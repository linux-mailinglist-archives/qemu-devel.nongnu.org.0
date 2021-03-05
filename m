Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F68832E242
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:32:54 +0100 (CET)
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI417-0002q2-EY
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vq-0004qH-1C
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vo-0005oV-8T
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614925643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmcwdLNkp7oMuH+Ddnn0++/PfsdaKf0LQbBckccBUis=;
 b=HqtxW9tqWSqmak1h+YZxrcWuGPSlipfABzCx2G5wCMoDTOyhaJdW6I756bxHJdMId9X4Tz
 mbgFUj4XabZF44bIPUhzlmtDDsONJ20xW+YWFhebF2eMGInvvzmzkYi3ZXJArD9vOwPePj
 EVcJ2BHTIMfdGucZCg+o6b6vzssLlak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-DwNY4FzYNSKR2Kl-pH0uMA-1; Fri, 05 Mar 2021 01:27:19 -0500
X-MC-Unique: DwNY4FzYNSKR2Kl-pH0uMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F4B87A826;
 Fri,  5 Mar 2021 06:27:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-165.pek2.redhat.com
 [10.72.12.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E251A60244;
 Fri,  5 Mar 2021 06:27:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-security@nongnu.org
Subject: [PATCH V4 08/10] pcnet: switch to use qemu_receive_packet() for
 loopback
Date: Fri,  5 Mar 2021 14:26:36 +0800
Message-Id: <20210305062638.6749-9-jasowang@redhat.com>
In-Reply-To: <20210305062638.6749-1-jasowang@redhat.com>
References: <20210305062638.6749-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

This patch switches to use qemu_receive_packet() which can detect
reentrancy and return early.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Buglink: https://bugs.launchpad.net/qemu/+bug/1917085
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/pcnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index f3f18d8598..dcd3fc4948 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -1250,7 +1250,7 @@ txagain:
             if (BCR_SWSTYLE(s) == 1)
                 add_crc = !GET_FIELD(tmd.status, TMDS, NOFCS);
             s->looptest = add_crc ? PCNET_LOOPTEST_CRC : PCNET_LOOPTEST_NOCRC;
-            pcnet_receive(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
+            qemu_receive_packet(qemu_get_queue(s->nic), s->buffer, s->xmit_pos);
             s->looptest = 0;
         } else {
             if (s->nic) {
-- 
2.24.3 (Apple Git-128)


