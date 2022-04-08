Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034E4F9B80
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:20:58 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsI4-000357-44
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs88-0005sB-6V
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs85-0006m4-ST
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:39 -0400
Received: by mail-pf1-x430.google.com with SMTP id x16so8870425pfa.10
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGhmD4rOTAIJSjHt/IgM7greLZgwM1iLxm7R7RjIYMk=;
 b=ehe1bQkD6badpS36ay7Zd0x5L9z6Cf04MfFTr6UVi8YMlmRvMPUJoao09PNe+InudM
 zm95MJSvXxNEhEJc0GcYt5LOBSGzPuYJbOthYzn5z7/QcxqhXjYJ+CgnSlWxa45//wNh
 3TVNB0SlijqoVAP6udpr8hlI5p/H2/a5jN5j/ZR97iFbqt+2TSYrY+5N/PxNjCSXxi+J
 wtXH8GEkvucKWAGBawDcTnrhd5aI6PZ8oDMIgw97/lQBI8ZBXzr/13he61+dGV/nkrbu
 TSiuj9vRMJOtajoaZg2r8BQjHFJwKGwHvHvyg0BXIbelmmUUaoO1Bsnx3HHYt0dtTAce
 ZX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGhmD4rOTAIJSjHt/IgM7greLZgwM1iLxm7R7RjIYMk=;
 b=0TlZfx3y7xTa//HasRk0Eg3DEKQaPU0ytE5QqeXMwnS8H7fk/8ZbMUF8BhW+0pHUlq
 /EafijaO5Iw3aprrWFYkjHr5dyOPTPaFo47fJOPxYmKTX39zeKZshwtCXLFv6b/Xs+3e
 ZVm7RLTh1FBARcMh9SBrrYDHrigicAV/qiAtde7lJXWh4VVbZ0TIfMaXvKqhoe5o8Aqk
 j9PLNDfDKMjts7Fq5BvrOd7COFKJ3r3Im8TpAW1Z8Vc8e5t9mjueyzpJy6N6NolFXk4I
 KbD3oM74hnJMdeVuzQK5oiUKmc/YCrI0TJAI3mI9KGoDw0FRcn2/dklXP/2qBcF0p4e+
 anRg==
X-Gm-Message-State: AOAM532hCFhCmYOFievcYQlpHKeIXWh7yEWAI0fMTjTgpbWA3m0jdm0m
 Wvn6bjACph6JH8lliJN8AiJ1wUMrZfGmQA==
X-Google-Smtp-Source: ABdhPJx8b0PYEyJ8xVepiOFUJsBUPCuRkQvxwd26IwPzIuVER6BJLxP3zGY8HkyrBRflot8N41EghQ==
X-Received: by 2002:a65:6789:0:b0:39d:199:e17f with SMTP id
 e9-20020a656789000000b0039d0199e17fmr2545006pgr.111.1649437833695; 
 Fri, 08 Apr 2022 10:10:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm22263494pgp.3.2022.04.08.10.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:10:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] meson.build: Turn on virtfs for Windows host
Date: Sat,  9 Apr 2022 01:10:13 +0800
Message-Id: <20220408171013.912436-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408171013.912436-1-bmeng.cn@gmail.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Enable virtfs configuration option for Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 861de93c4f..a609a9e98f 100644
--- a/meson.build
+++ b/meson.build
@@ -1465,16 +1465,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux' or targetos == 'darwin',
-             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
+    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np') or targetos == 'windows',
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()) or targetos == 'windows',
              error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
 
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
-- 
2.25.1


