Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588B6A5F59
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5K8-0002PF-IW; Tue, 28 Feb 2023 14:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jp-0002Lh-Oh
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jk-0002ms-0O
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so10325206wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thQrLXkRWue5/igRIQt+F6mSv/9xFmIxivOvyRTxMxg=;
 b=U+QeD1e9dYZV4RFaSK44k7dSd7yYjes2Nc9PEXHkIYldfLiDMa4iiJgeHD7Qmt1wFr
 HU3PvdgTdQ/1f3p+eVDPqrQePC2VbsYj8ZS5mjrikFWWSC6aamEU3BRdbXbcZbFahMTo
 5Py8oXa16gSrkYu3HJ9Re5GllBU2VdgKH3kOHK82yS6X97fQzPV7q4/SbXGGwKJ0AKUg
 fi9VInFJx5uI/+jUQRgiZSmvQAz6KNo2Y1UlP6VUzX9Wq9xBxOY7jR2wXPGYijk0Q5LL
 blP0mKQgsuR1zTJ94wCA4vJZkj1kY8Cur2SqxKzM2NR3RZVVZc/aKvbiJqASDrCji/m5
 3Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thQrLXkRWue5/igRIQt+F6mSv/9xFmIxivOvyRTxMxg=;
 b=Tcm1TTKxKhyIBlAiFGtRVt+UPJLX18I5W70ySoGSssnIhQyBoApFXOliSr4pboSTD8
 9eWP41MuFk9RW3KXxk4krviwEkCrBsF+8Wu3CBHlaZH9YHp/6nCijHOwXNwEDJJhdNxK
 10WQPkCeUA74UXsapC/RnmwYT4+6w0TCIXqEzfoGshblMw8XDxmW4HuUECJPlDsSrmRo
 zr+GvTY/gRUOuaeABIQBfnAyAM4Ir1i5H1zC743Fi2ogrigWycQBQuZbngCMEFzl+VRx
 ILoXX98CeLRDxQ/XWCKmntFmkZg3DqyqpYB97wjyw7q9oti5BReCIXEGiLefbsk+tWGb
 imGA==
X-Gm-Message-State: AO0yUKUoqazTLkuIii2CTiEh55ymzqMvDzX9isJGHRLikmvLvAFPVYVq
 trjN2z+P2w+sGCk8JM3vFXAAJA==
X-Google-Smtp-Source: AK7set9wl0Y/VJ1gJ3LxLaek5XbNnOXpwtBYeaxDArtuOutNc8l2oUymKwVh3sVwx4Gxj1OeweobdQ==
X-Received: by 2002:a05:600c:1992:b0:3ea:f0d6:5d36 with SMTP id
 t18-20020a05600c199200b003eaf0d65d36mr3057445wmq.29.1677611223084; 
 Tue, 28 Feb 2023 11:07:03 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm10358330wrc.90.2023.02.28.11.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FA811FFBB;
 Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH v3 16/24] tests: Ensure TAP version is printed before other
 messages
Date: Tue, 28 Feb 2023 19:06:45 +0000
Message-Id: <20230228190653.1602033-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: "Richard W.M. Jones" <rjones@redhat.com>

These two tests were failing with this error:

  stderr:
  TAP parsing error: version number must be on the first line
  [...]
  Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.

This can be fixed by ensuring we always call g_test_init first in the
body of main.

Thanks: Daniel Berrange, for diagnosing the problem
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20230227174019.1164205-1-rjones@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
 tests/qtest/rtl8139-test.c         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index a9254b455d..2012bd54b7 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
+    g_test_init(&argc, &argv, NULL);
+
     if (!qtest_has_device("lsi53c895a")) {
         return 0;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 1beb83805c..4bd240e9ee 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -207,9 +207,10 @@ int main(int argc, char **argv)
         verbosity_level = atoi(v_env);
     }
 
+    g_test_init(&argc, &argv, NULL);
+
     qtest_start("-device rtl8139");
 
-    g_test_init(&argc, &argv, NULL);
     qtest_add_func("/rtl8139/nop", nop);
     qtest_add_func("/rtl8139/timer", test_init);
 
-- 
2.39.2


