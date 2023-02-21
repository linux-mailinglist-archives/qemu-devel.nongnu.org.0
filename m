Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A191369DD33
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPEA-0006n2-Mz; Tue, 21 Feb 2023 04:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDx-0006Z0-SB
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDs-0005lU-0m
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg37-20020a05600c3ca500b003e21e018039so3824894wmb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPAcXxshM3oIDV7Nd8qDMhK+ewSzYoeyH2TxIrPviEw=;
 b=nDDpKX7O37ZhKxq0rO5B49V6cYsVebxr3yEkMRZAAumAVOK1dVqmZJnsX0sj0yL6Va
 5VwpSPPVoeo+SpjrlwzxzmMzyCKN9ucBhJ6W5c1oOG4wd/4IMQOPyKkAJ4bLI5SeGyC2
 x1E6p7cD8hIJqyogKZJGN/s3poGeBmONVWZHqx2ErsK8vWdrHVtIDfwjw6KYAQ3LxBCe
 KgycJxyu9IwyGdtUZ7dVOUHxrUIRJRYMkiFmCnWW/3LnauPodpyEXHu8wPp2zdtqfBIu
 aRZxEWQsB0+XXs15gw6Zq83CecfL2uB26n1Vxq4F/ct6BEVKoglk5pJhacfY+aqZ0Qbs
 vm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPAcXxshM3oIDV7Nd8qDMhK+ewSzYoeyH2TxIrPviEw=;
 b=LHH28e9jpjBY31zqPz2ueQnrCJRkqz2ylDdKFO64CbT8swAmpFf6nx1iQpqA2McYOu
 murzSI4Qcq9UGUtVGBjmKTVa1spg6vizxneCWwt60VZ4e6zymt8Oh0xU6qNxVOGyCnY7
 OpzbcvrPnzuLSzwQNoLleBYWXT+jmkrwNcw0VBdI5NYgxuGjFnaBJiDHyt3/7WULHhmD
 HULQEOGSas3zmEwzoHnSBRmIoHms6XKFgDMXkU4AE76Jch8/BlLNgNk8PgcjNJmdKKzp
 JvxUpHso5eDMqhLrT8AnxBeFU9DJS3DtXgMT3Vc1MV1DSYAXk6l8+cyYc7V07yslpxLL
 IbkQ==
X-Gm-Message-State: AO0yUKWEji/Yd9h/5Cf71hxQfcfMzoR+AOgNQst3GRa6uLledeegVHLa
 brYDjdrAZWN0uxxLhCYkuqzHLA==
X-Google-Smtp-Source: AK7set8EiIHLYJsFugk78p9SymKl/OBKeioeeviHCnBtCKkxzqXmzy4fwBDSNo/R2RGkSfAOm0DfOg==
X-Received: by 2002:a05:600c:2b46:b0:3e0:14a:697a with SMTP id
 e6-20020a05600c2b4600b003e0014a697amr3347585wmf.6.1676972765916; 
 Tue, 21 Feb 2023 01:46:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hn29-20020a05600ca39d00b003db03725e86sm4137663wmb.8.2023.02.21.01.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A7CD41FFC4;
 Tue, 21 Feb 2023 09:46:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 14/14] cirrus.yml: Improve the windows_msys2_task
Date: Tue, 21 Feb 2023 09:45:58 +0000
Message-Id: <20230221094558.2864616-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Thomas Huth <thuth@redhat.com>

There's no need to run a full-blown bash just to create a directory.
And we can skip the "cd build" each time by doing it once at the
beginning.

Additionally, let's exclude some targets (that we already compile-test
with MinGW in the gitlab jobs) from the build, since the build time of
this task is very long already (between 80 and 90 minutes).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230208103046.618154-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4895987da4..5fb00da73d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -100,9 +100,11 @@ windows_msys2_task:
       tar xf C:\tools\archive\msys64.tar
       Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
   script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - mkdir build
+    - cd build
+    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
+        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
+    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
     - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-- 
2.39.1


