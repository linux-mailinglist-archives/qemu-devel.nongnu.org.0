Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D084F11CFF0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 15:35:21 +0100 (CET)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifPYm-00022K-N9
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 09:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifPU9-0005j6-Gm
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifPU8-0008Hr-Dy
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:33 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifPU8-0008ED-5L
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 09:30:32 -0500
Received: by mail-wr1-x443.google.com with SMTP id q10so2927591wrm.11
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AMjvcNPBoUuuvyW0xFxWLMl0K4YTz84fMxF1PXSjs+g=;
 b=V3woC/Ai+to45VtBcnzzCPnDn5J2Tx/HELG9Hv4qeLsNz94Rx4SMO0zfwRjp7OJtxh
 wP6VHom/0p/uYDCxG9J76Q69Th7Osx3dL0TK8ud+OQuAtvtCE9yFDL++TCMzP5/CTFER
 ZZEpsEBupgMayd9Y3eVljOLpSBjrB++Y6Z5+W1e8Ey12cC3kYNyhIiC8y8ahYGNa/Q7j
 8JMjv28JfpNUa9b98w+MGnJMpnbxRsKdp0tHizrNGhCrfU1IIpmXNczzVTH778SzZcGe
 QivmlibZ2HKilgCIhFdpU95GaAKHNe5BLSE0o1zwOelcRjv+iqcMi5xO3iPJFhhUWX48
 WUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=AMjvcNPBoUuuvyW0xFxWLMl0K4YTz84fMxF1PXSjs+g=;
 b=iAGZGl2G9uQ0gZMgiPmxW7g5efjLx7Tv2Z/gSoi/WI9agajKhlFMEFBROY8W5/nmKX
 3IfxAN/U8iAL2+F5N6AGse4kIpYCNeAagUIJr5SGi8zuufjRjqdYIz/gunB7tiku7eS8
 B6gDqE0QNB1YppKQ3gFMV3HOZ5yx2yiYx5MI34nWLQSTXMU444uv4b2+cFVLipGBmtNd
 SxO0C5STeXFcNRbR1QWcBcyvNUDWiDpB4Ab36HW6UStjM7OpW966Kzat7RqoD4sF30GD
 NvD0BBS2Uu2nQ83Cjlzrjqhrf60IwMMorZ/PMc+14n/tVqRyalBbC5t3Osm62SZD8G8M
 EpXw==
X-Gm-Message-State: APjAAAWzgtX4EE9HolGz6g6tsbZcdu5yeumRPFalxozyjMiCA/mMYiWn
 tQphHhV9U/wZrlkOiZ3P97sacc6Y
X-Google-Smtp-Source: APXvYqxzty0wBaMMtq46x1EQbyue6L7gYwJs6KdMGZcf1ukK3LNIhE3k4fvLINxTzmgJwZ2WWWuL8w==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr6568723wrx.102.1576161028182; 
 Thu, 12 Dec 2019 06:30:28 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c9sm6140505wmc.47.2019.12.12.06.30.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 06:30:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] kvm: check before accessing PCMachineState fields
Date: Thu, 12 Dec 2019 15:30:21 +0100
Message-Id: <1576161021-5359-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576161021-5359-1-git-send-email-pbonzini@redhat.com>
References: <1576161021-5359-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: philmd@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 roms/SLOF         |  2 +-
 target/i386/kvm.c | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/roms/SLOF b/roms/SLOF
index 8ebf2f5..bcc3c4e 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 8ebf2f55e1ba1492b942ba4b682160e644fc0f98
+Subproject commit bcc3c4e5c21a015f4680894c4ec978a90d4a2d69
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index ef63f3a..2ad5a94 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -49,6 +49,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "trace.h"
+#include "config-devices.h"
 
 //#define DEBUG_KVM
 
@@ -2172,9 +2173,15 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    if (kvm_check_extension(s, KVM_CAP_X86_SMM) &&
+    if (
+#ifdef CONFIG_PC
+        kvm_check_extension(s, KVM_CAP_X86_SMM) &&
         object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE) &&
-        pc_machine_is_smm_enabled(PC_MACHINE(ms))) {
+        pc_machine_is_smm_enabled(PC_MACHINE(ms))
+#else
+	0
+#endif
+       ) {
         smram_machine_done.notify = register_smram_listener;
         qemu_add_machine_init_done_notifier(&smram_machine_done);
     }
-- 
1.8.3.1


