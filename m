Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624B47BE99
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:09:47 +0100 (CET)
Received: from localhost ([::1]:36084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzd1e-0004uZ-AM
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxd-0005Kp-4p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:37 -0500
Received: from [2a00:1450:4864:20::32b] (port=35604
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxa-0004zm-Sh
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so1420961wmb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5sjI4uOofFiqMg8XcI1JjXR51NsB7PISgae11hFAus=;
 b=MaqK0t5eqCuGjTMuUWGG6CC2Bf1AZQ4XGtm8H/vnC4n9qnP8KZcTdmHY65We7Xto24
 Y306BE8Po43kxW7yKEBR9o3QAzFyjZMMPEfDjjONyngOg/AgmaadgN6DTCbgz53ODqUk
 h0GEvHh1NwxTRkrtDTvfY4y4nZT7EvTYWd35obEtRnPs4zuamXbtFAYeUvXT83ne1aMs
 UQtSXccZACCKiwEx6BQmX/eC0K9aEy7szmPd6yTKab/LnPHToPUSAETXILiDvIUGovyi
 2gWFNKFaNufcOqbaTJXbEQgxu34jevUkC9+FdLLOknuSc0cHA1ilV8P7TUKNhIOm5wyP
 z/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E5sjI4uOofFiqMg8XcI1JjXR51NsB7PISgae11hFAus=;
 b=FCNwwEWm5nE54uldpddc4LxAcYFMnyvgN8OmeEGdngRUmqPgX7nkuemnG9MEqjtzJK
 tDz5Xv9x/4uEBmSpxb8+EdEWrGjXD6Xf1YLQpjAYm7jWMOtjzn3RMgesDUtgtxobxqtz
 EXReGr9oTot/fOnxxsg6W6k9yFsTI9I/HFWoUarbR3G10KynztSmmyBSH/ONxGhQIFq0
 z25qbXAM7Hm7uVKJXQNL4Nb2jH3SGhBYcvLQ7HlyxQ+32yQZwDKPyzy/Rvl0yHWlROmY
 0SJbEq3H4cyaZ0sdJr6vpVMua/9g5cOEy1Eyy890frBf0RG+XjvIH1rEgy2ByhTC3urF
 jyGg==
X-Gm-Message-State: AOAM531YayeG4/YIOMiyPA5pl7E34NXfExOUFpLMPteO9RjCpJJYF/qI
 uAMt/CGq6uVa/WUDi0oTxox/E6kvO80=
X-Google-Smtp-Source: ABdhPJwQNF3bW1OG/QI0+BSHHEgRgoyjDr+XIHkxqjciRFnroD4oB5mzG0qbwtizapDY69mbyYcC1g==
X-Received: by 2002:a1c:9a8d:: with SMTP id c135mr2203394wme.66.1640084733625; 
 Tue, 21 Dec 2021 03:05:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] meson: build contrib/ executables after generated headers
Date: Tue, 21 Dec 2021 12:05:24 +0100
Message-Id: <20211221110526.351709-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be needed as soon as config-poison.h moves from configure to
a meson custom_target (which is built at "ninja" time).

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



