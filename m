Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54A267C91C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:50:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznz-0004J4-SB; Thu, 26 Jan 2023 05:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznj-0003B9-6A
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:15 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznf-0005YX-TG
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:14 -0500
Received: by mail-pl1-x631.google.com with SMTP id v23so1505972plo.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqahPieSTesSQ3ytgQT7EouT1GVK8PvqW8EjKRNmOFQ=;
 b=2eaMPMuIDD0yUHv9ChSZbc1OikoUViBWV5lmdeF+gH4KMO8YXVsXtckvpwLy2eDwqi
 1OZoPO2uPCIwCpLrbpgPbw0cbQFWCvBhvgXhqNwHFnxRNUZNNjGqYrIMdYf5libQPq8R
 U4/0QKWVIElaYrw8bhgu6gKDkbc2PSKwci1tiVei6wWhPCipOXCojIOsFvToTb5RoEDa
 zoGebeDU19MDpHDILAfeFyeO5GCNipRBqxB4u13zy9HDd+eMS9j6t8C9eR6fTCyqofcm
 oT8kXN2voTR8hEwuncNZW6TEd9iQrXxtB+cwbcTunuEJJ2kZI1qXOkrZ7uaHUczthNha
 1sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqahPieSTesSQ3ytgQT7EouT1GVK8PvqW8EjKRNmOFQ=;
 b=pzbm3BokmuxUV4zTZI1ljEY9inocG30KiADMDkBAucZ5FSJCFBgGa7d0PzFTdfvQiE
 XT/c+kSDM9jjUQ5x2OPjJv7N+PDvtG+LT+j6Q5+7wbZND4zUZNfYshTxQLppoSbTYnsX
 DaL2CZM6guhG51V463Vwr6TXitGEOPQ1ptW/KVtwLYUFtnufQqA8xSrmNDSaA6oqwter
 PedUoqjfQuq87JvbV3hOlFBUenAZMMuJkh2RZOUIs5pKRuRiY/9r7tXeKwJJQCK4VHMH
 Fxl2aEiexS1s9kMUDkHEJ5v5F1el3tBSQw9ELEbfzDHJsfgZpFrffAOBRfJ8ZBsprkKo
 NGyA==
X-Gm-Message-State: AFqh2koZYqw2pckVtudIA+e/6uJZtmzLlE/AL4lC7Zpf5gVCN3I12zPg
 os5ZPXheKn/8EDo8+fQHo6LGwQ==
X-Google-Smtp-Source: AMrXdXttNno7+QsobWzuFnMu090djz6lTxzv2Om+xOngqhV5QgcYguKOOv3SGIZWFDnVlFAUEB46/A==
X-Received: by 2002:a05:6a20:9f09:b0:b8:c6ec:a269 with SMTP id
 mk9-20020a056a209f0900b000b8c6eca269mr37907066pzb.16.1674730091278; 
 Thu, 26 Jan 2023 02:48:11 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:10 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 17/26] e1000e: Remove extra pointer indirection
Date: Thu, 26 Jan 2023 19:46:56 +0900
Message-Id: <20230126104705.35023-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

e1000e_write_packet_to_guest() passes the reference of variable ba as a
pointer to an array, and that pointer indirection is just unnecessary;
all functions which uses the passed reference performs no pointer
operation on the pointer and they simply dereference the passed
pointer. Remove the extra pointer indirection.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000e_core.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 736708407c..d143f2ae6f 100644
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
2.39.0


