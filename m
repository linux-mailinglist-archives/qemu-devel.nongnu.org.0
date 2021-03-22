Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15933343DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:31:58 +0100 (CET)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHqn-0003ZS-2d
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUH-00086H-M5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUF-0002um-A2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=OXDGhx+504Hm/tZi3Zt4Wp798QlrYLrIylkrVW22fY0=;
 b=EGDfVSQ81s63CMtagDMhftZd0dmm8eHBlW0Cts/1UfENzjktAljaBf08/jaM0XdsizrDAe
 txNO0qpgaBHT3igP/HhPo56twQ5Ouf4ujb2mBJEIznxbNEV2Qzb4CNckeJ5r13H85KigKc
 ov+W03z8jFgzAhsLkwTrEPjBFA+chzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-7VMFhB5FPkKfb_JkgIdapw-1; Mon, 22 Mar 2021 06:08:36 -0400
X-MC-Unique: 7VMFhB5FPkKfb_JkgIdapw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F818015BD;
 Mon, 22 Mar 2021 10:08:35 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 460F65D9CD;
 Mon, 22 Mar 2021 10:08:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 06/13] net/colo-compare.c: Optimize removal of secondary packet
Date: Mon, 22 Mar 2021 18:08:05 +0800
Message-Id: <1616407692-693-7-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

g_queue_remove needs to look up the list entry first, but we
already have it as result and can remove it directly with
g_queue_delete_link.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 2e819ff..9d1ad99 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -691,7 +691,7 @@ static void colo_compare_packet(CompareState *s, Connection *conn,
         if (result) {
             colo_release_primary_pkt(s, pkt);
             packet_destroy(result->data, NULL);
-            g_queue_remove(&conn->secondary_list, result->data);
+            g_queue_delete_link(&conn->secondary_list, result);
         } else {
             /*
              * If one packet arrive late, the secondary_list or
-- 
2.7.4


