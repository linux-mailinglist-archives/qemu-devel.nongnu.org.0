Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C1937B58A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:40:27 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghbd-0004Sd-1H
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYw-0001gJ-PO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYt-0006cQ-FS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so22266980wrt.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxIn0INwdcSb5lb9f8fZG1avNfdlG4L8wrUYhmTwTc0=;
 b=M8UUXINnr+w2OfdSj/ScgU1L0ekUMRACEMPrdrrku0Fc57O85u0YhJsiCTBqL167Th
 Qv6w3b/Tgc5akRc9ksBk6XFHFnPxXTUVdmER9VOFHTvcWkt7kgUYM0EgjRrd1r0Tjrop
 sT9Ps20jjV5PkdJkEGH73SQrxx/J3g/FqZP1+0BCyzO/3qI/8mg9JkVbmW0grEv6MuaC
 0YY8JJrVsHHuD5IqqWuMnjS/CvVKAxT2Aj9pArw7ND3WxEiAkNdCBGrrLMQcDTRulvKr
 cUz9+Fng+7wlIaWW9SSM9UycyHa/NDIxeCOtZUHHwHOtECCpT+QxQVExy9k0PDnU88fg
 Brdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bxIn0INwdcSb5lb9f8fZG1avNfdlG4L8wrUYhmTwTc0=;
 b=rqPltcsHbHNxYPD6QYKTQvGgrubXmufRutcogH4kP+RREHoGsHBFzHfYQ7mgYLZKP6
 FdSUKY/VsMD9P+eRulXS3qdF/yub9m6LfuJeEbN7IvX2s51HOD73Gchv26ysQ5v3stip
 79gJmGzVgzewY3ZE3AR41LERjf1k+5jiQsCp0nAShdjQtoCEFjDK7dYW1TMnYhyRySdp
 IpCaW0kQnRr2DZIT8fC4MRziFxXngzudvc49yxlr3oxNnLA0yZn/1X/Gg8/Ls3eMqDZe
 /P9LsqMDbXzGzFijY+x4wgTZiQdTGjPFQPpmvanXMwwrpznlx9KlkfKL2Yv3rX2gwY2o
 O2Ew==
X-Gm-Message-State: AOAM530RCjPXYQTVs6DIjSEbVGl5HUy3toKRFtJx8I1+D28tXHDI+v2V
 Rd35DBdLzVDHzcMJOAa1ZiNs/atopYdGbw==
X-Google-Smtp-Source: ABdhPJyQSLztzuuImWrlxzMNxHEXSVN9Nu24cIrPcnTu1jluQscApud8ZbaMPtdvrihFFpaN4t2S5w==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr43087935wri.141.1620797853782; 
 Tue, 11 May 2021 22:37:33 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n12sm23549283wmq.29.2021.05.11.22.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] gitlab-ci: Run GNU make via the $MAKE variable
Date: Wed, 12 May 2021 07:37:11 +0200
Message-Id: <20210512053714.3268162-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the $MAKE variable to call GNU make, and set it to 'gmake'
on FreeBSD to avoid:

  $ make -j"$JOBS"
  make: Unknown modifier ','
  make: "/builds/dTyar424/0/qemu/build/Makefile" line 3: Need an operator
  make: "/builds/dTyar424/0/qemu/build/Makefile" line 4: Missing dependency operator

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index fe4f18595ac..f284d7a0eec 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -5,9 +5,11 @@
         ;
       then
         JOBS=$(sysctl -n hw.ncpu)
+        MAKE=gmake
         ;
       else
         JOBS=$(expr $(nproc) + 1)
+        MAKE=make
         ;
       fi
     - echo "=== Using $JOBS simultaneous jobs ==="
@@ -33,22 +35,23 @@
       then
         ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
       fi || exit 1;
-    - make -j"$JOBS"
+    - $MAKE -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
       then
-        make -j"$JOBS" $MAKE_CHECK_ARGS ;
+        $MAKE -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
 .native_test_job_template:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  extends: .environment_variables_template
   script:
     - scripts/git-submodule.sh update
         $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
-    - make NINJA=":" $MAKE_CHECK_ARGS
+    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
 
 .integration_test_job_template:
   extends: .native_test_job_template
-- 
2.26.3


