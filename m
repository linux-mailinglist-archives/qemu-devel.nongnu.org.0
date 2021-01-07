Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E02EE907
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:46:39 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe3C-0006G6-2r
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdio-0000wn-RU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdim-0005Xa-PD
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id m5so7110078wrx.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TMeZXBPfIw0UjpZf8Gz8v4KrcSgueeNPugH/0sy+Pio=;
 b=Luly0zoR582cNphF4JxYJ/wLU37qzjIgDaR9mJ2Q1F4IVZ5DXDsAl76xGz0RhYjKYC
 v5rFDRvqQn+1E3+dd2HOUHoPMaXSJKrMPL7YXVuvSRxu2PHpZPkV245s9JZKAtvY9JEY
 03Vmf5qKPNt/byK6qL9hehSYI/aN8waCEtIFNo+ko8A3y6ZUO01bg1RggubpRvzNTtKq
 wRWBQMxskzbMErKL4r6/129J9lPtGfDV9ha230uUsnE6LNrBHm7haaxWkGlncI9dQGI8
 qSyE64sSahKBqaeF6KbARomyT4/4at0XEATFE4DGIuL0Id03BbZBl74xzfLWCCb/Q1jg
 k3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TMeZXBPfIw0UjpZf8Gz8v4KrcSgueeNPugH/0sy+Pio=;
 b=ivxzFJGO/ZrxcPHwxo2EoV7NLv9g1pHoi/I6jYb6ui2AP4k1GuHDrIGEbapEfypf3I
 FC3zXaR1A0WfkJm29ITSiZBp3INP6JUTLdFnOXvYuUUgTqUjsBIdHSre1nXBce//koVT
 6E5l3mB9Kh5SgvXLzXIcGIzsDCngsOBgXhIDIi4Ns+47RcB/huER7kLm04w0FnIOIzLF
 lvbdRk2ojYKghXEvTCJHq+Q6BootxQClJ3hYnHOGMuXprikh9FIwfFigLsUly03AhEQR
 0YL1E1xd/ySFyyk0Nly1Dju3dACD3JmMp+/wIHoQ8ntTO/z44gMe9M4wm5SuA8j7vHpJ
 4bIg==
X-Gm-Message-State: AOAM532p2YZD19CXStrQFg7ba5684bYsmQ3ZY6WfEcHCHVhkbPkWlGg2
 La3D2f5+gD2qI+s9mOcM0fpT9IxqFWI=
X-Google-Smtp-Source: ABdhPJyQheiVWednPyzYmSRVjnmfiD7VWxSYgMeazBYkbky7oQAAQ3mn/UgeIi/xUbmp1CUcnp2SVQ==
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr703316wrs.222.1610058331183; 
 Thu, 07 Jan 2021 14:25:31 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id k18sm12295867wrd.45.2021.01.07.14.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/66] target/mips: Replace gen_exception_err(err=0) by
 gen_exception_end()
Date: Thu,  7 Jan 2021 23:22:17 +0100
Message-Id: <20210107222253.20382-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

generate_exception_err(err=0) is simply generate_exception_end().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-11-f4bug@amsat.org>
---
 target/mips/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5889d24eb65..445858591a4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2898,7 +2898,7 @@ static inline void gen_move_high32(TCGv ret, TCGv_i64 arg)
 static inline void check_cp0_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     }
 }
 
@@ -3104,10 +3104,10 @@ static inline void check_mt(DisasContext *ctx)
 static inline void check_cp0_mt(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     } else {
         if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-            generate_exception_err(ctx, EXCP_RI, 0);
+            generate_exception_end(ctx, EXCP_RI);
         }
     }
 }
-- 
2.26.2


