Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD819314366
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:02:56 +0100 (CET)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FYV-0008Ca-NB
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCM-00031W-VP
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCK-00064n-7F
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so18329840wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3nWXJKoken2wu6yZkOmxurevNjqlczbSMx4DrujPTw=;
 b=YgVvYOUy1L1v3NTOCR5+OI9ZNf/nC0Zwnfkazwc1Pk+BcTZORx00iuuTRsOYETBzYR
 KB6tuhrXMv54mKqfqd7+VJdYADXTrlCiQhc5emOWSZn/tu3hNg3UCm/3DYbFODCZFyTJ
 Pgip8XPkNFhUfjgxe47j+8E+fjGaaYuj/95kzVekUd8RWI9O3J6Hh47I0EZCDQ33BNM9
 BJ+6FnEjdcjCS2BHoG/t7X7vvGLZTZS9XXSDnCEzAI4pmdKE4idcXGavbeWNo7PlAib/
 UFOkfgt/qNFXUpypPzUri1fIqk48Op5MaDOrhMIPnDt8YX4MxBdzIi+o51LPjJx2p0ZF
 Ej1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v3nWXJKoken2wu6yZkOmxurevNjqlczbSMx4DrujPTw=;
 b=llt0fi1/7pecL78apQseGBrtPAsf9FxThAmRc0XzOgBysRcMcbE7CPjk385iaRbqfT
 E/bGEYUjyth3MUNdp7G/HaFgwpSD5Z9CBd+pFdx618U4ODzzMKvUb050qmQpcs7uJpes
 WNHEKcBWkEyAn/XgCvKAKwem2CjmnVRLae6TMEb6989hU9no2lAkz33Ck/YU9gtAK7w+
 OtAud2GXCixnl8NWpLIPDrkL3R66UPCqZjtwdWqX9WR5mDZoMguzgw86ZslsP2fnMd5e
 Zb2+hapzdP2QElFJKIHNFPFrCZ/rNlcH/Tvvnzijd4t71nop74BAKndr8Nv4vKaC2a8I
 fS+A==
X-Gm-Message-State: AOAM531COo72LdznBEwrlZRQPbjDzVAN5zixaKjTDhVDDM2HRqV8Ah8R
 I63Y1U7tp+BBoCbNd4lkerEoQhcTWfvQAg==
X-Google-Smtp-Source: ABdhPJzcE5bcO1Imk5qKAlV0McXqjza6V/zdImTLyJx+wdkWxykoB1YbkdTXhsgXtoPUSTmwIOIofw==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr21641023wrw.170.1612808622815; 
 Mon, 08 Feb 2021 10:23:42 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/46] meson: accept either shared or static libraries if
 --disable-static
Date: Mon,  8 Feb 2021 19:22:55 +0100
Message-Id: <20210208182331.58897-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson's "static" argument to cc.find_library is a tri-state.  By default
Meson *prefers* a shared library, which basically means using -l to
look for it; instead, "static: false" *requires* a shared library.  Of
course, "static: true" requires a static library, which is all good
for --enable-static builds.

For --disable-static, "static: false" is rarely desirable; it does not
match what the configure script used to do and the test is more complex
(and harder to debug if it fails, which was reported by Peter Lieven
for librbd).

Reported-by: Peter Lieven <pl@kamp.de>
Tested-by: Peter Lieven <pl@kamp.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst |  2 +-
 meson.build                 | 79 +++++++++++++++++++------------------
 2 files changed, 42 insertions(+), 39 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 31f4dced2a..69ce3087e3 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -100,7 +100,7 @@ In meson.build::
   # Detect dependency
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
                          method: 'pkg-config',
-                         static: enable_static)
+                         kwargs: static_kwargs)
 
   # Create config-host.h (if applicable)
   config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
diff --git a/meson.build b/meson.build
index 2d8b433ff0..6d6537d74a 100644
--- a/meson.build
+++ b/meson.build
@@ -18,6 +18,9 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
 enable_static = 'CONFIG_STATIC' in config_host
 
