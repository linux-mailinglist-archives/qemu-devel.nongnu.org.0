Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61587422F61
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:49:44 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoZT-0006Xb-C2
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYA-0007oF-4e
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY5-0003sj-Nz
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p11so1202723edy.10
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6TvpJNG/slIkrin+hkmKbZdjUk1wAScZU5uZgiSk3LM=;
 b=OY1UkgI1s5xhY025AvIlekdoZMVej7SY/E96hmzpCHROBJGfujvWMIVkQWfMfcOkts
 q99ITR1WLDzIbj77LCmAomgcCqym379slZmll/w4Aot7Uhdwh5B46KFB2HP+LmSrqLUR
 skG/+hPfk7EF9FNx2+SRPIbhETbIdqJrR1xRKQNvSTPwYg9BHxYz1r9HSHC49JmjtFaT
 u2VUvlzIUZiW5/w0R1POp0Kx9VCXoBwnYpWOyYfu9PhFi4X1HPUunJZiDtlMn5cdiuVx
 kGjfnbRW1xD9YDKuNWPTnQZ/tf81FKBXBPBaCAqFYPY3HqH6PPGUXakWdJgPLN8lWvvR
 Hapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6TvpJNG/slIkrin+hkmKbZdjUk1wAScZU5uZgiSk3LM=;
 b=Te+8M0R658vcPohG6FfT2CwpSA+zsgTUbuvKWALZfo2jskJGy5JcoLto8g51KK1RIa
 c+YADmYFXUIY3Wv36xldeZTNW3i0qZlktesnLQob7L96Qyl30+Xc/c2KuzGZ7pCFkJkJ
 ey7jnLGDWZGg+bUsWtkRmdqpUHmncobg/6A2hvInfpSwtESYs41c8zfoHetvZxGAgdM3
 glFnzCg190jgbejF9uE+XBCdx/8M6i8HuqqqWHj9SJKyrsmQbZH0IqO6jkKcVZt6s2m+
 xRzv+vtZrg9O0DCPz0vz4u+hklPxw4zc8Qqd2f3gUkC05oRXbLuvVDv/OtO5pdnaiGeB
 qsbg==
X-Gm-Message-State: AOAM530fJ6Gh+LGYkG85rdrDKGyMm2MamCvIw5g3XBm0GDwM4r6e7Knn
 cd3dWY9U/DAOHPSaOrQcHuk+MSaX5rQ=
X-Google-Smtp-Source: ABdhPJyKUTiej7y/KMy++BFFEV8jzjVHqDl8RDIk0mLgk2WylrVPLzaidoqQaF5AQuQQuUxtB3XLew==
X-Received: by 2002:aa7:d7d2:: with SMTP id e18mr5880900eds.126.1633452252172; 
 Tue, 05 Oct 2021 09:44:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] i386: docs: Briefly describe KVM PV features
Date: Tue,  5 Oct 2021 18:43:57 +0200
Message-Id: <20211005164408.288128-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

KVM PV features don't seem to be documented anywhere, in particular, the
fact that some of the features are enabled by default and some are not can
only be figured out from the code.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20211004140445.624875-1-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/i386/kvm-pv.rst | 100 ++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 docs/system/i386/kvm-pv.rst

diff --git a/docs/system/i386/kvm-pv.rst b/docs/system/i386/kvm-pv.rst
new file mode 100644
index 0000000000..1e5a9923ef
--- /dev/null
+++ b/docs/system/i386/kvm-pv.rst
@@ -0,0 +1,100 @@
+Paravirtualized KVM features
+============================
+
+Description
+-----------
+
+In some cases when implementing hardware interfaces in software is slow, ``KVM``
+implements its own paravirtualized interfaces.
+
+Setup
+-----
+
+Paravirtualized ``KVM`` features are represented as CPU flags. The following
+features are enabled by default for any CPU model when ``KVM`` acceleration is
+enabled:
+
+- ``kvmclock``
+- ``kvm-nopiodelay``
+- ``kvm-asyncpf``
+- ``kvm-steal-time``
+- ``kvm-pv-eoi``
+- ``kvmclock-stable-bit``
+
+``kvm-msi-ext-dest-id`` feature is enabled by default in x2apic mode with split
+irqchip (e.g. "-machine ...,kernel-irqchip=split -cpu ...,x2apic").
+
+Note: when CPU model ``host`` is used, QEMU passes through all supported
+paravirtualized ``KVM`` features to the guest.
+
+Existing features
+-----------------
+
+``kvmclock``
+  Expose a ``KVM`` specific paravirtualized clocksource to the guest. Supported
+  since Linux v2.6.26.
+
+``kvm-nopiodelay``
+  The guest doesn't need to perform delays on PIO operations. Supported since
+  Linux v2.6.26.
+
+``kvm-mmu``
+  This feature is deprecated.
+
+``kvm-asyncpf``
+  Enable asynchronous page fault mechanism. Supported since Linux v2.6.38.
+  Note: since Linux v5.10 the feature is deprecated and not enabled by ``KVM``.
+  Use ``kvm-asyncpf-int`` instead.
+
+``kvm-steal-time``
+  Enable stolen (when guest vCPU is not running) time accounting. Supported
+  since Linux v3.1.
+
+``kvm-pv-eoi``
+  Enable paravirtualized end-of-interrupt signaling. Supported since Linux
+  v3.10.
+
+``kvm-pv-unhalt``
+  Enable paravirtualized spinlocks support. Supported since Linux v3.12.
+
+``kvm-pv-tlb-flush``
+  Enable paravirtualized TLB flush mechanism. Supported since Linux v4.16.
+
+``kvm-pv-ipi``
+  Enable paravirtualized IPI mechanism. Supported since Linux v4.19.
+
+``kvm-poll-control``
+  Enable host-side polling on HLT control from the guest. Supported since Linux
+  v5.10.
+
+``kvm-pv-sched-yield``
+  Enable paravirtualized sched yield feature. Supported since Linux v5.10.
+
+``kvm-asyncpf-int``
+  Enable interrupt based asynchronous page fault mechanism. Supported since Linux
+  v5.10.
+
+``kvm-msi-ext-dest-id``
+  Support 'Extended Destination ID' for external interrupts. The feature allows
+  to use up to 32768 CPUs without IRQ remapping (but other limits may apply making
+  the number of supported vCPUs for a given configuration lower). Supported since
+  Linux v5.10.
+
+``kvmclock-stable-bit``
+  Tell the guest that guest visible TSC value can be fully trusted for kvmclock
+  computations and no warps are expected. Supported since Linux v2.6.35.
+
+Supplementary features
+----------------------
+
+``kvm-pv-enforce-cpuid``
+  Limit the supported paravirtualized feature set to the exposed features only.
+  Note, by default, ``KVM`` allows the guest to use all currently supported
+  paravirtualized features even when they were not announced in guest visible
+  CPUIDs. Supported since Linux v5.10.
+
+
+Useful links
+------------
+
+Please refer to Documentation/virt/kvm in Linux for additional details.
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 6a86d63863..4daa53c35d 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -26,6 +26,7 @@ Architectural features
    :maxdepth: 1
 
    i386/cpu
+   i386/kvm-pv
    i386/sgx
 
 .. _pcsys_005freq:
-- 
2.31.1



