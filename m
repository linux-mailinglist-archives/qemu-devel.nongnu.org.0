Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC154416FE8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:05:39 +0200 (CEST)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi5K-0008Tg-VQ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThh1-0005FJ-2R
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgz-0007Db-Mb
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so25378576wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=KDCWAGWFJ7upO9THVyMnjHDFpep3f6zTACmCde0ZMovLrlalzOrwlvo0lsOtwv1e9g
 SNo15gysmGyaSBA/QGdozSsmZ+A1XmwBCOgvUIqWpB4WNSFF27YuSx6lM5yOpNp7h92h
 LLhywYEi/dmU48cSbtjRRxSiL3J+1yQ0gliA2gqR2BcG4/VvsaGcv4PK/5aGmzTByl8J
 CepeMYtBlDcLq39aBtzBj4Evzm3zKncqK4CkACkRag5ohrQHiNHioSHZU92f/lwgwVGr
 gL4sIAWEWtaVlOGir0Q0dcR+9zpwIMho4JOFBCGVQFuj4UuCnpZRxAomOaG/Z4Kxp/WA
 h/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qq83gm6o51EoSTv2SvU60Q/ZscN9CmckVp0QDVwTqtI=;
 b=Y80c4ffmMEdQKLD53eNJRJqCw9gHedaLAyRgvD08p18kmKO+ueBHoZw+0dLTgHaq2n
 XNRQB9IjbxROyYp3pwyJ8IodGrYhf9O7IpV6AL+IDzRW9uCG9Add/1o+yAUd5ESGbEBM
 Had+kV8YBVDgtRcyk3yfDHmSJvbbwEcWvfdrFfMUUeGP4g/B2J4mxdLOQrM69/fj7w1R
 FO/XCwyl/1iBfS8wuOPM3SccfPSDRXeyfMKXvON7tWrmv3ICcJPoEHbMC/yn8jJNxN/V
 mEfwbKBCQGxWy2qbj0JJsIFOw6xsyQasY8OH/xH/PRW/H77LAe93LbD4YuFNCJVu30sX
 n7OA==
X-Gm-Message-State: AOAM531cIG/tLAsWA2RZZ3Hw9T4mtDQkTf7ScI6VC0SJ0tX/ssf4Uhrb
 Xjjff/W73cKXScuX9VaCKTBKH1llIzI=
X-Google-Smtp-Source: ABdhPJw8GDZW7mDT3/NQPdK7CLRqqVrGF7VJGfXctgRgrFFg8nHO44TSZN+lIdC1lrT85tQ8cLkS2Q==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr9942607wrw.311.1632476428088; 
 Fri, 24 Sep 2021 02:40:28 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a25sm11606310wmj.34.2021.09.24.02.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/40] target/hexagon: Remove unused has_work() handler
Date: Fri, 24 Sep 2021 11:38:28 +0200
Message-Id: <20210924093847.1014331-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