+# Allow both shared and static libraries unless --enable-static
+static_kwargs = enable_static ? {'static': true} : {}
+
 # Temporary directory used for files created while
 # configure runs. Since it is in the build directory
 # we can safely blow away any previous version of it
@@ -311,14 +314,14 @@ endif
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
-                      method: 'pkg-config', static: enable_static)
+                      method: 'pkg-config', kwargs: static_kwargs)
 endif
 pam = not_found
 if 'CONFIG_AUTH_PAM' in config_host
   pam = cc.find_library('pam')
 endif
 libaio = cc.find_library('aio', required: false)
-zlib = dependency('zlib', required: true, static: enable_static)
+zlib = dependency('zlib', required: true, kwargs: static_kwargs)
 linux_io_uring = not_found
 if 'CONFIG_LINUX_IO_URING' in config_host
   linux_io_uring = declare_dependency(compile_args: config_host['LINUX_IO_URING_CFLAGS'].split(),
@@ -333,7 +336,7 @@ libnfs = not_found
 if not get_option('libnfs').auto() or have_block
   libnfs = dependency('libnfs', version: '>=1.9.3',
                       required: get_option('libnfs'),
-                      method: 'pkg-config', static: enable_static)
+                      method: 'pkg-config', kwargs: static_kwargs)
 endif
 
 libattr_test = '''
@@ -354,7 +357,7 @@ if not get_option('attr').disabled()
   else
     libattr = cc.find_library('attr', has_headers: ['attr/xattr.h'],
                               required: get_option('attr'),
-                              static: enable_static)
+                              kwargs: static_kwargs)
     if libattr.found() and not \
       cc.links(libattr_test, dependencies: libattr, args: '-DCONFIG_LIBATTR')
       libattr = not_found
@@ -381,14 +384,14 @@ seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
                        required: get_option('seccomp'),
-                       method: 'pkg-config', static: enable_static)
+                       method: 'pkg-config', kwargs: static_kwargs)
 endif
 
 libcap_ng = not_found
 if not get_option('cap_ng').auto() or have_system or have_tools
   libcap_ng = cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
                               required: get_option('cap_ng'),
-                              static: enable_static)
+                              kwargs: static_kwargs)
 endif
 if libcap_ng.found() and not cc.links('''
    #include <cap-ng.h>
@@ -409,7 +412,7 @@ if get_option('xkbcommon').auto() and not have_system and not have_tools
   xkbcommon = not_found
 else
   xkbcommon = dependency('xkbcommon', required: get_option('xkbcommon'),
-                         method: 'pkg-config', static: enable_static)
+                         method: 'pkg-config', kwargs: static_kwargs)
 endif
 vde = not_found
 if config_host.has_key('CONFIG_VDE')
@@ -445,13 +448,13 @@ libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
   libiscsi = dependency('libiscsi', version: '>=1.9.0',
                          required: get_option('libiscsi'),
-                         method: 'pkg-config', static: enable_static)
+                         method: 'pkg-config', kwargs: static_kwargs)
 endif
 zstd = not_found
 if not get_option('zstd').auto() or have_block
   zstd = dependency('libzstd', version: '>=1.4.0',
                     required: get_option('zstd'),
-                    method: 'pkg-config', static: enable_static)
+                    method: 'pkg-config', kwargs: static_kwargs)
 endif
 gbm = not_found
 if 'CONFIG_GBM' in config_host
@@ -468,14 +471,14 @@ if not get_option('curl').auto() or have_block
   curl = dependency('libcurl', version: '>=7.29.0',
                     method: 'pkg-config',
                     required: get_option('curl'),
-                    static: enable_static)
+                    kwargs: static_kwargs)
 endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
                        method: 'pkg-config',
                        required: get_option('libudev'),
-                       static: enable_static)
+                       kwargs: static_kwargs)
 endif
 
 mpathlibs = [libudev]
