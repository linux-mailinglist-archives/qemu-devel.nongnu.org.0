Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CCA32F97C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:56:37 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUbs-0007XH-6m
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZl-0005jh-Si
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZk-00082n-DY
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:25 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so815849wmj.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ycvxrc0S0t4ZZdoFTT/9bcQDSOzyv09fTX9F1ppHwE=;
 b=B/+qJoMOZxnQCuMgI5fnQP8DJ3pHO2RO/UKpcbiAPpgDcDmgRpe11dmLPfcgaJHhHx
 O8uwW0bGl3vdwl7LvjLPKayJmiDItdlLS2vILaRuyCQwB8wbN6bm6WYyJyCpy/H3Je7u
 k7tE0FuvVfVVDq/y/ybIsbgyI6Jb7eeemk6nwk5eOodZheHpLYMSG5z34znFMpBLcI6+
 HOsJ4Y5lCpc090YT/S9i6jTGmI+s61GqZBf3FNY+WQ+baHQZmkPxPLkBfr9XmiWMdTaf
 mDYcoR+bmhyCRUZs5KqEVV7Wmt1pDiOeqk2Q7dNnsOsuneIB0JsyD5h2wD23Xv5H2RWQ
 ctRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5ycvxrc0S0t4ZZdoFTT/9bcQDSOzyv09fTX9F1ppHwE=;
 b=TiJHrCGIUNyX6GH8n0N5xzk7e5buI+8LW+/0TP0T3oKUH4qwFddx9YB2Z7Abk+4wi8
 scXZjsO7xqMT3OM9sAeGKhXeIC0CuJtgnYBMODmDdSu/hqidlHltYPHTmyMnZxldw8dL
 pp1PAcINGchVZyX32MjjD9n2joOZy8mgRQ8NA7T+tRbQEM7BFhS5/7m1wINuUcaLs+pf
 X6BMqsfNIWm+2Xf3UonQY0666zPMW1VM3jbdTv019zYW7CX3KhQzmKJx7rIq/gzPsRLr
 q6yK39z6teg5z7JVbfiJKR1Zzi4XyrwkBtBMc+NDtdyMwzDXh6idXMzVoh62Ij5fJLEZ
 FoLQ==
X-Gm-Message-State: AOAM533fOyo1cYJrroszw7HEUk+5OHzx4AcSqJTAWEoYmOTKSdj+fp2/
 +PioZnUwNyXc9Lmg7b+uB+z42TIizqI=
X-Google-Smtp-Source: ABdhPJziQzTrRjeoksWHDtFecY4OKaNvtdOj5Cbr1Lcl8FrjdBKAuDFi0+cp2DwGS/Puk0lxgp6vVQ==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr13048323wmf.96.1615028063028; 
 Sat, 06 Mar 2021 02:54:23 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] KVM: x86: deprecate -M kernel-irqchip=off except for -M
 isapc
Date: Sat,  6 Mar 2021 11:53:58 +0100
Message-Id: <20210306105419.110503-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The userspace local APIC is basically untested and does not support many
features such as TSC deadline timer, x2APIC or PV spinlocks.  On the
other hand, the PIT and IOAPIC are okay as they are not tied to
the processor and are tested with -M kernel-irqchip=split.

Therefore, deprecate the local APIC and, with it, limit
-M kernel-irqchip=off to the ISA PC machine type, which does not
have a local APIC at all.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 7 +++++++
 hw/intc/apic.c             | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 561c916da2..fcf0ca4068 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -153,6 +153,13 @@ The ``-writeconfig`` option is not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and deprecated, with no current replacement.
 
+Userspace local APIC with KVM (x86, since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
+APIC is deprecated.  The ``split`` setting is supported, as is using
+``-M kernel-irqchip=off`` with the ISA PC machine type.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3ada22f427..f4f50f974e 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -25,6 +25,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/pci/msi.h"
 #include "qemu/host-utils.h"
+#include "sysemu/kvm.h"
 #include "trace.h"
 #include "hw/i386/apic-msidef.h"
 #include "qapi/error.h"
@@ -875,6 +876,11 @@ static void apic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (kvm_enabled()) {
+        warn_report("Userspace local APIC is deprecated for KVM.");
+        warn_report("Do not use kernel-irqchip except for the -M isapc machine type.");
+    }
+
     memory_region_init_io(&s->io_memory, OBJECT(s), &apic_io_ops, s, "apic-msi",
                           APIC_SPACE_SIZE);
 
-- 
2.29.2



