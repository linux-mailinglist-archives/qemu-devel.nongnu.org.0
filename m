Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD52ADCAC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:16:35 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXFy-0006IV-Ju
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX68-0006D7-4p
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:25 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcX5v-0008Ia-78
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:06:21 -0500
Received: by mail-wm1-x342.google.com with SMTP id a3so2476800wmb.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jih/JPR7rNmuRwjH6MNcptpond6bHtS/vHCrI5LZOSc=;
 b=Yvb7jo5su5SR6eWlRsr0+hCCDBasWisHtcJLwHfc1x1EF8IKXabH4iWn/4TeaF6oJR
 n/gKJPHETK+LocT3g+TuF3mNzdYRPvbt1E+6LbKempDdIFmY1VjoAVNKNRzIwsqfO7qu
 uw4pE2dn5Z5ulyPLuqmA803xPDEYcd/miLUEd2Fi8HuuOTju7R3XisJj+XbpxTxKzQW6
 a/mC7GR+IUd6+jlIbG4ZxCf8LNjGwlWM9GQ93pqZPbluyZYnRHm8v+wtUnFi436Tmylx
 kVzdKDEZHSnDe3GyIyjMTc4FQ2fKlkqSBh4NbhKw11ZyKfTTT/tyb5wu07oXzvZSwD1k
 lg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jih/JPR7rNmuRwjH6MNcptpond6bHtS/vHCrI5LZOSc=;
 b=kNljQyxsui2JYNpaY5mlDor23HzVg6nZj9oBYzzxokuLb1w8RQOiGL4Hh8LGVShtZA
 4PYV8njPWraJSbmm2pPY+4ZCjItyEZAYSoTetC1DZNMm3UnymzO1Kmg/9IqXSFkp9/Wa
 ihS42pU0q9n0c1WoWyJ9ZOEC9UAysEF6yLAF4+KOAApZVO3hTxODPoLCyuJqNK73uPEd
 +3D6viw0DeiniGeFAF1Ar39h/a1c/a77aNVxR2nnpbSTFcGWf0/1pag130eXVmze4BFp
 tQ4z/XMgXhsoOwjodpPi8zBSnhtNjnRR43rjDPyMjr7ubymIOMLTSAetM+fG9p6eXfL4
 TAwg==
X-Gm-Message-State: AOAM532XRpf+7T6Ne/U4x4pjUzO/r7ya0BaZyVoKCrOZtnZv4rPs5K8G
 yhf8A2ta1DD0SIHoo2B4gjEh2/LL9YAlVg==
X-Google-Smtp-Source: ABdhPJzSGm1YwrXJf7nngpSA06vKiFSusY3g4y6tKDnw7DqKkOBJoTRtaYGaCjDfuaAFBdhL2qYKSQ==
X-Received: by 2002:a05:600c:22c5:: with SMTP id 5mr44060wmg.25.1605027969374; 
 Tue, 10 Nov 2020 09:06:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h4sm17334893wrq.3.2020.11.10.09.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:06:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 v2 2/4] hw/net/can/ctucan: Avoid unused value in
 ctucan_send_ready_buffers()
Date: Tue, 10 Nov 2020 17:06:02 +0000
Message-Id: <20201110170604.5897-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110170604.5897-1-peter.maydell@linaro.org>
References: <20201110170604.5897-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that in ctucan_send_ready_buffers() we
set buff_st_mask = 0xf << (i * 4) inside the loop, but then
we never use it before overwriting it later.

The only thing we use the mask for is as part of the code that is
inserting the new buff_st field into tx_status.  That is more
comprehensibly written using deposit32(), so do that and drop the
mask variable entirely.

We also update the buff_st local variable at multiple points
during this function, but nothing can ever see these
intermediate values, so just drop those, write the final
TXT_TOK as a fixed constant value, and collapse the only
remaining set/use of buff_st down into an extract32().

Fixes: Coverity CID 1432869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/can/ctucan_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/net/can/ctucan_core.c b/hw/net/can/ctucan_core.c
index 538270e62f9..a400ad13a43 100644
--- a/hw/net/can/ctucan_core.c
+++ b/hw/net/can/ctucan_core.c
@@ -240,8 +240,6 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
     uint8_t *pf;
     int buff2tx_idx;
     uint32_t tx_prio_max;
-    unsigned int buff_st;
-    uint32_t buff_st_mask;
 
     if (!s->mode_settings.s.ena) {
         return;
@@ -256,10 +254,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         for (i = 0; i < CTUCAN_CORE_TXBUF_NUM; i++) {
             uint32_t prio;
 
-            buff_st_mask = 0xf << (i * 4);
-            buff_st = (s->tx_status.u32 >> (i * 4)) & 0xf;
-
-            if (buff_st != TXT_RDY) {
+            if (extract32(s->tx_status.u32, i * 4, 4) != TXT_RDY) {
                 continue;
             }
             prio = (s->tx_priority.u32 >> (i * 4)) & 0x7;
@@ -271,10 +266,7 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         if (buff2tx_idx == -1) {
             break;
         }
-        buff_st_mask = 0xf << (buff2tx_idx * 4);
-        buff_st = (s->tx_status.u32 >> (buff2tx_idx * 4)) & 0xf;
         int_stat.u32 = 0;
-        buff_st = TXT_RDY;
         pf = s->tx_buffer[buff2tx_idx].data;
         ctucan_buff2frame(pf, &frame);
         s->status.s.idle = 0;
@@ -283,12 +275,11 @@ static void ctucan_send_ready_buffers(CtuCanCoreState *s)
         s->status.s.idle = 1;
         s->status.s.txs = 0;
         s->tx_fr_ctr.s.tx_fr_ctr_val++;
-        buff_st = TXT_TOK;
         int_stat.s.txi = 1;
         int_stat.s.txbhci = 1;
         s->int_stat.u32 |= int_stat.u32 & ~s->int_mask.u32;
-        s->tx_status.u32 = (s->tx_status.u32 & ~buff_st_mask) |
-                        (buff_st << (buff2tx_idx * 4));
+        s->tx_status.u32 = deposit32(s->tx_status.u32,
+                                     buff2tx_idx * 4, 4, TXT_TOK);
     } while (1);
 }
 
-- 
2.20.1


