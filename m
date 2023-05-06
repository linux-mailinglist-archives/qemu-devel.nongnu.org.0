Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C21F6F8FFD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:28:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCGZ-0005nI-HO; Sat, 06 May 2023 03:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGU-0005bf-Vx
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFu-0004XB-Nz
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30644c18072so1726906f8f.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=UUB9heQZK2dk3DkWZJ+PK33dPI7Dph7mEO7jvS0vPMU8y9q1tDHSw34jXYSyBh/bkI
 WXx12h1YirRPxICSp07nqIEzO2XTR+uwCb7FBvVQAHX1RiWLsXXrVxxngrkpE0Xu+ngr
 SkURFJ42IBa8diQRAj3UDBtGVizvWUJhr/Sou20BFDD5yPj63M1yPTWYwubG6BSta6+h
 5m9b344tcSxJLs7I2Iczm8jZBuSVGQ9jJ8ILU4WuF/PPTXAlTj6qEqwVAAg9UOQZ5E1z
 bZPTXzMBhF9XDDehj1s8wbZHHyGWy2UDyrJ8X8Yf4qtolVvRixtnQIZJ8IvztY4eZQXX
 fsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357777; x=1685949777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4O2YAeN9cb5anbyImPMVEQOY1pM7UmSuOPh7iKYeY4=;
 b=c4Gd3iEZyrHIqwiTHBAi/diuTlMEhxPRiZcS1zACu/vsfc6EfCQv3eYGSmxuzaILQJ
 gAx3AJQSr8rqC86XiOXWSwFTd2VCMiYYLIYG8wU/hKeVJZGB5IZD2DRnMMmGW7cnSVUl
 OWUdKYSSIHfWnmux24pL5gXq5QTJC4Tph+vad0Upl8Bm/lmGFoLWlv55sOOn2cpEfmUC
 0JMGcC778/nv757p2zudYaSQ8VPmawAG1WPFZAIEZCmxcGpKvy7iU2O1/ee3/RbM/Gqi
 GYzSOOP6xd1/2cvYDNckbbgZ84Rrj129lyq+bVOf52305sQgE/D9VchgeG1xe8/LMvlN
 zllw==
X-Gm-Message-State: AC+VfDz0K8hJgOJ1LB/ji4XWaaqVXDA5A0uCPsSRjFi5ljINkiySLP5O
 aYNeY5q4+BN24W5LK5UCaIxLx+dGedNwrAFTlIP14A==
X-Google-Smtp-Source: ACHHUZ4/P0AFvJ7GR9ZcslfSm5QnkTPYJwrb9+Id3AaB1BrqbrITgvME3z/xb5GqyLldhpbAn2b3ZQ==
X-Received: by 2002:a5d:6b86:0:b0:306:2fd1:a91f with SMTP id
 n6-20020a5d6b86000000b003062fd1a91fmr2458522wrx.61.1683357777330; 
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 27/30] tcg/ppc: Remove unused constraint J
Date: Sat,  6 May 2023 08:22:32 +0100
Message-Id: <20230506072235.597467-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 5a4ec0470a..0a14c3e997 100644
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


