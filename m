Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B11769B1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 01:59:29 +0100 (CET)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vuC-00043G-7m
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 19:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkb-0001uq-Rl
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vka-0004Mt-Pz
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:33 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vka-0004MI-KX
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:32 -0500
Received: by mail-pg1-x536.google.com with SMTP id 7so675276pgr.2
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 16:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=rNsQkuIoNOeCoqq4/C2RK4FR6al+zbYhClVtHKQOLLw=;
 b=hB408k+WIvmJqdbZQqhwKNre9xBJqsfVWGabGoLOMJIYZD3zy7V1M1r+5Uf14uqx/P
 o6avf31ufsPc9X75KaoCZiRmY7ciVhzO6VLf2lVwkBf9Pl4/KpnOCiU3CDjl0TgxQJ99
 JxUoKcxTn+abiHtGpIQAydrVKAMTDWxytOENDcHSOLEUQwf176I0/O3N9AgXt5qmlBRf
 4KqXrcR+nsxHYjE0Y+PasopFc9MIRh3lL5R/qbt88CcMPYuSdbHZLHCFOt6LsgBugZTN
 /2lBOgdAC7zfVS9fO1dvEiPIgeSezebDWlecxLe91vIneO1XG61jkIjm1PZ5z28rjUrw
 1POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=rNsQkuIoNOeCoqq4/C2RK4FR6al+zbYhClVtHKQOLLw=;
 b=C/MtdZu3bUyn38ZBvG3+WUzGh+FOeoaiLEusLG5VyEkwanc9hMWTu1vkcN3Z8i6DbW
 iwYNGNSzE71LsAH3yYgi+tuEslAe8uP33AMddFMZ+wkjC1BOrOxqXNPdGk569Vwpsd0/
 45FoPUuZ5D6rHMyH1GSQkm5dW8eHAlNqMFTJl2cK1K6r+Kw1OcNgYgGQyKSKrqTBSuY7
 O5cR7xj1ugFm9OnwMdf0AH0s665onrbRlTW+pfy+KkPza0rllQAL4vYjbjDoDorAeE+V
 gfV58+eD1gJ+OL9oGuLfz2xW/RtoRxKUG0KonD2+r3dLZO7Ih+RYjDOM7/Pgd42GAvvV
 q+iQ==
X-Gm-Message-State: ANhLgQ385pNFSDJCAWfW+QJ1xyB2wi+KNcF0roHghUDdBFpcEvCLWP20
 8s311hGbl6pM2wGDlvNDuk7JuQ==
X-Google-Smtp-Source: ADFU+vv8GBm6o3EZFdJJiap3o5MIdsStvARl6zXFdo8DW4l5gDbAf2rlzTCK6mlo2vi1M9Gh20RdxA==
X-Received: by 2002:a63:8b41:: with SMTP id j62mr1513586pge.18.1583196571641; 
 Mon, 02 Mar 2020 16:49:31 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id f19sm15219913pgf.33.2020.03.02.16.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:31 -0800 (PST)
Subject: [PULL 20/38] target/riscv: Generate illegal instruction on WFI when
 V=1
Date: Mon,  2 Mar 2020 16:48:30 -0800
Message-Id: <20200303004848.136788-21-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::536
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index e87c9115bc..455eb28907 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -130,9 +130,10 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S &&
+    if ((env->priv == PRV_S &&
         env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(env->mstatus, MSTATUS_TW)) {
+        get_field(env->mstatus, MSTATUS_TW)) ||
+        riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.25.0.265.gbab2e86ba0-goog


