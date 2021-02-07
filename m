Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C245F31243E
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 13:23:07 +0100 (CET)
Received: from localhost ([::1]:36174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8j5m-00080d-Bx
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 07:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8j39-0007U8-T4
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 07:20:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:56224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8j37-0004hq-Pb
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 07:20:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id f16so10118105wmq.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 04:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VP0HhqMV4M0iGlywGIxQIbVz/6nHpqVRuLw4rSRoXhE=;
 b=NBLLmlU7SGhZ3bjEQXxGA/6rkGzo+ZqPHrCTnXGpKOXTUmIj33S239mZii9fdIJn/v
 I9ZfYYRxseSMqFI8rMokb0kUqCY+2KF5ntC9GLlsA4UNqFA6sCekCMkh3GZYM4GVcRFP
 u1BK/WOfbu+yMBc6wSrB04gDoMaWUpqfHxXF0Eu4UODtdfZEO8/HNOwAYqByEReuP7gc
 rXaDG76V8UGJ0cXExljRcO1ylpOohvTtA7nC8GVTFC+1veTtI9gpDHh1ZtSlfCJ4/7wP
 X5iziTFWEbVZEy5yo6YzxQ5xoc7adE8rNZAprvdzxwtvXDL9hRh+bnnVUXf4HKkZtm7j
 vNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VP0HhqMV4M0iGlywGIxQIbVz/6nHpqVRuLw4rSRoXhE=;
 b=iNSMayrjIRzQsv8atrwHlEFf1tYpto7BtnN/gnPz5m/5wtVUF4/SAnnq5cTVYJ20Ay
 duQbAf/BzSr6kD7Zt7hXZXf1oSlG733K2bhhITv+PyytpodYaSgclGuSdmSnjY+ujVcE
 bzjAtmUYFTOke16hKDaHR4MzZXHpYnFQYDON5q8zGZVqMaEpRK1B8xwzA5qwCGn9Myag
 bjlw/nIAOt7rTNziyLP21M0c59Y70/y/MwY2H3vAA7tXPd+J76nw3t2AHawwTP4fEKCV
 rC1bOVPbZ7VfWo2r7gY8KIoyIqCNrJrEl3n/Bry86SijsNZ4UEQBNd4gBstLk6ER3Gal
 +STA==
X-Gm-Message-State: AOAM5328ca17UPUkZYOWLqnuHrro/z7M/ADgy5qiNFACO1W+nycHKVA1
 ozpBQVgNS2qvffCtb2Y/Jz7N1ZSY6kY=
X-Google-Smtp-Source: ABdhPJzHqQdoNqzhiHXrwld5nfuD0qc9GhkcfstordsDHkxDOo+0cF4rGe+8zYhoMaHFy4PhXHwMCA==
X-Received: by 2002:a1c:2e04:: with SMTP id u4mr10778218wmu.79.1612699962574; 
 Sun, 07 Feb 2021 04:12:42 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b7sm21149588wru.33.2021.02.07.04.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 04:12:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
Date: Sun,  7 Feb 2021 13:12:39 +0100
Message-Id: <20210207121239.2288530-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Travis-CI seems to have enforced memory limit on containers,
and the 'GCC check-tcg' job started to fail on AArch64 [*]:

  [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
  FAILED: libcommon.fa.p/disas_nanomips.cpp.o
  {standard input}: Assembler messages:
  {standard input}:577781: Warning: end of file not at end of a line; newline inserted
  {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
  {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
  c++: fatal error: Killed signal terminated program cc1plus
  compilation terminated.

Until we have a replacement for this job on Gitlab-CI, disable
compilation of C++ files by forcing the c++ compiler to /bin/false
so Meson build system can not detect it:

  $ ../configure --cxx=/bin/false

  Compilation
                       C compiler: cc
                  Host C compiler: cc
                     C++ compiler: NO

[*] https://travis-ci.org/github/qemu/qemu/jobs/757819402#L3754

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Aarch -> AArch
v2: Link to first line with error, describe Meson

Supersedes: <20210206200537.2249362-1-f4bug@amsat.org>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 5f1dea873ec..b4b2d66fa4b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -261,7 +261,7 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
+        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
         - UNRELIABLE=true
 
     - name: "[ppc64] GCC check-tcg"
-- 
2.26.2


