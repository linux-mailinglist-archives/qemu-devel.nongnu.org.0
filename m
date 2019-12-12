Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755B411CE86
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:40:10 +0100 (CET)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifOhN-0002hE-9B
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyl-00047s-51
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyj-0007Y4-UW
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:02 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39313)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNyj-0007WI-Nh
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:54:01 -0500
Received: by mail-wr1-x442.google.com with SMTP id y11so2614572wrt.6
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=syJqPmkvJMmzIU8/98Xe13xx4bSEe0J6m0yTSrxfhOA=;
 b=DqKNEYE+2yxjHvOZAU+E8QKL5yav38LW2Q1/rO7yONRFFHdui5Gi2ER9E8kDy8ambK
 DSmKPSdzYl/iXUya2Zo5ydqDqg8yDyyHJS6E+mi/RUrcq97cfOcssP6vwoCvdPDIN59A
 g9x9HR/yap8+l4nodDFWc3uA4OxHeLxJ9ovW3f+yYBDIZH/lVOEjT5gGjk6DshIUoTAL
 0W1s4oTDfDFoVHppHnvosaLQ+UmZe2dXmozER1tPI2A/Cc2hLuWazqKK4p/Dcm8o+jLn
 8EIaacLJzotT/LSumpIXcmUBm/Rl8icDqYJLDqMOog/rYyfzMbL5AcGnUXmMOMZw0NAZ
 HpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=syJqPmkvJMmzIU8/98Xe13xx4bSEe0J6m0yTSrxfhOA=;
 b=iQuDXgmcww7kRu6EMuzHxR7SjimyY6U0rLfysO3xoD5uKKwXtsXDkyNUjAoJP6s19s
 04yHv4t9JIaA0hKB6Ogy7Bu7XoCz1RdYcOzRPL5wFOQd/hSW2yxuHh4gslm4QRIGPRby
 HAou/H9DEx/6qta1kprWlMClJDtIJDk3qAx4RCXPEWh9qcYehU9BMfWw+kyjvG90fxgj
 VMmx5wbu3AaPyfhSYTgHiVIiyIPthsqjERBqLZFg1euC8MiMhTLFrRsqHOeNYd2TVdNQ
 iNH3UIGJ/pYuwmRQAGVQUqjQYyiJOAHmA9eLDQmwQJx6CQCixdeWA4/xt0TmQbkg5CD+
 H+fw==
X-Gm-Message-State: APjAAAXf4kpeGXC+roKeeiRCn4Nn8Rmtv3PnRIPDWiV+YHfrWLM8Lu9V
 8CXiBF2Iiulcio5yN2kXTP5OvjZ7
X-Google-Smtp-Source: APXvYqzaRwkMRKT2//tDyuphSKlcbksWqEXrm5cWTb6rk4WYCs01cW6KSB48ZT+X0rysGthlMx9wmA==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr5873056wri.95.1576155240488; 
 Thu, 12 Dec 2019 04:54:00 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 062/132] meson: convert qapi-specific to meson
Date: Thu, 12 Dec 2019 13:51:46 +0100
Message-Id: <1576155176-2464-63-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Makefile.target    |  1 -
 qapi/Makefile.objs | 11 -----------
 qapi/meson.build   | 21 +++++++++++++++++++--
 3 files changed, 19 insertions(+), 14 deletions(-)
 delete mode 100644 qapi/Makefile.objs

diff --git a/Makefile.target b/Makefile.target
index e025246..c2fcb22 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -154,7 +154,6 @@ ifdef CONFIG_SOFTMMU
 obj-y += arch_init.o cpus.o gdbstub.o balloon.o ioport.o
 obj-y += qtest.o
 obj-y += hw/
-obj-y += qapi/
 obj-y += memory.o
 obj-y += memory_mapping.o
 LIBS := $(libs_softmmu) $(LIBS)
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
deleted file mode 100644
index 10ca4f6..0000000
--- a/qapi/Makefile.objs
+++ /dev/null
@@ -1,11 +0,0 @@
-QAPI_TARGET_MODULES = machine-target misc-target
-
-obj-y = qapi-introspect.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-types-%.o)
-obj-y += qapi-types.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-visit-%.o)
-obj-y += qapi-visit.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-events-%.o)
-obj-y += qapi-events.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-commands-%.o)
-obj-y += qapi-commands.o
diff --git a/qapi/meson.build b/qapi/meson.build
index 8431f26..4a335d9 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -67,11 +67,17 @@ foreach module : qapi_common_modules + qapi_target_modules
   endif
 endforeach
 
-qapi_all_outputs += [
+qapi_specific_outputs = [
   'qapi-introspect.c', 'qapi-introspect.h',
-  'qapi-doc.texi'
+  'qapi-types.c', 'qapi-types.h',
+  'qapi-visit.c', 'qapi-visit.h',
+  'qapi-events.c', 'qapi-events.h',
+  'qapi-commands.c', 'qapi-commands.h',
 ]
 
+qapi_all_outputs += qapi_specific_outputs
+qapi_all_outputs += 'qapi-doc.texi'
+
 qapi_files = custom_target('QAPI files',
   output: qapi_all_outputs,
   input: [ files('qapi-schema.json') ],
@@ -87,3 +93,14 @@ foreach output : qapi_util_outputs
   endif
   i = i + 1
 endforeach
+
+i = 0
+foreach output : qapi_all_outputs
+  if output in qapi_specific_outputs
+    specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
+  endif
+  if output.endswith('-target.c')
+    specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
+  endif
+  i = i + 1
+endforeach
-- 
1.8.3.1



