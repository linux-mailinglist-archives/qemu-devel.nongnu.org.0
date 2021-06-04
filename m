Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DF39BBA3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:19:38 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBbl-00024a-RK
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa5-0007lt-1D
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:53 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa3-0008De-8K
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:52 -0400
Received: by mail-ed1-x52a.google.com with SMTP id o5so11605441edc.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqYqnrlenFog4cY4zspWeuI8Xg7nEVqv+lvAE9Po+qM=;
 b=G5GygwHXh10kbJxn2Yj1BH6NFKy4/e7U8pe4gkh2iEvh1fKC4z2V9ppCvbGmIF45Ul
 3JueG1fvQ5ja1rUTkAyP3JUEMiO+xAEYTgCWCDPrBC8pG0FqlhES3Qz7Xb2hmZ8mkl+z
 pmCkeih3aQq3PMv6vlDw8vvLIhYLp8TZBMT8yAKmHI7YzSeD2nJPyEsm3/sWoEgz/gMg
 Jt9b7w2TzcfqXvFpasTbav0un3kErIqzL92HTtwyB4orBVwMJeXOxQOKsAK7qZ5renE2
 nKCZ3Bf60FqdZ4mnCJi5GdcRESQ35VRQ5CpTQqGNYNWA+2CYXUwbBuV2h7GU3aPQb318
 vXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qqYqnrlenFog4cY4zspWeuI8Xg7nEVqv+lvAE9Po+qM=;
 b=p1AG3YfeB7h2i77V+NweNhOhehavu6h8M3UwjMuzbog+0Fo8gjpfyTiRHxm+w5x0pk
 cLgK7NtioxfDr1eyXZU1d/FAKVVaRXdknBFpkveWDB0P0EdgNj/KAYgFFKH3eYcMsrGV
 HWZBWMlys2xJquN1fxtVK4vmvasQMdK6Xc0HIHdJz9TI0g6WoduKpGLVmxyV10S+7N9M
 Nf4Td1QrNCDcLXHnp7Cs9BQfWFPLdnf3oKQ7sNGyD/WGql9tUfZ3/CgkXfUgO02/yuXM
 c7/YnXiANrWu/NXuuGEhteElbDwdKdlj/JHmdFlHQsB1mepWeG6YzeFt0YKHRnE16NyH
 rAYA==
X-Gm-Message-State: AOAM531Ik8R+seSG2RE7UnSHSFQ4ulj2LCIkXOUN59qqCHv78zJZzP1Q
 yq9QROck6oGUyWHODHDgEzcrMQR93NAhlw==
X-Google-Smtp-Source: ABdhPJwLAZCrDPcm9dDROFzuK8RhiXDfuZkUqH1sgGkk5EIGC7G5GUO9eFzLsGr9mNCtrynVdsurJQ==
X-Received: by 2002:aa7:cfc7:: with SMTP id r7mr1992044edy.13.1622819868906;
 Fri, 04 Jun 2021 08:17:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] iscsi: link libm into the module
Date: Fri,  4 Jun 2021 17:17:34 +0200
Message-Id: <20210604151745.310318-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yi Sun <yisun@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the configuration of QEMU, some binaries might not need libm
at all.  In that case libiscsi, which uses exp(), will fail to load.
Link it in the module explicitly.

Reported-by: Yi Sun <yisun@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build | 2 +-
 meson.build       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 9e3388f633..01861e1545 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -73,7 +73,7 @@ modsrc = []
 foreach m : [
   [curl, 'curl', files('curl.c')],
   [glusterfs, 'gluster', files('gluster.c')],
-  [libiscsi, 'iscsi', files('iscsi.c')],
+  [libiscsi, 'iscsi', [files('iscsi.c'), libm]],
   [libnfs, 'nfs', files('nfs.c')],
   [libssh, 'ssh', files('ssh.c')],
   [rbd, 'rbd', files('rbd.c')],
diff --git a/meson.build b/meson.build
index a45f1a844f..913cf2a41a 100644
--- a/meson.build
+++ b/meson.build
@@ -163,7 +163,7 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
-m = cc.find_library('m', required: false)
+libm = cc.find_library('m', required: false)
 util = cc.find_library('util', required: false)
 winmm = []
 socket = []
@@ -1899,7 +1899,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-- 
2.31.1



