Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F4212349
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 14:26:29 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqyIO-0006yc-A2
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 08:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyDh-0000kc-IO
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56664
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyDf-000187-Uy
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593692495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=+T5nEzbikVPfmrsZRjdm19UXIkdXCxFroIqmStEfv64=;
 b=S9hVMrY1M3y4usoYqwIS5RMp4OmBqixAldxS8EMoQcP2DkXXACD2X/nBBbApu84BTbUFpI
 jUMiEi/fsZEdBkzbNXvcLkZ4w1ANz1g5/Cq9m6DivcrR4TuPZI1uZZ7igzEMm8ApcLQSzC
 jHkwzr+ZQ+ESqETcuvhS2vRu6hKYoOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-yG9n_A2kPsW3InaL3FPd7Q-1; Thu, 02 Jul 2020 08:21:33 -0400
X-MC-Unique: yG9n_A2kPsW3InaL3FPd7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A680107BA5B
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 12:21:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C08104B4EE;
 Thu,  2 Jul 2020 12:20:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9394131EBF; Thu,  2 Jul 2020 14:20:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] chardev: enable modules, use for braille
Date: Thu,  2 Jul 2020 14:20:48 +0200
Message-Id: <20200702122048.27798-11-kraxel@redhat.com>
In-Reply-To: <20200702122048.27798-1-kraxel@redhat.com>
References: <20200702122048.27798-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Removes brlapi library dependency from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200624131045.14512-11-kraxel@redhat.com
---
 Makefile.objs         | 1 +
 chardev/char.c        | 2 +-
 util/module.c         | 1 +
 chardev/Makefile.objs | 5 ++++-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 3d45492d8b46..d22b3b45d7b6 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -71,6 +71,7 @@ common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-y += backends/
 common-obj-y += chardev/
+common-obj-m += chardev/
 
 common-obj-$(CONFIG_SECCOMP) += qemu-seccomp.o
 qemu-seccomp.o-cflags := $(SECCOMP_CFLAGS)
diff --git a/chardev/char.c b/chardev/char.c
index e3051295ac37..df697f3ce9e0 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -527,7 +527,7 @@ static const ChardevClass *char_get_class(const char *driver, Error **errp)
     const ChardevClass *cc;
     char *typename = g_strdup_printf("chardev-%s", driver);
 
-    oc = object_class_by_name(typename);
+    oc = module_object_class_by_name(typename);
     g_free(typename);
 
     if (!object_class_dynamic_cast(oc, TYPE_CHARDEV)) {
diff --git a/util/module.c b/util/module.c
index a74214eac052..32b0547b8266 100644
--- a/util/module.c
+++ b/util/module.c
@@ -272,6 +272,7 @@ static struct {
     { "vhost-user-gpu-device", "hw-", "display-virtio-gpu"    },
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu"    },
     { "vhost-user-vga",        "hw-", "display-virtio-gpu"    },
+    { "chardev-braille",       "chardev-", "baum"             },
 };
 
 static bool module_loaded_qom_all;
diff --git a/chardev/Makefile.objs b/chardev/Makefile.objs
index d68e1347f9af..3a58c9d329d6 100644
--- a/chardev/Makefile.objs
+++ b/chardev/Makefile.objs
@@ -18,8 +18,11 @@ chardev-obj-$(CONFIG_WIN32) += char-win.o
 chardev-obj-$(CONFIG_WIN32) += char-win-stdio.o
 
 common-obj-y += msmouse.o wctablet.o testdev.o
-common-obj-$(CONFIG_BRLAPI) += baum.o
+
+ifeq ($(CONFIG_BRLAPI),y)
+common-obj-m += baum.o
 baum.o-cflags := $(SDL_CFLAGS)
 baum.o-libs := $(BRLAPI_LIBS)
+endif
 
 common-obj-$(CONFIG_SPICE) += spice.o
-- 
2.18.4


