Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4B1438594
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:50:01 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOts-00051i-2l
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsA-00033r-5D
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOs8-00054z-BA
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id z14so3682716wrg.6
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h8cd2gj6LioCQKjAoPWyLIIdDE8FcGsphzqJRwMU9Y=;
 b=g7j/ChCc/LcNFTfAhTouMvq95VT2Z/oE6cC6dPh783oLS+sQ+3v1F3jaD8QfE3rQMm
 u29yIy9D3i/gjj+wHBs8p2pzW4P5OrC6SAKJ+RrqXwIVGpUtM5hm/0MLCsZq9flxwBjY
 OCZ0+9gq4k72YJvXQ1D0azTYoGQ4erYCzBdgInpIWOcCT+120gikrDyKidALpJjTpAD3
 rXqLpvIo5XT1O7+AgwUpPZT7ETORlgBDgDQA7TeFqT4WT/IIxv+xHmuHpN3ROSOGONTg
 ilOj6l4E+Jtm19F5YbKO3aNJKTWz/oRHSy1jI1JlaxvK5WoCoMSgoBFT/Ifn+6OdRcoC
 YzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4h8cd2gj6LioCQKjAoPWyLIIdDE8FcGsphzqJRwMU9Y=;
 b=u1wv/5lf25CEkVRfpfzaM24kUJCK/tzAVxs+zu7C47Fols2B0XNZ1tKzqT5WKOeLAf
 +MrTFmWsT2w6BkvNGl9h8ideacVMAYC48NuCYUP2Vc90nOJao8llvGWgmFwo3K0Z6s5A
 8KtjD1134H7tlNDqXLnIcAaANxt9UMDNagW0k8pLNTE9Z0PO7aZB8uc0rWJ9FZ6klp6m
 83Z6sACzM6GPzfaDoPtpb/aLzdZexhAGbGd2+wSD7UDfHyZoU6D1ZLe7TO9ll7d6rHnH
 ZduRHwW0EzjTaKQA39ErQnfkye2eeKW3QKl1SrFgLHY65arCGclG5yP0lalatekHPpHp
 F6kA==
X-Gm-Message-State: AOAM532iUdwxuAiIIDMnwMH87rXQgh7+nG6KUP9oLLC77qSE2LUfW7ZO
 /RwY+5tsgq8DsFrxLDSTYbeCKVC2sSE=
X-Google-Smtp-Source: ABdhPJygghYsMFNf79bfBq1NQEW0qB01qocNzzfDru+dan/hTivChMGkQG8+JCaUi1zsneKjy+UnGA==
X-Received: by 2002:a5d:5229:: with SMTP id i9mr10653560wra.114.1635025690715; 
 Sat, 23 Oct 2021 14:48:10 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 s3sm11606358wrm.40.2021.10.23.14.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/33] tests/tcg: Fix some targets default cross compiler path
Date: Sat, 23 Oct 2021 23:47:31 +0200
Message-Id: <20211023214803.522078-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not want a shell command substitution, but a parameter
substitution (with assignment). Replace $() -> ${}, otherwise
the expanded command return an empty string and the $cross_cc
variable is not set.

Fixes: 634ef789f8e ("tests/tcg: add more default compilers to configure.sh")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/configure.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0c..b8574165fa6 100755
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
@@ -55,17 +55,17 @@ fi
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
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
2.31.1


