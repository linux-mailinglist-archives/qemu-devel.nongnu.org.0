Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37D5EC34D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:52:16 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odA4N-0004xx-9V
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SU-00048l-MM
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8ST-0005Kb-2G
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id a29so9377333pfk.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WijaFh1+3eGNmoiPADdFaEnlm/n1XUXqlNMKiv/+vQo=;
 b=n36nXKVb/IXL6NEReR6dAE9DahKOwnDfBKazEoAHJTf7MPdQjYCJx1blYIabO9Sev+
 BEspddevJ/uIMV0+l9VmOL7PxQeZkOwXLakVk5BOdbgsOnJEdYOzk3dEZAk0O3VjlJxF
 ouIm5bN9LQmq21Bcqi1Gb+JyBilk7JceuCeNUwdEM+ZE2phR/s781iaGmFKcjfjAXqFH
 pVIwxi9ZBluYj5Ld179S6Wg6p60TSVPmQRzOIXkrrGLB7VRqPB6kl3M2pyWiq0ZhMNX0
 pvm4oACYv8ftN6CrgkqMDaIeZ35pH5cEIBVM/uAUvWbeSPmssilumN42+67RPcR4o2bE
 5Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WijaFh1+3eGNmoiPADdFaEnlm/n1XUXqlNMKiv/+vQo=;
 b=VQ3QeJsfRwaFWoFG3EUmuU9qe6OLTPi4S+PY4fqjrw5lwT15EDdj9n0P+JtJZ79UgX
 uavM9IyKlbQkhTpCVJu0agLU82ol5m7fMahSL1mD0iyYawReRDZG7eEW6Oo3/r3c4eE9
 pve2aSshQy0jumYY2eOC0ts7asdrGJ/cZ05Daxw57cXcDBaKouniZGNTEz7Uion88B+K
 0eLBODzEDdFzJf5t00YlcCO6wwVQPxzpkdq2JqW5raLWwp2yenKjqAzKHHrBTyTK7bSq
 mPGAmjfHWGbvJGwOS0pcJYsulg19Jd+dzx49msko0e8/fBnlx9bArXQRgBjI6oDGqHtq
 p9EQ==
X-Gm-Message-State: ACrzQf1vQvjZpfstQgBScrALYtDG3RUdV/79RcII4nUd/uA5GHoY557q
 UYc6gcDrEljYHJ3XeKhOS1oxLarJZnw=
X-Google-Smtp-Source: AMsMyM6Z7FGCoO2ZQzdzlFcDEYax7b7hzxycNULQgnvWo74F9Yztzsp3TUYFf295aQjdZkNVHU0G+A==
X-Received: by 2002:a63:e417:0:b0:43c:2fc6:d60c with SMTP id
 a23-20020a63e417000000b0043c2fc6d60cmr20932775pgi.436.1664276937017; 
 Tue, 27 Sep 2022 04:08:57 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v4 51/54] .gitlab-ci.d/windows.yml: Increase the timeout to 90
 minutes
Date: Tue, 27 Sep 2022 19:06:29 +0800
Message-Id: <20220927110632.1973965-52-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
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

commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
changed to compile QEMU with the --without-default-devices switch for
the msys2-64bit job, due to the build could not complete within the
project timeout (1h), and also mentioned that a bigger timeout was
getting ignored on the shared Gitlab-CI Windows runners.

However as of today it seems the shared Gitlab-CI Windows runners does
honor the job timeout, and the runner has the timeout limit of 2h, so
let's increase the timeout to 90 minutes and drop the configure switch
"--without-default-devices" to get a larger build coverage.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- Change the timeout limit to 90 minutes

 .gitlab-ci.d/windows.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 86a4339c48..9ef4667317 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -59,7 +59,7 @@ msys2-64bit:
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
-      --enable-capstone --without-default-devices'
+      --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
   - .\msys64\usr\bin\bash -lc 'make check'
 
-- 
2.34.1


