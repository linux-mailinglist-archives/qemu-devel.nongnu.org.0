Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D43514A5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:59:32 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvz1-0001Jz-Ki
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvz-00055F-4b
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvvx-0002NC-Dl
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LO8T7bNUW+8r/eMJGeX8GLhh07MCIeqwow4BHT/m7g=;
 b=D+16IobT+4kJwfOgTPBCbVVF8X01Y3zc+ye7NFDP9tokfwW6LizwkrDJN3ne7e5b8XrpAD
 SGFWFqsMukZUcRcZjcYid5CK0blMFu4zHHffZl0PcUciwfD1OCwXcuU99DZv6UyIjc7438
 VxuIJVUCMkX3esoaiKcqJSMnTYYY308=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-HoFXnfx_PWy6pneYvOqUuQ-1; Thu, 01 Apr 2021 07:56:16 -0400
X-MC-Unique: HoFXnfx_PWy6pneYvOqUuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC72108BD06;
 Thu,  1 Apr 2021 11:56:15 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CED1F19C44;
 Thu,  1 Apr 2021 11:56:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 5/9] yank: Always link full yank code
Date: Thu,  1 Apr 2021 15:55:28 +0400
Message-Id: <20210401115532.430961-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Yank now only depends on util and can be always linked in. Also remove
the stubs as they are not needed anymore.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <997aa12a28c555d8a3b7a363b3bda5c3cf1821ba.1616521341.git.lukasstraub2@web.de>
---
 stubs/yank.c      | 23 -----------------------
 MAINTAINERS       |  1 -
 stubs/meson.build |  1 -
 util/meson.build  |  2 +-
 4 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 stubs/yank.c

diff --git a/stubs/yank.c b/stubs/yank.c
deleted file mode 100644
index 11b24fc057..0000000000
--- a/stubs/yank.c
+++ /dev/null
@@ -1,23 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/yank.h"
-
-bool yank_register_instance(const YankInstance *instance, Error **errp)
-{
-    return true;
-}
-
-void yank_unregister_instance(const YankInstance *instance)
-{
-}
-
-void yank_register_function(const YankInstance *instance,
-                            YankFn *func,
-                            void *opaque)
-{
-}
-
-void yank_unregister_function(const YankInstance *instance,
-                              YankFn *func,
-                              void *opaque)
-{
-}
diff --git a/MAINTAINERS b/MAINTAINERS
index 12c28feb35..dcab656e62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2822,7 +2822,6 @@ Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
-F: stubs/yank.c
 F: migration/yank_functions*
 F: include/qemu/yank.h
 F: qapi/yank.json
diff --git a/stubs/meson.build b/stubs/meson.build
index 8a3e804cf0..be6f6d609e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -46,7 +46,6 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
 if have_block
-  stub_ss.add(files('yank.c'))
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
diff --git a/util/meson.build b/util/meson.build
index 984fba965f..510765cde4 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -43,6 +43,7 @@ util_ss.add(files('stats64.c'))
 util_ss.add(files('systemd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
+util_ss.add(files('yank.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
@@ -51,7 +52,6 @@ endif
 if have_system
   util_ss.add(files('crc-ccitt.c'))
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
-  util_ss.add(files('yank.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
-- 
2.29.0


