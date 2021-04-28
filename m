Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22E136DDF6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:13:40 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnkp-0007Vm-SE
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncO-0007f2-9J
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:57 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncM-0005qx-As
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:04:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x5so13554243wrv.13
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zi+fMglV6U1JmHUHb3YXn7uEOGSf74nTOit2v0a7sNQ=;
 b=OhdCaowZukSejyWHHTwiBU3vCNNzRMbR8phqbi1YrGLVUUuKLlnQzpSAEsvrwNTNKZ
 W4log242zRp8WwP3VKYYFo/icDxuzMeW5aqdVpxfsMw6QYURTyoPq5Qdrb+kA7/zu5Qf
 hDwwwQJ4/XzMLQimsoCyWgJ0sPp/zkTOK5iYwnIBjAdMtYmcgDLLW2ck1uT4c6PjXApf
 YLhp4BgDITIirGM6mP0J97mewAKvxCiWFOwd8nZgEd1tUmh7sN5jUnrK0eMyFAaQPMoD
 kQAZsiN5/LgKmQmtWDu3nnkZQlldPYsEBWVnt0c5PnMi/UNTdeLtwf9OivteFQqDgcAA
 fTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zi+fMglV6U1JmHUHb3YXn7uEOGSf74nTOit2v0a7sNQ=;
 b=HugXTG6rOxnSDUi9mvwX8/S/Jlr6IMHm7iV1HJoc1YuOWpnrtgdKIRHtX1+oGTHlF5
 DEHYZbx2k61pWwYNlQPkY0v2ec7aFqhjOgbzy+lE/U554T2tSpRONHvtM4SdRRnnvgRV
 iXsk2Ufwz1ceDCitIX/CCdl/xKV6b6Se81TT+ntZs37gUvP63Ez6YfNJhzu173XYZ6uX
 OxJE2UV+KkQxr/QtktIAJtlY/zEAHr5SFxM+UK2v2reJhDe1oV34g3J1DkvdbHKnYlh9
 hkWmww2Ra7Tt349NyJGCJwrSrKZ+XqA5iMSp4vlPlG4vOFvhIgp8vZICC3lgY/kahB7E
 iB0w==
X-Gm-Message-State: AOAM532l77WN/U+oPL3HrJPr9Q5ZsrWfHfs+skLuDHj4/vHU2aXS/BQR
 6cWEuGJ8UPgVrU9+MsnnhKJF2X6dATyupQ==
X-Google-Smtp-Source: ABdhPJzpwG5Oy7kNx/2gMYAV64qWVoKZSGEcalo284rI9OCFWjoXjwRjRtLuBormQrTI0BxUObGRLQ==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr315746wri.129.1619629492848; 
 Wed, 28 Apr 2021 10:04:52 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d2sm459430wrs.10.2021.04.28.10.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/30] target/mips: Optimize CPU/FPU regnames[] arrays
Date: Wed, 28 Apr 2021 19:03:45 +0200
Message-Id: <20210428170410.479308-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all entries are no more than 4 bytes (including nul
terminator), can save space and pie runtime relocations by
declaring regnames[] as array of 4 const char.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 4 ++--
 target/mips/cpu.c      | 2 +-
 target/mips/fpu.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index a8644f754a6..37f54a8b3fc 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -71,8 +71,8 @@ struct mips_def_t {
     int32_t SAARP;
 };
 
-extern const char * const regnames[32];
-extern const char * const fregnames[32];
+extern const char regnames[32][4];
+extern const char fregnames[32][4];
 
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f354d18aec4..ed9552ebeb7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -35,7 +35,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
-const char * const regnames[32] = {
+const char regnames[32][4] = {
     "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
     "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
     "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
diff --git a/target/mips/fpu.c b/target/mips/fpu.c
index 1447dba3fa3..c7c487c1f9f 100644
--- a/target/mips/fpu.c
+++ b/target/mips/fpu.c
@@ -17,7 +17,7 @@ const FloatRoundMode ieee_rm[4] = {
     float_round_down
 };
 
-const char * const fregnames[32] = {
+const char fregnames[32][4] = {
     "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
     "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
     "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
-- 
2.26.3


