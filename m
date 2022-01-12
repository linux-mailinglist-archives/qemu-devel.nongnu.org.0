Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE148C36D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:45:06 +0100 (CET)
Received: from localhost ([::1]:36812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c3t-0007vE-8I
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:45:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnF-0002t0-1z
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:53 -0500
Received: from [2a00:1450:4864:20::329] (port=42904
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnD-0003R5-HW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so435639wmb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJdXj+GU0g5MXSnXf9glzBj8PLt6BBcIJN6YQ+yHU5E=;
 b=g1nuwzTBkgYSQqoK8P5EikqAieavF0DQevcNlsPgtNVev9Silx7GRt7rewxLeATGd7
 JJrGNfzE+ocxi6e35IRodMD5A3KGNfi0moR2gvX7rx6NRUb5wdOJMKjaMyDjMVuqHv6d
 YhGZU0m0tFkt0jzF3h/Wy3ZLejJHMaJX2D2QV0syXSLcnRE+mB8/6gmuHJKnRQv+5xDO
 D8hvp6nUVdZrM7l+hj4+Qp1IjBHYppLyNmHnKNYZJKFSqqKSb7wczeLwA92y3wgaSdjF
 WbQbWbGxaz0YdSmU86U3MRRAppbeAjIim+F6hIhXrGNo3imDmICXbLwcY3PsuakwPXtE
 LesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJdXj+GU0g5MXSnXf9glzBj8PLt6BBcIJN6YQ+yHU5E=;
 b=str8Zca26klRneq9HbdJP48l8dHovimkEyXjNWAPhTaeMq5c4Ek/lHbEamTAyW67+l
 TcMY/dv7lzC2bOlcMq9H71rjHiygx+BI6H2KGOyPoChCQVNuhewJQtW3jAYIbVILIrKt
 xMz7OxJAe6k0lCpG6gKE1yoyPCWQXNngp3dQ0Jih6ehogknxJTJ/Om44KpSEdsVNMuQb
 r9yKDMtZVeWPLS2s8BIu+wSH4JJujeOMpICc1NvDRdsAOXH6JUspcVnu0JGv5d/yQtYP
 peFDdBzcM4eiI87chtTXG2DfrYJTIepCE+rDi/1/HBPg5QZnmPKwRWOjkSTHNA1OBkiU
 Te5g==
X-Gm-Message-State: AOAM530ZOCIcSsjrpgfrsO9m/RO3+Wdrgbmw3nXliOMqbXs+1Bp0Ock0
 yA3KM7UVuoZLaQBDpsiPIdm8Ig==
X-Google-Smtp-Source: ABdhPJyjJ7Ls3imHTFb6CiNpya5JS0mbULWzCafwxolTGzXZfFsnlG6sGa8i4MaQVoo3VxnvS/6NSg==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr3568416wmi.71.1641986868803; 
 Wed, 12 Jan 2022 03:27:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 5sm13731156wrb.77.2022.01.12.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 226CB1FFCC;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/31] tests/docker: add libfuse3 development headers
Date: Wed, 12 Jan 2022 11:27:11 +0000
Message-Id: <20220112112722.3641051-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The FUSE exports feature is not built because most container images do
not have libfuse3 development headers installed. Add the necessary
packages to the Dockerfiles.

Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Tested-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20211207160025.52466-1-stefanha@redhat.com>
[AJB: migrate to lcitool qemu.yml and regenerate]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Message-Id: <20220105135009.1584676-21-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 97c7a88d1f..eb2251c81c 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -29,6 +29,7 @@ RUN apk update && \
         dtc-dev \
         eudev-dev \
         findutils \
+        fuse3-dev \
         g++ \
         gcc \
         gcovr \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3c62b62a99..cbb909d02b 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -30,6 +30,7 @@ RUN dnf update -y && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        fuse3-devel \
         gcc \
         gcc-c++ \
         genisoimage \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 6784878b56..60207f3da3 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -37,6 +37,7 @@ exec "$@"' > /usr/bin/nosync && \
         device-mapper-multipath-devel \
         diffutils \
         findutils \
+        fuse3-devel \
         gcc \
         gcc-c++ \
         gcovr \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 5510bdf19c..f57d8cfb29 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -22,6 +22,7 @@ RUN zypper update -y && \
            dbus-1 \
            diffutils \
            findutils \
+           fuse3-devel \
            gcc \
            gcc-c++ \
            gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 40402b91fe..4e562dfdcd 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -46,6 +46,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libepoxy-dev \
             libfdt-dev \
             libffi-dev \
+            libfuse3-dev \
             libgbm-dev \
             libgcrypt20-dev \
             libglib2.0-dev \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 2e2271510e..ed5ab1407a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -18,6 +18,7 @@ packages:
  - diffutils
  - dtrace
  - findutils
+ - fuse3
  - g++
  - gcc
  - gcovr
-- 
2.30.2


