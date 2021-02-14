Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BAE31B1E9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:21:20 +0100 (CET)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM1H-0004hQ-1h
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhx-0008KN-1U
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhv-0004aP-Lp
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:20 -0500
Received: by mail-wr1-x429.google.com with SMTP id v7so6063905wrr.12
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3/ym6u6v63O1H9s9Yezp8ui+y1bj86FlTiPhugIplI=;
 b=Klo5Y6mKfHvyILZ5JrhNLmNVHQV/tVIJMBaluYcqZUgc8xXApkOjxedpHbeq2IIDOK
 jcmATjqesYhYDquY8OS9h3Q2cm3SWFB7T4t4RtSVWh44rrH2RON41WeFjRc5RdTrN5dh
 tFvUMAX77Yt76y6cn1OQzXUInPOWU90mAbxZH3WMJDkcCjD5M8uZIpMai5YD3SvKYwz/
 CR98OsNJTMR0Rv31+Bv6MSOQUdRwjlJAm1MZqxXEIlOqjqdwRS0VX4RSIATaLsuvEvQd
 J7HQneW/YW/vfs+g0mneOvJi6FAbmAlleYdWL4W8SdFKYMQHqMFgBlwKTILKpii7PWfj
 VQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G3/ym6u6v63O1H9s9Yezp8ui+y1bj86FlTiPhugIplI=;
 b=COK+1067LCD5KJPH2FCDx12EjsR2BlThgufj7lMs8y07Apv0PrkIJdj00wve1x2R2a
 xqCCfT+mH6OlLl4/38BRqmnRZHckKm3b9nDI/YaEbW8pxuDRekxnHfdOPw4zCmuV9kN5
 9he9QALExnduwJ/17DmzmTgFDi5vfpdnTwUbC+iN/0Cawt3NwcnBJlLetZlTEU8KLBdP
 Hi5skaDB3IuMKPU+ICen9xT/9K3oo7s8Bh7A3S6P9AiYgkCrKnoqY0TODUHBLvYd2hpV
 17Pqr+Km/LYVEQXEfCDxOF+w0416UE3RiHcZqk7uAobatPpLsq5lI6pwBjtRBhoJGQMd
 s1yA==
X-Gm-Message-State: AOAM531V5lNEk9sU+JF6UJi3pd3IdgTi4bXM/LFA4+ZJfP/j0XiGaBbW
 HVwC+HIxwT+bQP+h95cdccyh8bSGBP8=
X-Google-Smtp-Source: ABdhPJwzc+W5UUGlMaKt6SZ8lq1DqKMn4gFNtGPGy7QldaeTcQ+CaP1Av8ch5re5tgzzspXoxoFHig==
X-Received: by 2002:adf:f089:: with SMTP id n9mr15162924wro.98.1613325675275; 
 Sun, 14 Feb 2021 10:01:15 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g136sm7512538wme.10.2021.02.14.10.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/42] target/mips/tx79: Introduce PROT3W opcode (Parallel
 Rotate 3 Words)
Date: Sun, 14 Feb 2021 18:58:54 +0100
Message-Id: <20210214175912.732946-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PROT3W opcode (Parallel Rotate 3 Words).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0ea9fc95568..79001359242 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -56,6 +56,7 @@ PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
 PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 PEXEH           011100 00000 ..... ..... 11010 001001   @rt_rd
 PEXEW           011100 00000 ..... ..... 11110 001001   @rt_rd
+PROT3W          011100 00000 ..... ..... 11111 001001   @rt_rd
 
 # MMI3
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 59451a043a4..c25f61d382c 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -753,3 +753,31 @@ static bool trans_PEXEW(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Rotate 3 Words Left */
+static bool trans_PROT3W(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+
+    tcg_gen_mov_i64(ax, cpu_gpr_hi[a->rt]);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, cpu_gpr[a->rt], 0, 32);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], ax, 0, 32);
+    tcg_gen_rotri_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], 32);
+
+    tcg_temp_free(ax);
+
+    return true;
+}
-- 
2.26.2


