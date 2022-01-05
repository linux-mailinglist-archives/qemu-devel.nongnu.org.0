Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F825485491
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:31:52 +0100 (CET)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57KR-0005v7-4x
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q1-0004Yy-KZ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:26 -0500
Received: from [2a00:1450:4864:20::42d] (port=36366
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pz-0006RK-8p
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r17so83198919wrc.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lJX1Rdn3x6iVR3GQXKCvJ1YiilMWNbxCAjbO3j9CedQ=;
 b=nT/nnJ150mblQGOTb/c7hf9yDaX7qKiymZhWgEnh2vmr0kMNSmUTooJKm718N+4mj5
 UHtn/JZ9eHU4KDj6bZxXxrKgMl+blw9vYkPfmuIhgZByEP9wd9dxFD9AkxePSydM1FmM
 cKDHGDJ+4wg0E8J3B82gHsGBdx4pXAMzLRCCRhrG947jL2HWUohP9WDDiFfwpDzoU7xl
 E5HGGH30qJpdpI+wOnTEQuoaJV1K2HlL+e8zJCuZ1D2rQQqGtL5d77cDn+3M3CwNgB0g
 hZ4/OFQYnslWYLOqdG2/0mNPjCjDAAaJB88OrpNs/X4nlLe0LCHccpUTdjdhNZnoNhRT
 ed4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lJX1Rdn3x6iVR3GQXKCvJ1YiilMWNbxCAjbO3j9CedQ=;
 b=6XU6EzICMKl4s26iV7YkD4ilag2rxq9jhIHSC2WTPE47hEBOG0H/MoJRPXFZhKN9So
 00jOH8NzgLfH98LuI0Mf4APbUF4nu7HeGg8s3L9C6Jr3DHApZxDGiYVQj4sTA1pE0pFA
 NXdoqQFfEWtOpBJAnHGm5rAjmO1HP14t8ndhTrHh8jnIGimAf/AxY2MvdxpEzER3mD3a
 /smWPzYnj+6KWPOt3Z3HzMu32BwttDxttK3jXhsY6MO0G6gTIkXzlempgMQkB/zwxviA
 pVJbnk0ktfp6SReKpCntXPlHK6hrLa0Inv8VQlDTsQ3lOLJRpVc2WKgimBp3YnH2V39j
 gvyw==
X-Gm-Message-State: AOAM5313xXSM6F6iMYbtUPOn1MZIWSzPAQ/YknssuFdqldKaVdVeUq1F
 yaVUIYDyEMbb/jfzeMoY6V/I7ZkD46t8OQ==
X-Google-Smtp-Source: ABdhPJzjIklercu6vwSZ/WfRt84l/LqO+yMSsHJAp2ciuWx52LQdPHz4i1v8hYgF0wyxCGPO2mV1Yw==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr46758304wrp.102.1641391219772; 
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o5sm2605678wmc.39.2022.01.05.06.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 511021FFC5;
 Wed,  5 Jan 2022 13:50:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/34] tests/docker: remove ubuntu.docker container
Date: Wed,  5 Jan 2022 13:49:48 +0000
Message-Id: <20220105135009.1584676-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This duplicates the ubuntu2004 container but with an inconsistent set of
packages.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-14-berrange@redhat.com>
---
 .gitlab-ci.d/containers.yml            |  5 --
 tests/docker/dockerfiles/ubuntu.docker | 71 --------------------------
 2 files changed, 76 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/ubuntu.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index cd06d3f5f4..b9b675fdcb 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -29,11 +29,6 @@ amd64-ubuntu2004-container:
   variables:
     NAME: ubuntu2004
 
-amd64-ubuntu-container:
-  extends: .container_job_template
-  variables:
-    NAME: ubuntu
-
 amd64-opensuse-leap-container:
   extends: .container_job_template
   variables:
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
deleted file mode 100644
index f0e0180d21..0000000000
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ /dev/null
@@ -1,71 +0,0 @@
-#
-# Latest Ubuntu Release
-#
-# Useful for testing against relatively bleeding edge libraries and
-# compilers. We also have seperate recipe for the most recent LTS
-# release.
-#
-# When updating use the full tag not :latest otherwise the build
-# system won't pick up that it has changed.
-#
-
-FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES \
-    ccache \
-    clang \
-    dbus \
-    gcc \
-    gettext \
-    git \
-    glusterfs-common \
-    libaio-dev \
-    libattr1-dev \
-    libbrlapi-dev \
-    libbz2-dev \
-    libcacard-dev \
-    libcap-ng-dev \
-    libcurl4-gnutls-dev \
-    libdrm-dev \
-    libepoxy-dev \
-    libfdt-dev \
-    libffi-dev \
-    libgbm-dev \
-    libgnutls28-dev \
-    libgtk-3-dev \
-    libibverbs-dev \
-    libiscsi-dev \
-    libjemalloc-dev \
-    libjpeg-turbo8-dev \
-    liblzo2-dev \
-    libncurses5-dev \
-    libncursesw5-dev \
-    libnfs-dev \
-    libnuma-dev \
-    libpixman-1-dev \
-    libpng-dev \
-    librados-dev \
-    librbd-dev \
-    librdmacm-dev \
-    libsasl2-dev \
-    libsdl2-dev \
-    libseccomp-dev \
-    libsnappy-dev \
-    libspice-protocol-dev \
-    libspice-server-dev \
-    libssh-dev \
-    libusb-1.0-0-dev \
-    libusbredirhost-dev \
-    libvdeplug-dev \
-    libvte-2.91-dev \
-    libxen-dev \
-    libzstd-dev \
-    make \
-    ninja-build \
-    python3-yaml \
-    python3-sphinx \
-    python3-sphinx-rtd-theme \
-    sparse \
-    xfslibs-dev
-RUN apt-get update && \
-    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
-RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.30.2


