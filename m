Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF637929E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:25:38 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7mr-00037l-8J
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kZ-0000Xt-At
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:15 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kX-0003iq-Sg
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:15 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b17so19205330ede.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WM56ZeWWX0mtxvGSarYLoOC9hh0ABVIqYRvMpQjC9w=;
 b=oBhH7D33ofNBMD0XL2lVuHJHl+eTWnzDxJMiiI345+YSWUrcTkBT/GcSLtUSGviPE0
 /qZuQUJBObmJQJBfg/cbTVtx8SORzLVnHtDQ7VvFGMYNhJhYOtSTszH/p1F4HZwI4XC1
 KDXXgV3b0hWSd4aX/N9/e5J0Bmxyo28cPMWFuHgUm/jzcCBhUdAMZhNiQuSkc1zdFBCn
 hanac2Ht4QiuCaEdVBhFXUUwa4FFzPozimHem+zwlqBrDdvBVIy9cOwwkz7gULlPD1tV
 kNDF63F/2KM6XXPiVaxPiRAP/31Jp4jccNs4nyOsRQu7kybO06gBI7RGdTCre9a1wl2v
 2e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7WM56ZeWWX0mtxvGSarYLoOC9hh0ABVIqYRvMpQjC9w=;
 b=JqiPgjfy3na2ZwxtWuHWbRYvoSqNhzfaIsoyxWIhfA5/APGB7YNP3k4AokIXGG1gwY
 Q0Cck8fpasCtbQ8Oj1DTzfbUzCBh8XHaLRICv06arIG/3HdxZYmJsSntzKLnEmAbph+2
 UgT40UposT3tdG1PJcTjh1FejODSmIArsyk4h7rSn/Szu0dBXW0HmsOymiqcvBFh848K
 fUwLw+vdd3ucbxLhrP3cpjunBBif7x14p81L1H8r5u5yDIFgPXmmBS3n7HUOT9x7VGqg
 McWS4nelf+AFfYFwu3Bg8g8vf2S5phAJfQTkIVxL6pi6iBT0BwpghjLDq37gS1QXQr37
 GYtg==
X-Gm-Message-State: AOAM532EaDLipc7Q0W6eAMSg6P1ujv8MmyxGSy/LgUcVVce65fl3jr1T
 YWpjWy37cnNG1n++Npvfogu/tbJKqFUbNQ==
X-Google-Smtp-Source: ABdhPJzXc1jNlzpXZSTDwC5epilenGozZcGRE1LmMnOW6J8+qJsbgHU6aQM0uhb9pdv6Q2tJaaGNAA==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr8594036edt.381.1620660191864; 
 Mon, 10 May 2021 08:23:11 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c25sm11726351edt.43.2021.05.10.08.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:23:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] gitlab-ci: Run GNU make via the $MAKE variable
Date: Mon, 10 May 2021 17:22:53 +0200
Message-Id: <20210510152254.2543047-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510152254.2543047-1-f4bug@amsat.org>
References: <20210510152254.2543047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
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
 .gitlab-ci.yml | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index aceaac5a398..a33e51bf453 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -19,9 +19,11 @@ include:
         test $(uname) = "FreeBSD"
         ;
       then
+        MAKE=gmake
         JOBS=$(sysctl -n hw.ncpu)
         ;
       else
+        MAKE=make
         JOBS=$(expr $(nproc) + 1)
         ;
       fi
@@ -44,22 +46,23 @@ include:
       then
         meson configure . -Dbackend_max_links="$LD_JOBS" ;
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
 
 .acceptance_template: &acceptance_definition
   cache:
@@ -833,17 +836,18 @@ build-tools-and-docs-debian:
 pages:
   image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
+  extends: .environment_variables_template
   needs:
     - job: build-tools-and-docs-debian
   script:
     - mkdir -p public
     # HTML-ised source tree
-    - make gtags
+    - $MAKE gtags
     - htags -anT --tree-view=filetree -m qemu_init
         -t "Welcome to the QEMU sourcecode"
     - mv HTML public/src
     # Project documentation
-    - make -C build install DESTDIR=$(pwd)/temp-install
+    - $MAKE -C build install DESTDIR=$(pwd)/temp-install
     - mv temp-install/usr/local/share/doc/qemu/* public/
   artifacts:
     paths:
-- 
2.26.3


