Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DA489B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:47:28 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vxH-00032t-IH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:47:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqz-0002GD-5z
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:57 -0500
Received: from [2a00:1450:4864:20::530] (port=35475
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqx-0000Vp-Ie
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:56 -0500
Received: by mail-ed1-x530.google.com with SMTP id q25so45825323edb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=nSMJZeF04CL0jhk31BFt+AembdkvwRk+/RHiP3Z1+Al8hUrd6IYFPjPkVU9cwx7gNg
 YrBxXw5Jk8AfihPz9HrJWLqdOn9CVMUI9xM3BHtjKtUqNMx9N4wBZddUtrSwzJgAjRb3
 /SDne2fNoJgw3ry7HqYShM3b+2De2BidqFr97RbHPr9O+lcWiyJunDff0Eu0Zs0annjL
 grwsYbXmELAc5gghXoUB9BlZeFbiymMnC2g33GEWEetyLrhniNm1NtajZTqIO0krqLiO
 89jWQLuxiFnS6+CyLn3qDiisH+sRJCPvoHShLKDZQJg1u3YYkPmvo+Betp/p4zu6bVNu
 NLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=lSip+FlnQ+B9X3g35hyPHPS/ufUfmO4l40TcQgsuh4OCXqQ3Lb3QOWSGMhb9SxMKQd
 uSd5EMY1WKjlpphwRIF0A/WSbuymet47N7lALZeyj+VFWd4sKbxR35P6ryJxVhxJy/ET
 xPFjiR3WyfAkrpOxhHyealJ/PG2TbFeDqTy6t0Q/BepwjZZ31rRDsn7Y9OuJ9D0gG4JE
 mP/esfTaWEMGsX0yqVp7k/nmQsVFKt0xT1hcPy6c60UFFzmVheth/7dftFfVMlQ7XI+0
 Un+vlIPd20Zzni9fbzFrBYn3gTzzjSOpcC0U6whZ1VGtlWUx7nCyfOkViJl5YNU+rNfN
 AAIg==
X-Gm-Message-State: AOAM532d6Bd0haaDT9oYoAi0grqE1vzSJ05sXIDGB1OocLpmrlxScryg
 /ieKV6CXtU7W0CObPMFWi0/Zc+q1XtE=
X-Google-Smtp-Source: ABdhPJyMim5QtmhHqxRcNn0ErQeUKuuOKZ2egi/e1D9nIkQu/c3oxqkkx9I10vX4QCCcxeD2dqmZUA==
X-Received: by 2002:a17:907:3d88:: with SMTP id
 he8mr40492ejc.241.1641825654325; 
 Mon, 10 Jan 2022 06:40:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] meson: build contrib/ executables after generated headers
Date: Mon, 10 Jan 2022 15:40:26 +0100
Message-Id: <20220110144034.67410-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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



