Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF304AAEE2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:45:14 +0100 (CET)
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGf2f-0002j8-QU
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:45:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepk-0004V2-8G
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:52 -0500
Received: from [2607:f8b0:4864:20::435] (port=37795
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepi-0002OD-Dv
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:51 -0500
Received: by mail-pf1-x435.google.com with SMTP id y5so8218075pfe.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bn51JgtZkfipNb1j4v1ZZK9UKAPKwd08pZI1+ol2wL8=;
 b=cEEXS683kQUIKX+Q7O8VTvtlYUzLC0DXv0kOygqWTh5w9qU6FinSxoS3tkpJlWA0iq
 UjTBfTtITlcAzYQy9CEJ9/V53XJyYWTST3HPDK7OZaX4dYyYAOTuNhGrjt9Kb7jjcGSI
 +nf4jXQ/BTr1450zcHfq/Zr6nQTAXgBoBKYaeXE2ZysCjGGKowbhrMV8Oy8KuYrHdXP8
 x8VVz+L+PTRfKV7OfVLTi5flrle/BEI2fYIgAE8E8sWMxUQc863SbL/qKDEJPI3VQF9V
 Yr85LauFII56mNNP390yf1QtxxjKC8+RfurSd+QvNBrNxXJ1gFt66gZE1j97fZcg1OJR
 SNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bn51JgtZkfipNb1j4v1ZZK9UKAPKwd08pZI1+ol2wL8=;
 b=zYCFdlv58tq9eIrdqZSK8ZpNdgcS6JOj4nCmCrDVRv1xmydSskssbcb7fdMa0d0bRX
 KB6j49i3P4i4KEgN1s4oLr+Dl6CP8km/flUaC+GDDXSUFPv4cISrt6mXJlXN5rHev6NW
 WpBnoPxQyxhpBwpRx132HNcKu2vqAHCBU0kxMlnd9N3dh1RRdhL+EN0kjxZyaYF5QJZY
 skZz6oVNujDrOqTZxdgp2JxUBluZKeztam87OujUQ6FLMkKe32MweEJWNgbLCgThRYGg
 jiBi9D5RpadGY0wYxtCy7Cdnhcfzz+VhMZaHhM5j5Jc9Ve1rfSBM2P/8iOZI8ge1mgb9
 IrUQ==
X-Gm-Message-State: AOAM533Vlp99ZwgBu6gn68DCyzvrcPrV4HukPou6h/Wl8wzyxg7651P+
 +1/nKnzaYcqe0WQdF4/MmawBElbP/BYwz+/p
X-Google-Smtp-Source: ABdhPJxgUw2YDSSJW+rsPBQ7mPyS4YOu3Oum1KYTqNZTwT3EvtdTirmqLEPB4jZxYzvtvmGufBxGgw==
X-Received: by 2002:a63:8649:: with SMTP id x70mr5505000pgd.564.1644143509200; 
 Sun, 06 Feb 2022 02:31:49 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] tcg/sparc: Improve code gen for shifted 32-bit
 constants
Date: Sun,  6 Feb 2022 21:31:34 +1100
Message-Id: <20220206103138.36105-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had code for checking for 13 and 21-bit shifted constants,
but we can do better and allow 32-bit shifted constants.
This is still 2 insns shorter than the full 64-bit sequence.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 8c3671f56a..f9afb1bffc 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -456,17 +456,17 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
-    /* A 21-bit constant, shifted.  */
+    /* A 32-bit constant, shifted.  */
     lsb = ctz64(arg);
     test = (tcg_target_long)arg >> lsb;
-    if (check_fit_tl(test, 13)) {
-        tcg_out_movi_imm13(s, ret, test);
-        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
-        return;
-    } else if (lsb > 10 && test == extract64(test, 0, 21)) {
+    if (lsb > 10 && test == extract64(test, 0, 21)) {
         tcg_out_sethi(s, ret, test << 10);
         tcg_out_arithi(s, ret, ret, lsb - 10, SHIFT_SLLX);
         return;
+    } else if (test == (uint32_t)test || test == (int32_t)test) {
+        tcg_out_movi_int(s, TCG_TYPE_I64, ret, test, in_prologue, scratch);
+        tcg_out_arithi(s, ret, ret, lsb, SHIFT_SLLX);
+        return;
     }
 
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
-- 
2.25.1


