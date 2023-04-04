Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B286D64E0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNd-0002YI-RZ; Tue, 04 Apr 2023 10:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dkovalev@compiler-toolchain-for.me>)
 id 1pjZ8t-0007MJ-0l
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 01:23:39 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dkovalev@compiler-toolchain-for.me>)
 id 1pjZ8p-0002Q9-6l
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 01:23:38 -0400
Received: by mail-lf1-x134.google.com with SMTP id h11so33882186lfu.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compiler-toolchain-for-me.20210112.gappssmtp.com; s=20210112; t=1680585793; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IaOX42jEq6Sx4FmHt/3Bu/vz7GR/ghrqJ3vXLkTLHLM=;
 b=LTg72RPV5PEl36E3RnS2nuNwfC8omtsom/zeeuDPLsGhFP4b6hR20iSw5hgU0GjzjH
 D1WJGaLU4qe4ecqQrtK769jj57pKFO2r1eyiPrK1VmcZ/8/Ynr7ZWyOM1px80neLyIz2
 FMnwTlSQY+9iRCv4vGs6XBytRZcPnNpP4quNsmZ23a3ZxM1+eBarnmYPIsJIS5cz9Wmd
 elvkwaW77MKUttxZb6jm8kEx0ErUzxxT2Bh4FZCBMDIZbeVSJiz/feiGL3lf/0EeEg8b
 oRQFTNSUONcVr4QL0DK6E7Tlw3/5+DLJ1i42EOoGucsDIAM4eLWNUVdkzAfXZQrfHQR5
 WjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680585793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IaOX42jEq6Sx4FmHt/3Bu/vz7GR/ghrqJ3vXLkTLHLM=;
 b=GGnnqR7thCHbBP/mYyMIO2oE5lXr6C/5YLjdDpg53T7so8gsxaL7yU8B1TT3V3f7Hn
 snQpUP3AkBG5PLUJuE70Q9FSHVVYBTKy9Sb0cTNivZ92BxIclIJgKSxv/BbH352Al3X3
 d9y6Zur8oeRtkX+6a923chDpqENV1eTpR3GoKbNr02CWBgcczx3KzwIBYa0tC3M1r1jK
 9Ef/0SSIb1EM0MtMEp5nlUdYdIV8ajAdHTLfz99iA9OA/VukhBxuj5tI7Spr40nxZ6fi
 hs5WVNeG2KP2nrbQ3LNqfwM4CmZWTCqztnR222uu+F/y1+/RduSikD2dc3qriGU0uVe8
 cyjw==
X-Gm-Message-State: AAQBX9fk6+FZ6HV+6Eif85GKtK4NwiY6FzlGI2a9fnph9re/YahLrdug
 SouTPipnuQrC7uaOnoOK3hqEObdUmfKiZfJI6QMLdg==
X-Google-Smtp-Source: AKy350bf589wddgWxnh+egtHP6Z/jtgt/FguHS85RuMoqVeSCZtxEyoaeadk2Mc8DYxEzkeY8ItWvQ==
X-Received: by 2002:a19:ee09:0:b0:4e9:cfd2:e2d with SMTP id
 g9-20020a19ee09000000b004e9cfd20e2dmr271363lfb.65.1680585793144; 
 Mon, 03 Apr 2023 22:23:13 -0700 (PDT)
Received: from localhost.localdomain ([89.19.180.108])
 by smtp.gmail.com with ESMTPSA id
 u12-20020ac2518c000000b004cb43eb09dfsm2124205lfi.123.2023.04.03.22.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 22:23:12 -0700 (PDT)
From: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
Subject: [PATCH] linux-user: Fix mips fp64 executables loading
Date: Tue,  4 Apr 2023 08:21:54 +0300
Message-Id: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::134;
 envelope-from=dkovalev@compiler-toolchain-for.me;
 helo=mail-lf1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 Apr 2023 10:11:21 -0400
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

If a program requires fr1, we should set the FR bit of CP0 control status
register and add F64 hardware flag. The corresponding `else if` branch
statement is copied from the linux kernel sources (see `arch_check_elf` function
in linux/arch/mips/kernel/elf.c).

Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
---
 linux-user/mips/cpu_loop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index d5c1c7941d..8735e58bad 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -290,7 +290,10 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
             env->CP0_Status |= (1 << CP0St_FR);
             env->hflags |= MIPS_HFLAG_F64;
         }
-    } else  if (!prog_req.fre && !prog_req.frdefault &&
+    } else if (prog_req.fr1) {
+        env->CP0_Status |= (1 << CP0St_FR);
+        env->hflags |= MIPS_HFLAG_F64;
+    } else if (!prog_req.fre && !prog_req.frdefault &&
           !prog_req.fr1 && !prog_req.single && !prog_req.soft) {
         fprintf(stderr, "qemu: Can't find a matching FPU mode\n");
         exit(1);
-- 
2.40.0


