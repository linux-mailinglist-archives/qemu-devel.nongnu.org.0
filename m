Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2396A65E1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCez-00019r-2p; Tue, 28 Feb 2023 21:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCen-0000sf-8c
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:29 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCel-0003Ez-Kd
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:29 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i10so12543876plr.9
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9Zl/72jqCv6b0jcueBEHeUBqu1bzp9c+AmvOSIfBwY=;
 b=IbT3lmf/wW2/PcQGpqdZboGaMczkKuvNgA5QMZKS8CPxYB858sukbywVLvNQlInMgV
 AyAFL3wmAW3xHo83tNVuPIlC1OKMMsakqvh0OCFJcpPtZvEDjgqZlpxgNx0usgd0lved
 rpFVftqLlDnmzN3Vw41oZn0Q12+AIYz+B32R4UDJdBIA95gg6ccnUTj1t+trKCOiPK+j
 fAC4OKxETdlDUGyarSqZaVQfN8p32/clvGqrw6WrllclXHGaTkv2X+bPwx6BU11mhkQ6
 o98W+tQ2H8mxxlyFIB0QQ/0IslB46OVYnLLiSKZ9/4aUKDhDiNfnOpW4Nu5NJXe7ej0E
 t1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9Zl/72jqCv6b0jcueBEHeUBqu1bzp9c+AmvOSIfBwY=;
 b=7DDdGBw2EUVe+IMQIVFhDwdCW5ca7JTHJ79r/okFdps+hYswbHjNEuAflpMm0/g/Lz
 7xPhdcPv/XJpz5HoTTlBSjc9o1/OIGf7/NCHJ9ub68zD2IB9hxPnqWg530Dvx/w7nrTx
 yZHtusrYm9h0CXN5+0/pndKuYBnD1dbKva/yoby0zQxCfw9FGjSy3HqO3zG5LBRqvGwc
 HG7Tg0tPfUSHrzoIzcGaXPPgfSEl7rjGpcX6B7Ke5Ya1RgWQnCOVgWcXNnoF4UhNa8dM
 VpVIab1aHGzKYW1wvspxyKNfcy2zK5weGICiWckxIz3O/sJwhe9+3sUJhTo26so4WxiW
 vj4A==
X-Gm-Message-State: AO0yUKWgZ5wO4WFZHwviopEJgLOlblg2N1vSLtqGJemuGJzUB4jhya/G
 77RlXU8iHCcVk9le1Yk4vxkQYe/b/dOfQkQTGnQ=
X-Google-Smtp-Source: AK7set9WnJD5vv75gkEMHt8mFIEGDGZqnGu9szm9bdIOyLVDTtEjCLLcEBM7n4qmgiC+00OIPgRDNQ==
X-Received: by 2002:a17:903:24d:b0:19c:fd73:5586 with SMTP id
 j13-20020a170903024d00b0019cfd735586mr5645858plh.38.1677639446090; 
 Tue, 28 Feb 2023 18:57:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 23/62] target/mips: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:04 -1000
Message-Id: <20230301025643.1227244-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-20-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/exception.c             | 3 ++-
 target/mips/tcg/sysemu/special_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 96e61170e6..da49a93912 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -82,7 +82,8 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
 
-    env->active_tc.PC = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->active_tc.PC = tb->pc;
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index 3c5f35c759..93276f789d 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -94,7 +94,7 @@ bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb)
     CPUMIPSState *env = &cpu->env;
 
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb_pc(tb)) {
+        && !(cs->tcg_cflags & CF_PCREL) && env->active_tc.PC != tb->pc) {
         env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
         env->hflags &= ~MIPS_HFLAG_BMASK;
         return true;
-- 
2.34.1


