Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11316327D23
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:25:51 +0100 (CET)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGggQ-0006o8-2n
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lGgYP-0001fk-9Z
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:17:33 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lGgYN-0002W1-Gu
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:17:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 y22-20020a1c4b160000b029010b2094f5deso2797818wma.0
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rz+BlZ1jCNDHOdzOOV3X5750OfsXEdMI5Nlv6I3/0MY=;
 b=SabdyuO7yLecf8pEtXhCAput0wiCA+GCMqYZRlDQXk7H2nERWdSri8WsVOceVSDJVv
 MVjTp8HDLIoAjS7r05eQHMbGhWbZC3iCajaqTAdKp5v+JyfqblA6kxhETot5iIeA5MyM
 3GK4sio5OLJ2vGSCjvcjUyYw2tHVfYEY7pFf4UX1E1hEwBQb4RllvVFpNosx+67SoyM6
 v6EEjUFGPsdNLlqJ5rZThKoadFuR4wXNhiSomW9kNB88E0dGf0BrpCgd+xodLPLU0x1C
 mbdX1TXmutJPF7CdyoJNfQc+0p7eHPrXSBwZDWkj3oKEtXhE0Q9cScEarbo1trOKSyD0
 jgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rz+BlZ1jCNDHOdzOOV3X5750OfsXEdMI5Nlv6I3/0MY=;
 b=I3KhnvvdvJD+28oyZWY/W0KqWVc120ZMvsriIJlmSWC4cMunyHc/xwqtUH2rIijrTj
 Nz9T2P2MsCt92KDReYQjUfdcbtiTsNJ42eNeYmZnv+UJEBxR0QU8uKtaWRRivk0UIFXy
 Zo6S+9ZTgLy4hLFeSwO7LWEcG2ALjafA0yCZT0jsmR2mHZrv83rMmdAfdepW1p27nLeR
 Jd8fwMADlxSZ5ztkTR93wofQfY7xeELBsLc0jUP2XRnp1z5rIz5MoTIUDcNlYPgQXXFL
 6kLhdBdiYFLHdPjrSdqhaCcBgnxg4Y9BCRooDgXneofoyDyZBcMIPNeLuODqRAetjxWr
 2H7Q==
X-Gm-Message-State: AOAM533gmdrRXec7iieZ/M4v4eWuqgapiDmqM13GmihfR+lV1JgAp8jr
 AKGBGDx1a4OB4R+x87z8lHSabiVeYOw=
X-Google-Smtp-Source: ABdhPJzwCbZmOvbMQ5pW8J7JRyz1D7wUgR6Az395O3wPeuEn7+/yEA765rGXJiWUqSC4oDoAaOFpNw==
X-Received: by 2002:a1c:7fc6:: with SMTP id
 a189mr15318334wmd.169.1614597447889; 
 Mon, 01 Mar 2021 03:17:27 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r9sm20551660wmq.26.2021.03.01.03.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:17:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: x86: deprecate -M kernel-irqchip=off except for -M isapc
Date: Mon,  1 Mar 2021 12:17:25 +0100
Message-Id: <20210301111725.18434-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The userspace local APIC is basically untested and does not support many
features such as TSC deadline timer, x2APIC or PV spinlocks.  On the
other hand, the PIT and IOAPIC are okay as they are not tied to
the processor and are tested with -M kernel-irqchip=split.

Therefore, deprecate the local APIC and, with it, limit
-M kernel-irqchip=off to the ISA PC machine type, which does not
have a local APIC at all.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 7 +++++++
 hw/intc/apic.c             | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 561c916da2..ae180dc887 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -153,6 +153,13 @@ The ``-writeconfig`` option is not able to serialize the entire contents
 of the QEMU command line.  It is thus considered a failed experiment
 and deprecated, with no current replacement.
 
+Userspace local APIC with KVM (x86, since 6.0)
+'''''''''''''''''''''''''''''''''''''''''
+
+Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
+APIC is deprecated.  The ``split`` setting is supported, as is using
+``-M kernel-irqchip=off`` with the ISA PC machine type.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3ada22f427..7e9601b89d 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -875,6 +875,11 @@ static void apic_realize(DeviceState *dev, Error **errp)
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


