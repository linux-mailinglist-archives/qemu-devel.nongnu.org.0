Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7686D6A0624
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8ja-0006md-MI; Thu, 23 Feb 2023 05:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jU-0006hn-QH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:50 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jS-0002Vy-0R
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so3613907pjn.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lkd52RBk6GEtzLexVG2esWofdxIUyPYLGO6mQp3hTXA=;
 b=dXVt1/r9j33gyQwf69w94vfRWZ5V43RQTdYJ8UpoAMDGAUMfiTifJCx6MPCjG4oQmb
 qqicB9Q6+qsS8iOEhbh3Pe06XE9kIRY30wUne3yjAvIHwTJEwXJ4QdZAnj67SnmVapNi
 TG73COEpdFEhUN9ABvIUNKGMixFzl2BSbiZCXsa9IieSorNQFjJL1uPP2zM7yvzEHVjj
 6SQjLllZqrW6sNksStQ9NHpo3nQAvG38uqFv7RtgilVuUgNtLTMwBqjswVDrhO/LOh5R
 03l0gIiqi/2l8fO/8eJ7zTU5RAd5Lm31VKbtXORXpVf3jd7wJl7L8LKhX02yl2+9AOA+
 11og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lkd52RBk6GEtzLexVG2esWofdxIUyPYLGO6mQp3hTXA=;
 b=RiM9thd2grpI+sp/Y+aeDmpN3ddyn21ul9oADJa0f6KbrWqnZbMV9yFc+pwL5WFYYS
 dgf2T81nwD7pmB10seeimbk0HiwfO6ydLpAaBjzaB2uv8l7+Oi7/5QO+Acqr99Lla1aE
 t6VFnyndlbbyu0gXMUxdjKyJ6Rk7NvpJQq/mkVCWk3w8vJ2FQNkiLKG2FNniJKxxH7W1
 Q093sbfBLBZnIqZV6dg7X0ZdZombsKdpyuth/9Gsj8xHsKx8zmNJoruvOGlXcf1dLWRn
 3Fuu+NV2VasFtMm5jkT+uM/JNuzkb5agU1xeTYWM2ErWbZfrQODZE2PuZcNiagVEvy9M
 Rppg==
X-Gm-Message-State: AO0yUKVF1a+OkYpl1okkwZ4zjckBa0mShRKek2zo+h3Nqs7hU6jNEM7h
 V/VLmkbn540yeAH7ikuWK4q4kA==
X-Google-Smtp-Source: AK7set+acEZ9VzTHHWaOpdtkKoPNJ3RaObaYe0LtF5KhMWQCx7Z0VrcaUqqOI/nODRt0nszWqwH2IA==
X-Received: by 2002:a17:902:d50d:b0:19a:93fc:c4d0 with SMTP id
 b13-20020a170902d50d00b0019a93fcc4d0mr12688176plg.12.1677147704592; 
 Thu, 23 Feb 2023 02:21:44 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:44 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 18/34] e1000e: Remove extra pointer indirection
Date: Thu, 23 Feb 2023 19:20:02 +0900
Message-Id: <20230223102018.141748-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
2.39.1


