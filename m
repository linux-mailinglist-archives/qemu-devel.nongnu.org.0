Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D3651FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7acf-000614-CH; Tue, 20 Dec 2022 06:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7acY-0005yG-O2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7acW-00059Q-8u
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671535035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yb6rz2pTtrklBjGsQl4EcpnGAFJ/jQVs1DhzU9Q3vqw=;
 b=SWk0rraZjClIHnbWJDx4KwY6sNOcyP1w1XkyzUrHuTbADC2/ipNtIu+maRxbk6cTZcxYkv
 GUUylVxL96UXHClJAMiRcjRrYg781eULkGbEX9BIQ8jCnKmKBiiRblro6ZI9DGBCxgk1eA
 pV02iUv/91Ni6j4DORm7Ak0wk3GtuJM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-4A87WA-kNca1xIn_3ZS43Q-1; Tue, 20 Dec 2022 06:17:13 -0500
X-MC-Unique: 4A87WA-kNca1xIn_3ZS43Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0541D1C0513F;
 Tue, 20 Dec 2022 11:17:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B0B400D79E;
 Tue, 20 Dec 2022 11:17:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E1DC21E691D; Tue, 20 Dec 2022 12:17:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  kraxel@redhat.com,  dgilbert@redhat.com,
 berrange@redhat.com,  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH v3 00/18] ui: Move and clean up monitor command code
References: <20221220090645.2844881-1-armbru@redhat.com>
 <92b0d029-386d-8cb3-8dc6-416a24db2aa1@linaro.org>
Date: Tue, 20 Dec 2022 12:17:11 +0100
In-Reply-To: <92b0d029-386d-8cb3-8dc6-416a24db2aa1@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 20 Dec 2022 11:52:29
 +0100")
Message-ID: <87bkny9vew.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 20/12/22 10:06, Markus Armbruster wrote:
>> This is mainly about splitting off monitor-related code.  There's also
>> a minimum Spice version bump, and a few UI improvements to HMP
>> commands sendkey, change vnc, and info spice.
>
> Possibly related, use of InputEvent in replay:
> https://lore.kernel.org/qemu-devel/20221219170806.60580-5-philmd@linaro.o=
rg/

Independent, as far as I can tell.  My series changes very little in
include/, see appended diff.


diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 27f86399f7..8688769a27 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -73,6 +73,11 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict=
 *qdict);
 void hmp_set_password(Monitor *mon, const QDict *qdict);
 void hmp_expire_password(Monitor *mon, const QDict *qdict);
 void hmp_change(Monitor *mon, const QDict *qdict);
+#ifdef CONFIG_VNC
+void hmp_change_vnc(Monitor *mon, const char *device, const char *target,
+                    const char *arg, const char *read_only, bool force,
+                    Error **errp);
+#endif
 void hmp_migrate(Monitor *mon, const QDict *qdict);
 void hmp_device_add(Monitor *mon, const QDict *qdict);
 void hmp_device_del(Monitor *mon, const QDict *qdict);
@@ -81,6 +86,9 @@ void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
+void hmp_mouse_move(Monitor *mon, const QDict *qdict);
+void hmp_mouse_button(Monitor *mon, const QDict *qdict);
+void hmp_mouse_set(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
 void coroutine_fn hmp_screendump(Monitor *mon, const QDict *qdict);
 void hmp_chardev_add(Monitor *mon, const QDict *qdict);
diff --git a/include/monitor/qmp-helpers.h b/include/monitor/qmp-helpers.h
new file mode 100644
index 0000000000..4718c63c73
--- /dev/null
+++ b/include/monitor/qmp-helpers.h
@@ -0,0 +1,26 @@
+/*
+ * QMP command helpers
+ *
+ * Copyright (c) 2022 Red Hat Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef MONITOR_QMP_HELPERS_H
+
+bool qmp_add_client_spice(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#ifdef CONFIG_VNC
+bool qmp_add_client_vnc(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+bool qmp_add_client_dbus_display(int fd, bool has_skipauth, bool skipauth,
+                        bool has_tls, bool tls, Error **errp);
+#endif
+
+#endif
diff --git a/include/ui/console.h b/include/ui/console.h
index e400ee9fa7..e7f375312c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,7 +65,7 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *entry=
);
=20
 void kbd_put_ledstate(int ledstate);
=20
-void hmp_mouse_set(Monitor *mon, const QDict *qdict);
+void qemu_mouse_set(int index, Error **err);
=20
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
    constants) */
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 21fe195e18..b7d493742c 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -34,13 +34,7 @@ int qemu_spice_add_display_interface(QXLInstance *qxlin,=
 QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject);
=20
-#if !defined(SPICE_SERVER_VERSION) || (SPICE_SERVER_VERSION < 0xc06)
-#define SPICE_NEEDS_SET_MM_TIME 1
-#else
-#define SPICE_NEEDS_SET_MM_TIME 0
-#endif
-
-#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVER_VERSION >=3D 0x000f00)
+#if SPICE_SERVER_VERSION >=3D 0x000f00 /* release 0.15.0 */
 #define SPICE_HAS_ATTACHED_WORKER 1
 #else
 #define SPICE_HAS_ATTACHED_WORKER 0
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index e271e011da..5aa13664d6 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -28,11 +28,9 @@
 #include "ui/console.h"
=20
 #if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
-# if SPICE_SERVER_VERSION >=3D 0x000d01 /* release 0.13.1 */
 #  define HAVE_SPICE_GL 1
 #  include "ui/egl-helpers.h"
 #  include "ui/egl-context.h"
-# endif
 #endif
=20
 #define NUM_MEMSLOTS 8