@@ -511,17 +514,17 @@ if targetos == 'linux' and have_tools and not get_option('mpath').disabled()
       }'''
   libmpathpersist = cc.find_library('mpathpersist',
                                     required: get_option('mpath'),
-                                    static: enable_static)
+                                    kwargs: static_kwargs)
   if libmpathpersist.found()
     mpathlibs += libmpathpersist
     if enable_static
       mpathlibs += cc.find_library('devmapper',
                                      required: get_option('mpath'),
-                                     static: enable_static)
+                                     kwargs: static_kwargs)
     endif
     mpathlibs += cc.find_library('multipath',
                                  required: get_option('mpath'),
-                                 static: enable_static)
+                                 kwargs: static_kwargs)
     foreach lib: mpathlibs
       if not lib.found()
         mpathlibs = []
@@ -571,7 +574,7 @@ if have_system and not get_option('curses').disabled()
       curses = dependency(curses_dep,
                           required: false,
                           method: 'pkg-config',
-                          static: enable_static)
+                          kwargs: static_kwargs)
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
@@ -596,7 +599,7 @@ if have_system and not get_option('curses').disabled()
       foreach curses_libname : curses_libname_list
         libcurses = cc.find_library(curses_libname,
                                     required: false,
-                                    static: enable_static)
+                                    kwargs: static_kwargs)
         if libcurses.found()
           if cc.links(curses_test, args: curses_compile_args, dependencies: libcurses)
             curses = declare_dependency(compile_args: curses_compile_args,
@@ -647,7 +650,7 @@ brlapi = not_found
 if not get_option('brlapi').auto() or have_system
   brlapi = cc.find_library('brlapi', has_headers: ['brlapi.h'],
                          required: get_option('brlapi'),
-                         static: enable_static)
+                         kwargs: static_kwargs)
   if brlapi.found() and not cc.links('''
      #include <brlapi.h>
      #include <stddef.h>
@@ -663,7 +666,7 @@ endif
 
 sdl = not_found
 if not get_option('sdl').auto() or (have_system and not cocoa.found())
-  sdl = dependency('sdl2', required: get_option('sdl'), static: enable_static)
+  sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
 if sdl.found()
@@ -671,7 +674,7 @@ if sdl.found()
   sdl = declare_dependency(compile_args: '-Wno-undef',
                            dependencies: sdl)
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                         method: 'pkg-config', static: enable_static)
+                         method: 'pkg-config', kwargs: static_kwargs)
 else
   if get_option('sdl_image').enabled()
     error('sdl-image required, but SDL was @0@'.format(
@@ -683,10 +686,10 @@ endif
 rbd = not_found
 if not get_option('rbd').auto() or have_block
   librados = cc.find_library('rados', required: get_option('rbd'),
-                             static: enable_static)
+                             kwargs: static_kwargs)
   librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
                            required: get_option('rbd'),
-                           static: enable_static)
+                           kwargs: static_kwargs)
   if librados.found() and librbd.found() and cc.links('''
     #include <stdio.h>
     #include <rbd/librbd.h>
@@ -705,7 +708,7 @@ glusterfs_iocb_has_stat = false
 if not get_option('glusterfs').auto() or have_block
   glusterfs = dependency('glusterfs-api', version: '>=3',
                          required: get_option('glusterfs'),
-                         method: 'pkg-config', static: enable_static)
+                         method: 'pkg-config', kwargs: static_kwargs)
   if glusterfs.found()
     glusterfs_ftruncate_has_stat = cc.links('''
       #include <glusterfs/api/glfs.h>
@@ -744,7 +747,7 @@ libbzip2 = not_found
 if not get_option('bzip2').auto() or have_block
   libbzip2 = cc.find_library('bz2', has_headers: ['bzlib.h'],
                              required: get_option('bzip2'),
-                             static: enable_static)
+                             kwargs: static_kwargs)
   if libbzip2.found() and not cc.links('''
      #include <bzlib.h>
      int main(void) { BZ2_bzlibVersion(); return 0; }''', dependencies: libbzip2)
