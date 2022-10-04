Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F465F442F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:21:45 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhrk-0002uf-NM
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYU-0008Fe-G4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYS-0007Nw-2F
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso10797216wmq.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oFhe2ZA+iPnqPA1iiOwQwqaWQ8b/0eDk96Q44wRc52I=;
 b=oPR3G5h1tOI/s1J610gPD06gpOTuVb9dwPsy0tgV5K3x3F0krcrw7aLxVQmg8gFvcB
 KOHnRmNI0Zroh3pBjt2D8A4QoUtUaghI48W9REKPx68iYZwGVddHwUCw+EtAqGisiKqO
 KS3KnABHMRB4waDJnxSDK424bNWNhU+69ZPxf7a2kCZLmQa/W1wKKP955ryTV9mYoM49
 2z2rhikYi+xp5rnXzvb+aQ8DCLK/hmbioVtAdJH1/KTZCw4wfpg5bw40U85Rp5OFhXPh
 8nVcWhkLN2VugddeeMyxMgBTIxdYI5IImqSYD6jzS7JK9jV370NyZvYjLRef9pwSDk8a
 xLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oFhe2ZA+iPnqPA1iiOwQwqaWQ8b/0eDk96Q44wRc52I=;
 b=mAAUqQoxrkJgyeZqa1fpP1NbPBT7WbbAtD6ZBF5bo+j/wO+8FfVbE1dTP/uszDQDZA
 eCuJppZdX/uzdHsRIbDI1g/h0G6JHmsjhiYmlFG2e86mkppl6aIilcfi06okLte/Rv9q
 pGZZDM/+B5h7xt/+4fW7ew0AvHyqB7wTMFY077WCEpzXUZYY2lOw7T1D/ra5AFJvtkAl
 voy5nBPxnSJlkQyl+WvqL5RJueoNCpMwV6MEtd8RE5bTsoR3tlFIrGnbfznp+K2kVSL+
 /kvaEqe5oFaVVUxcYAJoRQ8etVKFyi2aKYibqixpBt0WxIjdOFQRXlOMDelO3wO1zJdX
 qwCw==
X-Gm-Message-State: ACrzQf1sJyPhi6vLtLl/CEsMbQusMcu2f0ONMHrwQ46hYU5ma+w9VAf3
 u228JKvZAItU5kqH018ZY3tk3BoxsxnyKw==
X-Google-Smtp-Source: AMsMyM7H2DMIhoZvhNtWGZWxALMOu1WkblHU8n31qAKSyNDQyIsUndXyjA9r7mjvGAmt444tITC18g==
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id
 bi6-20020a05600c3d8600b003b4b65fa393mr10342600wmb.0.1664888506473; 
 Tue, 04 Oct 2022 06:01:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c484100b003a5bd5ea215sm13774774wmo.37.2022.10.04.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EDEF1FFC0;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 08/54] target/hexagon: manually add flex/bison/glib2 to
 remaining containers
Date: Tue,  4 Oct 2022 14:00:52 +0100
Message-Id: <20221004130138.2299307-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Anton Johansson <anjo@rev.ng>

Adds our build-time dependencies to containers which build qemu-hexagon,
but aren't covered by libvirt-ci.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220804115548.13024-11-anjo@rev.ng>
Message-Id: <20220929114231.583801-9-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index ba59844d12..a3e7a37022 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -33,7 +33,8 @@ msys2-64bit:
   extends: .shared_msys2_builder
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
-      diffutils git grep make sed
+      bison diffutils flex
+      git grep make sed
       mingw-w64-x86_64-capstone
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-cyrus-sasl
@@ -67,7 +68,8 @@ msys2-32bit:
   extends: .shared_msys2_builder
   script:
   - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
-      diffutils git grep make sed
+      bison diffutils flex
+      git grep make sed
       mingw-w64-i686-capstone
       mingw-w64-i686-curl
       mingw-w64-i686-cyrus-sasl
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 594d97982c..9715791e0b 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -16,13 +16,16 @@ RUN apt update && \
 
 # Install common build utilities
 RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+    bison \
     bc \
     build-essential \
     ca-certificates \
     debian-ports-archive-keyring \
     dpkg-dev \
+    flex \
     gettext \
     git \
+    libglib2.0-dev \
     ninja-build \
     pkg-config \
     python3
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 0a3ec346e6..7eec648d2d 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,9 +1,11 @@
 FROM registry.fedoraproject.org/fedora:34
 
 ENV PACKAGES \
+    bison \
     bzip2 \
     ccache \
     diffutils \
+    flex \
     findutils \
     gcc \
     git \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a06bd29e8e..aca37aabc4 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
+    glib2-devel \
     hostname \
     make \
     meson \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index b71624330f..3642766479 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
     bc \
+    bison \
     bzip2 \
     ccache \
     diffutils \
     findutils \
+    flex \
     gcc \
     gettext \
     git \
+    glib2-devel \
     hostname \
     make \
     meson \
-- 
2.34.1


