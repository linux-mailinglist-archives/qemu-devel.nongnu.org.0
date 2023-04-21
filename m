Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A836EA718
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9V-0000FS-5D; Fri, 21 Apr 2023 05:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9S-00005M-Il
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9Q-00036s-Q9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpiB6sxC3DohqxrKYpC94Jz3RHHqCyDuIsL7iXn2uv0=;
 b=hZqkzeeTnXT2EUqYwYwMQTuFTFrBKXGp/TNFZyb29e0PULU31MD8qFgi8jHmbnDphilyJc
 lcnWTs36HqAd9Ym4UD/yq+ugQDluAHteCuZwtqxEpOQnCFTdmg0SpbYvVl4ztQjHZWlgRQ
 bIwXy6jTPiNIR8nXuD+i0aafZX0/RHc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-lm1MrSfgOT-JDmjgG_9azw-1; Fri, 21 Apr 2023 05:33:55 -0400
X-MC-Unique: lm1MrSfgOT-JDmjgG_9azw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-95707df1f05so101289566b.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069633; x=1684661633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HpiB6sxC3DohqxrKYpC94Jz3RHHqCyDuIsL7iXn2uv0=;
 b=M2v3XJQJfiG/7STJGKeSOD2z9CoN4z7NbONStjGZFgsDRfVsoASPgY1Tk6bGObXrQO
 cqZXYi5qssnljEVkjVUrt80f2JkK5aJj661HWUDdKxQWKzhal5BYu4Xn2kJbASLFQHOZ
 JMmg2jGGmNnl547/yUDkYwRBxSAYqaYcqx5pGGrKJ6QOIiyCfM6Vyzl9PLwrRTBfWkX3
 r6yMq+sknu533+WApwyAL6dNsOhKbWrKXNWdk591GGW08WgsEXYXwZT2EBJ7ULPIxpwL
 sxokX4VNTiIXp6aDFPORNR2QiXc1RxBC/1UTtJFPX3O48F0Q5CSdVJw/OQjmTpkQrRZ9
 hXHA==
X-Gm-Message-State: AAQBX9cKX13DOcR9zlu/5TWjZGS6ruMvUfQ019kvIxqOtpKJHHne5sxl
 O/5vWrNXf3idr5qdMWHee7CqDFlVlv1KY9nLOyKmuNulw15ZbYMMOxSxbIQupbPEYKy4/wl7GJj
 97aWiW8ChaMDNsWjL8jFHU8BlDNbSJSo1n4gh/IRqMmVcgnCKi/O4h+mozixbYr4xtOWi1A6xPn
 oGpg==
X-Received: by 2002:a17:906:2a81:b0:957:811:e88f with SMTP id
 l1-20020a1709062a8100b009570811e88fmr1415644eje.26.1682069633469; 
 Fri, 21 Apr 2023 02:33:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350aBiqqRyCqPjJd5a3UtfZtrINDyKCwFSO+YF9HRKCSDb1FwZT+KEZq8dgQAxCdUEBeUUjzwkw==
X-Received: by 2002:a17:906:2a81:b0:957:811:e88f with SMTP id
 l1-20020a1709062a8100b009570811e88fmr1415636eje.26.1682069633232; 
 Fri, 21 Apr 2023 02:33:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a170906b18f00b0094f2c74401csm1791335ejy.203.2023.04.21.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 25/25] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Fri, 21 Apr 2023 11:33:16 +0200
Message-Id: <20230421093316.17941-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Krempa <pkrempa@redhat.com>

Since OpenSUSE Leap 15 counts as a single major release of an LTS distribution,
lcitool has changed the target name to remove the minor version.  Adjust the
mappings and refresh script.

This also updates the dockerfile to 15.4, since the 15.3 version is EOL now:

https://get.opensuse.org/leap/15.3

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
[Adjust for target name change and reword commit message. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/opensuse-leap.docker |  4 +--
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/mappings.yml                    | 36 +++++++++----------
 tests/lcitool/refresh                         |  2 +-
 ...suse-leap-153.yml => opensuse-leap-15.yml} |  0
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-15.yml} (100%)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 28f153b77b56..afb9f5419f5c 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
+#  $ lcitool dockerfile --layers all opensuse-leap-15 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.opensuse.org/opensuse/leap:15.3
+FROM registry.opensuse.org/opensuse/leap:15.4
 
 RUN zypper update -y && \
     zypper install -y \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 2fa24dce8bc2..85487e140415 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 2fa24dce8bc2d0d57b02b111dbdbd24e25d4ae95
+Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index e4719e45516c..454963f07b86 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -1,71 +1,71 @@
 mappings:
   flake8:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   meson:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap15: python39-base
 
   python3-PyYAML:
     CentOSStream8: python38-PyYAML
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-devel:
     CentOSStream8: python38-devel
-    OpenSUSELeap153: python39-devel
+    OpenSUSELeap15: python39-devel
 
   python3-docutils:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-numpy:
     CentOSStream8: python38-numpy
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-opencv:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-pip:
     CentOSStream8: python38-pip
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap15: python39-pip
 
   python3-pillow:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-selinux:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-setuptools:
     CentOSStream8: python38-setuptools
-    OpenSUSELeap153: python39-setuptools
+    OpenSUSELeap15: python39-setuptools
 
   python3-sphinx:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-sphinx-rtd-theme:
     CentOSStream8:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
 
   python3-venv:
     CentOSStream8: python38
-    OpenSUSELeap153: python39-base
+    OpenSUSELeap15: python39-base
 
   python3-wheel:
     CentOSStream8: python38-wheel
-    OpenSUSELeap153: python39-pip
+    OpenSUSELeap15: python39-pip
 
 pypi_mappings:
   # Request more recent version
@@ -74,4 +74,4 @@ pypi_mappings:
 
   # Drop packages that need devel headers
   python3-numpy:
-    OpenSUSELeap153:
+    OpenSUSELeap15:
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index c0d7ad551649..33ef1282dac4 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -120,7 +120,7 @@ try:
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
     generate_dockerfile("fedora", "fedora-37")
-    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-15")
     generate_dockerfile("ubuntu2004", "ubuntu-2004")
     generate_dockerfile("ubuntu2204", "ubuntu-2204")
 
diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-15.yml
similarity index 100%
rename from tests/lcitool/targets/opensuse-leap-153.yml
rename to tests/lcitool/targets/opensuse-leap-15.yml
-- 
2.40.0


