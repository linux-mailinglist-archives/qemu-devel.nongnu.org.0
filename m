Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7FD608BE2
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 12:47:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omBHk-0004aU-7l; Sat, 22 Oct 2022 05:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBHi-0004aM-F7
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:59:18 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omBHT-0008FD-7t
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 05:59:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id f9so246483pgj.2
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RU8/5HTo8+baKMeHrUEQiBWbmsr/936MisDwlU3iBGk=;
 b=m+HclE7BndO+171z9rIM5f+KdAsuQQwcekZv5h0GAIUIYxV1BvJndK+zpQZPe4T7sa
 o4LdYXvgfBlEduVXcPXw8z0G7MAkDMTXkonGjlM1uL5YC1CmJ9GBnfx4Jsc8wjpCFeKh
 5rZiy9WR0936WanKNzwHeudWvmwBdswwKVxnJhdB/HoNqIxjgfmP24lDPgrZxEIdmpM0
 rvx7ZM32MWjhn/TgBFOEXr1BQZGYWPJ7/8WvX8AdWplTzcjPbRXllTATwrzhPAEEgvMa
 xeUomqcp10JpVUIXfygszLOXgpQWOFb1EoGEGhuSosK1+vQ0FUO68gtcCI+OVwc40TiH
 glIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RU8/5HTo8+baKMeHrUEQiBWbmsr/936MisDwlU3iBGk=;
 b=m7QC7RQVdiCjum4nj/13IsaZQ4J1cmGFfbkfXvdECPJkqwedVuoKYIsgxeDTjOuYii
 ImChr1gdzAzljDZRV/AXj7iizUWreXTfsaRrtmK6tgAvP3JQ5nG/TAwuJV01p+fUbjTA
 kYgdcfJGi0fyVttD+G8lxo7qXCGigLcKgcnzhmFcvPNan38x/hw2BixQg5QTwHN2xd9W
 bl8Je9rmAjQHfFYHA1jo1VQ5P1fUy7xc/bcasnaro4T+DNJO+HtSeky++X+PKaWekN8Z
 eIzu3kDT/8ADUVRa3byOzH6ov1zk24LbRa+glpwDoSv0TBgnIydM+hGMyvOuKPnJaSbT
 tLeQ==
X-Gm-Message-State: ACrzQf2ZrtTTsVslf9Gd1sPTKa/SSNSggB0uDQlssY8Yxg0SHMuxBS7u
 lLMHICmwXXkzpYuTX+TBbE7DgAI+uSOOJQo0
X-Google-Smtp-Source: AMsMyM7wpT23k+x74M/B8jO4WigDRTCxoZaYInGTBWeodb80VqIvB7Iq+88z3waJiUVBEua9mpZc+A==
X-Received: by 2002:a05:6a00:174c:b0:565:c73a:9117 with SMTP id
 j12-20020a056a00174c00b00565c73a9117mr23288425pfc.23.1666432741344; 
 Sat, 22 Oct 2022 02:59:01 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 129-20020a621987000000b0056b3c863950sm2021564pfz.8.2022.10.22.02.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 02:59:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
Date: Sat, 22 Oct 2022 19:58:21 +1000
Message-Id: <20221022095821.2441874-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We were matching a signed 13-bit range, not a 12-bit range.
Expand the commentary within the function and be explicit
about all of the ranges.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 1cdaf7b57b..2a84c57bec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits: [-0x800, 0x7ff].
+     * Used for most arithmetic, as this is the isa field.
+     */
+    if ((ct & TCG_CT_CONST_S12) && val >= -0x800 && val <= 0x7ff) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
+     * Used for subtraction, where a constant must be handled by ADDI.
+     */
+    if ((ct & TCG_CT_CONST_N12) && val >= -0x7ff && val <= 0x800) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_M12) && val >= -0xfff && val <= 0xfff) {
+    /*
+     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
+     * Used by addsub2, which may need the negative operation,
+     * and requires the modified constant to be representable.
+     */
+    if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
         return 1;
     }
     return 0;
-- 
2.34.1


