Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011E494E28
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 13:47:50 +0100 (CET)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAWqy-0003Or-H8
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 07:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGW-0003z5-UC; Thu, 20 Jan 2022 06:06:06 -0500
Received: from [2a00:1450:4864:20::32d] (port=35442
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVGT-0001uD-JM; Thu, 20 Jan 2022 06:06:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso21073229wmj.0; 
 Thu, 20 Jan 2022 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vjKx1I+N9K2I7ZZkgKBPbK0jQvXhaVoh5ziaAVd4fg=;
 b=GQcrr4l1wGXr7z2PEZaElZd/WxIW03FW2Gc5o3BWf/0tnfXMUbTgJtC/hmNPlL+vck
 1kJmu++c+lvM/UW4W2fUwESp1KM4HVd79YEwVemm/myntaQKdnoywEurLyKkR2hZRDbE
 WakKCs+qipqwUMuTnUlGb+8ANc7hYgtWoXH2F0zqDH/rQlRvQrxmD9+Hg7a2HDTct6Wr
 MD53NY3YwPG44ntA8kJUTPGPI0ZyxdMVbDuogPDRhQWrgM9d3++a+h9opVV+PcimhzlF
 FrxzDe4fq+g3Lmg0NoKDaxYSXvaHI2le9DUt3WnBqbMsbKIiTkyCNW4YxRUA3Q913Est
 YHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4vjKx1I+N9K2I7ZZkgKBPbK0jQvXhaVoh5ziaAVd4fg=;
 b=E3AOekvyszN1TcqHiFG891LUy3xpw6Jcdf3ekJAaetNU0/ojGovVE75fzz3EyNAjXv
 6GyfzyuySBTFdDP9stTbqF0z8VQbDMbbyfIa+0M0VMQkbtVgnnTUVD3aMljs8PE2jVhP
 tMN33x9t1Kd87VNcyeEHocY5/Nj0Gh8n+e4MylXbkoqVtzu73fKKNWAEHC+G87tOZKn5
 wnF1MbYSniKu6tbmuXwZ1UiXSpePIRmRlM9ME6Co/LpPFWhtYfmPqc/5norVJSVtcI18
 tp4xV4km54bmI8hEjzXvi1gUBDRa7fCsdLcjEc4fp1amvW9LHiaS4nsOwubEkxg4lLZj
 tAKQ==
X-Gm-Message-State: AOAM531c+ZDifLk/5iOnWBtGsgNI/UnAi7xPcIG/g1b3pUs6GAoRtAkQ
 CISPDYS5t3YHJ7bVKpELVKaalo/hzL8=
X-Google-Smtp-Source: ABdhPJy474OHCqrqDR5HydFxEXCRZJtT8ZQCXu/Y5S1JVMmUr6iplED7zOY7BFgp1MRBbT38/CKtfQ==
X-Received: by 2002:a05:6000:2ad:: with SMTP id
 l13mr16035818wry.374.1642676758070; 
 Thu, 20 Jan 2022 03:05:58 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 1sm1997292wmo.37.2022.01.20.03.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:05:57 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2 2/6] tests: Refresh lcitool submodule
Date: Thu, 20 Jan 2022 12:05:41 +0100
Message-Id: <20220120110545.263404-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120110545.263404-1-f4bug@amsat.org>
References: <20220120110545.263404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Refresh lcitool submodule and the generated files by running:

  $ make lcitool-refresh

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/alpine.docker        | 3 ++-
 tests/docker/dockerfiles/centos8.docker       | 3 +--
 tests/docker/dockerfiles/fedora.docker        | 3 +--
 tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
 tests/lcitool/libvirt-ci                      | 2 +-
 7 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index eb2251c81c8..9d7f74fc51e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile alpine-edge qemu
+#  $ lcitool dockerfile --layers all alpine-edge qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -109,6 +109,7 @@ RUN apk update && \
         zlib-dev \
         zlib-static \
         zstd-dev && \
+    apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b3..fde6a036263 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile centos-8 qemu
+#  $ lcitool dockerfile --layers all centos-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -69,7 +69,6 @@ RUN dnf update -y && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 60207f3da38..82f504e40d6 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-35 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
@@ -77,7 +77,6 @@ exec "$@"' > /usr/bin/nosync && \
         libssh-devel \
         libtasn1-devel \
         libubsan \
-        libudev-devel \
         liburing-devel \
         libusbx-devel \
         libxml2-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f57d8cfb299..30e7038148a 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile opensuse-leap-152 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-152 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0ffa3c4d4b5..4ea272d143b 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-1804 qemu
+#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 4e562dfdcd3..90988b2bc53 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,6 +1,6 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile ubuntu-2004 qemu
+#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 29cec2153b9..226c178a2a1 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
+Subproject commit 226c178a2a1f077d7ee371680cc649c1591b0457
-- 
2.34.1


