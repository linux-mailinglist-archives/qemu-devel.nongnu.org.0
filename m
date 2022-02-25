Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41F4C4D61
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:12:58 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNf5N-0006A3-NF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:12:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH0-00047D-O5
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:54 -0500
Received: from [2a00:1450:4864:20::52a] (port=45990
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGg-0002LF-66
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:54 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so8306475edk.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xtrexeoEJVm2dGaopXDo69WQ4Zzi4WQEocMvz+dIqSU=;
 b=AVzGVmX4CuLohMIoFyj7XnVR5CQNfxXsA8ZgBimISvdK9NGR2ugYIwqnuWlOeH7N6P
 jT1JTtBKJr1GIlCFkHVG3iNN9yOzLHVElKHYjLftUr06n47VwLOY3gD99dr8eTNuTkAG
 QWDHww2vp6IPi5d00k4+w+xyHirtLMq71WNsA7sIw0EIefjd3xiuoTg3uLFQ3QKUiC1R
 mZI1flhx3Tmdk7HwVEGOy4rHoODVcag4PQHiZYxN5rAs6BnZkDfAzlIowdFGE0+l8tCV
 2QKW06GV67A8xr1Q3pvrUBsziVu/aZ3RzJLoHBLDGhq0hccUMbE2qvKHqPzhxCXJvgNh
 qKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xtrexeoEJVm2dGaopXDo69WQ4Zzi4WQEocMvz+dIqSU=;
 b=Q37dWAjzg9KS1okRhguThxHy5nTlblPN7CfSo5S6vwkVdXKeyUlTGm7wE3M9lxntwG
 KhJJHMBb5ECuRi7ggNjAPqJfvL0xWnkFNnRN/XqL+DVKx5abR2KrirHRBQdBDYL/8Cuf
 MnKy9dKtHgAQKt4Q8AvL8ODLTgSWKmlqSk31LeBH8MAKu+I4fpfJ+871QVxf6xSJZ7TY
 /orbtN9JweTgE7IcVcFwTitlnHbm4Djm8b4DGEuK3CKyYaWqFxvN5pU/+y/5+eMQAtzs
 jN55EF5D3FBmNPteAjcmwFfht26rpzbE6H7K1bTKp15eP+VQMWiXGULf4Oz1yeqryALK
 Tf9Q==
X-Gm-Message-State: AOAM532s7kNyJqk1xmRdJzwfAwNOPFbxjIDzFL0+51++lnOpDNOt7iDp
 2Fr4aEKLRcoT8js9NXF3+C9EAA==
X-Google-Smtp-Source: ABdhPJwFTv78bRZWxYC29Qsam3riax9z17rn5/+M+CHCCnwmvu2nwCTbaldzv8rn8Xq7zAnh4TR/ew==
X-Received: by 2002:a05:6402:13cb:b0:410:820f:4e8 with SMTP id
 a11-20020a05640213cb00b00410820f04e8mr7907671edx.352.1645809627255; 
 Fri, 25 Feb 2022 09:20:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u1-20020aa7d0c1000000b004132c0a9ee3sm1596730edo.84.2022.02.25.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CACA1FFBB;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 03/18] tests/lcitool: update to latest version
Date: Fri, 25 Feb 2022 17:20:06 +0000
Message-Id: <20220225172021.3493923-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need an update shortly for some new images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
 tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
 tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
 tests/lcitool/libvirt-ci                      | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 1b78d8369a..e1ad9434a3 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -127,8 +127,7 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 699f2dfc6a..0a622b467c 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -134,8 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 87513125b8..b9d06cb040 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -136,8 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 6dd9b6fab1..f83b916d5e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 6dd9b6fab1fe081b16bc975485d7a02c81ba5fbe
+Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
-- 
2.30.2


