Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05A4C8895
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:55:51 +0100 (CET)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzEU-00051M-DT
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6J-00037x-S6
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:23 -0500
Received: from [2a00:1450:4864:20::434] (port=36588
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6I-00075h-Be
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:23 -0500
Received: by mail-wr1-x434.google.com with SMTP id r10so19546616wrp.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ijoyl5KiCr5Pn3m+N0bQKO6NKwJLDb084jCvcakMpbk=;
 b=IAVYe2V8o6fpZ4lBdf2O3oFSyWHG1oXT4vz8GWxDnG/ZxC3D56eAnK1auzNjGgKCZ8
 2LBXuceEJz6k7Dzagb4UGLExB+EdI96CjGvi3XZ4oJFKQ0DfJ6QGNdnnVdp4A25Fkfat
 kWRGZnLCRN/hV9bqAA90m3Kbv3HZ1oKVAgYJD6NbvRByyA/5FdboLw1DSTtDn4OYsuZB
 vyT+4sXWIbKsZhY6QXDz3HzPnhVpqkKpVavGMyfFjAYbT9ZeTz8ZDJRllfoUg5A374+Y
 Tr+DBxkeIgGof9LwTWVcd4Y7yFvQvu1au6e0UaLEt5MFgUbaOYDyr/VVoLLsidS/EzzN
 cANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ijoyl5KiCr5Pn3m+N0bQKO6NKwJLDb084jCvcakMpbk=;
 b=KU5TSXl+AEZd4rTNZn9r8n2UAHDH0pUrogqkysr65JLbajj15ygyWUq3WPa63z6RVo
 mauhIlVHHZaJub810ynA63LRXElCx76qWpb7A4Jqs2l94gxgIUi1oFoget2vS71C8aEX
 pHjxbFiw29H2BzbMwYterq2pAVOXiG+tVElNByePMi3K0CqZ9/w9FNv4Wc3xYh+ygop4
 bqa+t47EmUG+wYqlzSHseD+ht0wbtxUxlF7ZGBptkbPLrLRCIL80e1kAo9vKxokI0lYT
 O36SJEV5a8J60hV2yORk6ZWr3z0/oV6sBLEb5muo3U/gj7SZRCeaC8d5MtUmcK1Brf10
 Hutw==
X-Gm-Message-State: AOAM531tG+hUBKQAc8mPhvIImsuZZpS0QDKUvZTMjYobiPY/rTmCmnQb
 P2yCYcChSdEoyQOUdu1s4RvOag==
X-Google-Smtp-Source: ABdhPJwo55b6u1kLrSe5CVLYyjysWzNDND/t6uOCu2LhRdnmPuIMl9fhW2RwYXCcDGohMJq7j6HZWw==
X-Received: by 2002:a5d:540a:0:b0:1f0:1ee:d2c5 with SMTP id
 g10-20020a5d540a000000b001f001eed2c5mr2352634wrv.492.1646128041051; 
 Tue, 01 Mar 2022 01:47:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d56c6000000b001edb64e69cdsm13099326wrw.15.2022.03.01.01.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 972AF1FFBB;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/18] tests/lcitool: update to latest version
Date: Tue,  1 Mar 2022 09:47:00 +0000
Message-Id: <20220301094715.550871-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need an update shortly for some new images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220225172021.3493923-4-alex.bennee@linaro.org>

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


