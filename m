Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C83E2C4F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:15:25 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0dA-0003ZT-4X
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YP-00052m-81
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YK-0008Ix-Jr
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z4so11250562wrv.11
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jCFlyS7G8y2OceXjiqJdE3h+q0A8avhs1CGq9OkVms=;
 b=xu0jWKsUH9Ua7pKGkaQqhyZXg19OimDsRWU0nti+3U64Co2IYqBd6BgOC1iTULWnBp
 6gjk5Qj7ox8lz1Tkmv6n97xqoUFZCnazcjCnqxie2kS8jlaRdLxnjNnptQyaASWjSIiz
 nj/c3MT71LsSl1jh/911LxsLCnjJD46I6YUkGETvsnLUMOrirj4JLITg481ckk9hjnmJ
 rokipc9NTS2tufNa5WSG2wk5j2LKrQg+NRaKVUiMztyYslVdcKUupTdu6D3XUklsvcEr
 W9mQt2q9n3fAEYkQ48e1B+lmJVrwWtEYPvlgrZjHFftnhPJbqeLAPuXe1wGmc/B8Vztp
 Ylhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jCFlyS7G8y2OceXjiqJdE3h+q0A8avhs1CGq9OkVms=;
 b=pVCCMeWkCV4CEMKrFtspQAJcgvqnUxnoEMZZhEeeUl+bSaEjfAlO/WxnvTqUqvDmXd
 8rmUWOG3IDBYDmoPjcUkxyZUBjbtWtyD5y/WJtsIOPz2DGjQGHqiOIJj4s9BwkXo0UHT
 di0P3NB5L6Z2gq9pLA7c2eKHqSkc+KfuBRTaLnNzj1Wvmf/iAKbh+fv/kRL9Cxtl5pBs
 rvM2exZhWt6EWA9wbuXZ9jPMasiFE/8QXceY6dgOs4rBgOEE9Denz3QoUXTQKJGiwnJt
 t58yQs2iCe1H6fc8/7cD0pdo42ysnWVUbMUFU9ofHvEaqYYhZ90g4o5hNK8t3K/8Ut5w
 jjBA==
X-Gm-Message-State: AOAM530YTZ6KPvrffkU7x76/+qsa4C84lBT5hD9xNv3A+H5MIxbbOoZ6
 Os4svPpa68UUl0Ry6yXOLXA57A==
X-Google-Smtp-Source: ABdhPJzcrUCbStHyfXcHhpj4EZSxIMTRZRFgBQixzHfrMJOAEVFTIEsgFQYscJC+we64eFmNYHudHw==
X-Received: by 2002:adf:e601:: with SMTP id p1mr11391122wrm.14.1628259023270; 
 Fri, 06 Aug 2021 07:10:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h12sm9597311wrm.62.2021.08.06.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E224A1FF99;
 Fri,  6 Aug 2021 15:10:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] gitlab-ci: Merge "build-disabled" with
 "build-without-default-features"
Date: Fri,  6 Aug 2021 15:10:13 +0100
Message-Id: <20210806141015.2487502-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806141015.2487502-1-alex.bennee@linaro.org>
References: <20210806141015.2487502-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Both jobs are testing more or less the same thing (building QEMU with
features disabled), so we are wasting precious CI cycles here by doing
this twice. Merge the jobs by using --without-default-features by default
and just adding some additional --disable-... switches which are not
covered by the generic switch (yet). And while we're at it, also test
compilation with "--disable-fdt" (which forces us to change the list
of targets in this job, though, since some targets do not work without
fdt).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210730143809.717079-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 97 +++++---------------------------------
 1 file changed, 13 insertions(+), 84 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f390f98044 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -202,85 +202,6 @@ acceptance-system-opensuse:
     MAKE_CHECK_ARGS: check-acceptance
 
 
-build-disabled:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS:
-      --disable-attr
-      --disable-auth-pam
-      --disable-avx2
-      --disable-bochs
-      --disable-brlapi
-      --disable-bzip2
-      --disable-cap-ng
-      --disable-capstone
-      --disable-cloop
-      --disable-coroutine-pool
-      --disable-curl
-      --disable-curses
-      --disable-dmg
-      --disable-docs
-      --disable-gcrypt
-      --disable-glusterfs
-      --disable-gnutls
-      --disable-gtk
-      --disable-guest-agent
-      --disable-iconv
-      --disable-keyring
-      --disable-kvm
-      --disable-libiscsi
-      --disable-libpmem
-      --disable-libssh
-      --disable-libudev
-      --disable-libusb
-      --disable-libxml2
-      --disable-linux-aio
-      --disable-live-block-migration
-      --disable-lzo
-      --disable-malloc-trim
-      --disable-mpath
-      --disable-nettle
-      --disable-numa
-      --disable-opengl
-      --disable-parallels
-      --disable-pie
-      --disable-qcow1
-      --disable-qed
-      --disable-qom-cast-debug
-      --disable-rbd
-      --disable-rdma
-      --disable-replication
-      --disable-sdl
-      --disable-seccomp
-      --disable-slirp
-      --disable-smartcard
-      --disable-snappy
-      --disable-sparse
-      --disable-spice
-      --disable-strip
-      --disable-tpm
-      --disable-usb-redir
-      --disable-vdi
-      --disable-vhost-crypto
-      --disable-vhost-net
-      --disable-vhost-scsi
-      --disable-vhost-kernel
-      --disable-vhost-user
-      --disable-vhost-vdpa
-      --disable-vhost-vsock
-      --disable-virglrenderer
-      --disable-vnc
-      --disable-vte
-      --disable-vvfat
-      --disable-xen
-      --disable-zstd
-    TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
-      s390x-softmmu i386-linux-user
-    MAKE_CHECK_ARGS: check-qtest SPEED=slow
-
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
 # the configure script. The container doesn't contain Xen headers so
 # Xen accelerator is not detected / selected. As result it build the
@@ -649,12 +570,20 @@ build-without-default-devices:
 build-without-default-features:
   extends: .native_build_job_template
   needs:
-    job: amd64-debian-container
+    job: amd64-fedora-container
   variables:
-    IMAGE: debian-amd64
-    CONFIGURE_ARGS: --without-default-features --disable-user
-        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
-    MAKE_CHECK_ARGS: check-unit
+    IMAGE: fedora
+    CONFIGURE_ARGS:
+      --without-default-features
+      --disable-capstone
+      --disable-fdt
+      --disable-pie
+      --disable-qom-cast-debug
+      --disable-slirp
+      --disable-strip
+    TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
+      sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
+    MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
 
 build-libvhost-user:
   stage: build
-- 
2.30.2


