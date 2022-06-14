Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970F54A34B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:54:31 +0200 (CEST)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0upC-0005DM-2U
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udR-0008Q1-TM
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udO-00052r-Hk
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id o8so9084442wro.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NeIHFgFCW8Q9U3GCfrnTrsyzzh5Bh7ocDbzI2wH23g=;
 b=QOeLblSmm9JUjpEzpisSNRc5O6U6MmTmFvTh+tMfJFpty6OdCQ7tFQMdYhp/txqPW3
 dIW4igTBmAPUrHhzUjzjDFkS+4LMrzA5jlhT8HNHwuUQoIvFJPcxFRNJHQcItz/ewvfX
 OHcwJ/BwmLq9hKns9nOYE6c0g9K2pIo7KvRaRoDwczC/c4e+LgRWDWSUA489luP248BQ
 Dzyhq+GC/eBcBmZ+Uon+Xx+YoriTCJntulZHb5gcTwnyYEC1uwAr1HDBCHDBDnzkphVE
 Fh5yVnlQl7cqtyVlMh8TATo6+S+Cy2+0w56EYsB9lO4s9t4rHYVnAxfRhw7hSIZSP41e
 yDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NeIHFgFCW8Q9U3GCfrnTrsyzzh5Bh7ocDbzI2wH23g=;
 b=p/ZnaFtg8gm48gXt/eBDvdtiUz2EcTpSdbHtwBWrEfEyjrvvp7KQI9kj3ZXHcd0Wke
 UTs1GhCVK8aUreY7AFDwrMtS6vNZMn3zHaMPwVgkvFOdj6J745+TTmATSi9fHwCA2nVW
 0/497EN47xrHqQNJQ7rDzAuqjWoXyXrTi+lptcKddPU50Xw00ZxsyiB48ROs0FTlGAdT
 A8ZHNCyPloHdpevFY7a2r/GU7WnSOZaKBA9deDmdnU8nMab4whlRwp/3ueHaWCVwcDVo
 M3F2n17HqcTrYgGSGHG3zXtL/UWgTQoCeq9doQCzVookXf1m+yqLhg59QWt4Pa4yJUg8
 dVSQ==
X-Gm-Message-State: AJIora96NJaVmusb01wX29XKXNRSNBoyhINwnwLDqV4K58ASJsSbhZ8z
 zNEXLSpHxypMTZYxw21j9FJ1ww==
X-Google-Smtp-Source: AGRyM1tY5GX7LZR2mx5uR2ZFARBdiC04pk27hVL8/JVextPaUAxEuXVLfNk6v4riu8pa30vdr1zEdw==
X-Received: by 2002:adf:e189:0:b0:218:45f0:5c0a with SMTP id
 az9-20020adfe189000000b0021845f05c0amr2076824wrb.683.1655167337154; 
 Mon, 13 Jun 2022 17:42:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a5d44cc000000b00219e758ff4fsm9909573wrr.59.2022.06.13.17.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A24F1FFBD;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 5/7] tests/tcg: disable xtensa-linux-user again
Date: Tue, 14 Jun 2022 01:42:07 +0100
Message-Id: <20220614004209.1970284-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The move from tests/tcg/configure.sh started enabling the container image
for xtensa-linux-user, which fails because the compiler does not have
the full set of headers.  The cause is the "xtensa*-softmmu)" case
in tests/tcg/configure.sh which became just "xtensa*)" in the new
probe_target_compiler shell function.  Look out for xtensa*-linux-user
and do not configure it.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
Fixes: cd362defbb ("tests/tcg: merge configure.sh back into main configure script")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220613171258.1905715-6-alex.bennee@linaro.org>

diff --git a/configure b/configure
index e69537c756..4b12a8094c 100755
--- a/configure
+++ b/configure
@@ -2024,7 +2024,6 @@ probe_target_compiler() {
         container_cross_prefix=x86_64-linux-gnu-
         ;;
       xtensa*)
-        # FIXME: xtensa-linux-user?
         container_hosts=x86_64
         container_image=debian-xtensa-cross
 
@@ -2481,6 +2480,10 @@ for target in $target_list; do
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
   case $target in
+    xtensa*-linux-user)
+      # the toolchain is not complete with headers, only build softmmu tests
+      continue
+      ;;
     *-softmmu)
       test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
-- 
2.30.2


