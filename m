Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFF82F0868
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 17:32:58 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kydeD-0001sh-9S
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 11:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZL-0006e7-NQ
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kydZK-000573-5C
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:27:55 -0500
Received: by mail-wm1-x329.google.com with SMTP id v14so11872593wml.1
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 08:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lg97+hvw3Kq20FeEauHGubZQHEucwB5/NyPPM50tBmI=;
 b=srsVlE0w65N2Roe++YptjZCygZaMc41iuZS10rt+3XUONzo4dLD/nkZnHfEqpuR6vF
 P6ici9pH3dmdl3CqwnhFvdJjR85iUaP6ZMLEHKrg7LozwWhUmTZ+KCFBX1WL+f/t/8xH
 74MxKpTzlsNyPKw/GqpCXdzYSEp6Ir4Zg5iXhvn5xBEs9n8W3BHHssuzfmh2vc4qWMTJ
 7RDcpK/cVebnDlLf/eLYBMJqFYdUG7fx14V3PDy05t/mo3B5sHi3SNRnt0inknRbIbdP
 8I39ZMULfieKeG5mqlLzgm1qbBCHbsJd97ENoFKPeOqATxDbc0KDN8m2YPlnmqn0pFdt
 VhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Lg97+hvw3Kq20FeEauHGubZQHEucwB5/NyPPM50tBmI=;
 b=YNiCjRmBDT65rRfxj7I+ygA+7ywodlfhn6sX6b5UOJr8PCp1oDaI5EZBhAdoYkIrdU
 8bCt6yN4TEGwWYGdabb9Tv+gvsLM20AP/1DvMZ1xOkKAvOJUqip9bB5NKUG2vrzjEleN
 k3yWa1gS8KG1vTfl+jsMtCdCfQW5WE7Be202LJdBdmwrhQPWu4+ovpsx+bEVreRHIJa7
 83/WwD4xmTahqTg+iozE/Oo8b/2EXE0FNx9+nqfAi6Gbto1QyaCBpjVuw1/L+qC+hzWu
 h60uer3Q5yrF/vVrq7nDoFgtAVclkT913oMlRl2zWFn+4FDx0HrXW5ac2TLbfHIgVkja
 uw/w==
X-Gm-Message-State: AOAM5308EP7qRwZbRDATb+FtCgKg+CWVG5hsv0acFWmuHI6ZpgO0xzZ/
 4fmCwcQGc0UMx33jh6gz0KAYkRQcRlc=
X-Google-Smtp-Source: ABdhPJz4qPOjplC+AQzR/hBhNlHsuAtnxREzBVuzQpvd5m1yNpIk9F9VqrA0zHsqz0JlMziaJng6Uw==
X-Received: by 2002:a1c:2d8b:: with SMTP id
 t133mr11117065wmt.127.1610296072449; 
 Sun, 10 Jan 2021 08:27:52 -0800 (PST)
Received: from localhost.localdomain (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id b83sm19213211wmd.48.2021.01.10.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 08:27:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
Date: Sun, 10 Jan 2021 17:27:39 +0100
Message-Id: <20210110162739.858087-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210110162739.858087-1-f4bug@amsat.org>
References: <20210110162739.858087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the current GCC build-tci job in 2, and use Clang
compiler in the new job.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC in case someone have better idea to optimize can respin this patch.

 .gitlab-ci.yml | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 01c9e46410d..9053161793f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -397,12 +397,12 @@ build-oss-fuzz:
     # Unrelated to fuzzer: run some tests with -fsanitize=address
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
-build-tci:
+build-tci-gcc:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
   script:
-    - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
+    - TARGETS="aarch64 alpha arm hppa x86_64"
     - mkdir build
     - cd build
     - ../configure --enable-tcg-interpreter
@@ -416,6 +416,24 @@ build-tci:
         ./tests/qtest/cdrom-test || exit 1 ;
       done
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
+
+build-tci-clang:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: fedora
+  script:
+    - TARGETS="m68k microblaze moxie ppc64 s390x"
+    - mkdir build
+    - cd build
+    - ../configure --enable-tcg-interpreter --cc=clang --cxx=clang++
+        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - make -j"$JOBS"
+    - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
+    - for tg in $TARGETS ; do
+        export QTEST_QEMU_BINARY="./qemu-system-${tg}" ;
+        ./tests/qtest/boot-serial-test || exit 1 ;
+        ./tests/qtest/cdrom-test || exit 1 ;
+      done
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
 
 # Alternate coroutines implementations are only really of interest to KVM users
-- 
2.26.2


