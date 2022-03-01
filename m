Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C907D4C890E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:13:38 +0100 (CET)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzVh-0003eY-Tb
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:13:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6d-0003Vc-Nn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:44 -0500
Received: from [2a00:1450:4864:20::332] (port=38645
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6O-00077s-AK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:43 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 10-20020a05600c26ca00b003814df019c2so895218wmv.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BuTGADjY91ULHZMBqMmqygI/2yJZ4q2AhA3jocLd6Rw=;
 b=VNVwXpEAQcCTi0BUpzF5RbpQVuzzj/G91EqujQxZGHO4eIl6I1AC8r4eB+uvnJl//8
 0pEClMu5JjNI7OitrQ4l52sLVGPHf3QDAk4qnwQ2pg0DVic+1w0JkSSdUfIYOfYEL3jW
 k1aLyJsGRe9xdmvPh/dVy09t2JpIgzDtPh/mqOt6cqhF4qJeRFeBrzDCaik70KJvFAe4
 8SZVoczfjPq5utvzNiUIosadjcNdCuVw+AssNnZ26LSuUzjOO+nVGV8D4XFOeS2GDRR5
 dyt1diPosaz9/aDHwOaqRpYn9qiaGTna7dC4rsyg5wYXsFZbc3vQT+JmENrbJYkn4gPd
 gYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuTGADjY91ULHZMBqMmqygI/2yJZ4q2AhA3jocLd6Rw=;
 b=VuNEkGS9+IfXxJpPTkT7d6wuSTOeXrnPsn6rnO8tAoTqTYtIdkicDrk9QRrMhRSCeF
 hgVauKDgnu8tYOgFzQvLbOujA7piBmXfpt6/sdMRb8MB/gTTsRUYRsv5OSgeRvPtGfXZ
 rsR6zUMfKXA6mBW/aw8p+BlXNickwCj10p4vezs+Ucan54zXKRCHkln7CcLsgUVWlSGJ
 ULnEtjVj2LwAXvdXNGPhi0dFSrelfeknulGLHmxCryXoz3ed+qVbCl91TZMU9fVY/NC0
 4K80FRAGcs1udsLSxs+uZf/vdElINtfCdEV+UplSc/G/NcksNZOMgMSqoynsMv6mrnYc
 llCw==
X-Gm-Message-State: AOAM5319qy6XyfNnIo4N3PSC9baWZKOypmkHh/hR/bVty6RGK3+rwj/Y
 OEGzEfJnNhU2FkVVjyUYxxQ56w==
X-Google-Smtp-Source: ABdhPJwyNUjOi7WDefNh5OAip6vanv5KRBYWJ6bthhbxgzLQOUtMFO2irhH4AwdNdvT4C3M9iqy0Yw==
X-Received: by 2002:a05:600c:5014:b0:381:6829:96bd with SMTP id
 n20-20020a05600c501400b00381682996bdmr6549405wmr.123.1646128046866; 
 Tue, 01 Mar 2022 01:47:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm1943154wmj.34.2022.03.01.01.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CD751FFBF;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/18] scripts/ci: add build env rules for aarch32 on aarch64
Date: Tue,  1 Mar 2022 09:47:04 +0000
Message-Id: <20220301094715.550871-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least the current crop of Aarch64 HW can support running 32 bit EL0
code. Before we can build and test we need a minimal set of packages
installed. We can't use "apt build-dep" because it currently gets
confused trying to keep two sets of build-deps installed at once.
Instead we install a minimal set of libraries that will allow us to
continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-8-alex.bennee@linaro.org>

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 599896cc5b..9182e0c253 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -19,6 +19,13 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
+    - name: Add armhf foreign architecture to aarch64 hosts
+      command: dpkg --add-architecture armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
@@ -115,6 +122,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '20.04'
 
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+      package:
+        name:
+          - binutils-arm-linux-gnueabihf
+          - gcc-arm-linux-gnueabihf
+          - libblkid-dev:armhf
+          - libc6-dev:armhf
+          - libffi-dev:armhf
+          - libglib2.0-dev:armhf
+          - libmount-dev:armhf
+          - libpcre2-dev:armhf
+          - libpixman-1-dev:armhf
+          - zlib1g-dev:armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['architecture'] == 'aarch64'
+
     - name: Install basic packages to build QEMU on EL8
       dnf:
         # This list of packages start with tests/docker/dockerfiles/centos8.docker
-- 
2.30.2


