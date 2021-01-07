Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B2B2EE959
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:56:26 +0100 (CET)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeCZ-0004A6-V0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjJ-00023u-9M
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:06 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjH-0005ti-Pi
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q18so7157959wrn.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xMINXm1sTVzeUT3ZE6sRQjEA5ZHRpEpLUaOQgOSkVsQ=;
 b=EHAE3Ol5/HOD8NEgpNC9Z7QLjkfjlPScUCA/+1Ni7Wvc/Ouh8RmBNpTvF44ACC+O94
 ui3rGx1wKxHQQoWQyUnB9heNVZifzrLk54YRq8z3DH4E8rDIK8hHUaSM/Kf04dakP5vJ
 Fd/RQeSsatodFbulCqF6x8TiPphBSmQSoE2oFdRH4mW2S4ao8xDf4CPQc974T0fgAWgw
 KUM9zTusnII0RIHXs5cxNPaR4GTj5lKYOe9TbQos2ZzdL0gfkCVrktIaf+TvwrLhWRw7
 fAdNPsepUBUnfdlphWJmcp2vcwOQupadPCDedEMM2CG1BB56BBZBMIvmFZBdizHwPzJH
 WgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xMINXm1sTVzeUT3ZE6sRQjEA5ZHRpEpLUaOQgOSkVsQ=;
 b=OLUcJJ72Zre8+Es7UKP7MKlWPN9C0mtlyO57cd2rHzP8CsEJtQcLLWx4qL04DX9E8b
 LqTxy5aSuGi5OmbiHoWYTb/alNAtB+ZlCg9Uo/epl7wGn/Y7Tqc4CvY4ME2gMy07dTlU
 u1HBPceaSrcQsMNjgsv3T3uOWVWeJwDwxE41Gz1siBr1K2kvibrpIyxfb4tY3qpVfeLl
 Jt54MJr4p3pe7YD60la7hdOLMDp1ZlQCPAzLN+JpF7nqE74SAQf/Szp7yCQy6lxJ2vR8
 5N4Y9amAmi5pE4jvySuRVu4zoqlkV+jPs1EdnCzoqKv54RtXpq1fYsJuiJx8yMPlhJ3D
 IIHA==
X-Gm-Message-State: AOAM533lILVSUKNKeiuzqAo5uOiQkL20D/rgMAVe76WgaHWdAA4gt0D4
 s4HnqYK5h2KSaqEYsvx8cJIZR8mw0Q0=
X-Google-Smtp-Source: ABdhPJwjVucGLGwLTP8ZlzahNzVV4CW6S2hcO4HB4SrTqZzAZcO7bXWXd4P/foDdI4h565pPc3KKDw==
X-Received: by 2002:a5d:60c1:: with SMTP id x1mr660228wrt.271.1610058362338;
 Thu, 07 Jan 2021 14:26:02 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i9sm10795243wrs.70.2021.01.07.14.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/66] target/mips/translate: Expose check_mips_64() to 32-bit
 mode
Date: Thu,  7 Jan 2021 23:22:23 +0100
Message-Id: <20210107222253.20382-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow compiling 64-bit specific translation code more
generically (and removing #ifdef'ry), allow compiling
check_mips_64() on 32-bit targets.
If ever called on 32-bit, we obviously emit a reserved
instruction exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201215225757.764263-3-f4bug@amsat.org>
---
 target/mips/translate.h | 2 --
 target/mips/translate.c | 8 +++-----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index c70bca998fb..402bc5e8846 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -128,9 +128,7 @@ void generate_exception_err(DisasContext *ctx, int excp, int err);
 void generate_exception_end(DisasContext *ctx, int excp);
 void gen_reserved_instruction(DisasContext *ctx);
 void check_insn(DisasContext *ctx, uint64_t flags);
-#ifdef TARGET_MIPS64
 void check_mips_64(DisasContext *ctx);
-#endif
 void check_cp1_enabled(DisasContext *ctx);
 
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7d2120dd51c..69fa8a50790 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2972,18 +2972,16 @@ static inline void check_ps(DisasContext *ctx)
     check_cp1_64bitmode(ctx);
 }
 
-#ifdef TARGET_MIPS64
 /*
- * This code generates a "reserved instruction" exception if 64-bit
- * instructions are not enabled.
+ * This code generates a "reserved instruction" exception if cpu is not
+ * 64-bit or 64-bit instructions are not enabled.
  */
 void check_mips_64(DisasContext *ctx)
 {
-    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
+    if (unlikely((TARGET_LONG_BITS != 64) || !(ctx->hflags & MIPS_HFLAG_64))) {
         gen_reserved_instruction(ctx);
     }
 }
-#endif
 
 #ifndef CONFIG_USER_ONLY
 static inline void check_mvh(DisasContext *ctx)
-- 
2.26.2


