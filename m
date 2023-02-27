Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6986A44D0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:40:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeX4-0007wp-Lw; Mon, 27 Feb 2023 09:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVd-0005Mx-9v
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:50 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVN-0004WT-64
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ejCxozW2KDZscOQD34pHUDLwOlSsEPfmXxQc/b+wYQc=; b=kKKVow+wNSBEHFWXxm2rmxVOqa
 ANkkUH2GSdgncY3oXjjJG79gK7vBwYDPEIO8N1BM2tuQz43rggxiR2D+dxpbZxSL72e5O2YYxeUWM
 jGDjPvOUXrpgxeg3ZxysQWvae2LtAiuiqg97mE4hXkWI5bMqUytDleSt/wJejHHsZ12MPJeb/Sw/e
 b3jOAaH75j6F/0EWuPirGiWTvPXkdZLweV2lazqBF71Zhn+6KTUqe6ca/JbbdqGJxC+ONQMQ9Ly70
 dSJVJ264s2tEWM6UoW/LXhRR3DQmCCYy0qYatNl59/DOC/WWzxsE2rgnPwOk5oedcg5cKjJOGnfZ5
 WaZpwuFA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pWeV8-000AUY-91; Mon, 27 Feb 2023 14:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV8-0027EF-0n; Mon, 27 Feb 2023 14:29:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v14 59/60] i386/xen: Document Xen HVM emulation
Date: Mon, 27 Feb 2023 14:29:07 +0000
Message-Id: <20230227142908.503517-60-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw2@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 docs/system/i386/xen.rst    | 76 +++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 docs/system/i386/xen.rst

diff --git a/docs/system/i386/xen.rst b/docs/system/i386/xen.rst
new file mode 100644
index 0000000000..a00523b492
--- /dev/null
+++ b/docs/system/i386/xen.rst
@@ -0,0 +1,76 @@
+Xen HVM guest support
+=====================
+
+
+Description
+-----------
+
+KVM has support for hosting Xen guests, intercepting Xen hypercalls and event
+channel (Xen PV interrupt) delivery. This allows guests which expect to be
+run under Xen to be hosted in QEMU under Linux/KVM instead.
+
+Setup
+-----
+
+Xen mode is enabled by setting the ``xen-version`` property of the KVM
+accelerator, for example for Xen 4.10:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x4000a
+
+Additionally, virtual APIC support can be advertised to the guest through the
+``xen-vapic`` CPU flag:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x4000a --cpu host,+xen_vapic
+
+When Xen support is enabled, QEMU changes hypervisor identification (CPUID
+0x40000000..0x4000000A) to Xen. The KVM identification and features are not
+advertised to a Xen guest. If Hyper-V is also enabled, the Xen identification
+moves to leaves 0x40000100..0x4000010A.
+
+The Xen platform device is enabled automatically for a Xen guest. This allows
+a guest to unplug all emulated devices, in order to use Xen PV block and network
+drivers instead. Note that until the Xen PV device back ends are enabled to work
+with Xen mode in QEMU, that is unlikely to cause significant joy. Linux guests
+can be dissuaded from this by adding 'xen_emul_unplug=never' on their command
+line, and it can also be noted that AHCI disk controllers are exempt from being
+unplugged, as are passthrough VFIO PCI devices.
+
+Properties
+----------
+
+The following properties exist on the KVM accelerator object:
+
+``xen-version``
+  This property contains the Xen version in ``XENVER_version`` form, with the
+  major version in the top 16 bits and the minor version in the low 16 bits.
+  Setting this property enables the Xen guest support.
+
+``xen-evtchn-max-pirq``
+  Xen PIRQs represent an emulated physical interrupt, either GSI or MSI, which
+  can be routed to an event channel instead of to the emulated I/O or local
+  APIC. By default, QEMU permits only 256 PIRQs because this allows maximum
+  compatibility with 32-bit MSI where the higher bits of the PIRQ# would need
+  to be in the upper 64 bits of the MSI message. For guests with large numbers
+  of PCI devices (and none which are limited to 32-bit addressing) it may be
+  desirable to increase this value.
+
+``xen-gnttab-max-frames``
+  Xen grant tables are the means by which a Xen guest grants access to its
+  memory for PV back ends (disk, network, etc.). Since QEMU only supports v1
+  grant tables which are 8 bytes in size, each page (each frame) of the grant
+  table can reference 512 pages of guest memory. The default number of frames
+  is 64, allowing for 32768 pages of guest memory to be accessed by PV backends
+  through simultaneous grants. For guests with large numbers of PV devices and
+  high throughput, it may be desirable to increase this value.
+
+OS requirements
+---------------
+
+The minimal Xen support in the KVM accelerator requires the host to be running
+Linux v5.12 or newer. Later versions add optimisations: Linux v5.17 added
+acceleration of interrupt delivery via the Xen PIRQ mechanism, and Linux v5.19
+accelerated Xen PV timers and inter-processor interrupts (IPIs).
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index e64c013077..77c2f3b979 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -27,6 +27,7 @@ Architectural features
 
    i386/cpu
    i386/hyperv
+   i386/xen
    i386/kvm-pv
    i386/sgx
    i386/amd-memory-encryption
-- 
2.39.0


