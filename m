Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35725774F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 12:29:18 +0200 (CEST)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCh3t-0006Cq-7O
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 06:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCh38-0005nA-Rt
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 06:28:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30881
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCh36-0003wX-C9
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 06:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598869706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VUVk544bf9oFhWFTwyNaUmHzbHspXnbrcMxc4WKRHIw=;
 b=XC/6w8r5kjm3tPqLX2WtBTWwJ2wip2rt0b/8Jc77kjMaTi/f8L12OfzMN0TMmjJLzoqFxD
 R6T21k8JfnwqVyD+lxdFdBQa4L6VVBHh1YKVkACz1BWuWFJFEPi/iA+gwlmrHGr5x6JTjm
 tDqjzNnVeCFh0yiFT0c3D7ojEChzDCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-Ifj8jfn2Pk-I_8LYJbU1Zw-1; Mon, 31 Aug 2020 06:28:24 -0400
X-MC-Unique: Ifj8jfn2Pk-I_8LYJbU1Zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B1410ABDA3
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 10:28:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE025C22A;
 Mon, 31 Aug 2020 10:28:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: use pkg-config method to find dependencies
Date: Mon, 31 Aug 2020 06:28:19 -0400
Message-Id: <20200831102819.24334-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:06:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need to ask cmake for the dependencies, so just use the
pkg-config mechanism.  Keep "auto" for SDL so that it tries using
sdl-config too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst | 6 +++---
 meson.build                 | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 58bf392430..4465ea76d6 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -97,11 +97,11 @@ In meson_options.txt::
 In meson.build::
 
   # Detect dependency
-  sdl = dependency('sdl2',
-                   required: get_option('sdl'),
+  sdl = dependency('sdl2', required: get_option('sdl'),
+                   method: 'pkg-config',
                    static: enable_static)
 
-  # Create config-host.h
+  # Create config-host.h (if applicable)
   config_host_data.set('CONFIG_SDL', sdl.found())
 
   # Summary
diff --git a/meson.build b/meson.build
index cfdbdd5e8e..26c2aacb69 100644
--- a/meson.build
+++ b/meson.build
@@ -129,7 +129,7 @@ endif
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
-                      static: enable_static)
+                      method: 'pkg-config', static: enable_static)
 endif
 pam = not_found
 if 'CONFIG_AUTH_PAM' in config_host
@@ -168,7 +168,7 @@ if get_option('xkbcommon').auto() and not have_system and not have_tools
   xkbcommon = not_found
 else
   xkbcommon = dependency('xkbcommon', required: get_option('xkbcommon'),
-                         static: enable_static)
+                         method: 'pkg-config', static: enable_static)
 endif
 slirp = not_found
 if config_host.has_key('CONFIG_SLIRP')
@@ -247,7 +247,7 @@ if sdl.found()
   sdl = declare_dependency(compile_args: '-Wno-undef',
                            dependencies: sdl)
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                         static: enable_static)
+                         method: 'pkg-config', static: enable_static)
 else
   if get_option('sdl_image').enabled()
     error('sdl-image required, but SDL was @0@',
@@ -332,7 +332,7 @@ sasl = not_found
 if get_option('vnc').enabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
-                   static: enable_static)
+                   method: 'pkg-config', static: enable_static)
   jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
                          required: get_option('vnc_jpeg'),
                          static: enable_static)
-- 
2.26.2


