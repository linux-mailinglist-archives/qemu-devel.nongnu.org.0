Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1C3C5C92
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:47:06 +0200 (CEST)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vKz-0003dR-2r
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1y-0004V7-Pp
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1w-0008Je-Dr
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v5so25370593wrt.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGsJyJN7LttFhIAfv8indlVD2zWT1TMrW1Pu0xBSDjk=;
 b=lpIa7WlHwYXScyb82//53yp+nB+I5fCLi1BLI1YZkjgMEU+ReSO0l2PjPtxWuot823
 b/hVSGi+TrMPs6qbnhBgWoSlsNAd5VlQvPw6dnm8bkyPS+V2HwuXQ8QYXMAnhJAXEYa7
 QGnP3LDANtBZuCqqszeyxY0vvbGvAA073T5Uptei1hIeJHXoNiHGwJoOq15pA9PMI8Df
 PEqCSyxdZ6ZeaKhh85dLLs1RrXlyG6U1NOIIG2GzsXq5JT7HPYiRtaVF2pnuOq6lFTDj
 smoeR4HGZwWUbDwPgir0qBBpPdiOHTAAnE7CXtouDgYMZzi499qbg3464LvgCmPjNxHW
 lRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGsJyJN7LttFhIAfv8indlVD2zWT1TMrW1Pu0xBSDjk=;
 b=ijTcC65k8m/FvoCFUJUUzFhjSwLCYIjOl7PNY0mJoWHCeXeHsP7ly9fdc8bPmfDEil
 2ksmh2rJTMQxS3Ogk8KJbAioKF0JBOwmvrNgALo4thQxSRPRNqDOpCYIvEvc9nk2YmZk
 Qogt6Z0w29vrgU3VaOQp9A8XAVvXLH7Hkvo2Q7179QAGRGemA3KI5VIosHsM9uNJGH1O
 BV83PJUGPyLgyE9E9zIpjJokEa0zSItOpGyhdj316dtA11yhZijchNLRsefBsA8ZO3k+
 N34uK9E7OzXmJtQIUstG4QLM8SdlhAvHcH9c+bh4nQ2Dcs49Yx4PX0XEqsh40wtF62z1
 ggHw==
X-Gm-Message-State: AOAM531vyZOvTxBGd/wL2xfPSP6lo4yfSaPUNCV0g8SHo2KHE5d3n23a
 TE65En2h6FfVD7EeX4U0HbvG0A==
X-Google-Smtp-Source: ABdhPJxiosg/AnrgtTNjvYp+mQgpuB93rLJWhCbqxuoLLihjWPaYs17FZmSa5qda0cul9TGLCBwgWw==
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr8756745wrw.112.1626092843046; 
 Mon, 12 Jul 2021 05:27:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v21sm8940683wml.5.2021.07.12.05.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F371D1FF9A;
 Mon, 12 Jul 2021 13:26:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/40] tests/docker: use project specific container registries
Date: Mon, 12 Jul 2021 13:26:24 +0100
Message-Id: <20210712122653.11354-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-4-berrange@redhat.com>
Message-Id: <20210709143005.1554-12-alex.bennee@linaro.org>

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


