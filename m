Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE124CC7AE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:14:18 +0100 (CET)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsm9-0008V7-Kg
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYR-0005wx-EB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:07 -0500
Received: from [2607:f8b0:4864:20::52b] (port=36452
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYP-0004EL-M1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:07 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t14so5754911pgr.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pd3yrxT35d4SOyEjqIqaXgmr9vG25Nh62apx3szcfnk=;
 b=Mm93nEYKmYEUiPnIUUa+xvTossscaaaO41G7bRxukfRsnxlNcMEzYy5lcugLvjLGsl
 ZCgWh78UcerFpj1XCwKvPnIofcBu5p0Hm5nwAPOElO8ypbYGsYyGf2m4WTs3PU/Bp+/f
 FSF+BHJqj14ccVVH/PnHhYiQrwXYUJRR7KLbuxKNs8zkjg1esWKGfN9GypI4/hqYCShb
 YINwVVdkH1nyxZcFVMLSP0n/P7SjyNA34v+fV2Qp00tSd2ponnC6bBzdn/fruNzTSlTH
 G+NX0zoXDbQ2RRgS9/KEgCJwLUNmFdpRQHVXGMDQwqq4dqa0YkDHu5JqwoiRyjXPFBzJ
 J8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pd3yrxT35d4SOyEjqIqaXgmr9vG25Nh62apx3szcfnk=;
 b=u+5CSnqigdGTjVuHefbQcr19nZvucteXUJTL4ReCGVN7ohbiyFI9vRnYKiUJTBYui+
 qb4n8CkZA2COe6mHsPNBRRE8AA73qxQS0NJSulvOqgA7QaGRK5nCKK9rZNxXpdxKO9ni
 F5QvCNW22N9GCH/70I/P4Rz9RoSP0r2+/BhYAClOHlhVqzN6j9KAD+CS8pWcWDWfMshD
 ZNDffls6ajGTjDkaW6sq5LyNlT8+rsxT1Ehp1KJXY92IL63mKzS4ckItfVXIfDbJTaPf
 xZq3o6tcmCf5MCo4lH1ahtUWxa+YIi8VjYnjYpgV5A0Ab/yOistv/+Q1mLj3SHD+iV1i
 iYzQ==
X-Gm-Message-State: AOAM532FOUkKRckNwf2GGLragUUYHPSFjbKWLN1I2rmK7XPxzL+1a4CU
 wxDTF2jEbYZDHyoBEgTlsxsucz46y2ZCjQ==
X-Google-Smtp-Source: ABdhPJwRvBaKB5uJQd3hWaBYGdTA2qjiU4zD0Vx5VkbH63jRgBpQJ+6oogLBiuphYxanI8PRaeRP8g==
X-Received: by 2002:aa7:85d8:0:b0:4f6:8ae9:16a8 with SMTP id
 z24-20020aa785d8000000b004f68ae916a8mr3181958pfn.15.1646341204358; 
 Thu, 03 Mar 2022 13:00:04 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] tcg/i386: Implement avx512 immediate sari shift
Date: Thu,  3 Mar 2022 10:59:25 -1000
Message-Id: <20220303205944.469445-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512 has VPSRAQ with immediate operand, in the same form as
with AVX, but requires EVEX encoding and W1.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1ef34f0b52..de01fbf40c 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2986,17 +2986,22 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_shli_vec:
+        insn = shift_imm_insn[vece];
         sub = 6;
         goto gen_shift;
     case INDEX_op_shri_vec:
+        insn = shift_imm_insn[vece];
         sub = 2;
         goto gen_shift;
     case INDEX_op_sari_vec:
-        tcg_debug_assert(vece != MO_64);
+        if (vece == MO_64) {
+            insn = OPC_PSHIFTD_Ib | P_VEXW | P_EVEX;
+        } else {
+            insn = shift_imm_insn[vece];
+        }
         sub = 4;
     gen_shift:
         tcg_debug_assert(vece != MO_8);
-        insn = shift_imm_insn[vece];
         if (type == TCG_TYPE_V256) {
             insn |= P_VEXL;
         }
@@ -3316,16 +3321,23 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return vece == MO_8 ? -1 : 1;
 
     case INDEX_op_sari_vec:
-        /* We must expand the operation for MO_8.  */
-        if (vece == MO_8) {
+        switch (vece) {
+        case MO_8:
             return -1;
-        }
-        /* We can emulate this for MO_64, but it does not pay off
-           unless we're producing at least 4 values.  */
-        if (vece == MO_64) {
+        case MO_16:
+        case MO_32:
+            return 1;
+        case MO_64:
+            if (have_avx512vl) {
+                return 1;
+            }
+            /*
+             * We can emulate this for MO_64, but it does not pay off
+             * unless we're producing at least 4 values.
+             */
             return type >= TCG_TYPE_V256 ? -1 : 0;
         }
-        return 1;
+        return 0;
 
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
-- 
2.25.1


