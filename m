Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16CF11CE57
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:31:56 +0100 (CET)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifOZO-0000Fl-Sg
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyY-0003ot-NO
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyX-00078w-Ds
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33611)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNyX-00076r-6b
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id b6so2660446wrq.0
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbod70QFVH0c994XIXE4cM47ECszyQsoWIS+2slZOD8=;
 b=ZxRRYJb2AM1p7UP6XB2wXAdj8ZsyDNAqOYzj+JAmA0Yvkee1PpNv+c9tx7w4wLpO72
 2xNn0xmiBM4FYml3LSUshemre+qKnpMALjPf33kps/ag8bz4wgVz6K60uDyOz2y83Bo5
 INIfwqtfgCNUN8JcMvpODvCLRFmUFUqaKuXTwAIxNy/abW7eV7AhX19ZpzTDz0JMHCeN
 osn4psps4hpB/DB4ztz2t7JJ+TNAQCWPzRjtpTKNTFJW3JRNfLfVYQeUKEfk3w6bYG0B
 T8wabGJiq66hfTlfFfwU18/n+kBp2SToWN/SzeyROGWYV6IH2qP5a2IiL9LMbb3kQwUX
 OwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gbod70QFVH0c994XIXE4cM47ECszyQsoWIS+2slZOD8=;
 b=e9PitdW7/Ei0sSR6rZXAnyDe53XBnjzD4GKaJD7pLQPyZREybMJMf4nVm/rFElZSxX
 dSC0qT7x49GjVLnXQB9XJ1p6iTMmky3cpwxPidRAh9Q7YL8LKl7SY6G5LOlQ9hVRvNRu
 Yqa/2DV20/6iTRcsMS2ZFsQYa2Z6ZCtPk/IOM/PzxLPtCX9D6ODPI1QZTzX67kgXTIxz
 RiqfPx7G/v8sahMtNj/yJzeaMizRkYrGQy1CbT8QgrZUKfrJny2j8j2Z+Bz94MkHWVQA
 +aFW1OntHqRGGXdSBos/Wd+cjjdx6WBANAp81QL7d5sCsml4Nxe0MAc4DJwLZlBnOq8e
 BTRQ==
X-Gm-Message-State: APjAAAWTvxn9FVAKoiJRSV7VHM9tNeXcS+0Bu1aPX4i1k95uGgRl8Ngo
 DKi8gwLXHyKlA37IRC7OaKrq6sud
X-Google-Smtp-Source: APXvYqwO49zyVjEBRXSJc5nyC51fW9GbKh32D3zruMH+NfbyFG6isVXRjgX4D15XXhVdKmBYR3SwPg==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr6526157wrx.304.1576155227922; 
 Thu, 12 Dec 2019 04:53:47 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 050/132] meson: convert trace/
Date: Thu, 12 Dec 2019 13:51:34 +0100
Message-Id: <1576155176-2464-51-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
 Makefile.objs       | 4 ----
 trace/Makefile.objs | 8 --------
 trace/meson.build   | 5 ++++-
 3 files changed, 4 insertions(+), 13 deletions(-)
 delete mode 100644 trace/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index 307e27c..e9ae889 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -77,7 +77,3 @@ common-obj-y += disas/
 ######################################################################
 # Resource file for Windows executables
 version-obj-$(CONFIG_WIN32) += $(BUILD_DIR)/version.o
-
-######################################################################
-# tracing
-util-obj-y +=  trace/
diff --git a/trace/Makefile.objs b/trace/Makefile.objs
deleted file mode 100644
index a429474..0000000
--- a/trace/Makefile.objs
+++ /dev/null
@@ -1,8 +0,0 @@
-# -*- mode: makefile -*-
-
-
-##################################################
-# Translation level
-
-obj-y += generated-helpers.o
-obj-y += control-target.o
diff --git a/trace/meson.build b/trace/meson.build
index 8ea8db7..b113425 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -1,3 +1,5 @@
+specific_ss.add(files('control-target.c'))
+
 # common options
 tracetool = [
   find_program('scripts/tracetool.py'),
@@ -67,12 +69,13 @@ foreach d : [
   ['generated-helpers.h', 'tcg-helper-h'],
   ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
 ]
-  custom_target(d[0],
+  gen = custom_target(d[0],
                 output: d[0],
                 input: meson.source_root() / 'trace-events',
                 command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
                 build_by_default: true, # to be removed when added to a target
                 capture: true)
+  specific_ss.add(gen)
 endforeach
 
 if 'CONFIG_TRACE_UST' in config_host
-- 
1.8.3.1



