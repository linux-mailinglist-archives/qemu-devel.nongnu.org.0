Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B282943B017
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:34:08 +0200 (CEST)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJmR-0001Xj-Ny
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbh-0001Ey-6s
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:23:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbR-0007Q6-9a
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:23:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so14882458wrg.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GXjIZSWU/U5ppISCei450OTir4ISL2+HnT7Ict5FVI=;
 b=V+ARYHhZuk+nUviwxbxR5ioKkQD+LxwZReV/UJX0qjXx3f8Rp2dYx945jPtKY7E1Ns
 pHVfJJw1MS4clU0rnAIH4/ya7WzF14s0FIOfSTT8uYEVzUkr3wcXQsmc6eVDwDCDHOWt
 x7iZ6jgZ47dLGa6t7G2TZuUFGk2cqgakjRbZVCJuFZPiC0s8Z8gnlHDeYuTF7N8wI9Yy
 O1zUqNVhqniZ2sfKvbXbSwHir0oyuFJhRMxi+vzRvbjhx8x4XLZ2u45H8U/JoxI872eb
 CEpxM6kCxGr4HEl2KekDQkqbbOzdMvjkvYKwRsWWvV3kwMaO2SXoJ2Rb7tzDqwlSeBdb
 vYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GXjIZSWU/U5ppISCei450OTir4ISL2+HnT7Ict5FVI=;
 b=sVzXd4tAFd7ygKLpyeXZujuvbpWlnn4gkR7jjFf2m6d0NDgaSVMqIA5IBiEhS+5BTu
 i8QezaxXCyeEqnWAyFobrhQuHMylcgl7Cf8RrLrz1eLmtZeM1W9hnd2a0r/s2QfFw8s9
 cuvpCH3seZ6D2pe46KYDU43jEhIh7aQQ5T25KBkuXwzQJMOZJE6n4EjfcNvJM1Ceux12
 Qr8BL2DhHZBr4p+gRx+ZbwHZRvoWgSdCjPzHYUzPxdq9aSrMhtOlOd7cK0tC++Ubg7eP
 bJvwtXTAFTXjf1MAVcz1Wty8GjQB5ewKgHGLiF8AdFkkvhv/7C9aqHTHgc46xgJ3xo2q
 mxOA==
X-Gm-Message-State: AOAM532CIWH3rnBLWCpRU/+zsr8gsbQIxuiPJH4VAeHlv8aIK9U85d8m
 MJiw8M8sIZWMyOyul6TbD5QQhQ==
X-Google-Smtp-Source: ABdhPJzi06i1RO3+i7eZY2azole7IETkYN+OssN9gGaZQOZABJXL4eVwZ9o0aGhemxk6mWVpwZKEuA==
X-Received: by 2002:adf:e489:: with SMTP id i9mr2385125wrm.22.1635243763258;
 Tue, 26 Oct 2021 03:22:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n68sm183053wmn.13.2021.10.26.03.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C0991FF9F;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/28] tests/tcg: Fix some targets default cross compiler
 path
Date: Tue, 26 Oct 2021 11:22:14 +0100
Message-Id: <20211026102234.3961636-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We do not want a shell command substitution, but a parameter
substitution (with assignment). Replace $() -> ${}, otherwise
the expanded command return an empty string and the $cross_cc
variable is not set.

Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211023164329.328137-1-f4bug@amsat.org>
---
 tests/tcg/configure.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 149eeb15ff..0d3ac839ee 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -46,7 +46,7 @@ fi
 : ${cross_cc_aarch64="aarch64-linux-gnu-gcc"}
 : ${cross_cc_aarch64_be="$cross_cc_aarch64"}
 : ${cross_cc_cflags_aarch64_be="-mbig-endian"}
-: $(cross_cc_alpha="alpha-linux-gnu-gcc")
+: ${cross_cc_alpha="alpha-linux-gnu-gcc"}
 : ${cross_cc_arm="arm-linux-gnueabihf-gcc"}
 : ${cross_cc_cflags_armeb="-mbig-endian"}
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
@@ -56,17 +56,17 @@ fi
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
 : $(cross_cc_microblaze="microblaze-linux-musl-gcc")
-: $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
-: $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
-: $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
-: $(cross_cc_mips="mips-linux-gnu-gcc")
+: ${cross_cc_mips64el="mips64el-linux-gnuabi64-gcc"}
+: ${cross_cc_mips64="mips64-linux-gnuabi64-gcc"}
+: ${cross_cc_mipsel="mipsel-linux-gnu-gcc"}
+: ${cross_cc_mips="mips-linux-gnu-gcc"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
 : ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
-: $(cross_cc_riscv64="riscv64-linux-gnu-gcc")
+: ${cross_cc_riscv64="riscv64-linux-gnu-gcc"}
 : ${cross_cc_s390x="s390x-linux-gnu-gcc"}
-: $(cross_cc_sh4="sh4-linux-gnu-gcc")
+: ${cross_cc_sh4="sh4-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
-- 
2.30.2


