Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121003D68EE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:48:59 +0200 (CEST)
Received: from localhost ([::1]:46138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88T4-0004Wr-2P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rn-0002P1-6W
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rl-00066e-LM
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso1016802pjb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdI8+8nFNnxTYtRyQ8td0fUaRpYVtNk1B3zMGvwjcGA=;
 b=mlC4dz9dm5HBlcHuhh9jzfeJWxr1RKvDeSXrOF9F/ztICm5geh7LDty/NIBLaHOsnH
 6DUUd3YDzPZwwhmTYXRGWNKO7/W8wLUZ/qHTKMPM88+GDPS0WXGySelmaKY4H3HtMxzs
 wgDo5kAOAUgGUIpCPISkkjIg2TrSsNF7d4RZ5m9h3wQRtFz0sskc1gYjssz2XBukpdZP
 9xlnD2OOXZ1LeYCNSV76hsxHEogzdJflGx/MV8xYCA+uGPzwVIZmzBRa7gtqTkv9bYiR
 Kxsm4bSujwm2aTCDGE3fCnmSVanbYI7XH9Ua9JgisQUS+D3J/WL2LalMl3XYmRMSL8Qa
 JWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdI8+8nFNnxTYtRyQ8td0fUaRpYVtNk1B3zMGvwjcGA=;
 b=oAqjJwB14ujdD8RGpvc/MlBtm3Yo7sdhDjYYPTrkaDZ/wMEIXAsjym+QdLNcrW0aiz
 mhdiDU1T6Xo/vxMISqLQqYrkeWt444Ozej1yPMqJHo3vJabD2Y+oUPUIeCWdsif6hy7Z
 oPUWpu11at29kQDtkLDQXWt5ixwHh6u9iN9LEXAUcEV+vehXnacQLUSIrQ0YE/vvyCqJ
 QOprSGP1pn/dako21/s0nfQErkXIJ/D0yqB+Glyt5KCz0lrUXH3xQfqtysGWK/39fs5R
 aH6iN2RVtKl1TIzBHQn2J8SYLlobduC7lJfwH5anMYxshODD5muC08O+bTAmpSAoGtSl
 BqrQ==
X-Gm-Message-State: AOAM531FrCTpSZ0kcUKv7YryVCWGG5BKeo5LCGWgiqSBd49EuWx80TXn
 BFbUfaW93nchOvjTBmdVROVJtJFIQfkacw==
X-Google-Smtp-Source: ABdhPJzw4IJYLWw35dzjgnEUA+h+Nmf9v5fmtvds42RqgwGmx+ZMyc9o2xZOXC90JHNtFESld7uMAg==
X-Received: by 2002:a17:902:e851:b029:12b:c50a:1ebc with SMTP id
 t17-20020a170902e851b029012bc50a1ebcmr13947312plg.84.1627336056466; 
 Mon, 26 Jul 2021 14:47:36 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 03/12] bitops.h: revert db1ffc32dd ("qemu/bitops.h: add
 bitrev8 implementation")
Date: Mon, 26 Jul 2021 11:47:20 -1000
Message-Id: <20210726214729.2062862-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation") introduced
a bitrev8() function to reverse the bit ordering required for storing the
MAC address in the q800 PROM.

This function is not required since QEMU implements its own revbit8()
function which does exactly the same thing. Remove the extraneous
bitrev8() function and switch its only caller in hw/m68k/q800.c to
use revbit8() instead.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/bitops.h | 22 ----------------------
 hw/m68k/q800.c        |  2 +-
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 110c56e099..03213ce952 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -618,26 +618,4 @@ static inline uint64_t half_unshuffle64(uint64_t x)
     return x;
 }
 
-/**
- * bitrev8:
- * @x: 8-bit value to be reversed
- *
- * Given an input value with bits::
- *
- *   ABCDEFGH
- *
- * return the value with its bits reversed from left to right::
- *
- *   HGFEDCBA
- *
- * Returns: the bit-reversed value.
- */
-static inline uint8_t bitrev8(uint8_t x)
-{
-    x = ((x >> 1) & 0x55) | ((x << 1) & 0xaa);
-    x = ((x >> 2) & 0x33) | ((x << 2) & 0xcc);
-    x = (x >> 4) | (x << 4) ;
-    return x;
-}
-
 #endif
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6817c8b5d1..ac0a13060b 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -334,7 +334,7 @@ static void q800_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = bitrev8(nd_table[0].macaddr.a[i]);
+        prom[i] = revbit8(nd_table[0].macaddr.a[i]);
         checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
-- 
2.25.1


