Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68A6B9C83
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc88H-00061E-GC; Tue, 14 Mar 2023 13:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc88F-00060q-0g
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:08:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc889-000615-5E
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:08:14 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso2932053wms.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NQZU6a79X42jny9TR5/WHbUxyedgMvwNu/DoMNPB+vg=;
 b=y6SK2sowYHGiXHyRJ2Aw3AQFmQUW0xyJDLlX49fwN4my0WT9hpEDkZ3yFR/QI/IRHh
 PvxsboYE1T17cR81o0lK/NyoAKRWMTlsmE5uQuLn9LoC4ukl+LDzbbmrQmXjRT3JU75C
 uyqFrDi6k89SyVyWg8chl6mDOMiJsSK5uPOULygkYx7bngtXvQFGK0XOCyDYsKWl1bEM
 gkTSd6gAn013QQ31j1EHZB7zN1kOIgFqAdWTIIsThxnR4I1WduMfiTjjGeiJp77gMSAw
 ludecF6g8NDboFAJ/+HG9R3O6d01t632QBVTcuOc7gsmZrWo/0Gygi0HL6Kiw/naeZFT
 KOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQZU6a79X42jny9TR5/WHbUxyedgMvwNu/DoMNPB+vg=;
 b=N6KBMYkb5Hx0jEjWWLwkZJ/iSTEstGk9v+eHepv/oOQyUght07CX57FJ5IgpYetzxQ
 MDjsR31mxL7LU3Qwjsoza10kZP219cn1ACgrLvIbxpStL2B8wXT6qHsdtaoJuelPefiT
 uM+wESJ2j8rKOKd1CwTA2Vpac5qCchKX09O9FqpoJw9/rO+cizvqhg56JJwqLHKQOjER
 SHOClGxnlp+kEUm1EXjEYSbyznEnLCYUGnXvdHvmelPEdptafwHNEnPfc/vYBkUmGJX4
 8SND0FhOCorGpQN9+62j2sAdyP+HJYREG7YUC/uB9AGiXL2JchK5XYO7byEMgSKl8nrP
 nkMA==
X-Gm-Message-State: AO0yUKViFQVti6j0OorPBvg/FLICl8OamGQ+P0fklJf2AxAxuSNmFOoO
 9l/usNzHaz+wP/Vq2PokzNUwvw==
X-Google-Smtp-Source: AK7set/s7pigz1kfyHpIR7AEB98BfTvKRx9kgs2PsmcnZ9z2uwcdUI7SH/ttq3Js4LYgzZXCIhm2zw==
X-Received: by 2002:a05:600c:5028:b0:3eb:a4e:a2b2 with SMTP id
 n40-20020a05600c502800b003eb0a4ea2b2mr14867108wmr.4.1678813687517; 
 Tue, 14 Mar 2023 10:08:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c290a00b003e8dc7a03basm3378653wmd.41.2023.03.14.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 10:08:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV
 settings
Date: Tue, 14 Mar 2023 17:08:04 +0000
Message-Id: <20230314170804.1196232-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The cadence UART attempts to avoid allowing the guset to set invalid
baud rate register values in the uart_write() function.  However it
does the "mask to the size of the register field" and "check for
invalid values" in the wrong order, which means that a malicious
guest can get a bogus value into the register by setting also some
high bits in the value, and cause QEMU to crash by division-by-zero.

Do the mask before the bounds check instead of afterwards.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/cadence_uart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c069a30842e..807e3985419 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
         }
         break;
     case R_BRGR: /* Baud rate generator */
+        value &= 0xffff;
         if (value >= 0x01) {
-            s->r[offset] = value & 0xFFFF;
+            s->r[offset] = value;
         }
         break;
     case R_BDIV:    /* Baud rate divider */
+        value &= 0xff;
         if (value >= 0x04) {
-            s->r[offset] = value & 0xFF;
+            s->r[offset] = value;
         }
         break;
     default:
-- 
2.34.1


