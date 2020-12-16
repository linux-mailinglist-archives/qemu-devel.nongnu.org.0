Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B02DC413
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:27:02 +0100 (CET)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZdl-0001jv-6c
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXF-0002EC-2a
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:18 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXD-0006VI-2J
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:16 -0500
Received: by mail-ej1-x636.google.com with SMTP id g20so33598822ejb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVM1InpNhRI/g9ZYU2u7pE3PbR6QDiLKhPiZwnr0RDE=;
 b=gYbIwX2cOchXrs9tcbuBuZgSt+DIGRQcJSPqWPOorzlio5z8ip9FDMj7Vab9hXGZdw
 SOgPqRJVEW9ERLcKbanjtQVwtYb9GKRCaNqQ1y0CfXmufy1alTkJUhbsYF3phQ1XDGeH
 kDS6ZnYt5/4GmCPBdCn278B1aOuxEMzUqanIIUZPwDIo7ROKcHxwTjBw0PphY8/ahxH9
 d1IhZfGE0dzZTbflivc4UNS9f553XZ3w/UNNmYNKowQ02i7pRneAzpexRsj79GCFcv+5
 +3bge4E57sBZpLKFGq8YqppJ/wFyD509x4VOXdVbNTq1Py4UTm+S6Cuzt1SDrO6ctkKD
 jlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fVM1InpNhRI/g9ZYU2u7pE3PbR6QDiLKhPiZwnr0RDE=;
 b=Hs9qwSVeUdxxMKNe+dA+/cPbNfC8+ivawHYWL8Sm+pXBhklNttIfbRSiqzeE0hIv/L
 48wMWgTHmSGGnO1g1R6GPHLTMXDMPV9c2/xrXBzZXwJArh9aivVFoC91TTwDzyjcdaQu
 dB0KpCGnB6bFnxpbgQV++NG5nSpptjY1Ncl2lTDPVEGCeCp7FNVSdwDSLkP6hxaij3Jr
 s1p7Vi0YvNU6Nd9A7zyDqTfiR2aR/BD4ObRU+JsqdK3G9K+rjedQ/r7BqHfV+p8n6iFZ
 2qURfgojfgNa84LhxEIX5NsI4dOMqGL2aFKtkz2YkELmtll9Vdm0stsRk9DArgzE0tRg
 IXuA==
X-Gm-Message-State: AOAM5304iK+91apKt0uvuAHDcWPZIuRcW3hKcFa6lwFPFpoeP/96nVZ/
 qKTo/GD0WynGfL376Rah9R+CVejGteA=
X-Google-Smtp-Source: ABdhPJyXQBOrMWTzFO52f7GAwqA9g/UWJv+oB7Bjbyua4BVGavAk7bY7NAW+4Bmz+oS8PRgsiDhUig==
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr31256404ejx.113.1608135613837; 
 Wed, 16 Dec 2020 08:20:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] meson: use dependency to gate block modules
Date: Wed, 16 Dec 2020 17:20:05 +0100
Message-Id: <20201216162006.433850-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow converting the dependencies to meson options one by one,
because moving the tests to meson.build will get rid of the symbols
in config-host.mak.

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



