Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4848821B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:19:50 +0100 (CET)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n660z-0001Ef-Mv
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:19:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lg-0005iD-Dd
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::536] (port=39711
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Le-00049X-TW
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:08 -0500
Received: by mail-pg1-x536.google.com with SMTP id a22so3298904pgd.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1PgEAjuvJVWdLvX5wSFmndrZo74W/oucIMftf9RLc6U=;
 b=wvb9IRHnNqF6+gsgUPQ6JE5DBeWftiA8x2efzd02CCXnANqqDPKx4H32ohL5FW/aM2
 vnVyd8zkYONbi43SUig3CJTjvyAlZmIRYD1uE8Etpn85d6LVZYJbpM2WU+jPMDopS75X
 T6tq5j/8bdwsctQIYieaWD6AxgGocmhGBlGusojypNENv+bPlghg80vEp4PG5Cso82Uz
 aTnt6o525vEmtHbWxX+fy6Hjy7V8TqhY9qg98tKIu/q5C2xLKlQp8LAXqWk1l+y4tpdg
 baBoUvbldSeuhJyrPhq/9po+qvl2AiJGJIAz40E+jjdVXmYPkySYOdNQ4rOWi/Emaufl
 EQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PgEAjuvJVWdLvX5wSFmndrZo74W/oucIMftf9RLc6U=;
 b=DMlYOkvfNZSOVlzdlb8yVp3bsdsHac6Lqcd2VUCFlwt5BB/JZ0ge1Bx6Vt4RsAnJmj
 t0sj5UeRMXS8aHKL6diBf836GieTDsp4MDoDrd5n0rlbelbbJLtnIupIC5CgZgYLX0h3
 BkriBPAIqa0KsQDYooeRG3Z7WY+r2Xq8HbRJVbblCqdtUaGCp+w9sZiPYdyGO+yGmk7H
 JYvKf+nvd+fFywdLfdtAnTHdlk37+pGC56kC1c/w7ob/zWt32J8aCKhAQb7lFMsotwie
 QvcKizsks+c2eEujxKjJ5zj6G+2H14MgYKwnVBQVqAI1Z1FO38IhopkZJlU4gCGn2rUe
 FjlA==
X-Gm-Message-State: AOAM533zal0Pd3T8v/Vigs/KW9+w52wpdHbTddF84Z0y/kOTZp6Tbbrr
 2k5ls5W6rfbsaxRi78xhKeeJOQRfgR1QiQ==
X-Google-Smtp-Source: ABdhPJw8DF1vCa3gKbdEKGrlb3GDYcdNWG1LsYlXxrOTZ0UqWIVbDZL96Ed63lrnmai6uUSzQzfslA==
X-Received: by 2002:a62:180d:0:b0:4bb:dafb:ff50 with SMTP id
 13-20020a62180d000000b004bbdafbff50mr57641672pfy.45.1641623825613; 
 Fri, 07 Jan 2022 22:37:05 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:37:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/12] tcg/mips: Try three insns with shift and add in
 tcg_out_movi
Date: Fri,  7 Jan 2022 22:36:44 -0800
Message-Id: <20220108063644.478043-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These sequences are inexpensive to test.  Maxing out at three insns
results in the same space as a load plus the constant pool entry.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a128c70154..185241da17 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -583,6 +583,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
                              tcg_target_long arg, TCGReg tbreg)
 {
     tcg_target_long tmp;
+    int sh, lo;
 
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
@@ -605,6 +606,49 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
+    /*
+     * Load bitmasks with a right-shift.  This is good for things
+     * like 0x0fff_ffff_ffff_fff0: ADDUI r,0xff00 + DSRL r,r,4.
+     * or similarly using LUI.  For this to work, bit 31 must be set.
+     */
+    if (arg > 0 && (int32_t)arg < 0) {
+        sh = clz64(arg);
+        if (tcg_out_movi_one(s, ret, arg << sh)) {
+            tcg_out_dsrl(s, ret, ret, sh);
+            return;
+        }
+    }
+
+    /*
+     * Load slightly larger constants using left-shift.
+     * Limit this sequence to 3 insns to avoid too much expansion.
+     */
+    sh = ctz64(arg);
+    if (sh && tcg_out_movi_two(s, ret, arg >> sh)) {
+        tcg_out_dsll(s, ret, ret, sh);
+        return;
+    }
+
+    /*
+     * Load slightly larger constants using left-shift and add/or.
+     * Prefer addi with a negative immediate when that would produce
+     * a larger shift.  For this to work, bits 15 and 16 must be set.
+     */
+    lo = arg & 0xffff;
+    if (lo) {
+        if ((arg & 0x18000) == 0x18000) {
+            lo = (int16_t)arg;
+        }
+        tmp = arg - lo;
+        sh = ctz64(tmp);
+        tmp >>= sh;
+        if (tcg_out_movi_one(s, ret, tmp)) {
+            tcg_out_dsll(s, ret, ret, sh);
+            tcg_out_opc_imm(s, lo < 0 ? OPC_DADDIU : OPC_ORI, ret, ret, lo);
+            return;
+        }
+    }
+
     /* Otherwise, put 64-bit constants into the constant pool. */
     tcg_out_movi_pool(s, ret, arg, tbreg);
 }
-- 
2.25.1


