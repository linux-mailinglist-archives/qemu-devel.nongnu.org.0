Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E021C2C1B94
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:47:03 +0100 (CET)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khOMA-0001S1-Cs
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJn-0008GL-ES
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJl-00027J-6w
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=MM1KCRtmdZhv/stmi7fLoaBTZ2wgzxNLrP4QiX2B3kE=;
 b=E9XVGZeeWiuECfTACJax3F0mK3Q4Fclu1toCyxh4re1pcxKGJxT3dTCZwgDFd/vdJfEzyU
 RsWXk6v3NkWxQEI60tYOA7vfQGsuJ8uoTLPPOLfSGiMM3jin3upBSjux6699WzECCJ8z+t
 p+aqnCpludQsEdKh1dg+/YQKfnoh7QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-oYK2-BD_MNuX1qUPMphyHQ-1; Mon, 23 Nov 2020 21:44:29 -0500
X-MC-Unique: oYK2-BD_MNuX1qUPMphyHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8C345212;
 Tue, 24 Nov 2020 02:44:28 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 531A75D9CA;
 Tue, 24 Nov 2020 02:44:27 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/net/e1000e: advance desc_offset in case of null
 descriptor
Date: Tue, 24 Nov 2020 10:44:19 +0800
Message-Id: <1606185863-25996-2-git-send-email-jasowang@redhat.com>
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
Cc: Jason Wang <jasowang@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While receiving packets via e1000e_write_packet_to_guest() routine,
'desc_offset' is advanced only when RX descriptor is processed. And
RX descriptor is not processed if it has NULL buffer address.
This may lead to an infinite loop condition. Increament 'desc_offset'
to process next descriptor in the ring to avoid infinite loop.

Reported-by: Cheol-woo Myung <330cjfdn@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d8b9e4b..095c01e 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1596,13 +1596,13 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
                 }
             }
-            desc_offset += desc_size;
-            if (desc_offset >= total_size) {
-                is_last = true;
-            }
         } else { /* as per intel docs; skip descriptors with null buf addr */
             trace_e1000e_rx_null_descriptor();
         }
+        desc_offset += desc_size;
+        if (desc_offset >= total_size) {
+            is_last = true;
+        }
 
         e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-- 
2.7.4


