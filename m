Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615022DFD28
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:03:13 +0100 (CET)
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMiO-0000Qb-Bs
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRK-0004yU-EY
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007mG-MK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id g25so10375601wmh.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=We8zm4vTljefLB1H+FZSFrGQyaLw5AVUbS8dE3t5u5A=;
 b=Ps3ttjcUxCJH+NMGlHp7rEaKJ/Ms8D0moQ7wkTyZDjqBE2SrXyuQj/Dl9N3GupjHMJ
 aqvJeQ1TQHOir/NUrVgLRcvtf8oilstmJaPmmakW2is3MS7aosRgZ7ruuGp6m34sDWhz
 VcSC7uU0eBtGHxV1Cj9/djTJDk2OWeGGMmTOGmABJBLo0tmVnKLymiXCTJesc8RrS3WC
 ZYGnWE3N8H+PVqioyYSq0oFMcmbQip12AIDjdQTJXty6cmUnWruyAK4a7l8kKgNJBo1e
 wlWcE0zOSm9kS4T72FAojDdi5XgAlO2RkkpZUaw1SlvkYgxHo2jiQSXrdDi/N8LVTSE0
 SUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=We8zm4vTljefLB1H+FZSFrGQyaLw5AVUbS8dE3t5u5A=;
 b=q0ZyPIk+uBQIrP1Rwyh6nMMSdHRz8wkO5h5Iygi0GZXWNufNlnjUBQnCTOBd8wnAiZ
 QKxHfz34OTEMcrhn/7/szCpndCobp4+uOUPXZRprGlYQuGce9cZd8gCQPHAJtq53rd/z
 wR6PVIJIieWUHjmjZqYvIqe3swAulrCflbm82ODzdZY3gyC/Av2YM7xnV4PeHkaDwQXk
 IxgoWv7EdwxF1W9ZS/YDV3Mpu2WY/laQ+2a4UZYFLcc5WyJiZ20i1OCrCrmgmRpvQvCR
 6xwbpjLBPO6rUcfGZo9Y4MSXuYnVcFYEIslpN23VdpiG12VZsBx/SwlBuxl50fR4kb1w
 zDJw==
X-Gm-Message-State: AOAM531EFv/kENIeJwSfY7rca1XSxL1h/Wf4PQ61MwQEdRbbW7AFM3tM
 hMjWgSckUkYjWmQv69jt1fd6RMMrdHU=
X-Google-Smtp-Source: ABdhPJwk5Ctp0pZsXO+ItssBSLwlIPbtTMr4SaJZBON6IcMt/SUh8U3PLRtHDp9LLs4ZWSwZ/oVlDQ==
X-Received: by 2002:a1c:43c5:: with SMTP id
 q188mr17059302wma.163.1608561915560; 
 Mon, 21 Dec 2020 06:45:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/55] meson: use dependency to gate block modules
Date: Mon, 21 Dec 2020 15:44:22 +0100
Message-Id: <20201221144447.26161-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows converting the dependencies to meson options one by one.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 5dcc1e5cce..b02cb14aad 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -70,14 +70,14 @@ block_modules = {}
 
 modsrc = []
 foreach m : [
-  ['CONFIG_CURL', 'curl', [curl, glib], 'curl.c'],
-  ['CONFIG_GLUSTERFS', 'gluster', glusterfs, 'gluster.c'],
-  ['CONFIG_LIBISCSI', 'iscsi', libiscsi, 'iscsi.c'],
-  ['CONFIG_LIBNFS', 'nfs', libnfs, 'nfs.c'],
-  ['CONFIG_LIBSSH', 'ssh', libssh, 'ssh.c'],
-  ['CONFIG_RBD', 'rbd', rbd, 'rbd.c'],
+  [curl, 'curl', [curl, glib], 'curl.c'],
+  [glusterfs, 'gluster', glusterfs, 'gluster.c'],
+  [libiscsi, 'iscsi', libiscsi, 'iscsi.c'],
+  [libnfs, 'nfs', libnfs, 'nfs.c'],
+  [libssh, 'ssh', libssh, 'ssh.c'],
+  [rbd, 'rbd', rbd, 'rbd.c'],
 ]
-  if config_host.has_key(m[0])
+  if m[0].found()
     if enable_modules
       modsrc += files(m[3])
     endif
@@ -90,10 +90,10 @@ endforeach
 # those are not exactly regular block modules, so treat them apart
 if 'CONFIG_DMG' in config_host
   foreach m : [
-    ['CONFIG_LZFSE', 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
-    ['CONFIG_BZIP2', 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
+    [liblzfse, 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
+    [libbzip2, 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
   ]
-    if config_host.has_key(m[0])
+    if m[0].found()
       module_ss = ss.source_set()
       module_ss.add(when: m[2], if_true: files(m[3]))
       block_modules += {m[1] : module_ss}
-- 
2.29.2



