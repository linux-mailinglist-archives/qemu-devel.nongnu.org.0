Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDE370E06
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:41:45 +0200 (CEST)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFA8-00050i-9G
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElt-0005gB-LF
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElq-0007Wj-Pa
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id l2so3086541wrm.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otaOdF2+QjBw7vCs6eJeEN+7XfrkFSt9cRlnVyMFAT8=;
 b=YzqwfsBxeZ643NXMZN6yrtEFs37/3BnfS98ZFXzsjsAJ7BGFSbbUQC72ZutQ25swS/
 HGDGfytE/dH2taG2npjICB9yhLHLkGpd4fx3KzAeLzgbfYVd0scb26qr6AqF2iAnaGBc
 fjH8ew4cbKGtKf3Gp6Eg+qtA3PX+ZF+90EkKssh3Xb+PPqW5HTx7aR9Ate60wSrUPoZw
 c73rFN7fpl9S9h/K+fb0Ac9i32I7S0QSJR0l/29hckG2+t9rzeNaTAMzmv+VIfhkOvqr
 qwnf8GS3/tZUFGUuu9GSCfuPf/H1PNVrAeWJdR/v6LpEnqVD5DWS11O5+9WiqxFTYFQ7
 HrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=otaOdF2+QjBw7vCs6eJeEN+7XfrkFSt9cRlnVyMFAT8=;
 b=tIv5H8po/UOF2KmfgKA6yeeh+uBM4b3x7a1NfH+FQqW/4pXqNgfZR3kssvnb6ofWiD
 1BePXE7K+VkEQ4UCK2vabySiGy3GBXm8pmE5CD4UFf2G83ZWXQWW8SVhwmihpormhyPS
 liI1wrEpzyNHHoZXivM6OihsA0ab8iXT5tbB9xnz1cL6+WH8E1gF3TRo5BHjBCF5KkiH
 ZqrpImOgyGrY+PaBdWlcvw+USAG+O15oeADSYrafA2tAC3penzpiiDfNCuqJAh8jN3Y5
 5OjQ5mIywt/iI8d/9hBVlPUNeuFApxou2tRvIswsUFVPFquilEctEgothr+b7CeyYo7o
 HCzQ==
X-Gm-Message-State: AOAM5336KCuSdJlOXu+CVQdx4G4pb+ZSxKJomXXEiIRV5liw3/UIQjSu
 Y8nokzNCkO/steZnEjBQzZWWAElyH5nj5dN6
X-Google-Smtp-Source: ABdhPJzOy91Rge+I9QbC6z1HsSI2Ja21veqhliFdHuaxqdufJ2JvBOw+2yiQMJf2G6zjnK4wWR3pYA==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr19439702wrr.305.1619972197154; 
 Sun, 02 May 2021 09:16:37 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id s6sm21201888wms.0.2021.05.02.09.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/36] target/mips: Optimize CPU/FPU regnames[] arrays
Date: Sun,  2 May 2021 18:15:13 +0200
Message-Id: <20210502161538.534038-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Message-Id: <20210428170410.479308-6-f4bug@amsat.org>
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


