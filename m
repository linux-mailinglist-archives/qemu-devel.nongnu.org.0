Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D5E64FD21
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 01:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6hD0-0008Dx-03; Sat, 17 Dec 2022 19:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCs-0008Cy-Iq
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCq-0001tK-Ls
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671322024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G51J+3KrIXBWqvhU1c+Vjb40tuN5Wffh3N5pZzl4/eU=;
 b=YPFnChU/K2Wbxnq93iey5D3V9uCFOsgc997geEnLbV5m7xXCb9ZxScDfE6WpxBRi4ser8A
 N+OTNVNPfuSvzLPofHT4cXlWUaE0FoXKzw6YP68mhrArIg/Lkd2a0nPJSza7TwtIRQfidP
 PwzXPeWSlkJTb2QS05aKChzoRmoz8hA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-yn6byhgaMLa_v5QNzAPOWA-1; Sat, 17 Dec 2022 19:07:02 -0500
X-MC-Unique: yn6byhgaMLa_v5QNzAPOWA-1
Received: by mail-ed1-f72.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso4091345edd.14
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 16:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G51J+3KrIXBWqvhU1c+Vjb40tuN5Wffh3N5pZzl4/eU=;
 b=ogYuwDV1ftCPXIIw/E7CpGzIWLm8e3VsBWiQV/QtUgkgOyhREbZjK2Z9wM4qIHZhIH
 B58hpoQ6I/Ow8N/eiOIS6votvCK5o9UZYA3ukvdbWO43KPFk6AF3j6lGpTvNuKbMmmOF
 UPErFKHttNQRBz01DrtFiIeZeGgqxhqq+n5NjwN70RMhYuGCWxPxcEQn1179XNgG2RdH
 3b8atniRa8uVXASq5wv0NTTldvhAof13ER5FOQA/RyfY3UHCGlfK6o74AYBMMeVgu/Ad
 KKSGP2LULwYYB6JH7jsOvHhGqn070BjHL0Qck6LQbaYTR+sQ3B8/ZaKxK/Zb7jyWk0p3
 bF8Q==
X-Gm-Message-State: ANoB5pnJ2vBn2Kxg09j+BgVCPj/oEZy2CVltz+/+T7g3LTQ25b1SlCSR
 jWgN5G2hHQBRFx+wi44n0xYgsZUPbI9Rvpl6phvWqXJAifFC2MOTp4zJnhnxbI1Fc5MTDg6QdxN
 VAUt8CI9v+Rl7X4hrX86RGiDdK6+MPK84DaIP6NqyV8mnJODJ0Zofg/uf+MnsW9fQPi8=
X-Received: by 2002:a50:8d1c:0:b0:46c:97c2:8d75 with SMTP id
 s28-20020a508d1c000000b0046c97c28d75mr33513897eds.21.1671322020652; 
 Sat, 17 Dec 2022 16:07:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5kBe8J/uU07+yAQqy8USmQeiDRVAYr9hAPboaZtRiiEmajN+qkDjqBfHRICQPFnTd0sdmNHg==
X-Received: by 2002:a50:8d1c:0:b0:46c:97c2:8d75 with SMTP id
 s28-20020a508d1c000000b0046c97c28d75mr33513876eds.21.1671322020282; 
 Sat, 17 Dec 2022 16:07:00 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 h31-20020a0564020e9f00b0046ba536ce52sm2474274eda.95.2022.12.17.16.06.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 16:06:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] util: remove support -chardev tty and -chardev parport
Date: Sun, 18 Dec 2022 01:06:48 +0100
Message-Id: <20221218000649.686882-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
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

These were deprecated in 6.0 and can now be removed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char.c                  | 33 ++-------------------------------
 docs/about/deprecated.rst       |  6 ------
 docs/about/removed-features.rst |  5 +++++
 docs/qdev-device-use.txt        |  4 ++--
 qemu-options.hx                 | 11 +----------
 5 files changed, 10 insertions(+), 49 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 4c5de164025d..87ab6efbcca0 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -530,19 +530,6 @@ static const ChardevClass *char_get_class(const char *driver, Error **errp)
     return cc;
 }
 
-static struct ChardevAlias {
-    const char *typename;
-    const char *alias;
-    bool deprecation_warning_printed;
-} chardev_alias_table[] = {
-#ifdef HAVE_CHARDEV_PARPORT
-    { "parallel", "parport" },
-#endif
-#ifdef HAVE_CHARDEV_SERIAL
-    { "serial", "tty" },
-#endif
-};
-
 typedef struct ChadevClassFE {
     void (*fn)(const char *name, void *opaque);
     void *opaque;
@@ -578,28 +565,12 @@ help_string_append(const char *name, void *opaque)
     g_string_append_printf(str, "\n  %s", name);
 }
 
