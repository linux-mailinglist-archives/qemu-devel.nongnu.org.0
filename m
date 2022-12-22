Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CC653CFE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Gw1-0000HG-Jx; Thu, 22 Dec 2022 03:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Gvu-0000GG-9i
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Gvs-0008L5-78
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:28:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671697683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1iztJhjIdSLC/UaGXeGU806lJ3O3/H7g5Sj618eT3vY=;
 b=Uw+NvPreNTQegponHXAuxacjC4a5neaaBE2OLVJMrpSP/K+i7b8p+cPpB+SHkgvuHPTx/t
 Y9v56ZI5oKYjbWK0JiEbR2R0JF4QuP4GH4XDzkZvqE4mY5xEGxdLaPXGw/illhBhkDLavh
 6DcCKc6omXfW3VBKXw9NB/7Ypn+C5UA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-3XkX3keEPKup0LF-3OQBzQ-1; Thu, 22 Dec 2022 03:28:01 -0500
X-MC-Unique: 3XkX3keEPKup0LF-3OQBzQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq42-20020a1709073f2a00b007c100387d64so978496ejc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:28:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1iztJhjIdSLC/UaGXeGU806lJ3O3/H7g5Sj618eT3vY=;
 b=7mSN8JxeYo8DpUszXMv+4gEsoPSDDzdEMi2TjAhKdv6+vGEEE7TLbE9WqggwxTI9Fb
 mLoCOkW7DoofSfS5pcmwN6uC0Ol3pICqE3YOy0OClaFiqukdyNP5szVLR9BK+A6clyQx
 ou1xSXmvDfl5ygMEyDgNZiullzrntkzd3TNzB2fGky5pC4b9PF76CQtph2F/hPsr8lb2
 gbp/2RqqnV22jYn+78sBkgsHb8IWLEx3XJp/R/ktIU4sWfIRb5YqXUJcpGMvKMnUG1DG
 0Gi22xqIaHgT0PhrcsZieKfoMHPViGfF6eFylZTZps0t456R0b9xluiCgORb2T2mzQTL
 wP9g==
X-Gm-Message-State: AFqh2kpH6YgTQ7EpIwtZWDa82UUOPziARZYdMupjruCvougEAXshAE63
 qJ3tYU4qmd097a61KQMesJ5fUbZMcwU4TZxgkVdmQjMFvYhdfqQBg5dTqJ8lVwWlhKhashzibN3
 1FrNmQsdPbXx4zHOetQZ1G1u+VQJP3sMEBaJFp5JXRhhv6F229qML519xJGW/7lDw9uo=
X-Received: by 2002:a17:907:a805:b0:78d:f454:ba2c with SMTP id
 vo5-20020a170907a80500b0078df454ba2cmr4385659ejc.43.1671697679937; 
 Thu, 22 Dec 2022 00:27:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvIbW7cT8HQakfgQsXkJkATQqGF/pY2W75lwBR19IrGnqDDi3s1/fs9r12IQ9y5RYoqln2TAA==
X-Received: by 2002:a17:907:a805:b0:78d:f454:ba2c with SMTP id
 vo5-20020a170907a80500b0078df454ba2cmr4385641ejc.43.1671697679667; 
 Thu, 22 Dec 2022 00:27:59 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 s22-20020aa7cb16000000b00457b5ba968csm111859edt.27.2022.12.22.00.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 00:27:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] dockerfiles: update to Fedora 36
Date: Thu, 22 Dec 2022 09:27:56 +0100
Message-Id: <20221222082756.859848-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

lcitool has removed the fedora-35 target, so let's follow
suit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
 tests/docker/dockerfiles/fedora.docker             | 4 ++--
 tests/lcitool/libvirt-ci                           | 2 +-
 tests/lcitool/refresh                              | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 75383ba185a4..aece4f55818d 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-36 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:36
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 98c03dc13b9c..2d573e2505f2 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-36 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:36
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index d200c7fc1055..901562bb8e5a 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all fedora-35 qemu
+#  $ lcitool dockerfile --layers all fedora-36 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM registry.fedoraproject.org/fedora:35
+FROM registry.fedoraproject.org/fedora:36
 
 RUN dnf install -y nosync && \
     echo -e '#!/bin/sh\n\
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3eb28cf2e17..a29b1c9925ed 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
+Subproject commit a29b1c9925ed8549b2a9e83374a8aa5ebe16bc71
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index fa966e4009d5..ee55ee40ee5d 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -111,7 +111,7 @@ try:
     generate_dockerfile("centos8", "centos-stream-8")
     generate_dockerfile("debian-amd64", "debian-11",
                         trailer="".join(debian11_extras))
-    generate_dockerfile("fedora", "fedora-35")
+    generate_dockerfile("fedora", "fedora-36")
     generate_dockerfile("opensuse-leap", "opensuse-leap-153")
     generate_dockerfile("ubuntu2004", "ubuntu-2004",
                         trailer="".join(ubuntu2004_tsanhack))
@@ -161,12 +161,12 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
-    generate_dockerfile("fedora-win32-cross", "fedora-35",
+    generate_dockerfile("fedora-win32-cross", "fedora-36",
                         cross="mingw32",
                         trailer=cross_build("i686-w64-mingw32-",
                                             "i386-softmmu"))
 
-    generate_dockerfile("fedora-win64-cross", "fedora-35",
+    generate_dockerfile("fedora-win64-cross", "fedora-36",
                         cross="mingw64",
                         trailer=cross_build("x86_64-w64-mingw32-",
                                             "x86_64-softmmu"))
-- 
2.38.1


