Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4146D01F1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:47:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpnd-0004MA-9L; Thu, 30 Mar 2023 06:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phpnZ-0004Ls-Sx
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phpnY-0006wd-2A
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680173187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YGxekpwulH6/haKUNvKFSHVmGOaw7yrqW6rkHXV0+gs=;
 b=cKO9YM7szO+gU0Z/DLTIJiJFxMVoeeF1B8gpOy2LN1V5DsNOzrheNgasVlUcmnk5+qkuXF
 sPH9UPf+tpKY+diq9kudFFV1Dpx5p2BMwtrSsVBijpeVylNg8DydNCkhwJCWVj03YPGhK5
 yoSGwq75UGROoa0x1R2wp1s8C6iEQqA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-KWymlqSrO7G2U0tSyWqaJw-1; Thu, 30 Mar 2023 06:46:25 -0400
X-MC-Unique: KWymlqSrO7G2U0tSyWqaJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j22-20020a05600c1c1600b003ef95cef641so2979201wms.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680173184; x=1682765184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGxekpwulH6/haKUNvKFSHVmGOaw7yrqW6rkHXV0+gs=;
 b=SAo44uxjxrzqQ/IoyPrZQ7UanbClBk4pyCBxzThMtK40fWj1ZDIbFJINOYVo0e1/96
 ysWI8jHD+bJvBILxFG5QSe08USRKYWIkMB06MKQSxzmPRF6VnSr+FINs6IM/mfIaoAyk
 0GNVu+rr2udyPUX8yPfN4vosTV9Ld6R8rkTOqycU4vmdil/cpmkgmEPbVtv+TpDuLgDL
 O2sLSZFIRm1U85BmgEBfNZ9J+11VbAs6dKjilTZrndrlt8VD+xYjODFFRQ6RZUOaU69H
 XrQjCyI1APspGS6nXv0P9EKgfsC++uUvHVxyb+rNbVH5Jf/qzPQT9dg6qV2N4MaE1BD5
 IjRA==
X-Gm-Message-State: AAQBX9d9zLqM8tRSToeGUcnTjvwSPzqBkjb25zPJ/kz+lFQRAZx2wdYh
 UUHVXZjr3kWIyN8fsDvbsKf+eTHOVwTPFgOvIlnLYWw78NNbpVBmC7yMlhBd22Qy1i2zB4TcxDY
 bvVi8eloYq6yypQ+UB03II+2i+J+ulsewo0XzIfnDCsaczDYTD3BtVuu+YWxtdDiHXSigbGKxC3
 PzDg==
X-Received: by 2002:a1c:f718:0:b0:3ef:6b97:f0c3 with SMTP id
 v24-20020a1cf718000000b003ef6b97f0c3mr12433669wmh.15.1680173184145; 
 Thu, 30 Mar 2023 03:46:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y06HRpX/gyoC34AmQLkPPovVN04uT9e0ryl7zVYiC9+33at0r7qD28WoDZGQPgBsg5aLp7ow==
X-Received: by 2002:a1c:f718:0:b0:3ef:6b97:f0c3 with SMTP id
 v24-20020a1cf718000000b003ef6b97f0c3mr12433644wmh.15.1680173183710; 
 Thu, 30 Mar 2023 03:46:23 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a1c7212000000b003eafc47eb09sm5324450wmc.43.2023.03.30.03.46.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:46:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: add more version numbers to the summary
Date: Thu, 30 Mar 2023 12:46:22 +0200
Message-Id: <20230330104622.29087-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Whenever declare_dependency is used to add some compile flags or dependent
libraries to the outcome of dependency(), the version of the original
dependency is dropped in the summary.  Make sure that declare_dependency()
has a version argument in those cases.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index db38e777edad..3467159381b7 100644
--- a/meson.build
+++ b/meson.build
@@ -1164,7 +1164,8 @@ if have_system and get_option('curses').allowed()
   curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
     if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
-      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
+      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses],
+                                  version: curses.version())
     else
       msg = 'curses package not usable'
       curses = not_found
@@ -1253,7 +1254,8 @@ endif
 if sdl.found()
   # work around 2.0.8 bug
   sdl = declare_dependency(compile_args: '-Wno-undef',
-                           dependencies: sdl)
+                           dependencies: sdl,
+                           version: sdl.version())
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
                          method: 'pkg-config')
 else
@@ -1476,7 +1478,8 @@ if not gnutls_crypto.found()
     if gcrypt.found() and get_option('prefer_static')
       gcrypt = declare_dependency(dependencies: [
         gcrypt,
-        cc.find_library('gpg-error', required: true)])
+        cc.find_library('gpg-error', required: true)],
+        version: gcrypt.version())
     endif
   endif
   if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
@@ -1510,7 +1513,8 @@ if not get_option('gtk').auto() or have_system
     gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
                         method: 'pkg-config',
                         required: false)
-    gtk = declare_dependency(dependencies: [gtk, gtkx11])
+    gtk = declare_dependency(dependencies: [gtk, gtkx11],
+                             version: gtk.version())
 
     if not get_option('vte').auto() or have_system
       vte = dependency('vte-2.91',
-- 
2.39.2


