Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8D5BE6FE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:25:00 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadFD-0000c6-Fs
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZk-0001Xo-5r
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:34:00 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZi-00053v-GQ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:59 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x1so1917401plv.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CeqCs+fhJTq9ubJJCHLWPqSHezBqKxEmHRY/t8v7R8c=;
 b=l1w6aH1yb78q5GBCs+Uy2kG71s9gacPQyvIJuj3jXOuv4+8/BbeiywNONijxQygMAE
 uP3HOrzDAYTlpeXmVI57ZRxxQp994rZoiPsj8tUzyvgngIIzdhT5RLKti8essKL6Pmi0
 NFdww8a8c+2/riFxwCK/Wn+PRS00hv/nwh7Spbfg6wuYQgvSbGuZBVyuvGqtyLEZRmwD
 3GhZIKU1yVqmp9BiHhYwOqoMuab7d0WNVWtn44bqjNGEn3e6ni/hHAZ1sAxzj0FtqaSF
 B2LcxKM8MZEVEdxbsaFVm1PGY2FgTSiIbGNu3FtvKIWmopNqaWXRzw/q9rOH/Ldp9cS/
 rGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CeqCs+fhJTq9ubJJCHLWPqSHezBqKxEmHRY/t8v7R8c=;
 b=yp3Fag+OdL4X6DqRYuEzewjEXawL3sFD0SXobYXVGn4SsL+2FfZCmuphZ8E2rN9poO
 YENI/wX6Lpz9IEBT6IdA1AZaHtm10MwCnboeLSyp/GD+7IkFjW9CNqICywn2zVN3UMD4
 ZLyU5pqbwynPD3tNT7ZtuCr0QWxOjrq27TqLQ0Ub5yOvR1FYBEjkBK/8syZVL2FyCGN9
 +Gya7Ufy7QteOxkwfGRn0q0Q59Rx4o7aYIdvEX2rSMkqMFmbYp3V/dqgqkDFmZYHMjYQ
 ASXWv15ESr7ZdcNuIjLBN5SB7Ayio57hbs00M+8ZC1dPM2hYeUvhlLXbrHhoAwjUgNo3
 wr6Q==
X-Gm-Message-State: ACrzQf2RdU+O0YtcHP7X+xIbHHQdYcWf52PE5b982I4p1EC3BxJazHZx
 uzrifdcNM+A0XM1avYZuE19oNNgKAlo=
X-Google-Smtp-Source: AMsMyM5rZjZs+JNFOuxRZqeCRyLeFBkRkJYpCAPVhcp+LeG17wIy/QKTC2UTIrRrQPjR6GcLX/wJWg==
X-Received: by 2002:a17:90a:ec0f:b0:200:b4b5:c352 with SMTP id
 l15-20020a17090aec0f00b00200b4b5c352mr3210974pjy.205.1663670037209; 
 Tue, 20 Sep 2022 03:33:57 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH v2 39/39] docs/devel: testing: Document writing portable test
 cases
Date: Tue, 20 Sep 2022 18:31:59 +0800
Message-Id: <20220920103159.1865256-40-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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

Changes in v2:
- Minor wording changes

 docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index f35f117d95..eb65401ad2 100644
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


