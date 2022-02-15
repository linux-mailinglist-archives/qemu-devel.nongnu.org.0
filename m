Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74E4B6827
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:49:24 +0100 (CET)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuSZ-0006vT-GB
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCQ-0004Nx-CX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:42 -0500
Received: from [2a00:1450:4864:20::62f] (port=39608
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCO-0008SN-3T
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:42 -0500
Received: by mail-ej1-x62f.google.com with SMTP id p9so20021592ejd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0OFaVgYpYiiercWGJHBall5XMdKYApo48qVLKLorG8=;
 b=hD7ImMut3e5vFtwVJmqfxoV6iSUpL63/IH/cWW/pBzGhEhJTVO8h8oWXjXtrysMDp4
 z4Xjta/BuHEnB7m7jQw+0HE6lu23aeWryByet0DxPYzwESK3is+VrwLhcIvq7fQLGpq5
 eKxF4MOoFQGo68R29HsNFf3C9QDCO+7bgEjbd2NHtue8GRfXHZLvLKnDW7u+rp0z7oZ4
 v6zgermByi3Fd/HjWQhJ8/EltmDadSS6vDUWVAwHp4AT+JrW4HxQSHlrETXytm6lddsa
 OMVu6aujFGXXDHMdK4Yl/o9TTKLZTMjhgWDs5BJyJFLJhg0LZNgzevfvlEEb8FBdaT8U
 pYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T0OFaVgYpYiiercWGJHBall5XMdKYApo48qVLKLorG8=;
 b=pUlsr0yKNxq9+1jupldYMt5G9+ll44HD7fgigo7BY7iIxQs45CrLPyZt9GbobAEnbA
 vhd5U/mOTc0Z8FtOxxkD3EFX6KTRyuNgmboAIiJFy/YYQFy/C94RBx/ADH1LNkRBmWAp
 R2m1MAC/dq8ye7N/kvWy7Y9bc/rQqdBqF8D4UG60dA9VbvpvtX2NQjyP2sYtkUGbP+sq
 RdS+bI/Xp5vMUiiG0MIzj8QGTovLQ7XpiMVarss1wLoocRF8jYpzU2nyqeFv1qYuNjHl
 4xilluX1OtU30bHPBnbNyy6rd9V/B+DrCBihPuoKAeiDBvww3I+1NiOf/nQ+mG0q8/Wm
 S+qA==
X-Gm-Message-State: AOAM532d9Jo/xCl6LSJXtAvTVh3kgg2tamJXMTfN3QelXkNgIv02Uv9n
 9MF652+E6A98sxnaedX2nVj9S+KHrhs=
X-Google-Smtp-Source: ABdhPJzYAS3lozsb3J9R4mMmjhaXZhNjXw8qYF0nvQPEW38w2csN1hzfVaVIll+hXVRFR5K+EXzbOQ==
X-Received: by 2002:a17:906:7291:: with SMTP id
 b17mr2170377ejl.321.1644917557830; 
 Tue, 15 Feb 2022 01:32:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] meson: refine check for whether to look for virglrenderer
Date: Tue, 15 Feb 2022 10:32:12 +0100
Message-Id: <20220215093223.110827-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check should be performed even if !have_system, as long as there is some hope that
vhost-user-gpu will be built.  Store into have_vhost_user_gpu whether vhost-user-gpu
will be built; we will also use the variable to decide whether to look for libepoxy.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/vhost-user-gpu/meson.build | 3 +--
 meson.build                        | 5 ++++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index b4e26045da..c8883c2d8e 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,5 +1,4 @@
-if have_tools and virgl.found() and gbm.found() \
-    and 'CONFIG_LINUX' in config_host and pixman.found()
+if have_vhost_user_gpu
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
              dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
              install: true,
diff --git a/meson.build b/meson.build
index b9bedf928a..5ad346816e 100644
--- a/meson.build
+++ b/meson.build
@@ -621,7 +621,9 @@ if not get_option('zstd').auto() or have_block
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 virgl = not_found
-if not get_option('virglrenderer').auto() or have_system
+
+have_vhost_user_gpu = have_tools and targetos == 'linux' and pixman.found()
+if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
   virgl = dependency('virglrenderer',
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
@@ -1000,6 +1002,7 @@ if (have_system or have_tools) and (virgl.found() or opengl.found())
   gbm = dependency('gbm', method: 'pkg-config', required: false,
                    kwargs: static_kwargs)
 endif
+have_vhost_user_gpu = have_vhost_user_gpu and virgl.found() and gbm.found()
 
 gnutls = not_found
 gnutls_crypto = not_found
-- 
2.34.1



