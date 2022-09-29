Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7465EF5FF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:05:58 +0200 (CEST)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtEj-0004gT-LG
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw9-0004Qj-5J
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0001DK-3i
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id bq9so1758637wrb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U6pzoGmye/soVbf/lv98NM957nVkbZaRaRV3Ma5l18Q=;
 b=TepAKlULP8gJos0TiqOmdBGAlpgkRzMPjpS7mQTIu0TA9v1sOAVQ4VLDCZMRlZqbXI
 9ZCmuAopHrYJ4u2/4uqR+7eEc00APC094cvXTOjmFAZBRFthACM41W8NRQxTo2phBnS6
 Axq9NbyIMCsdJVybjdf0gCVSlkLl5o4eTOLdWmfMg3tPwNpVN19tq9jxX5FusakLecA4
 Pl5mab7HrR9moZ+Sgl5c9X5FVyYqUShJ2HYfj38ifw9VZFax6IgRTGATa4qQaNwrczRv
 fvtR4u1fdxRypqb6g5RkPeQLmOqHmBnlkH/i+thOHuDaziqie0lelP1BohywLaWWu9Kv
 DzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U6pzoGmye/soVbf/lv98NM957nVkbZaRaRV3Ma5l18Q=;
 b=B/pGFF7or+KJbH9KWHWHrMh2L33Hn395NsT6y9Gk+OIw85Yd70O3T5ba/6Ub1Ye34s
 wZdumWv8Wqa9d0mvqaRwN9BdgJgGXmrx/EGy3MsPfEhOeDcCK5TxINCSSlTDY+HC52b3
 F4pyPREI7AKVKC9ACc+cNnwnf39I/mb4KyKWQDew5OHWHP7TW9iwJZqZC3/OOebhLC7u
 uHSHVClCz0+GALf1Fey3qHzch2t7wrUtRGZbsgGSLJUn9Vk+aURQ10E5U2uyTHYv0fJk
 qTSetc/ovQnx+8ZVRSHUPQ1h5tUs63T6rNWgJJ/tGkIMtxCdVP1Fp/xvsmuGNTBzk0QL
 cdNA==
X-Gm-Message-State: ACrzQf1AAgHofAVPqAbczbKGRcPauXmh1e70XV8X9TNme1HYbwRca+M7
 Znm4TLDQwfUoclKB/x0xkoLonQ==
X-Google-Smtp-Source: AMsMyM4mbnBf2asrsFkZ9onLFfBe74y+CaMmHiAo/MfBrKSgZoVzFdOXNlRQ/KehPrtCwrkIedK3Wg==
X-Received: by 2002:a5d:460f:0:b0:22c:c851:40d4 with SMTP id
 t15-20020a5d460f000000b0022cc85140d4mr1980570wrq.130.1664451757198; 
 Thu, 29 Sep 2022 04:42:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c1d0300b003a62400724bsm4472982wms.0.2022.09.29.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4421C1FFC0;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 08/51] target/hexagon: manually add flex/bison/glib2 to
 remaining containers
Date: Thu, 29 Sep 2022 12:41:48 +0100
Message-Id: <20220929114231.583801-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
---
 .gitlab-ci.d/windows.yml                             | 6 ++++--
 tests/docker/dockerfiles/debian-riscv64-cross.docker | 3 +++
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 2 ++
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 3 +++
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 3 +++
 5 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 86a4339c48..70571b29a3 100644
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


