Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B83BD9AA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:11:52 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mjn-0005rF-Hr
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mXA-0004vq-Qz
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWv-00024V-Pg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so26452895wri.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7/mVr7Wht5ohFpSzGRlkrOJNv9dh0GtVvv3G35jqG0=;
 b=KqI9jAVlm6IxDc0+v4NdLJCDL2SWt4Y34TjwQApiiNvWwwH4rvHLtGnD5Sx1i8ywiu
 MS81BMddekGr/P/vpIaW1OIqCtbieGNmvIISjm7XIPpaXHHnO/qMqXSGfCietHxWoRMx
 DSnZI81CThd08nOD50A9RTVBULqlV0SMb+3++gF8jQZog6356VHOp6EQT27Wjssy3cbt
 iflvrf1YSFAjBceS1THIr4FL0SHSBz6UGQTASuUUNzkK7dWlJdTMjaZ5P3fbz6PcXEmT
 pKgBO71KNYkqHgch7AxaWp453fq+KbMhWRrVEnJW1rGcZX1S0z3PB/5SbcXyNY3Eiak3
 a2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7/mVr7Wht5ohFpSzGRlkrOJNv9dh0GtVvv3G35jqG0=;
 b=fDphdkOWskBa5MZ6LxNy8MmV1st8DMLJR1J9IvFgMfzfCVjNaZk/A9aL2dMAAKPlKv
 CGrERE+tib1a7nHjpQ++ezkA2mDaQLGEVFIldx87lvIdnqRHVMsz4Tz6ugyuxQIFT82K
 I7wK9UWzwxLEdrDk9xmdhJGPFzHLY6Gmc1k28GwzCvh4l3G/LVgolnKLGk8xgXd1BeqE
 H20HH/uMbbvJNvhm3TXNuQpvmVYFoTsqtjKnHjYRjDso5+iw3sw8Nszqju7sovWEUOpV
 XpXfeVs6pUHTPHX48VBqkfXMDgD3So4gFv6s0GOJHtPO8AizVomTJztrOGlqJ+mJDTMI
 d9MA==
X-Gm-Message-State: AOAM531liohkbfqKiXAeOfZYtdwbt6sbuzr6Ie8cjG2tc0snjHiPZCVe
 1TqHwVI9B3pS7InpAW2M5+4iww==
X-Google-Smtp-Source: ABdhPJxabqJH331JlIXQY1/wxuF6ojmB077bRaIVFDAtKkqzlBLWGaWDFvKK2AQ4TxugVaG9ucZSVQ==
X-Received: by 2002:a05:6000:12d1:: with SMTP id
 l17mr22256519wrx.225.1625583511829; 
 Tue, 06 Jul 2021 07:58:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h8sm17027619wrt.85.2021.07.06.07.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B91E1FF9A;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/39] tests/docker: use project specific container
 registries
Date: Tue,  6 Jul 2021 15:57:49 +0100
Message-Id: <20210706145817.24109-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Since Docker Hub has started to enforce pull rate limits on clients, it
is preferrable to use project specific container registries where they
are available. Fedora and OpenSUSE projects provide registries.

The images in these registries are also refreshed on a more regular
basis than the ones in docker hub, so the package update should
generally be faster.

While CentOS also has a registry it is considerably outdated compared
to docker.io, and also only provides x86 images, while docker.io images
are multi-arch.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora.docker             | 2 +-
 tests/docker/dockerfiles/opensuse-leap.docker      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
index 1dfff6e0b9..91c373fdd3 100644
--- a/tests/docker/dockerfiles/fedora-cris-cross.docker
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -2,7 +2,7 @@
 # Cross compiler for cris system tests
 #
 
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 ENV PACKAGES gcc-cris-linux-gnu
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 8004fd8ee5..dbb8195eb1 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 ENV PACKAGES \
     bzip2 \
     ccache \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a638afb525..9fed35f4e1 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index f53007ac86..fb641f6104 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 9dde3f6a78..a506e68d33 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM fedora:33
+FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f7e1cbfbe6..7ebff1b3a8 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,4 +1,4 @@
-FROM opensuse/leap:15.2
+FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.20.1


