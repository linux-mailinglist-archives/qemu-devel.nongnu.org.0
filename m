Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76AF5EC30F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:41:36 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9u3-0007YQ-RX
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rw-0003J7-R7
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rv-0005Gk-2s
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id cp18so219211pjb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=teWUKK+iPqgAl9S+lVS0e68MivpBqlPL4Km9qM05Zkg=;
 b=m8ROKyVG27Yh9vSMPDmTjCxznSgc3NGM0eybi8bQ6DWXhVCjxelZnFMzi0CDhSZPd0
 sHoOfP7s4bDMmWb/8jecdJmcxgdMAEU5iVUUZtml7fafc2NSWyHlrCF6GJlKI8QYfpaV
 nhVaIT6ZJ/8W0PVNd3TDp8EJgl4/4i6ZLGrSfIhmP23WPZHdx5mPpT20GT9rFrQ5Xvb6
 Ap+vJhNdM9vGEI+5gUDAhCPqjTcpRfBzjRAhoyrbler2wXOIjTheD5uxpr1gbGH6RpXg
 SSneTGin3+9UxzV7UhWUPcJYlp7XlZJ9/XAQE7feyhKYRCDqJKqeeE91bRiyQ8qqeEqJ
 8r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=teWUKK+iPqgAl9S+lVS0e68MivpBqlPL4Km9qM05Zkg=;
 b=iEFmFmgzm/mfIjCF5W27YPkqPJ3968tdeBdjY0wmPrB4S4CAMBNPJBwVAQWVljr5kG
 QAW9WHmrHM2NX2oOrwcPx6yMWTs3BS9eBGcNIKPlVqCy+1KWw8cPKUuDkdzPqDN+rwiK
 w/wlmET9eC7qRhTUuWqWLxb6mgt4gim2HI1KaiDCra3KoVuxzvVj18qmUxUMigH9GtRJ
 oKzVrar7ZPfyn46rfDRmXBcfbc6rYlXfMhvpYjaGakmZcxmslPtcc/8sRQVub6eELJCb
 djjQu57d1q1mZJZXgfBeh7OalnkgBA8RPiAMrlpLOALRrHUnyLQ3uT4HItZucboKnmHb
 UN4A==
X-Gm-Message-State: ACrzQf0cit4hD792vzjjHcanjbEyJn5px8nkj6r1UvN8ldt62GrvdM7L
 HkvUNfq+9WKlEwagHKztjF9AsRVS3u8=
X-Google-Smtp-Source: AMsMyM6xYdWpiJdoAfrxaNvrTLkjm5qCr3W83EYvprlDSfCvSneMtw5oTTy/alWDZPavK5fDrjal1Q==
X-Received: by 2002:a17:902:d58a:b0:179:ec1d:9ead with SMTP id
 k10-20020a170902d58a00b00179ec1d9eadmr2559920plh.158.1664276905557; 
 Tue, 27 Sep 2022 04:08:25 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 39/54] tests/qtest: boot-serial-test: Close the serial file
 before starting QEMU
Date: Tue, 27 Sep 2022 19:06:17 +0800
Message-Id: <20220927110632.1973965-40-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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

This qtest executable created a serial chardev file to be passed to
the QEMU executable. The serial file was created by g_file_open_tmp(),
which internally opens the file with FILE_SHARE_WRITE security attribute
on Windows. Based on [1], there is only one case that allows the first
call to CreateFile() with GENERIC_READ & FILE_SHARE_WRITE, and second
call to CreateFile() with GENERIC_WRITE & FILE_SHARE_READ. All other
combinations require FILE_SHARE_WRITE in the second call. But there is
no way for the second call (in this case the QEMU executable) to know
what combination was passed to the first call, unless FILE_SHARE_WRITE
is passed to the second call.

Two processes shouldn't share the same file for writing with a chardev.
Let's close the serial file before starting QEMU.

[1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- New patch: "tests/qtest: boot-serial-test: Close the serial file before starting QEMU"

 tests/qtest/boot-serial-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 72310ba30e..b216519b62 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -233,6 +233,7 @@ static void test_machine(const void *data)
 
     ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
+    close(ser_fd);
 
     if (test->kernel) {
         code = test->kernel;
@@ -266,6 +267,8 @@ static void test_machine(const void *data)
         unlink(codetmp);
     }
 
+    ser_fd = open(serialtmp, O_RDONLY);
+    g_assert(ser_fd != -1);
     if (!check_guest_output(qts, test, ser_fd)) {
         g_error("Failed to find expected string. Please check '%s'",
                 serialtmp);
-- 
2.34.1


