Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A575EC183
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:34:58 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8rY-0005PE-Mf
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8R3-0002nT-2u
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Qw-0004uP-Bz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:29 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y136so9383832pfb.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mvrmJ/pQkH1S72jelAHPkbozzUShmbIR4RwdiG3Eq4Q=;
 b=nXgD+lyQOw5HfOtFgbeBp0Ubs05yfp9oWIKV/Qgx5a3EhiIVl3HOOlt3qmLr6P9Zdh
 Yhj8P19Iq/hVvX/FjQoNvl/AQusA9Qj4srPMltdfviVvGGVSLzYYxF3L2lAwQ9eFGmVH
 UxYrsbXORkggAqQnaQhVC7VBDPfdKdR2+ej1MGPyCnlrZPMqDSKJ1zD7O0OjjmsTCFpQ
 ZVVpxz6+Ek3Or54iKUz049eHjcGIZEn4SZCn5CncEXUOtbo1W/iWhbnfb49lLUKwIjR6
 40A2Z9+l0M8CKJuKbK5ASHvbM2++8hiVQanrRoDuNwFDqrkh6rCDf6UDlxVvUHtw/na4
 vNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mvrmJ/pQkH1S72jelAHPkbozzUShmbIR4RwdiG3Eq4Q=;
 b=I176wBVQzn1DRZLF2Ph+QgnbyizHeDQHnonECIGb4K0aPhc8mYGnEmIi55l1qc0DGA
 LwruovtiXFgK3I4N1tmP08AJWqUfUX6+AkOWqtgEcSgXrV4SysiMu7YmNk4Ro3Pta5ze
 JX/eTQl09W964/6Y0nwdjgQ2wxzScbrZTwOptUSvSBnwGd2YCfq7BpXZj5vTlw5tC9Az
 hm1prXVyo9Nm1+LY29VGM0qqRnQSqixYC/72cZxhkAvDqMGVovgN9YM/ArppapBWJRhR
 PVAaKJtpEaGnUBBDzGf7T0T79bYj/SoXL1JqOELdfPZKqOp/yg3YwDch175soWXzzA6w
 og5A==
X-Gm-Message-State: ACrzQf1jY2yG2UrgLwgwVOZxRFnEIqLuMBJqkBX8ZeUu/sOAV68kx+4V
 y8d97FeYOw0AjerdYAXT1WHHwJBsF8c=
X-Google-Smtp-Source: AMsMyM6GES5WfCmR0+RxP4XTe/1D7bROhxzR879ic+XAiJL+aH2/PrSj6MtkPFmKig0UAW8Wp4Ku6Q==
X-Received: by 2002:a63:e044:0:b0:43b:ddc9:3885 with SMTP id
 n4-20020a63e044000000b0043bddc93885mr23873968pgj.325.1664276841832; 
 Tue, 27 Sep 2022 04:07:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 14/54] tests/qtest: migration-test: Avoid using hardcoded
 /tmp
Date: Tue, 27 Sep 2022 19:05:52 +0800
Message-Id: <20220927110632.1973965-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration

Changes in v3:
- Split to a separate patch

 tests/qtest/migration-test.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4728d528bb..f57e07fe2d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -102,7 +102,7 @@ static bool ufd_version_check(void)
 
 #endif
 
-static const char *tmpfs;
+static char *tmpfs;
 
 /* The boot file modifies memory area in [start_address, end_address)
  * repeatedly. It outputs a 'B' at a fixed rate while it's still running.
@@ -2434,10 +2434,10 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
+    GError *err = NULL;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -2462,9 +2462,11 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       err->message);
+        g_error_free(err);
     }
     g_assert(tmpfs);
 
@@ -2589,6 +2591,7 @@ int main(int argc, char **argv)
         g_test_message("unable to rmdir: path (%s): %s",
                        tmpfs, strerror(errno));
     }
+    g_free(tmpfs);
 
     return ret;
 }
-- 
2.34.1


