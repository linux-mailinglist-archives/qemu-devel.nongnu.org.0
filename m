Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06462FA875
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:15:39 +0100 (CET)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Z3y-0007PJ-Py
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Z1T-0006aa-Uo
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Z1S-00083J-7T
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610993581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2SjoNZ8cNM2fJSWguEpQo13vZsmR4Psun2djDSWC/Zw=;
 b=I/Gja6tWaqDMLiohiPoxwkGQtaVy3SqJvArNwnPCsuLfP8+pOxtdsT7+7gxQrfBaOx3AbK
 X4XYByaTPJfiFpg4n2eHEutMsp5b3E+6WYcePQwQ6pUbffVABSu15IZq94SFq2nVHpWMBT
 mnVnPPuaEaA8CGzJLsKQaIyYEpjFiiU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-sJKTho6VNsi32lVQwvtRlQ-1; Mon, 18 Jan 2021 13:12:59 -0500
X-MC-Unique: sJKTho6VNsi32lVQwvtRlQ-1
Received: by mail-ej1-f72.google.com with SMTP id h4so5457437eja.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 10:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2SjoNZ8cNM2fJSWguEpQo13vZsmR4Psun2djDSWC/Zw=;
 b=Ri/6GdAbEUqBEkjV5A1g33+IDRmEibEIef87SciU2K66CDkR3XRXRZ+oKYJVyVlWjn
 /90GzsAyYRTL6UiqxM0rpKNKoqcmu8IZfU1qWP6xEIkYym4Ra2upMuJENQbtKv/v1UoK
 pxcKlsaC1O7IJe8bVFI77gpWnoAOo/mOZ8c6AQ35phAeAUT+XNqpjiW7fMhpH853a5K9
 GGLZzPj54AIU5AvEWm+SAwA8dlvjhNtgAvPs6fMgUTyjB7ZGPKx8qFeKYjIN1dIxywVx
 N3ETl8x/COKNObIsII82mnBnRES5wuoYE4ZXpo5rd3mgTMTh5/KG5/WCcGqC1jYKIa0S
 kGrQ==
X-Gm-Message-State: AOAM530RBB39DIkm5rzh+NJADCbFoHF0fVdoTUoqvH4SIuZAVLYP0UXl
 1mrG6Ra0yGN94piH5GYYe7Fv0cn6kISE1hmiohFY+tHBcjR/3eM06s3sQbml+cd5aQUzgtICUEi
 XC80flPaIdqGJAlpnCFmycltHxs3kZmg9ja/hhruPNvtwyHS0wWEKoqfz7G1LAs40
X-Received: by 2002:a05:6402:50a:: with SMTP id
 m10mr534628edv.324.1610993578029; 
 Mon, 18 Jan 2021 10:12:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkANHFCdLtDalMRvmDXJ+aZz3kiT6CI0HSVN2RtnFkl/Acmf0GdCbdLzTEgqhfPLrkBoN1Bg==
X-Received: by 2002:a05:6402:50a:: with SMTP id
 m10mr534610edv.324.1610993577833; 
 Mon, 18 Jan 2021 10:12:57 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id cn25sm11227679edb.63.2021.01.18.10.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 10:12:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docker: Bump Fedora images to release 33
Date: Mon, 18 Jan 2021 19:12:55 +0100
Message-Id: <20210118181255.314672-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fedora 33 was released on October 27, 2020.

Update all the Fedora 32 images to this new release.

Suggested-by: Daniel Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20210118181115.313742-1-philmd@redhat.com>
hw/usb/hcd-xhci: Fix extraneous format-truncation error on 32-bit hosts

Based-on: <20210118170308.282442-1-philmd@redhat.com>
hw/usb/dev-uas: Fix Clang 11 -Wgnu-variable-sized-type-not-at-end error
---
 tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
 tests/docker/dockerfiles/fedora.docker             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
index 09e7e449f9b..1dfff6e0b96 100644
--- a/tests/docker/dockerfiles/fedora-cris-cross.docker
+++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
@@ -2,7 +2,7 @@
 # Cross compiler for cris system tests
 #
 
-FROM fedora:30
+FROM fedora:33
 ENV PACKAGES gcc-cris-linux-gnu
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index a6e411291b9..966072c08e6 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:31
+FROM fedora:33
 ENV PACKAGES \
     bzip2 \
     diffutils \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 087df598a09..81b5659e9c5 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index d5d2f5f00d6..bcb428e7242 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 0b5053f2d09..9ba8c147edd 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM fedora:32
+FROM fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.26.2


