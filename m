Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4A5E932D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:44:24 +0200 (CEST)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQzf-0007DB-9R
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsd-0003qN-Ac
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsb-0006WC-AA
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:33:02 -0400
Received: by mail-pg1-x532.google.com with SMTP id 3so4240324pga.1
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wBKfIvS9x64YlkQ8k7SGVBoOTJo9nKg2KRFTaNM53ZE=;
 b=VYcmbmT294xMJ0Ic1NZN6/TvkWt8L6fxHIZGNpKX6j2EvWKvIuRnW2+ruqPA+LPlXz
 26d6k/u6Zg/uFSMafm0gsF8mAoh2/+m+Py8MIh++I5tcip8cjGS6jGgHBu//ISag2B5t
 ySBCBZUASda1xMPIcOlmbzLzVWzpQ1QIWhqwWbs6FeAZWfNoCuXO1IvCXUsOpVbUXLhn
 PJQ+TAejyFzH2tTfVhVA2pLRMcpQA3HVjA3KzV1NftEcJezTVtD/JsZrRTocLdQXCeNv
 X5HRSqLhOk7WqKiNXdSfYxUZsy1ABteY7jZPm/x/+YNoZETYsx9IoZRxBvp5QK08hEJt
 3vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wBKfIvS9x64YlkQ8k7SGVBoOTJo9nKg2KRFTaNM53ZE=;
 b=OXmHHLcwC3/6uS+x1kSxFq+WHXOxcMACFaOsSUpmi5v2AT1x8qHEbm8WUHsPmyAXmi
 uyPHJbWMB8CD823fJvUCczELRrMtbPJIWnSb118VjF7RS0yjsUu1v52w+FeJwtK4awDC
 KANueGbJc7CUFT1zHKpOlVyIV0EChVU2DHoUtjEe+RHJC6miQc57vEruXfWoVeMbN2NI
 PBGB58W5wYWmGEqaLlhdmzKg4OScTuDBveUUjCUyaLdBq/VVVrd9h+PfRQ6KlWsmx0Ei
 NKp95yPKL/YobGlHsnXUea5yHw4HsAJsQ9A+fFvO0ROHPfvFSFVPQ8VhS+qbiIN+coe/
 jcJg==
X-Gm-Message-State: ACrzQf2Zqqe5jGkm2wMx8gJXNcYUxd+nLHIHWm8tvrHo59TgT4tCxlXu
 Tzi8U1gSiA0GOSODyKbiWcmZsFBFFEc=
X-Google-Smtp-Source: AMsMyM5KQkgRfkHabl8V/DD1txSdIRoSS4nsqHt0uwCNggqc40BbQc4mH8ZW3imV5g0w0pk1ftcVrA==
X-Received: by 2002:a05:6a00:3392:b0:547:f861:1fc9 with SMTP id
 cm18-20020a056a00339200b00547f8611fc9mr18155798pfb.17.1664105579878; 
 Sun, 25 Sep 2022 04:32:59 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:59 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH v3 54/54] docs/devel: testing: Document writing portable test
 cases
Date: Sun, 25 Sep 2022 19:30:32 +0800
Message-Id: <20220925113032.1949844-55-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Update the best practices of how to write portable test cases that
can be built and run successfully on both Linux and Windows hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v3)

Changes in v2:
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

 docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index aea5b42356..0eae9c4654 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -115,6 +115,36 @@ check-block
 are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
+Writing portable test cases
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Both unit tests and qtests can run on POSIX hosts as well as a Windows host.
+Care must be taken when writing portable test cases that can be built and run
+successfully on various hosts. The following are some best practices:
+
+* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
+  g_mkdtemp(), g_mkdir().
+* Avoid using hardcoded /tmp for temporary file directory.
+  Use g_get_tmp_dir() instead.
+* Bear in mind that Windows has different special string representation for
+  stdin/stdout/stderr and null devices. For example if your test case uses
+  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
+  Windows instead. Also IO redirection does not work on Windows, so avoid
+  using "2>nul" whenever necessary.
+* If your test cases uses the blkdebug feature, use relative path to pass
+  the config and image file paths in the command line as Windows absolute
+  path contains the delimeter ":" which will confuse the blkdebug parser.
+* Use double quotes in your extra QEMU commmand line in your test cases
+  instead of single quotes, as Windows does not drop single quotes when
+  passing the command line to QEMU.
+* Windows opens a file in text mode by default, while a POSIX compliant
+  implementation treats text files and binary files the same. So if your
+  test cases opens a file to write some data and later wants to compare the
+  written data with the original one, be sure to pass the letter 'b' as
+  part of the mode string to fopen(), or O_BINARY flag for the open() call.
+* If a certain test case can only run on POSIX or Linux hosts, use a proper
+  #ifdef in the codes. If the whole test suite cannot run on Windows, disable
+  the build in the meson.build file.
+
 QEMU iotests
 ------------
 
-- 
2.34.1


