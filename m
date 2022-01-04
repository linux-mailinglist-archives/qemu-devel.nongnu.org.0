Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866D484466
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:16:06 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lXg-0006P3-Ka
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:16:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGZ-0007BO-US
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:23 -0500
Received: from [2a00:1450:4864:20::530] (port=38657
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGW-0004TC-98
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:21 -0500
Received: by mail-ed1-x530.google.com with SMTP id bm14so149555861edb.5
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=UpQKU9eeS/K9v2ETi9WgANOx2H7FuRiwng2evvCm57c9pDfdovNB+fS4ryW2iTSuBr
 w/D/3V8iUO6w9CwcrRghTF10MvOAbeUIV0M+FSA4G+93FINliz9uJvIvzzMPfZ6Y4pn1
 8BenerqnG/h0sMSEXo1uKuBKG7nvLEtaWOW9FHxlubKllHucSKRfTc1ASgONJeM6zhv1
 tBOvca+v4PWuQ75BxUvlYcnBkBqHAZzSxk2q1wH7+5RW2IeCtzgGQBZiu3EwQY1ZovG8
 rKFxcRqdzKeW1j998vRxzhy+JjdeaEZsvVGJrSS6q3F6Xm7tbE82stvDeurWbNB3b1Mo
 0BGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3qbqkIQNqeg3P7tq5zzTnKQjNiTPg4hX+5Vl379ivaM=;
 b=K0tNLivsFnHfqOlGW/wCFbh3bwrh1Ubm/DNn/6WB4mmP4VQBMfttce/oShrDt5pj+E
 L105gi2LSXvjeGBkRYSnRRs7bF6NcpvUrFn+9VY7TCn0Q5/N48RMVyd8C9oLRS4z/jYM
 GH2g2Egj7Cjr4Afhb/k6xEqQeryk8oICV1bteeZSvC3CTtyBy2yBXikzmTMp1iyi3PjZ
 RIetjh3eFeISOLsJEMF5V8UwIMcvU60jTdqV3oa76kNsYI9tEAzMPqVxIJcq3MFVeZ6q
 xCgsWBcsp+5rbBCZm+RQVV8R8ypZ78u56cg2nFVQ49lGPTMs8nivqc8n22qSuH67Lskj
 5G3g==
X-Gm-Message-State: AOAM5318vKgetVSSFRq0AfwqVu0FbPTRMrUR01rV1TbYl7KS9WneFnsP
 //7DsIk121+utgKnfY6jIHK1doGnafA=
X-Google-Smtp-Source: ABdhPJwofQKnPIFN1e9j31nVzsqG7aZXJjdKYh6/hTLeoo9dUaHunRMDoCB0WczcPKeuHfbx6U0x2g==
X-Received: by 2002:a17:906:8283:: with SMTP id
 h3mr1247246ejx.608.1641308298029; 
 Tue, 04 Jan 2022 06:58:18 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] meson: build contrib/ executables after generated headers
Date: Tue,  4 Jan 2022 15:57:44 +0100
Message-Id: <20220104145749.417387-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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



