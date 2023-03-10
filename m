Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3A6B3B1D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:44:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZAv-0003Vh-I9; Fri, 10 Mar 2023 04:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAq-0003Lk-SR
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAo-0008Mz-MD
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SR7C3cz5p9kRpnhlnoLSX4mRR7bPRqpVIjjhyHvBtnA=;
 b=LIFFfERsAwoAj3J96eQBlCxRYS1s5yGv0NcrM2xbqr+1z3ormchEcmpyvqmM4Ago1LQabH
 m19h19EnH1dhzuxteSW2fEoi+SHcnOoQQp/WTUnuf671kO9J8U0njH9XTYikuJFjuaQei5
 LzCaUFrK2XW4LtclPMl49DmunigwN8M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-0NpPA7ESMcSUzARDodX6Qw-1; Fri, 10 Mar 2023 04:36:21 -0500
X-MC-Unique: 0NpPA7ESMcSUzARDodX6Qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7842811E6E;
 Fri, 10 Mar 2023 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0A040ED76D;
 Fri, 10 Mar 2023 09:36:18 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 18/44] e1000e: Remove extra pointer indirection
Date: Fri, 10 Mar 2023 17:35:00 +0800
Message-Id: <20230310093526.30828-19-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

e1000e_write_packet_to_guest() passes the reference of variable ba as a
pointer to an array, and that pointer indirection is just unnecessary;
all functions which uses the passed reference performs no pointer
operation on the pointer and they simply dereference the passed
pointer. Remove the extra pointer indirection.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 7367084..d143f2a 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1075,31 +1075,31 @@ e1000e_read_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
 static inline void
 e1000e_read_ps_rx_descr(E1000ECore *core,
                         union e1000_rx_desc_packet_split *desc,
-                        hwaddr (*buff_addr)[MAX_PS_BUFFERS])
+                        hwaddr buff_addr[MAX_PS_BUFFERS])
 {
     int i;
 
     for (i = 0; i < MAX_PS_BUFFERS; i++) {
-        (*buff_addr)[i] = le64_to_cpu(desc->read.buffer_addr[i]);
+        buff_addr[i] = le64_to_cpu(desc->read.buffer_addr[i]);
     }
 
-    trace_e1000e_rx_desc_ps_read((*buff_addr)[0], (*buff_addr)[1],
-                                 (*buff_addr)[2], (*buff_addr)[3]);
+    trace_e1000e_rx_desc_ps_read(buff_addr[0], buff_addr[1],
+                                 buff_addr[2], buff_addr[3]);
 }
 
 static inline void
 e1000e_read_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
-                     hwaddr (*buff_addr)[MAX_PS_BUFFERS])
+                     hwaddr buff_addr[MAX_PS_BUFFERS])
 {
     if (e1000e_rx_use_legacy_descriptor(core)) {
-        e1000e_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
-        (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
+        e1000e_read_lgcy_rx_descr(core, &desc->legacy, &buff_addr[0]);
+        buff_addr[1] = buff_addr[2] = buff_addr[3] = 0;
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
             e1000e_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
         } else {
-            e1000e_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
-            (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
+            e1000e_read_ext_rx_descr(core, &desc->extended, &buff_addr[0]);
+            buff_addr[1] = buff_addr[2] = buff_addr[3] = 0;
         }
     }
 }
@@ -1420,14 +1420,14 @@ typedef struct e1000e_ba_state_st {
 
 static inline void
 e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
-                               hwaddr (*ba)[MAX_PS_BUFFERS],
+                               hwaddr ba[MAX_PS_BUFFERS],
                                e1000e_ba_state *bastate,
                                const char *data,
                                dma_addr_t data_len)
 {
     assert(data_len <= core->rxbuf_sizes[0] - bastate->written[0]);
 
-    pci_dma_write(core->owner, (*ba)[0] + bastate->written[0], data, data_len);
+    pci_dma_write(core->owner, ba[0] + bastate->written[0], data, data_len);
     bastate->written[0] += data_len;
 
     bastate->cur_idx = 1;
@@ -1435,7 +1435,7 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
 
 static void
 e1000e_write_to_rx_buffers(E1000ECore *core,
-                           hwaddr (*ba)[MAX_PS_BUFFERS],
+                           hwaddr ba[MAX_PS_BUFFERS],
                            e1000e_ba_state *bastate,
                            const char *data,
                            dma_addr_t data_len)
@@ -1447,13 +1447,13 @@ e1000e_write_to_rx_buffers(E1000ECore *core,
         uint32_t bytes_to_write = MIN(data_len, cur_buf_bytes_left);
 
         trace_e1000e_rx_desc_buff_write(bastate->cur_idx,
-                                        (*ba)[bastate->cur_idx],
+                                        ba[bastate->cur_idx],
                                         bastate->written[bastate->cur_idx],
                                         data,
                                         bytes_to_write);
 
         pci_dma_write(core->owner,
-            (*ba)[bastate->cur_idx] + bastate->written[bastate->cur_idx],
+            ba[bastate->cur_idx] + bastate->written[bastate->cur_idx],
             data, bytes_to_write);
 
         bastate->written[bastate->cur_idx] += bytes_to_write;
@@ -1577,7 +1577,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
         trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
 
-        e1000e_read_rx_descr(core, &desc, &ba);
+        e1000e_read_rx_descr(core, &desc, ba);
 
         if (ba[0]) {
             if (desc_offset < size) {
@@ -1596,7 +1596,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                             iov_copy = MIN(ps_hdr_len - ps_hdr_copied,
                                            iov->iov_len - iov_ofs);
 
-                            e1000e_write_hdr_to_rx_buffers(core, &ba, &bastate,
+                            e1000e_write_hdr_to_rx_buffers(core, ba, &bastate,
                                                       iov->iov_base, iov_copy);
 
                             copy_size -= iov_copy;
@@ -1613,7 +1613,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                     } else {
                         /* Leave buffer 0 of each descriptor except first */
                         /* empty as per spec 7.1.5.1                      */
-                        e1000e_write_hdr_to_rx_buffers(core, &ba, &bastate,
+                        e1000e_write_hdr_to_rx_buffers(core, ba, &bastate,
                                                        NULL, 0);
                     }
                 }
@@ -1622,7 +1622,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                 while (copy_size) {
                     iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
 
-                    e1000e_write_to_rx_buffers(core, &ba, &bastate,
+                    e1000e_write_to_rx_buffers(core, ba, &bastate,
                                             iov->iov_base + iov_ofs, iov_copy);
 
                     copy_size -= iov_copy;
@@ -1635,7 +1635,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
                 if (desc_offset + desc_size >= total_size) {
                     /* Simulate FCS checksum presence in the last descriptor */
-                    e1000e_write_to_rx_buffers(core, &ba, &bastate,
+                    e1000e_write_to_rx_buffers(core, ba, &bastate,
                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
                 }
             }
-- 
2.7.4


