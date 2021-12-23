Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A450847E2E5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:08:12 +0100 (CET)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MtH-0005kx-OY
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdP-0004Kg-VM
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: from [2a00:1450:4864:20::434] (port=37411
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0008QF-4Y
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id t26so10947886wrb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=N/DORDta1Wp6aIYLa1EAHa0g7+AYAWqTqjrhcUocSbXBsJMm4mbu1c9U7bMnGZnp8Q
 ItczBivZHFH5w3oiQO+AzZDTmcQQ/vLbWms+6JY1sRN8QIB1rvoXR71nWCQr6fTHisBx
 qswkH5Jed79XgOtn+JTD5Wbv/ZZe7FuU0ZstLLG0+hyGiU7JiqJeK+RmcAIg86/Skk1c
 kZJI27otxpy1B7kojE6Vm8onV4I1ayHRbK5g1XzIZpocVW6cORJt/7xopWPvk7iGhvid
 U6HZZM0GLdguwbOEp4942CuoquYLjH9vh1gndFDfc4E1gmxTMlMdVmFRkMY+LXTFcY27
 IL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=oxTteVB3aYq2vHwF0DLbxlUl+8nPhI0wonXJW5TgtHKfMoI/7WxsdNodUlr72orLVn
 O8DvDP05qY6hwQ87NNCJCIgaYyJp/FyzMNQ6YF0EJIJyYqQ2Ofp2pK73/DQvNTrPxJpU
 rDi8TorMq4U+VX/XKWFWhA4TLXbKjXnqU8l9bhKRa6lDiVQw+iHuG9xMDGiihqzfpFTq
 EIBLIuYTFjLnbjsXBYRocZBmho75bOxXZn6qoixM6ibHS5g9MdSXmMC7eMx9cf/GOYtq
 4Ey/3BDC3tK9HgLCe6FeRGT4xuex2fHU5ENRbFTebKIGds82ndNTK560Ct74YY7P9qbW
 0ZcQ==
X-Gm-Message-State: AOAM530siTEn0XTzPVn8IRYVsLXFLTb31xkG8SLL0819/uBy4c4S9bQ2
 XBXPg/pL3/5mJMZ1BteVu9BGy4LbjZA=
X-Google-Smtp-Source: ABdhPJxLOhv3S3SZM8Gy0WmXJ/aC3yxN6c1tCJmAXNBNPLubRtNJGJ7bU+ZhM7PJ3vL2vRibtLwbkA==
X-Received: by 2002:a5d:6111:: with SMTP id v17mr1513958wrt.324.1640260302239; 
 Thu, 23 Dec 2021 03:51:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] meson: build contrib/ executables after generated headers
Date: Thu, 23 Dec 2021 12:51:30 +0100
Message-Id: <20211223115134.579235-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be needed as soon as config-poison.h moves from configure to
a meson custom_target (which is built at "ninja" time).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/elf2dmp/meson.build        | 2 +-
 contrib/ivshmem-client/meson.build | 2 +-
 contrib/ivshmem-server/meson.build | 2 +-
 contrib/rdmacm-mux/meson.build     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/contrib/elf2dmp/meson.build b/contrib/elf2dmp/meson.build
index 4d86cb390a..6707d43c4f 100644
--- a/contrib/elf2dmp/meson.build
+++ b/contrib/elf2dmp/meson.build
@@ -1,5 +1,5 @@
 if curl.found()
-  executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c', 'pdb.c', 'qemu_elf.c'),
+  executable('elf2dmp', files('main.c', 'addrspace.c', 'download.c', 'pdb.c', 'qemu_elf.c'), genh,
              dependencies: [glib, curl],
              install: true)
 endif
diff --git a/contrib/ivshmem-client/meson.build b/contrib/ivshmem-client/meson.build
index 1b171efb4f..ce8dcca84d 100644
--- a/contrib/ivshmem-client/meson.build
+++ b/contrib/ivshmem-client/meson.build
@@ -1,4 +1,4 @@
-executable('ivshmem-client', files('ivshmem-client.c', 'main.c'),
+executable('ivshmem-client', files('ivshmem-client.c', 'main.c'), genh,
            dependencies: glib,
            build_by_default: targetos == 'linux',
            install: false)
diff --git a/contrib/ivshmem-server/meson.build b/contrib/ivshmem-server/meson.build
index 3a53942201..c6c3c82e89 100644
--- a/contrib/ivshmem-server/meson.build
+++ b/contrib/ivshmem-server/meson.build
@@ -1,4 +1,4 @@
-executable('ivshmem-server', files('ivshmem-server.c', 'main.c'),
+executable('ivshmem-server', files('ivshmem-server.c', 'main.c'), genh,
            dependencies: [qemuutil, rt],
            build_by_default: targetos == 'linux',
            install: false)
diff --git a/contrib/rdmacm-mux/meson.build b/contrib/rdmacm-mux/meson.build
index 6cc5016747..7674f54cc5 100644
--- a/contrib/rdmacm-mux/meson.build
+++ b/contrib/rdmacm-mux/meson.build
@@ -2,7 +2,7 @@ if 'CONFIG_PVRDMA' in config_host
   # if not found, CONFIG_PVRDMA should not be set
   # FIXME: broken on big endian architectures
   libumad = cc.find_library('ibumad', required: true)
-  executable('rdmacm-mux', files('main.c'),
+  executable('rdmacm-mux', files('main.c'), genh,
              dependencies: [glib, libumad],
              build_by_default: false,
              install: false)
-- 
2.33.1



