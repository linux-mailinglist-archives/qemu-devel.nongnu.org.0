Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E12DFD07
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:51:20 +0100 (CET)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMWt-0001qK-2e
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQm-0004jp-H4
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:00 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQk-0007ez-Hi
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c133so10105431wme.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KQ7Eb2mptyWkstvTdaI21O4im2v6UCc4yqZIm6MzZc=;
 b=MtemWxNG0/dn5MhX4z4ArxeedGw5r02Zx0FgdNH/jSg4bXwr38UQQeaF1xD1Vu/v+B
 fJVKZUU+BXi+8XOEiMzgGkAowzGZFBUo8XLK6tmbYkosIbpS7xcvBlnsfOC+0B7E1X4/
 Qbsp7nOO/+6cXPIdm/p1CUTENg/iPKJxx2zr+mN8kTEzP3eaqAWaIb61ZbMeGb8iJgPK
 N6l0a5INC5yyXtSfO4jPTZ7uE/79g8kcvQGHUQ2oPSlLJeJUCV7cu5fnRuiGjexwPgU7
 /jHKBjxIF/9pBC12a7QKn4pJchKe1ZI0lkDW83kiDW/B7ddkrJnbfvNhydFvlI06SXhC
 LCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6KQ7Eb2mptyWkstvTdaI21O4im2v6UCc4yqZIm6MzZc=;
 b=DGv2Kpd4aaWQiL5FwR8QQMesSx5F6owT36BLdlRx4mm1AX+YS/0IN7NlqKwj7u52x3
 lGUJXEkBiNhrlgk7adMJZEMOk/XFhhhEo7XY9JSnQXePUCP+F7Hd5VPgmqxw8cA17Ue4
 NaO1n7muwHHdQQx913A0HamuqVI/rhutJ7wN23xiUZQ9ciM8XiUI7KLz/TqoeJ7TEXyJ
 iOsoos660Kj5KBr3aYBnDrGgeRIZkRDL0zTbiQJThwzjQui1F5HrWyXi1NN/naoaSRkX
 vyKtTDQSW9ncrEvYUSufnnOddwmTvJWwojQxD1w16b3q2eh/KW4ILdMnGLNqc3A+lI87
 p5Nw==
X-Gm-Message-State: AOAM531tVLX9+Pdl8x2ld7TEBPwA6TXNc40JZ9KgShlfXqcWafHREz+B
 tJlTyZZbWvpc4CQxZ1ll42RNFwh0s0M=
X-Google-Smtp-Source: ABdhPJyqMZ/v/aMpe0d2pH294olf8eu+PH2UHMDkS5KbZ1F5Vjr6sBdNb4nUl70LlvXhOTkOEtDdmA==
X-Received: by 2002:a1c:630b:: with SMTP id x11mr16833531wmb.138.1608561896639; 
 Mon, 21 Dec 2020 06:44:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/55] gitlab-CI: Test 32-bit builds with the fedora-i386-cross
 container
Date: Mon, 21 Dec 2020 15:44:00 +0100
Message-Id: <20201221144447.26161-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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

From: Thomas Huth <thuth@redhat.com>

After adding some missing packages, it's possible to check 32-bit
builds and tests with the fedora-i386-cross container in the gitlab-CI,
too. Unfortunately, the code in subprojects/ ignores the --extra-cflags
(on purpose), so the vhost-user part has to be disabled for this.

While we're at it, update the container to Fedora 31. Unfortunately the
gcc from the later versions emits some very dubious format-truncation
warnings, so Fedora 32 and 33 are currently unsuitable for this job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201215083451.92322-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml                   | 16 ++++++++++++++--
 .../dockerfiles/fedora-i386-cross.docker       | 18 +++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index fcc1b95290..66547b6683 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -10,7 +10,7 @@
         --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
           microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
           ppc-softmmu sh4-softmmu xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 # Job to cross-build specific accelerators.
 #
@@ -37,7 +37,7 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
   extends: .cross_system_build_job
@@ -69,6 +69,18 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-i386-system:
+  extends: .cross_system_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check-qtest
+
+cross-i386-user:
+  extends: .cross_user_build_job
+  variables:
+    IMAGE: fedora-i386-cross
+    MAKE_CHECK_ARGS: check
+
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index cd16cd1bfa..a6e411291b 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,14 +1,26 @@
-FROM fedora:30
+FROM fedora:31
 ENV PACKAGES \
+    bzip2 \
+    diffutils \
+    findutils \
     gcc \
+    git \
+    libtasn1-devel.i686 \
+    libzstd-devel.i686 \
+    make \
+    meson \
+    ninja-build \
     glib2-devel.i686 \
     glibc-devel.i686 \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    perl-Test-Harness \
     pixman-devel.i686 \
-    zlib-devel.i686 \
-    libzstd-devel.i686
+    zlib-devel.i686
+
+ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
+ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.29.2



