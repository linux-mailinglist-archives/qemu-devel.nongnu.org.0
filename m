Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981EE3896A3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:26:58 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRqL-0003wc-JV
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCs-0000Jz-JT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCq-0005C6-19
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:46:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q5so15072348wrs.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bxIn0INwdcSb5lb9f8fZG1avNfdlG4L8wrUYhmTwTc0=;
 b=EppczxByJXAMutDFYy/13i2SzyQrC74vxvsbe1iy+rryBZHrjjOf4akdT9dHyRdr2B
 KT997xM0z516IoKlUSup76Bhq0ZHUDcHq2Ltro+5MNerE8niJ8KEwwsKEC3grwIpZsrG
 qqFQ/o1QbMhwNhlkYjdR5qQRmIOHnPlFewrqsVmHZVPZTlY23X8IHzXZcGNeetd8xqag
 W2O3zpLIbMJQ4r155gR2g4NDYCj9D4HX+JDRIwXG3rUQfvjhy+q6o6MlI7O48FtrlXDz
 vD7hZlmpRE9dEBj0aNYu688SvDYAwC50w8oFuimzNMlnSo9Zz02GlGSnhqKh5uRS0CLk
 SRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bxIn0INwdcSb5lb9f8fZG1avNfdlG4L8wrUYhmTwTc0=;
 b=Z8zXWOPI1bNeBaRlUNKss+JuTtthHvP5p729/EGECyMuQpnXXQfdsHmP3Y5utitMhU
 TTzLbdNS7I6HXVyhjPd03IGNPiZh7y4tVn4wpK5oM+h4HgbTXgShoqCmZ8nVi8l8STtP
 ItFIKPnHeyLMp4BL1QG8L81seO0J9n8y74ne046fT59gXxg7i/b9Iq2Zvc/B2SWvU9g7
 3YmbrYjd5jju8aTkqjpvpHGaSqQh22Zjzu0AtooDFuqSOcBUeoj5dOhmZTdyUN4tGXg1
 Q2zEh4N3OcvP3P0iz/O9jMvLdYZcpAEvWWHkR5GzOo3KYFzoYnAgEsLfbPWMJHg041hj
 2fAA==
X-Gm-Message-State: AOAM530LAWv8nr7o9UMAzsoeWX5NrE7SOGncr6Xnfyl3nsVbpXF6Zdys
 b9CVRPokstRL5u4F9eL5yS8yrPuFT9KISg==
X-Google-Smtp-Source: ABdhPJwwbMV/JrSZaaTi1Dgj3phWxe+dRSVIXgwPv431LHQLVLTC32niwYXvV3dt4rzpji8tJm48rA==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr324999wrw.263.1621449966468;
 Wed, 19 May 2021 11:46:06 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d3sm208820wri.75.2021.05.19.11.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:46:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] gitlab-ci: Run GNU make via the $MAKE variable
Date: Wed, 19 May 2021 20:45:46 +0200
Message-Id: <20210519184549.2192728-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


