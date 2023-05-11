Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D667A6FEDA4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1JG-0007Rw-0r; Thu, 11 May 2023 04:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Im-0006gE-Dg
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:28 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ia-00013H-Hu
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50c8d87c775so10951898a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792315; x=1686384315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QU1syb+cc4YKGCG4Z49Hidz1m6+KfeR1vmxnC8mNNIs=;
 b=jcIpcVMy0YbzCFwfBRLc1zrex+zsXqq9HSXo57XLJ10DjQgu7ElI2XxBgs1wBveVQO
 DUR1Ph/PcCA3a3xfP/O8AB1awXAsq7UBrqQjEaHjKspOOMcGY4f9fSC6034q+4Sum7k6
 /xuS4wuDNgOFoLTdeYkDrkM5pmaFcgKvuTHNUbxs0bNypDDTC5VWmdSu5FHi4QHb0Gye
 sviAI/2LJuXpsX65ufR6OczoBo19tC9B+rNMdD2xFvEdNFdynIvVNUil57eF6tomdVnN
 xyMEYJ7gmQgMVhlFNNk++BGty9Ji890lu1YhXZK2jyRxM8B0KMaNd1/Y5GMgCzvNBc9u
 oQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792315; x=1686384315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QU1syb+cc4YKGCG4Z49Hidz1m6+KfeR1vmxnC8mNNIs=;
 b=k21XHe0U1ppra+0piwEos3TRjDvVbxKiaKFfrfcsxMzgEZdqHlHhM0YZBGPOPdK70D
 kJ048UNe+IaE3getlNBfxyA+csZ6H1IW1y60x2BeWqyaLVmTeya6knwNOBW0ExyvxbzR
 SChem0ptp0CF4G4Izx4pL0QLiMBzsm1nj9yR4vglMWYLLsAzVPAvzG0vU/TWGVYBG6m5
 gXkX0Wgu7CX0vIvz2lRDJ7elns33B513ovKE1HDNsVOMMAGoYd6fm3PBYBolSLOM+wus
 A6AiQtXLwe10YcrvRlTy6vE4ctttDm8Ffyuzs+Rz3ohN5EdMI7E5O93UUe11bSkwS/vA
 2gcg==
X-Gm-Message-State: AC+VfDzLXmzC3zP5zH0fgLCS+Pv4LUoZWyWFUmjXdOyvxDLVywvJ9vxb
 gQPpVoruIClYIobWNYFhaYBlXGWe/pfOJlJdBrfz0g==
X-Google-Smtp-Source: ACHHUZ6iiyZFlPJNVbkuIMjEgjsrzDJYFraAOPQjbVlt389DB553EyYUY+7EyhxB+SGwdW2658NZng==
X-Received: by 2002:aa7:d705:0:b0:50d:8c5b:86b with SMTP id
 t5-20020aa7d705000000b0050d8c5b086bmr15355053edq.21.1683792315238; 
 Thu, 11 May 2023 01:05:15 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 37/53] tcg/ppc: Remove unused constraint J
Date: Thu, 11 May 2023 09:04:34 +0100
Message-Id: <20230511080450.860923-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Never used since its introduction.

Fixes: 3d582c6179c ("tcg-ppc64: Rearrange integer constant constraints")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 1 -
 tcg/ppc/tcg-target.c.inc     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 9dcbc3df50..094613cbcb 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -16,7 +16,6 @@ REGS('v', ALL_VECTOR_REGS)
  * CONST(letter, TCG_CT_CONST_* bit set)
  */
 CONST('I', TCG_CT_CONST_S16)
-CONST('J', TCG_CT_CONST_U16)
 CONST('M', TCG_CT_CONST_MONE)
 CONST('T', TCG_CT_CONST_S32)
 CONST('U', TCG_CT_CONST_U32)
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index fa016c02ee..29bfbfcc61 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -83,7 +83,6 @@
 #define SZR  (TCG_TARGET_REG_BITS / 8)
 
 #define TCG_CT_CONST_S16  0x100
-#define TCG_CT_CONST_U16  0x200
 #define TCG_CT_CONST_S32  0x400
 #define TCG_CT_CONST_U32  0x800
 #define TCG_CT_CONST_ZERO 0x1000
@@ -270,8 +269,6 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
     if ((ct & TCG_CT_CONST_S16) && val == (int16_t)val) {
         return 1;
-    } else if ((ct & TCG_CT_CONST_U16) && val == (uint16_t)val) {
-        return 1;
     } else if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
         return 1;
     } else if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
-- 
2.34.1


