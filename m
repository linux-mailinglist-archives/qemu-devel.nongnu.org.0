Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D24678F49
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzK-0002up-BQ; Mon, 23 Jan 2023 23:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzI-0002st-8V
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzG-0002Uv-Br
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id jm10so13539915plb.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqahPieSTesSQ3ytgQT7EouT1GVK8PvqW8EjKRNmOFQ=;
 b=BP56+WkABFuzs0TawnMBM4tcBeNrHHY3W8//jdOHLfeYX7L0gfFrPZTyclvoMPSwum
 t3naezUcS0OoH8qC5ZT6yRWvA/1sno4y4eKxPZxer0xd5L/1yeE06UXlEK+8B4ycL3qp
 X78XKUxJNlqjKXCNFyMl5wMcJhk4puFlYm+0+qghVQrwIsfQgBdZc/h023zwLLphpnTt
 h8SSITjR2P+cssfcvT/EpuxOvmlBtyM/7qz+0xUN72zqZa00m/nKU32szNWMj1jFDawx
 hNlJU72ierp2qcj2zNVs+OnwHU6CfA1RZ7yNgonY1j4UUsAr+fUiJN0QpOblKqWcDDCR
 SNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqahPieSTesSQ3ytgQT7EouT1GVK8PvqW8EjKRNmOFQ=;
 b=WishojT+cxQd39vBAWjWUaHGqUYMfWXDDcTaLe5xYIp3b78Q0Jm5t+uGZo0HNXRHgt
 EVCgTXNfjhgv92r9NjGqhJICAsGObmVdw+9MsAj6RMRVCRGe0XyL5KICAVcNsF7NebwV
 79yAKeniuT4TCyAqBi4/1SEBePOgvrFE3kbG1VO9xZFCGfYTX+1kvcSuLqk8Lq64B6mS
 5c+79f9c0JzXO94H/0h06nNjQ9b7SS2rTciEt794ABXJgtNSXzL8aVX0xjPvdm4nBa9E
 YsXUQQmZvxaSJ3O3UpMoeMobl+wwqhhdcuX+riTlzVqK4C6e/J7fKHPFxw/TQ1aCdPyU
 UUxg==
X-Gm-Message-State: AFqh2kqN2vl8pbgNCjLgXud1yESt9+51rjiUilikQypIuRGdWtgEftPv
 cc2EBaVL4UbQsY+KeH/q3qOzwA==
X-Google-Smtp-Source: AMrXdXtiXFspd08foHreJboOkVnDoDqVf77WA/gysrhNxTfCoOFcD7qMYduuOOP6qWNf7qyHbfxI6Q==
X-Received: by 2002:a17:902:f705:b0:191:1e89:35de with SMTP id
 h5-20020a170902f70500b001911e8935demr29826958plo.9.1674534765292; 
 Mon, 23 Jan 2023 20:32:45 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:45 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 17/26] e1000e: Remove extra pointer indirection
Date: Tue, 24 Jan 2023 13:31:34 +0900
Message-Id: <20230124043143.5515-18-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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


