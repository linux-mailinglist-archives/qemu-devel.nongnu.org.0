Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04764CC7D6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:18:56 +0100 (CET)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsqd-0001OE-Pf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:18:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYd-00067S-JX
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:31 -0500
Received: from [2607:f8b0:4864:20::534] (port=39867
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYb-0004JH-B3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:18 -0500
Received: by mail-pg1-x534.google.com with SMTP id 195so5747052pgc.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vifo7q6L9IkoLUdxKHrGN8YzcFRSVAdcJsKjVkqwOiI=;
 b=dyKP8Qy6ZWwsm7A64LedhcCiJQwKwzmy3m6fwmYfwDihIgR3MuvOPDjBHO9xSaKTOX
 RGKkj9e35NZojeKk+IxL4vV9NNlOAZ3Pq3+CSayjytpoyTU89f/5Y2b8irV1IOhSnKtJ
 +4j7LCEYuQWptxitch6whFQmK2W4qD6Li2MMeU0oTI5IyP19Zhcew1SvBQ+OOIeVZ9aI
 ucf5/6n43I4TdcoccrVx8gH6pY3csxPnL9GZgtDOLY2MtlOeRk+VtG4vbXSO/WVR/4Zl
 tE+LRjNbHqazR3SQN9DdPK+tyVF7PGPIxG4V+F16O1W9uIZSoGgGtmkqLS7P5ZfGb/7D
 DzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vifo7q6L9IkoLUdxKHrGN8YzcFRSVAdcJsKjVkqwOiI=;
 b=McewW3jnIaJx/rh0vX8QUyHj0+KUJ6oRoYrYR+lmre0wAz2hJ4UtZhusoY+wQmYatx
 /2ara0jHx5M+e24lR24RuqYdlS9EQIU88mpW/IxB5LzgDzbHYdRLrWuVoPbjA7y/e61W
 Dx64t2UJkJv1Wnh+yE+CC1nQUieSICXlNrp4QFISts2K1KqqaFmYuLsRk8U9xc9Y0EN9
 6M8iJ2vYqf3jJIb+qpniJ0m8haHzyOffzHfOS2kKTndL9oUumdWzb/x4StYzciiNq2Ja
 XWGpTTXehVvP4/Ik9JroP5z+EEUN0MEovcOdo6MVaVTboK8pMn43FfkMl7BAeAsjvxdz
 G8Pg==
X-Gm-Message-State: AOAM532MgOO/G/1tSrYsscV1Ny5XUlERkL5YAYJiw54VLEhjVArA3avh
 eYxafqkClFm3n9yOhMk+Y1wtHQG61eREzg==
X-Google-Smtp-Source: ABdhPJz1mY4BYUR8yO/O1NbA8J33W7H9cLRU1/6JKjSbIDf/YGu8uO4MZgrAAGaMPAqEUQZ44C3n8w==
X-Received: by 2002:a63:da0d:0:b0:364:b771:ff4 with SMTP id
 c13-20020a63da0d000000b00364b7710ff4mr32239062pgh.514.1646341215678; 
 Thu, 03 Mar 2022 13:00:15 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] tcg/i386: Implement avx512 multiply
Date: Thu,  3 Mar 2022 10:59:33 -1000
Message-Id: <20220303205944.469445-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

AVX512DQ has VPMULLQ.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index be94b82fd6..a800764d2f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -361,6 +361,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PMOVZXDQ    (0x35 | P_EXT38 | P_DATA16)
 #define OPC_PMULLW      (0xd5 | P_EXT | P_DATA16)
 #define OPC_PMULLD      (0x40 | P_EXT38 | P_DATA16)
+#define OPC_VPMULLQ     (0x40 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_POR         (0xeb | P_EXT | P_DATA16)
 #define OPC_PSHUFB      (0x00 | P_EXT38 | P_DATA16)
 #define OPC_PSHUFD      (0x70 | P_EXT | P_DATA16)
@@ -2822,7 +2823,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_PSUBUB, OPC_PSUBUW, OPC_UD2, OPC_UD2
     };
     static int const mul_insn[4] = {
-        OPC_UD2, OPC_PMULLW, OPC_PMULLD, OPC_UD2
+        OPC_UD2, OPC_PMULLW, OPC_PMULLD, OPC_VPMULLQ
     };
     static int const shift_imm_insn[4] = {
         OPC_UD2, OPC_PSHIFTW_Ib, OPC_PSHIFTD_Ib, OPC_PSHIFTQ_Ib
@@ -3456,12 +3457,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 0;
 
     case INDEX_op_mul_vec:
-        if (vece == MO_8) {
-            /* We can expand the operation for MO_8.  */
+        switch (vece) {
+        case MO_8:
             return -1;
-        }
-        if (vece == MO_64) {
-            return 0;
+        case MO_64:
+            return have_avx512dq;
         }
         return 1;
 
-- 
2.25.1


