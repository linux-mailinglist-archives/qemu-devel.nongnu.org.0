Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2F6F50AC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:09:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bk-0004eK-Jy; Wed, 03 May 2023 03:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ak-0008AP-8c
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aC-0005p5-Qe
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:57 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f199696149so30072215e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=DQZStCmfpITqXVoPKKs046wsCDC6HKbvcDtAnqC7TguHvFgGaIT2G/NeXwws19QZLw
 gKp+COQvhNBrVGbaAUqbiS0yMUNLqXFk2ggkvJQ0b5oySg4ZcV+nI+5hh5Rrn5IapeYV
 sEJ0d3feP9kFdq3cFTXVJpOpvd8QJ/pwn5aDJhLqaS+ElnFBT/vEmOJd/HY0yd9tJOCA
 XHhgKMR1DToVJIY2MWvOB5fW1TJCC92FaKjmih0D9PI3b37b+pstBxjc/WCpPVvo5/cB
 7C9IrOWeXOQAWPiLNQsNAQqOD3Z94t0hxAA8/GImAQHo/Ho4A8yrx8m8/mrRcBdKSyoz
 VRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097642; x=1685689642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=ZHgnPCVEiK5lt/VExyB1PdNjc1cyGi+zbv6+XJPovGi02W32nSTmuqBz2t4pLsKzsP
 U210pYD/amv7NDBhGENl5OeX/7DmZg7qoNmi1oJ5Q3KdBowWSzEbbqqPdB9MwMdV7tuG
 Es59jf7UkKhDOF4xggzQ7iv5KgTcZETRyxKU1REiUo9jQOSbIhokkFgr9LgK24356uIN
 e74NMXirGww4D7EZZzkwSAGiIG2kK0klRXuq5i82M+dmcDItW9uYADLBiSYojPyoIelQ
 /6E/Znjf4pIBHui+eQZlxUga/EVvnOuAMubZrM/xct+++Ylqa4va46WjmwXgZzLA9g0h
 Jvzg==
X-Gm-Message-State: AC+VfDzYyo3KaH8scAgWOda/dz08Cu7xPLU1Dp6w02ZoI60m2XJNWCHe
 4y/HJCWHyVhuUyiRYwxLTlktBDTyChwMWZqpaHzY+g==
X-Google-Smtp-Source: ACHHUZ7QEeuu8KssG1eXNRr5Rt30HXnmO/n49kkgkL6X1VkYnDflEBuchiGpP68HGcG7u7WlaAnjAg==
X-Received: by 2002:a7b:c388:0:b0:3f1:7bb5:9d71 with SMTP id
 s8-20020a7bc388000000b003f17bb59d71mr12991250wmj.33.1683097642518; 
 Wed, 03 May 2023 00:07:22 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 33/57] tcg/sparc64: Split out tcg_out_movi_s32
Date: Wed,  3 May 2023 08:06:32 +0100
Message-Id: <20230503070656.1746170-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e244209890..4375a06377 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,6 +405,13 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+/* A 32-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    tcg_out_sethi(s, ret, ~arg);
+    tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+}
+
 /* A 32-bit constant zero-extended to 64 bits.  */
 static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
@@ -444,8 +451,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
-        tcg_out_sethi(s, ret, ~arg);
-        tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+        tcg_out_movi_s32(s, ret, arg);
         return;
     }
 
-- 
2.34.1


