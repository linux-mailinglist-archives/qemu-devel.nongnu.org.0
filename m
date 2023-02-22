Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513B69F6C8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqGO-0004i6-KI; Wed, 22 Feb 2023 09:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGC-0004Mf-1p
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqGA-0001Gs-Gh
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fquq5rmYRc2Q+vS1uFL1UeL36Rp+zoQi5qdIIdc5UMA=;
 b=SeLNnAlH3Wc+07VEf55tlY+bXhbAHntP9D+iXPq4n2fmsQSMq3GLmNcv7s+PQ0gFyqlWKq
 P0QN0ENQXqNBjquyG9MAI18gDp5Zv7HxeREqZMvwDwmjpLpcvHDMHQ5o0bGQjX/8v2fZz/
 sHlTmA2fgbJ2MK9kYudCGt+9Y73bK88=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-9izwojO-O7Ox-82H4c5emQ-1; Wed, 22 Feb 2023 09:38:16 -0500
X-MC-Unique: 9izwojO-O7Ox-82H4c5emQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t9-20020a056402524900b004af59c073abso5641762edd.6
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fquq5rmYRc2Q+vS1uFL1UeL36Rp+zoQi5qdIIdc5UMA=;
 b=MvDa++CxxK0VRZUOpsjJuZiFAp8GFuiMbF6ouGeygijxpmtjKGvQWuC1dm6MT5J4cQ
 zHurTbUaX6RRrqJ7joV0YMFzyBevH3QNKnEjCoOYIxN9QwaaXhlp9uOimE+nqoudNmPm
 5AmQ40QBzjnsv+ohGVWkZlc7I71p4iRB47D1scYftteK7AhKg5aZyQqCG9/IwxfTE08S
 KhnRbLQg0el0mSgSpbfZDU0UgB8iXqhROM6DCQPfC0ofZeaq6B8HLs7s9gELOg9IJ64p
 KvCPGUMGkyWMZHRQRH/G1Ph4efj2i1w5RNIBx5kRX7H4/8YC46eIg3RdMHdPM5SZIJBB
 GANA==
X-Gm-Message-State: AO0yUKW7tWHFskYjBeFM6Bktm1Mf0D9HEfWIscAGgWyRB/sOxqmTDgD0
 WVWT7LxGkjo/tuMCez9+93jNdxztP9gFAjskEsqOtfHIepcmFgLLOu8VdLZA6OXLUt+RPgKDCYe
 aT8XbP0VHF3j17ay8lUfOK+1tzHF169mQXtdnRkfA+rgi+Znn/p+y2v+25jesV+78HRRyCUHd
X-Received: by 2002:a17:907:6e8f:b0:878:4d11:f868 with SMTP id
 sh15-20020a1709076e8f00b008784d11f868mr24413185ejc.2.1677076694962; 
 Wed, 22 Feb 2023 06:38:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8xCJBDEpXQmOpykS8/UJnyxboI1xK4SJGxKkm2YdDLQjpBZMTGL5X6wqZsUxZEbd1bes5TiA==
X-Received: by 2002:a17:907:6e8f:b0:878:4d11:f868 with SMTP id
 sh15-20020a1709076e8f00b008784d11f868mr24413159ejc.2.1677076694717; 
 Wed, 22 Feb 2023 06:38:14 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 kd21-20020a17090798d500b008b980c3e013sm6427540ejc.179.2023.02.22.06.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:38:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH 06/10] lcitool: update submodule
Date: Wed, 22 Feb 2023 15:37:48 +0100
Message-Id: <20230222143752.466090-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker             | 2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 tests/lcitool/libvirt-ci                           | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 4a569d82f64f..66c499c097ab 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -61,7 +61,7 @@ RUN apk update && \
         liburing-dev \
         libusb-dev \
         linux-pam-dev \
-        llvm11 \
+        llvm \
         lttng-ust-dev \
         lzo-dev \
         make \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index b659c0b8a89d..41769fc94a8e 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -79,6 +79,7 @@ RUN nosync dnf install -y \
                mingw32-glib2 \
                mingw32-gnutls \
                mingw32-gtk3 \
+               mingw32-libepoxy \
                mingw32-libgcrypt \
                mingw32-libjpeg-turbo \
                mingw32-libpng \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 0a404c15bfe4..46d5d05763a6 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -80,6 +80,7 @@ RUN nosync dnf install -y \
                mingw64-glib2 \
                mingw64-gnutls \
                mingw64-gtk3 \
+               mingw64-libepoxy \
                mingw64-libgcrypt \
                mingw64-libjpeg-turbo \
                mingw64-libpng \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 319a534c220f..1c3e16cae384 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 319a534c220f53fc8670254cac25d6f662c82112
+Subproject commit 1c3e16cae38407d0782dc94080d1104106456fa4
-- 
2.39.1


