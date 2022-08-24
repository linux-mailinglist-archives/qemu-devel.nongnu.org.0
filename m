Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F859F83D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:57:28 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo4d-0006Wd-Sv
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvJ-0004jy-00
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvG-0001wU-9t
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:44 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v23so9909165plo.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yHfvFbtV55sIFsllW+Yh1BVm3WnXAcaxhuBNZ2Rs4dY=;
 b=n98X281VnSIXn3kaNQ4oC0g06Bd3h21W4/4R3DYvQaogjZR3GX8XlPJY6U7ovZo4K6
 xb45hx5EyZKBC+goYwJdNOZMTz2TvxCC/zFvshvC0yLmQ/bMEP7KmeSS4B0RbuSvwWRZ
 GdaQnFn4J7VR8DhsVqqhsVvL5EXQQQNg+HKPr0DQwdTTn1A9bn3zyPPQHGazWOeln/CF
 b8nG1K+Y5c4m/uDXyK94VXnuxIQOh7CLK61jahrJsj7L3Cr0Dqhz7qGZYYOG//fqh0rN
 JnrDXTKrUXi0msOPH2hQXni8uqQ3h6ORHgr4AIKZI7m0/C/ddJSVNQDrSpemsLys3ETA
 cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yHfvFbtV55sIFsllW+Yh1BVm3WnXAcaxhuBNZ2Rs4dY=;
 b=GPQomE86T/UhanZ6EbX7fm/Ja1DSm/DoMRwXp5U/fr0HdO2cbsZK/p0BQSU0cfnPR+
 CjnUBUTSF/OSQyPfjhVHPiTrXQKfoG0QqGxH+bpYBSCUFQM0Z6F/2LU54/yEMHOTT1aU
 ZeFNPzc86bk0ve3lpFSz7GaL+y/LxWubyJny31apx6YQ02kVmfheTuIbDE/GrfRIMQSY
 kXz1+BHLWTjDH81CkTGN+GJQAlbrVW7nvFTR1C6MO44jwQQFN7Ux2UD2+ncQpNrL8hdl
 8oEszsCCo2/VfhJMHTmxyTeeafkfijdkpzOMqLKMbJ0kvZZwFvjpdFE+wnJKqmPqz81n
 NXHQ==
X-Gm-Message-State: ACgBeo2qgmryDd/eOCp6RY2nycgfdpgw8Qzp6HLSf7fSTuubtCtBqZQK
 RrfXGdPy+wsNNSmbXkcI4vgPQZaTEwU=
X-Google-Smtp-Source: AA6agR7VCqP14AnB0BgzlFcLgFyL94Kxm2pb/fJcLkwbgILm2ODzmvsVJnWWah0bZ80BAPxfqZNn2w==
X-Received: by 2002:a17:90a:1912:b0:1f7:8c6c:4fde with SMTP id
 18-20020a17090a191200b001f78c6c4fdemr7600625pjg.8.1661334220282; 
 Wed, 24 Aug 2022 02:43:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 50/51] .gitlab-ci.d/windows.yml: Increase the timeout to the
 runner limit
Date: Wed, 24 Aug 2022 17:40:28 +0800
Message-Id: <20220824094029.1634519-51-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to the runner limit and drop the configure
switch "--without-default-devices" to get a larger build coverage.

As a result of this, the check-qtest starts running on Windows in CI.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index c4bde758be..d4fd821b5f 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 2h
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -59,7 +59,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
   - .\msys64\usr\bin\bash -lc 'make -j2'
   - .\msys64\usr\bin\bash -lc 'make check'
-- 
2.34.1


