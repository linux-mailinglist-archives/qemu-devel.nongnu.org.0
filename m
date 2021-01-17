Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E82F94FB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:46:39 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1E0U-0002yR-V3
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dh1-00007H-LL; Sun, 17 Jan 2021 14:26:31 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgz-0005Z8-R1; Sun, 17 Jan 2021 14:26:31 -0500
Received: by mail-wr1-x435.google.com with SMTP id 91so14459064wrj.7;
 Sun, 17 Jan 2021 11:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLzS9Bs5+OgQ/PoK/Es1Ix8oJMDYYC+sg+uBbYc2jF4=;
 b=CkwMsV8INxC6IbZrpQSLWtqkYM7Lrst93pFDrrc3JrCNpyl8DEtgIQRIklY4zeLfhI
 yXFPy4lMl4WV92ZnEdFZvwSS/hHcJ8PznnYo9IrN4tZz9iVrWbilg4pN3Mo7HFefVzT4
 z/aybAzi/R5NF6BQ5rPc7h1KyRFdiRHhCHZvo65slVvfl3OW+0ilZcnHTg6a2G+sHcok
 n17dBnJhF6oRK3A3+h28snY7ClgEiKLuoa7FsnKBDQ4tDr9njcijK8/E/wxwy84l+LZB
 eXRJu8NLo6kjCugqwFJICAkikVgZn2rwDx3ndHgvbski6Ayk5W4o70rkLtpwTNf3k2Pv
 PlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sLzS9Bs5+OgQ/PoK/Es1Ix8oJMDYYC+sg+uBbYc2jF4=;
 b=iHJQwQBbiMqjLlt82Bb0DLY+Sz2xrxFbuciWx0gfcIUYIMUc4A4KT3uYuoi8Z/YZ6+
 U/OkgGU0//9bx57BOQCNXRfgEy75XJNwbY/+6NEXR5vyEJOuO5wnpbGWnWN4c8J0o2pT
 31PnNIet/AEMc0DcHibHWC1MOmuPaxHcebS4MBTY156GutQYp/QObLj1khgn0sjlvnhy
 szojsNthWVdgSJC55ZalK9kHYahSMBAm6Z9fOK1SDZQS4ZQ738JYCLtXbG8iiD1c5yCy
 UhodwBOsTh7GNsbYysbrhRNdbia7ANsCQXRLr5YASCPUw/CrYSCd8iGiNzp6IWSMAykj
 z7kA==
X-Gm-Message-State: AOAM533DE9AATkUHM73MjGAAFHyJNcJUuF+1/TexPJwMJgmlUUNQAGgT
 af3KS70TwienHkdG8XZfVsQ=
X-Google-Smtp-Source: ABdhPJxWrf+AFOLydS3QL/cdCmgoG08Uh/rSVPpDcMqUO7MHLHlm/zfTafxeQ0CNyCiIKJf+lJj5Eg==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr23155649wrz.109.1610911588342; 
 Sun, 17 Jan 2021 11:26:28 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z3sm25943380wrn.59.2021.01.17.11.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 18/20] hw/core/qdev: Display warning for devices
 missing migration state
Date: Sun, 17 Jan 2021 20:24:44 +0100
Message-Id: <20210117192446.23753-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When built with --enable-qdev-debug, QEMU displays warnings
listing devices missing migration state:

  $ qemu-system-arm -S -M spitz
  qemu-system-arm: warning: missing migration state for type: 'pxa270-c0-arm-cpu'
  qemu-system-arm: warning: missing migration state for type: 'serial'
  qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcmcia'
  qemu-system-arm: warning: missing migration state for type: 'pxa2xx-pcmcia'
  qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c-slave'
  qemu-system-arm: warning: missing migration state for type: 'pxa2xx-i2c-slave'
  qemu-system-arm: warning: missing migration state for type: 'ads7846'
  qemu-system-arm: warning: missing migration state for type: 'max1111'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Unresolved issue:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg721700.html
Peter:
> I think where we'd like to get to is installing a migration
> blocker if the machine has any devices which don't have a vmsd.
> But for that we'd need to be pretty sure we'd got all the devices
> on machines where we care about migration, and we're clearly a
> fair way from that (eg we need to do something about the
> devices like the CPU which don't have a vmsd but handle their
> migration some other way so they don't trigger the condition
> for warning/migration-blocker).
---
 configure      | 10 ++++++++++
 meson.build    |  1 +
 hw/core/qdev.c |  5 +++++
 3 files changed, 16 insertions(+)

diff --git a/configure b/configure
index 155dda124c2..984befbb99d 100755
--- a/configure
+++ b/configure
@@ -383,6 +383,7 @@ blobs="true"
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
+qdev_debug="no"
 trace_backends="log"
 trace_file="trace"
 spice="$default_feature"
@@ -1005,6 +1006,10 @@ for opt do
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
+  --disable-qdev-debug) qdev_debug="no"
+  ;;
+  --enable-qdev-debug) qdev_debug="yes"
+  ;;
   --disable-virtfs) virtfs="disabled"
   ;;
   --enable-virtfs) virtfs="enabled"
@@ -1048,6 +1053,7 @@ for opt do
       debug="yes"
       strip_opt="no"
       fortify_source="no"
+      qdev_debug="yes"
   ;;
   --enable-sanitizers) sanitizers="yes"
   ;;
@@ -5912,6 +5918,10 @@ if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
 
+if test "$qdev_debug" = "yes" ; then
+  echo "CONFIG_QDEV_DEBUG=y" >> $config_host_mak
+fi
+
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
   echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 3d889857a09..545c8f9f88b 100644
--- a/meson.build
+++ b/meson.build
@@ -2472,6 +2472,7 @@
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
+summary_info += {'QDEV debugging':    config_host.has_key('CONFIG_QDEV_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index f0d0afd438d..9a73a242fa4 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -792,6 +792,11 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
                                                &local_err) < 0) {
                 goto post_realize_fail;
             }
+        } else {
+#ifdef CONFIG_QDEV_DEBUG
+            warn_report("missing migration state for type: '%s'",
+                        object_get_typename(OBJECT(dev)));
+#endif
         }
 
         /*
-- 
2.26.2


