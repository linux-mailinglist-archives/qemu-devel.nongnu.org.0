Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438025EBDA0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:41:48 +0200 (CEST)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od69z-0000Tf-DN
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oU-0005RD-AL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oJ-0000I6-PG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qz6m5wNnMR4b4k9F7KgrsOGoMcMDGwawdO4N7dnhA6U=;
 b=bfEiFLTDPJ5/o7bqh0Zc7FNnmUty1X8S6Gar3qtcKb0Zy5R7xwI2LY8A7M4wtd5MrBke9o
 rCRZaEOWEtV1+Rc31s7L2PM5tLr2KellnixsZsK1f2sni4EMFSyx3OLGbWDfFjJgx6GnJ5
 QqSl5X0bDX5uJmAeNbuTlNQVWAurkvE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-yZPhxNhgO3i6jADW-GYwXg-1; Tue, 27 Sep 2022 04:19:20 -0400
X-MC-Unique: yZPhxNhgO3i6jADW-GYwXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A4D803D4A;
 Tue, 27 Sep 2022 08:19:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E5C2166B26;
 Tue, 27 Sep 2022 08:19:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1B999180091C; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/24] meson: Allow to enable gtk and sdl while cocoa is enabled
Date: Tue, 27 Sep 2022 10:18:52 +0200
Message-Id: <20220927081912.180983-5-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
can be enabled even ui/cocoa is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220819132756.74641-4-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 3885fc107633..d9ac91ff3659 100644
--- a/meson.build
+++ b/meson.build
@@ -589,12 +589,6 @@ endif
 
 cocoa = dependency('appleframeworks', modules: ['Cocoa', 'CoreVideo'],
                    required: get_option('cocoa'))
-if cocoa.found() and get_option('sdl').enabled()
-  error('Cocoa and SDL cannot be enabled at the same time')
-endif
-if cocoa.found() and get_option('gtk').enabled()
-  error('Cocoa and GTK+ cannot be enabled at the same time')
-endif
 
 vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
 if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
@@ -921,7 +915,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if not get_option('sdl').auto() or (have_system and not cocoa.found())
+if not get_option('sdl').auto() or have_system
   sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
@@ -1187,7 +1181,7 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-if not get_option('gtk').auto() or (have_system and not cocoa.found())
+if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.37.3


