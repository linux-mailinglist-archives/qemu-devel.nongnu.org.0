Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B056664676
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:46:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6Z-0003Wl-A7; Tue, 10 Jan 2023 11:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5f-0002zx-M4
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5e-00050w-1u
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTxgzICoPV0Y7l5bNsw7lmfX8M4gzc3Wrg6/6XmCqvQ=;
 b=TcgShcOUGXLPa9JBfjhyXNaBCLtEtaobhiYtOs6oPHARBWaNasiZmukYE6lzDDjxci5puZ
 DOuzklGryotmmFfXoSVEAYC95CxztEX8VGU2MKb/xqdSQShhrG3leIV9gNfaTpB+GQY9Ci
 BqscNZYHtVfYRN8/n5woYPhzaQW4DP0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-Iun0lcOXMNi6zG3Njpiqvg-1; Tue, 10 Jan 2023 11:03:03 -0500
X-MC-Unique: Iun0lcOXMNi6zG3Njpiqvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso2672257wmd.7
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTxgzICoPV0Y7l5bNsw7lmfX8M4gzc3Wrg6/6XmCqvQ=;
 b=aFrzROZ+v8X9yp95ZVnZhsyHk8FWHUhqYhPibKLRXgBpWOnUeZ93z1v1X/9pZ7p3X8
 iA2NPv7zEqD3xOjwhq43s+WypjQTrlCaW7S58lpBf7d/6eX94GlNJ+buDcxiGSKGAs/B
 sF4YzSKEH6UVxWc/ipiJc7IFWtu3FQIaWNyqwFqBXg8d+6cqyn4lyrHMboSHdU5qdQrz
 ZxyOn8Z1/u+UudXM4KmGaZJ62Bzww6pgIFWpPFhm0HQFby9zfQN7qS7wOBy0yCjFgneV
 hDqhCnaMkvbgaI84PIJDXP+ayc0BzAQoCqsdut7Cpn/PfE1rGQE5xHS7Dw77lyJhjxvQ
 YTxA==
X-Gm-Message-State: AFqh2kpFXDtc17QPg1yMjkm4WJyTiR+ogQ/uAYWe/kgg1O0ktAOmj/a0
 M+4g6DDNBtnFMdlV7DFGtyWOvGEjGBFgkxJAOuhG53iG3IOF/WeeiFEGRTpEINKRXNxI4aYLnpo
 mximz6zHAaKYBBxuPuT65HAVar/b+xBI2haC63gL7YX76OJgmwBPHPgVHTBMUUyPD+Ew=
X-Received: by 2002:a05:600c:c87:b0:3d9:73fb:8aaa with SMTP id
 fj7-20020a05600c0c8700b003d973fb8aaamr40366644wmb.8.1673366576973; 
 Tue, 10 Jan 2023 08:02:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuPei2Vf7sN4Al9BJSWDsbl8EeJ1zk/n77tZhf1oZmwmtYKZjz8VC9bIDy2w+BeQkhP+zCa0g==
X-Received: by 2002:a05:600c:c87:b0:3d9:73fb:8aaa with SMTP id
 fj7-20020a05600c0c8700b003d973fb8aaamr40366620wmb.8.1673366576708; 
 Tue, 10 Jan 2023 08:02:56 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a7bc7c9000000b003d9ef37ec1bsm9640675wmk.5.2023.01.10.08.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 08/29] gitlab: remove redundant setting of PKG_CONFIG_PATH
Date: Tue, 10 Jan 2023 17:02:12 +0100
Message-Id: <20230110160233.339771-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

The PKG_CONFIG_PATH variable is not defined in GitLab CI
envs and even if it was, we don't need to set it to its
existing value.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221103173044.3969425-2-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 5e8892fd4998..6d709628f127 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -6,8 +6,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
@@ -32,8 +31,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
@@ -44,8 +42,7 @@
   script:
     - mkdir build
     - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+    - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-system --target-list-exclude="aarch64_be-linux-user
           alpha-linux-user cris-linux-user m68k-linux-user microblazeel-linux-user
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
-- 
2.38.1