-static const char *chardev_alias_translate(const char *name)
-{
-    int i;
-    for (i = 0; i < (int)ARRAY_SIZE(chardev_alias_table); i++) {
-        if (g_strcmp0(chardev_alias_table[i].alias, name) == 0) {
-            if (!chardev_alias_table[i].deprecation_warning_printed) {
-                warn_report("The alias '%s' is deprecated, use '%s' instead",
-                            name, chardev_alias_table[i].typename);
-                chardev_alias_table[i].deprecation_warning_printed = true;
-            }
-            return chardev_alias_table[i].typename;
-        }
-    }
-    return name;
-}
-
 ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Error **errp)
 {
     Error *local_err = NULL;
     const ChardevClass *cc;
     ChardevBackend *backend = NULL;
-    const char *name = chardev_alias_translate(qemu_opt_get(opts, "backend"));
+    const char *name = qemu_opt_get(opts, "backend");
 
     if (name == NULL) {
         error_setg(errp, "chardev: \"%s\" missing backend",
@@ -637,7 +608,7 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
     const ChardevClass *cc;
     Chardev *chr = NULL;
     ChardevBackend *backend = NULL;
-    const char *name = chardev_alias_translate(qemu_opt_get(opts, "backend"));
+    const char *name = qemu_opt_get(opts, "backend");
     const char *id = qemu_opts_id(opts);
     char *bid = NULL;
 
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index f3cb309cb8e1..e5d7d29f7f02 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -39,12 +39,6 @@ should specify an ``audiodev=`` property.  Additionally, when using
 vnc, you should specify an ``audiodev=`` property if you plan to
 transmit audio through the VNC protocol.
 
-``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-``tty`` and ``parport`` are aliases that will be removed. Instead, the
-actual backend names ``serial`` and ``parallel`` should be used.
-
 Short-form boolean options (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 68ac80d37a40..f2a5785d3176 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -416,6 +416,11 @@ Input parameters that take a size value should only use a size suffix
 the value is hexadecimal.  That is, '0x20M' should be written either as
 '32M' or as '0x2000000'.
 
+``-chardev`` backend aliases ``tty`` and ``parport`` (removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
+respectively. The actual backend names should be used instead.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index 240888933482..c98c86d82802 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -216,11 +216,11 @@ LEGACY-CHARDEV translates to -chardev HOST-OPTS... as follows:
 
 * unix:FNAME becomes -chardev socket,path=FNAME
 
-* /dev/parportN becomes -chardev parport,file=/dev/parportN
+* /dev/parportN becomes -chardev parallel,file=/dev/parportN
 
 * /dev/ppiN likewise
 
-* Any other /dev/FNAME becomes -chardev tty,path=/dev/FNAME
+* Any other /dev/FNAME becomes -chardev serial,path=/dev/FNAME
 
 * mon:LEGACY-CHARDEV is special: it multiplexes the monitor onto the
   character device defined by LEGACY-CHARDEV.  -chardev provides more
diff --git a/qemu-options.hx b/qemu-options.hx
index 7f99d15b231f..f3d5e1313ca1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3379,11 +3379,9 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
@@ -3398,7 +3396,7 @@ The general form of a character device option is:
 ``-chardev backend,id=id[,mux=on|off][,options]``
     Backend is one of: ``null``, ``socket``, ``udp``, ``msmouse``,
     ``vc``, ``ringbuf``, ``file``, ``pipe``, ``console``, ``serial``,
-    ``pty``, ``stdio``, ``braille``, ``tty``, ``parallel``, ``parport``,
+    ``pty``, ``stdio``, ``braille``, ``parallel``,
     ``spicevmc``, ``spiceport``. The specific backend will determine the
     applicable options.
 
@@ -3622,15 +3620,8 @@ The available backends are:
     Connect to a local BrlAPI server. ``braille`` does not take any
     options.
 
-``-chardev tty,id=id,path=path``
-    ``tty`` is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD
-    and DragonFlyBSD hosts. It is an alias for ``serial``.
-
-    ``path`` specifies the path to the tty. ``path`` is required.
-
 ``-chardev parallel,id=id,path=path``
   \
-``-chardev parport,id=id,path=path``
     ``parallel`` is only available on Linux, FreeBSD and DragonFlyBSD
     hosts.
 
-- 
2.38.1


