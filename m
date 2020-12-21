Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9D2DFD09
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:51:33 +0100 (CET)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMX6-0002Oo-9d
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQj-0004j6-7A
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQh-0007dW-PU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id e25so11194280wme.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGnuMthuXcsH6OY9HMnN1qAZ8S8XpiRe9F4Rv2hYwmo=;
 b=iKYJoprO2vn9jAHCSORrPweZQebTvysy9SW0rfO1xll2voA3XB370cKgmMYiSeNxrA
 ce1APxMbnmvDtaeAvd0+Rx1PBLOLPAnna332LSuLelI58ee5x9EDhNrNe5Jk/pn1Bziu
 YnTfJq6qvZjyXQSv57gbv0MLNkCikfdFh2sIxhuCjki53x1w4mDpULah2Z7lmUpqWkPb
 4CgDZRqwpf2pEjUslAFIzImBE3QCzk6CBWcYiGEZYvYiR2Kh0u8HgqqNHIjFysX8OTwq
 NFQTrw6PBeC7lbHWwfUO7zytD1I/R6c1h805LIJPP3H4cuNxzAxT1t8OzGCQHbsYa/Ne
 aezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YGnuMthuXcsH6OY9HMnN1qAZ8S8XpiRe9F4Rv2hYwmo=;
 b=uEahopcOkrVuI+Il0JoF3VV5dHZ+SizondK0Af3lnRdTt+gEzR1TIzjpRHwJFdbtXM
 MmTIxUpsg+5X+iZaZO9coPsrOfGSiHyHGvSfvcmoAdZ6rvNC1P0MGTO9Ji/ALoeKLKRd
 sdYcX5bU3Y+s++8drKAsW386D5g3bi40jR3hyUo96FWPOTmhxuEVXH5iuemV4K1ccgCC
 rwDnur8TlT5kEPqN1MS2BcqHiatUnSwfqOw5g4/5MVTXRUw2HbullkeTESxHZeSHzYZu
 AK++/qfd11M70jZTi7TqUDhkAgqTqxjOx9aPdxwxAGcZTEPqiHDxhMpt+5lCUWLPEsui
 8C2Q==
X-Gm-Message-State: AOAM531uM5QBnkVJAcqf6nhnOcDFK8jXfgkg/xPdNuuiZUb3xribLQtb
 BYVRr1OOFadIH77OaGbJ1YqL5IRNgWc=
X-Google-Smtp-Source: ABdhPJxkv9iLZ6zt+Gk1ANxKLrWjuRHd03gH2H1KgLsXQbFFlcLZbOz+z+s30ldrNjgWWI6gJlBfbQ==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr17274498wmi.146.1608561893950; 
 Mon, 21 Dec 2020 06:44:53 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/55] gitlab: move --without-default-devices build from Travis
Date: Mon, 21 Dec 2020 15:43:57 +0100
Message-Id: <20201221144447.26161-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201210190417.31673-7-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 7 +++++++
 .travis.yml    | 8 --------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47..495ff59340 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -514,6 +514,13 @@ build-trace-ust-system:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
 
+# Check our reduced build configurations
+build-without-default-devices:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --without-default-devices --disable-user
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
diff --git a/.travis.yml b/.travis.yml
index d01714a5ae..f2a101936c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -205,14 +205,6 @@ jobs:
         - ${SRC_DIR}/scripts/travis/coverage-summary.sh
 
 
-    # We manually include builds which we disable "make check" for
-    - name: "GCC without-default-devices (softmmu)"
-      env:
-        - CONFIG="--without-default-devices --disable-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-        - TEST_CMD=""
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.29.2