@@ -761,7 +764,7 @@ liblzfse = not_found
 if not get_option('lzfse').auto() or have_block
   liblzfse = cc.find_library('lzfse', has_headers: ['lzfse.h'],
                              required: get_option('lzfse'),
-                             static: enable_static)
+                             kwargs: static_kwargs)
 endif
 if liblzfse.found() and not cc.links('''
    #include <lzfse.h>
@@ -798,12 +801,12 @@ if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-                   static: enable_static)
+                   kwargs: static_kwargs)
   if gtk.found()
     gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
                         method: 'pkg-config',
                         required: false,
-                        static: enable_static)
+                        kwargs: static_kwargs)
     gtk = declare_dependency(dependencies: [gtk, gtkx11])
   endif
 endif
@@ -816,7 +819,7 @@ endif
 x11 = not_found
 if gtkx11.found() or 'lm32-softmmu' in target_dirs
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
-                   static: enable_static)
+                   kwargs: static_kwargs)
 endif
 vnc = not_found
 png = not_found
@@ -825,12 +828,12 @@ sasl = not_found
 if get_option('vnc').enabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', static: enable_static)
+                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
-                    method: 'pkg-config', static: enable_static)
+                    method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
                          required: get_option('vnc_sasl'),
-                         static: enable_static)
+                         kwargs: static_kwargs)
   if sasl.found()
     sasl = declare_dependency(dependencies: sasl,
                               compile_args: '-DSTRUCT_IOVEC_DEFINED')
@@ -841,7 +844,7 @@ snappy = not_found
 if not get_option('snappy').auto() or have_system
   snappy = cc.find_library('snappy', has_headers: ['snappy-c.h'],
                            required: get_option('snappy'),
-                           static: enable_static)
+                           kwargs: static_kwargs)
 endif
 if snappy.found() and not cc.links('''
    #include <snappy-c.h>
@@ -858,7 +861,7 @@ lzo = not_found
 if not get_option('lzo').auto() or have_system
   lzo = cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
                         required: get_option('lzo'),
-                        static: enable_static)
+                        kwargs: static_kwargs)
 endif
 if lzo.found() and not cc.links('''
    #include <lzo/lzo1x.h>
@@ -893,7 +896,7 @@ u2f = not_found
 if have_system
   u2f = dependency('u2f-emu', required: get_option('u2f'),
                    method: 'pkg-config',
-                   static: enable_static)
+                   kwargs: static_kwargs)
 endif
 usbredir = not_found
 if 'CONFIG_USB_REDIR' in config_host
@@ -920,7 +923,7 @@ if 'CONFIG_TASN1' in config_host
                              link_args: config_host['TASN1_LIBS'].split())
 endif
 keyutils = dependency('libkeyutils', required: false,
-                      method: 'pkg-config', static: enable_static)
+                      method: 'pkg-config', kwargs: static_kwargs)
 
 has_gettid = cc.has_function('gettid')
 
@@ -979,7 +982,7 @@ endif
 
 fuse = dependency('fuse3', required: get_option('fuse'),
                   version: '>=3.1', method: 'pkg-config',
-                  static: enable_static)
+                  kwargs: static_kwargs)
 
 fuse_lseek = not_found
 if not get_option('fuse_lseek').disabled()
@@ -1367,7 +1370,7 @@ capstone_opt = get_option('capstone')
 if capstone_opt in ['enabled', 'auto', 'system']
   have_internal = fs.exists(meson.current_source_dir() / 'capstone/Makefile')
   capstone = dependency('capstone', version: '>=4.0',
-                        static: enable_static, method: 'pkg-config',
+                        kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
   if capstone.found()
@@ -1477,7 +1480,7 @@ if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
-    slirp = dependency('slirp', static: enable_static,
+    slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config',
                        required: slirp_opt == 'system' or
                                  slirp_opt == 'enabled' and not have_internal)
@@ -1556,7 +1559,7 @@ fdt_opt = get_option('fdt')
 if have_system
   if fdt_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'dtc/libfdt/Makefile.libfdt')
-    fdt = cc.find_library('fdt', static: enable_static,
+    fdt = cc.find_library('fdt', kwargs: static_kwargs,
                           required: fdt_opt == 'system' or
                                     fdt_opt == 'enabled' and not have_internal)
     if fdt.found() and cc.links('''
-- 
2.29.2



