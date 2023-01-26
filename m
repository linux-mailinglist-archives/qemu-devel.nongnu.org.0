Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133B67CA01
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0UK-0005vS-8o; Thu, 26 Jan 2023 06:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U9-0004ne-U6
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:06 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0U6-0007oZ-AY
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:32:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id z5so1450331wrt.6
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwSqXLP10LrAD37JzH4KFdnVQSIUx4KIjtli2huFpGg=;
 b=jSx+tLANafS224HtwcYPqWMUmItf2LO5Ann/lAPrpd+KZi/vlwzqg7/hrt+5y4CAiA
 WwcglJ6F0QWd9bz4IhsBKAvrDzxsQaO3LVwUlRYFhO4kqUmHX9Zu4Pxohim+V1a9M74N
 vWhW17qe5INZh2HCCWieCYVir4/B0b2+b993VWKySBrhu7liAwNG/M5N9Ahhqgq2SKkl
 D0Woi33dYQU94oRvtTapvh74cY2uw6U1zlB2RhSbgAssm2kGUqzdgfy7K6f2KrYco1lT
 /uIgLOxCmNHIe7/aXXnpTj2p6KU1MnPVQnYPjXInmNUN1ztmnHUutOVHNiAQlqS7QcUb
 56jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwSqXLP10LrAD37JzH4KFdnVQSIUx4KIjtli2huFpGg=;
 b=TUcxI9YGTwewUY0sxnfjSbODtnX2CFRpgnmxW728C22ZxSHzsZC5tlS2zXMylkXIXd
 C3EaRlGEMEmhnM90vSQGATDydftP73433D09dBknD2T6V7MbGnMEXJWFytaicnEbIrZf
 +3usyQN7hLRkNfbkN2tSAq4JNU8Eg0MNmWsarE90ow1+xaTD8oS2IA8kyDgQMk1wTaVh
 W1iiFf8QKfwzNlZ8PQmjm9L2IU3Gs2jGiFR2Wk53czG2BCU8tpjjTpHaAzldsM/xIYWU
 jK4IjcVOR+SEyUSRF0Rco5SV7i7e3fV2j1/sTXz8utmWYUyhoLsZfW19D1U6u+smjkVo
 Pa+Q==
X-Gm-Message-State: AFqh2kpXlVaJcjAGuAhi6kczM9VMwnq7a9hf/g20RcMGQMx1jQirTWDi
 E0NKBX8e+OKSTwFkS9KCH2VwaQ==
X-Google-Smtp-Source: AMrXdXu5NA5Kxzq+6+eHHONUiQUM3ZSwS16TgA5GTveZ+ru+at3cjwJ0OERS7r9n3hdbIraw+o2u6A==
X-Received: by 2002:adf:a14f:0:b0:2bf:950e:7fc4 with SMTP id
 r15-20020adfa14f000000b002bf950e7fc4mr18186866wrr.39.1674732720755; 
 Thu, 26 Jan 2023 03:32:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b002bdcce37d31sm1207378wrx.99.2023.01.26.03.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:31:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 249E91FFC9;
 Thu, 26 Jan 2023 11:22:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 25/35] tests/tcg: add memory-sve test for aarch64
Date: Thu, 26 Jan 2023 11:22:40 +0000
Message-Id: <20230126112250.2584701-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This will be helpful in debugging problems with tracking SVE memory
accesses via the TCG plugins system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Robert Henry <robhenry@microsoft.com>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20230124180127.1881110-26-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a1368905f5..df9747bae8 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -36,6 +36,13 @@ config-cc.mak: Makefile
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3 -fno-tree-loop-distribute-patterns
+
+TESTS+=memory-sve
+
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
 QEMU_OPTS+=$(QEMU_BASE_MACHINE) -semihosting-config enable=on,target=native,chardev=output -kernel
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index e190b1efa6..f136363d2a 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -179,12 +179,13 @@ __start:
 	isb
 
 	/*
-	 * Enable FP registers. The standard C pre-amble will be
+	 * Enable FP/SVE registers. The standard C pre-amble will be
 	 * saving these and A-profile compilers will use AdvSIMD
 	 * registers unless we tell it not to.
 	*/
 	mrs	x0, cpacr_el1
 	orr	x0, x0, #(3 << 20)
+	orr	x0, x0, #(3 << 16)
 	msr	cpacr_el1, x0
 
 	/* Setup some stack space and enter the test code.
-- 
2.34.1


