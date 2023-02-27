Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959016A48D5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhj5-0003YA-5N; Mon, 27 Feb 2023 12:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj3-0003TQ-GD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj1-0004Nn-UD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1wPlWoaubHd+0TZZpQbg2AEBv6a2i88a+2I1vJL5nk=;
 b=JSNZnWVs4w1FX/ZCDsVs1ZPK1v6avcVSXZy88ZdAqfOjYajEK8n8IkYHXN3Il4QRBbQngI
 ku2lRAoqzzymPQFjXxO8Ge5VY6pS//jJ9Sc9cvYCFLD7USPqjRKkuilnX1gxX07pnOJjSR
 NWakeRkWj6WpjAAFgODGw9H2OY3pCCE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-54-pLpm4S5pOWCK2wySdbZ0LA-1; Mon, 27 Feb 2023 12:55:44 -0500
X-MC-Unique: pLpm4S5pOWCK2wySdbZ0LA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so9601178edb.18
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e1wPlWoaubHd+0TZZpQbg2AEBv6a2i88a+2I1vJL5nk=;
 b=fOqJ76UfQVCoeD+2GspJgA+oqHK8CsEDLMO2sdU69AUJvk5kRCQdR6yNKnp1KX+qbT
 JHR9xt+5dOIlubewslzVTDMrR/G/hbjAmp3GE7zlRZThdTYHG4MpQv9vtWGzd1N0qQOx
 69sd02WipOoI29dVHMhwBw5EGo8+JGurfABs1gDzFfboICp6ptWIvgfNKqrlpDrPx4qc
 zjcDDVFaA1NsdwF31w3qvGY92Q/JXc9t71qyGs1nNyA3bNltt+0k5yTDoKoxmaW283yU
 p1PrlXcOe0xPGQtpw6i9K+slj/gMc2rKGe9mUUJSMrbHqCxDDlr9pVGnBwdSKM58fKUq
 U7IA==
X-Gm-Message-State: AO0yUKVwjoLs8p7ou2D+QRxPmuod04lm6AurEpD9Uekg6mKsg54hKsju
 zU89ljbPF19mM/EPFLxB4mg3B7IxLsqKCC1Li7NGWhLgUN2iS3osZJflpmJMFzJOW84xoYKzvTp
 mqGzsi9+Trz0R7uK8120o1IfzdxwUo1McfQoHBRfqKu8EQ06uiYGk2VWQD1+l9oNEAXk5NwA0
X-Received: by 2002:a17:907:961c:b0:8f1:dfa5:8117 with SMTP id
 gb28-20020a170907961c00b008f1dfa58117mr20575896ejc.51.1677520543498; 
 Mon, 27 Feb 2023 09:55:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/15YfvrahjvbVhnMmiJ4DvfuXzdFQHR7gfuc/4i41u1eeTDNPRxIp/n5vFwYsAnDLrZdSVtg==
X-Received: by 2002:a17:907:961c:b0:8f1:dfa5:8117 with SMTP id
 gb28-20020a170907961c00b008f1dfa58117mr20575877ejc.51.1677520543214; 
 Mon, 27 Feb 2023 09:55:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170906060500b008d53ea69227sm3500856ejb.224.2023.02.27.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 06/13] lcitool: update submodule
Date: Mon, 27 Feb 2023 18:55:17 +0100
Message-Id: <20230227175524.710880-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


