Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222C31B205
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:36:00 +0100 (CET)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMFT-0002Th-Hj
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLip-0000zY-RU
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLin-0004g3-0d
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n4so3122340wrx.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDYGyb10B7bTg3SKlpM1Yb6/DaGZTJ05b5VgebX2EjE=;
 b=sySQiFU9wJDs3qW27aidVdde/yZIOxFLR0vgsC6CfafJpn3FYjMYSg+Fi/7HgjSuqw
 Tw1uIxUJ+s47saCTwZpi4NgASB1kvO0d5OU7njoMz/s+f2a20MVJ28smOyGoGZQDn5N4
 Lg1jsB9hbd3i2i0Ec+FoLoAbEGjn7b8BDnSD7T9m3/HoRyW8Hy7tpXVYPjjqzXWXchEr
 k0NJ3nkYOwsgGqUYMsxxoQL1MCfqY2CnrknoMGeIa82TwMx41u9NJlNBVbxe3W+4REqE
 r0FFr61kIRjMkDvEH2aeGldbyX9yv+oqsjuUisKAqgW2L0JB18oOqEkZxx+3OJLZhk59
 dLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UDYGyb10B7bTg3SKlpM1Yb6/DaGZTJ05b5VgebX2EjE=;
 b=AdEGBogj2wG4gzjaASNWls1W1/VjHz/qsY+Ec3JknohypJpmGZwbbHk47mQMHCt1Yn
 xcNvjf75Sv51kp8+qqF2GygVk0wBqdlCQx2B6/O6TIHE4pw6U0JR+bAEHInpJDzR+REV
 dGYYDUnGImvPLuD1bCw7z6cuB5qzOQkAb2HakjOBtEBhzwP1i9LCNz65u6M0lXRw7XvI
 iLK/rIJ6E5WBPlsjDdQClBz5YhJpRYeGW5MnXxZy62QD6eF6+B+R3IRAyNYJZMKKcLwZ
 Io/hgIP+AXXhRYeCVAzvMYQ/9KuhkT4D6SalXEvxINtc2utPrTe9jBl4m+6/6EUc3O6t
 Plvw==
X-Gm-Message-State: AOAM5334c8WWHC81+tW9jeKP9imlbv++m/tgjyHHfgEU9q/XKNHR/KLG
 x3PDdDv3fnZQDuOx6FPKf23LfmOeZwU=
X-Google-Smtp-Source: ABdhPJwLnSi+M/p2dMnLjHgfbd8pf6kJDrmKWtotRdHD/DVKrb4Y9zq/3qFrNfedXPrNVnFFwPOdMQ==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr14549616wrc.22.1613325730024; 
 Sun, 14 Feb 2021 10:02:10 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s14sm1972355wmj.23.2021.02.14.10.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 35/42] tests/tcg: Add MIPS R5900 to arches filter
Date: Sun, 14 Feb 2021 18:59:05 +0100
Message-Id: <20210214175912.732946-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/configure.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e1b70e25f23..64796ee11fc 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -57,6 +57,8 @@ fi
 : $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
 : $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
 : $(cross_cc_mips="mips-linux-gnu-gcc")
+: $(cross_cc_r5900o32el="mipsr5900el-unknown-linux-gnu-gcc")
+: ${cross_cc_cflags_r5900o32el="-mabi=32 -march=r5900"}
 : ${cross_cc_ppc="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc64-linux-gnu-gcc"}
@@ -79,7 +81,7 @@ for target in $target_list; do
     aarch64|aarch64_be)
       arches="aarch64 arm"
       ;;
-    mips*)
+    mips*|r5900o32el*)
       arches=mips
       ;;
     ppc*)
@@ -150,6 +152,10 @@ for target in $target_list; do
       container_image=debian-mips-cross
       container_cross_cc=mips-linux-gnu-gcc
       ;;
+    r5900o32el-*)
+      container_image=gentoo-mipsr5900el-cross
+      container_cross_cc=mipsr5900el-unknown-linux-gnu-gcc
+      ;;
     ppc-*|ppc64abi32-*)
       container_image=debian-powerpc-cross
       container_cross_cc=powerpc-linux-gnu-gcc
-- 
2.26.2


