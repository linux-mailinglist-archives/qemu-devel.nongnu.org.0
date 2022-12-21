Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307896535E0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qx-0001lw-Jm; Wed, 21 Dec 2022 13:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QX-0001Qk-QX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QV-0004QO-SI
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2YIepTp86KZkTWlT6697JjI+bssqxMA1MngkOKDmEw=;
 b=bmauTUgwtS5wcq4UR7wu5rxRW/AXOuuwUlJFVyYM+vALk2vWaSD7AW39CrDM34LczX+aCz
 0Ez56gOA5/oICPJbPSFVf3HnjEdfiPNK4cL+gCfPGugzBJJpimXgakrDkg9WCvbdF5cQgm
 6DgvO4mxU+J/0/fTcpY7eBlHZLxJxMg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-qCuQhMbwN-G0GrJU6SNj0g-1; Wed, 21 Dec 2022 13:02:44 -0500
X-MC-Unique: qCuQhMbwN-G0GrJU6SNj0g-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga21-20020a1709070c1500b007c171be7cd7so11222660ejc.20
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2YIepTp86KZkTWlT6697JjI+bssqxMA1MngkOKDmEw=;
 b=H/ZeZ/649c+q39QthRsSAKxIMBtm/ImS7pdTk85t1BB3pntSgqHWa5pwY/AmbWLnJD
 QUzXGUpJkLxkvpxvSIh7QMKnMWrdmdDFqTEtxif+mVStbAvH/8CItpBxYxBzlLMMRv5s
 LYvN1W8IV/siJtVWu3M2tHmR1WuuZkhzgt4uIzjc2/HTMgRocjKjnCU6h9FOQpMVSLdU
 7XNIAnR/JchZwRZNx3aQPZeAbR34BznMhDzdRnXuRDWcOIf7ivVuU+F9n0QZCRrtkqzs
 +ITn4cAYot1Bcr2jErzqVjU8aIbkSxmU1IlG5ccfuXPSfZqoxZ/88dACg/J81ckUOR/Z
 ie3Q==
X-Gm-Message-State: AFqh2korhyYE7W87l+RQJRiDSGUAWvfxBRFX6sVG690vemhDIPm+lJLG
 FLH3LXGm9fuFqKq/4VkjWKU6uOzdMnBOfG//6WI9CIpShyd5b2Ke7pIoeI1+7kw+F/+yng2Foio
 3Dv73pgIkM2o7X2rc8vdSOe4OUWFKk/32n8PJCjJpkf6Z2yc2UXnGmRvkRecMMX1oJ0s=
X-Received: by 2002:a05:6402:e09:b0:479:3ffb:9243 with SMTP id
 h9-20020a0564020e0900b004793ffb9243mr2299133edh.25.1671645762531; 
 Wed, 21 Dec 2022 10:02:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXse7vPXZ8Sc9vX6WHpreMRKmD0Al0jounwzppmz9MxojR7pVGi6dumaQcG+r8/VDyp5lGRvZQ==
X-Received: by 2002:a05:6402:e09:b0:479:3ffb:9243 with SMTP id
 h9-20020a0564020e0900b004793ffb9243mr2299110edh.25.1671645762199; 
 Wed, 21 Dec 2022 10:02:42 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a056402045a00b004610899742asm7286845edw.13.2022.12.21.10.02.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] util: remove support -chardev tty and -chardev parport
Date: Wed, 21 Dec 2022 19:01:39 +0100
Message-Id: <20221221180141.839616-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
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
index e2ca3c8b566d..91015ce5da3b 100644
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
index 724a83142511..44bd299142ca 100644
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


