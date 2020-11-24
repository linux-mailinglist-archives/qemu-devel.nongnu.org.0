Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5062C1B9A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:48:54 +0100 (CET)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khONx-0003gv-Ld
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJx-0008NF-Fo
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJv-00029V-S6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ABx0p2qmAGxG+XfxGy7HrResy/wTlAIDE6SIuSRFQPY=;
 b=TeJ6o1KJhsTng1YUUqbT9uqNr1/B9vQhuUwFKIWfQp6LL1BBi9IIEkik3lgfdefNyOxLSu
 0w0pycLK6Tj+LmEi5INCnaMBxD8ty3yI8GCM7KcATzxuGEHjSvZVvNO09c7bdhY2va1PWb
 brWKcW/z1/AAe9EZK21WfwmxXG434aE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-791gNTF_NCugf9wUyYmy0w-1; Mon, 23 Nov 2020 21:44:38 -0500
X-MC-Unique: 791gNTF_NCugf9wUyYmy0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F46B8049CF;
 Tue, 24 Nov 2020 02:44:37 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AF285D9CC;
 Tue, 24 Nov 2020 02:44:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 5/5] net: Use correct default-path macro for downscript
Date: Tue, 24 Nov 2020 10:44:23 +0800
Message-Id: <1606185863-25996-6-git-send-email-jasowang@redhat.com>
In-Reply-To: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
References: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

Fixes: 63c4db4c2e6d (net: relocate paths to helpers and scripts)
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index fe95fa7..b751285 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -953,7 +953,8 @@ free_fail:
             script = default_script = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
         }
         if (!downscript) {
-            downscript = default_downscript = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
+            downscript = default_downscript =
+                                 get_relocated_path(DEFAULT_NETWORK_DOWN_SCRIPT);
         }
 
         if (tap->has_ifname) {
-- 
2.7.4


