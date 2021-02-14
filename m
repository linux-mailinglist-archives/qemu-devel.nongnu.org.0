Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E431B1D0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:10:18 +0100 (CET)
Received: from localhost ([::1]:60342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLqb-0001In-Tx
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgm-0007St-I0
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:08 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgk-0004Ig-Hv
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:08 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so6045883wrx.13
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B0DaUMvL1uZYp8k8aX0o70HkV8YrP4Nv25QeZd+p2wA=;
 b=NMP2fgy1zjpPgtT84U9cilEVBeTtfg4NO5OmhyLEhNtpDGl09f9zzmWgNi0jZYxcme
 R0ra/+9zGaBwqU4I7AY7KMJ/eJTQZVVigaaZH6N5VrSuHUqHtO2i6k5UdBCmPideHxDq
 XnS7Lza/hHkESqnbxyJOY4vr/fV3z+xdLHIOceVbVWpnxke9/aQYTH+j8Rn+LmO4I4Fa
 UH3vRyMmFguiWui+v3+muAX//gWHhL/9fu4enapQmdsWG2Ynowpdj6kh7/BiUP70234O
 PQ4QpvGT5jyb9Z9ed1zdQsBF9Rze9b//MGhWI4GT6QipyAlsXsZcv3A8ZHEO2V45kBhy
 MQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B0DaUMvL1uZYp8k8aX0o70HkV8YrP4Nv25QeZd+p2wA=;
 b=p0brg05xBfwkPpBqNPXhRGyssCcqczalSnlZy+lOttufHzLUAKt1CyI00023lx1gHG
 iNNh0CHsFXzi4e8JfuD09+8A444IZsn8gYT7Wvt+5kUXaPKCAZsI9JhNY3hTrYXgexYC
 Xg5Cuiw2LHAkvncJ8Oqul14hbJUjG4cYTX5fAVpJbYe8HHdnztTU/DhMsg4EXuMEnoxe
 alBFBK4BHs9U4tTOLyYTW/nY8j5iRiK8qQ9+NrcAFM6W/jxUlVBoGGZH+VDJnVyRGNYz
 fCVOzAx3mFeSLD9RL+IGjVx2ZTDvau2xTxqXvsz8i15NqL4Q2u5d5ZOQIuNNzAdZ00uD
 F/ow==
X-Gm-Message-State: AOAM5303AFGGXoLWG27EoX5LHRgF8kuXzXggNJmBofGZBUrjorXHS58U
 LZq1BAiB+2vJAIm4GgVw7cHuZ4ksFAc=
X-Google-Smtp-Source: ABdhPJwlYjc3Gc0XII8yBOWF5dRbtptdBthLb3L4LfZNQ8DpeJXFBYBYZAqehyU8eJ2FCsaUTLXPGw==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr8952777wru.300.1613325605050; 
 Sun, 14 Feb 2021 10:00:05 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a84sm22132594wme.12.2021.02.14.10.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/42] target/mips/translate: Simplify PCPYH using
 deposit_i64()
Date: Sun, 14 Feb 2021 18:58:40 +0100
Message-Id: <20210214175912.732946-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Simplify the PCPYH (Parallel Copy Halfword) instruction by using
multiple calls to deposit_i64() which can be optimized by some
TCG backends.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Use missing rt, optimize (Richard)
---
 target/mips/translate.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 7bd951d3a06..a13ad4959b4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24762,36 +24762,10 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
         tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
     } else {
-        TCGv_i64 t0 = tcg_temp_new();
-        TCGv_i64 t1 = tcg_temp_new();
-        uint64_t mask = (1ULL << 16) - 1;
-
-        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr[rd], t1);
-
-        tcg_gen_andi_i64(t0, cpu_gpr_hi[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr_hi[rd], t1);
-
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rt], cpu_gpr[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rd], cpu_gpr[rd], 32, 32);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt], cpu_gpr_hi[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rd], cpu_gpr_hi[rd], 32, 32);
     }
 }
 
-- 
2.26.2


