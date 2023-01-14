Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46266A91A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXjf-00012l-TX; Fri, 13 Jan 2023 23:01:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXig-0000Lh-FO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:40 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXid-0005fu-I8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:37 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o13so20752955pjg.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJ4xBlAo9T+mFdhDq+09tR9xxUcwwwDKYVyE1bGBTt8=;
 b=hr9ttHXt9Y9xdqrsucSDbdhO+NZ1Dcph/iaImjA9TkdJGmdreKxPB6NUtVA9CvQ8Eb
 b4BviDI8P9t98R77Cuyv4/60jHLuLAttrA6vEqq5q/RqF+onAVDd9VB1aVxiRQz6jaQ7
 AtfMXEfLXU+GpN8guL28WRM2bVlEHGp/XXrFg6pSirdjY5wZ1r89tgjS+kqGSDAoZI4c
 3jp0JvREgiajGfT+aeJzC/bAlbMbbtGiL/ejUCMcROlvzfkBkS8PFBB9xsbu+pNuEqv6
 FMWfrO0DVwVOvqO5nZ9wGdN/d/6SgD1nbPKEHUXX9YPsXBu2w8rok/+HXRsD/+c0WfTV
 WtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJ4xBlAo9T+mFdhDq+09tR9xxUcwwwDKYVyE1bGBTt8=;
 b=HhLQePiTDdAmLYIMdZL0ileAFspZXOh/oyI5tis7AGekxfvFjGmaMFm7pQF1GqF9W4
 6C9o38ubFeUY+wgbQirTDzWjtryfX29ystdVnExSSDt1Iv9lxDdx044AeC6IEEUifmeh
 vRTzX2SUX050ZbEtUxRkeI0TqG44YOQ7oDiFoRqfBxVai99e0xA8aV/stxlC06+CMQut
 2VYkbEGgVAulQqpisXppB6ZDAMNfCqTTg84R/JWAvbt6Dd8jFg53RytgsVswrdPA1HIu
 8pZ/9Hc/+d4qCheyFQViW27Ow72BD0KVc1HsN+Qu6Qklvj6sE64+d5y/o3D5khWSlvf1
 v2Zw==
X-Gm-Message-State: AFqh2koJNUPIPikU6ToUyTB3IZVZteViTheEpqlf0Xc8u6JyTpTuGyHB
 Yi3OPX++LEVBLn5p4yLfr8nsTw==
X-Google-Smtp-Source: AMrXdXv+SD4YF5XdJM1mU6FowtOHv6VsQ1r+XCDE5eg/ClWfdpVND031cEK85aRWwo9CUALUbU/25A==
X-Received: by 2002:a17:902:bd8f:b0:193:2d46:7c5f with SMTP id
 q15-20020a170902bd8f00b001932d467c5fmr23704441pls.33.1673668832733; 
 Fri, 13 Jan 2023 20:00:32 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:32 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 17/19] e1000e: Remove extra pointer indirection
Date: Sat, 14 Jan 2023 12:59:17 +0900
Message-Id: <20230114035919.35251-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


