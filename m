Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA46A0931
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB1V-00004z-MA; Thu, 23 Feb 2023 07:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzs-0004pn-0Q
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:52 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzc-0004ly-Ur
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xA7Dua4ghEDNfnVAJPmS5o2h3yVXNByfoTvYsGvEWRE=; b=VelWGnxHg7zGq+JFivP/m0vMOJ
 oIBYBNQ0krT1TwjSa/Ckcq5IKLzok7DiIJaO3pkF6VU3o+6J8gJjY+RrQ/GAtaU2LdJ0/GtguDSXH
 5i/PYJqe6Yw2TGtz6noHMrsO9Ny6RkLZT4qlF+uAJirM03elVbqPCBmBM2ZczNWmQm8tB1gKebbUE
 YCNY8Q6Fln+jgd6/UvPGT+PUUzWeuKDZnYJVGYfUFMu6JBedaUzyp3xABP/DV9OOkBc6Vq8hKevdH
 FKilNxojQRysUq/FPCkgd+VS+HDZHu09Bk0v/6KX1qeeE3hoER3RGJbuMxjV1YuQqD0TR8ogAtrOU
 MMqeCi5Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pVAzH-00CujN-1V; Thu, 23 Feb 2023 12:46:15 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzH-00DYoi-17; Thu, 23 Feb 2023 12:46:15 +0000
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
Subject: [PATCH v13 02/60] xen: add CONFIG_XEN_BUS and CONFIG_XEN_EMU options
 for Xen emulation
Date: Thu, 23 Feb 2023 12:45:15 +0000
Message-Id: <20230223124613.3231331-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
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

The XEN_EMU option will cover core Xen support in target/, which exists
only for x86 with KVM today but could theoretically also be implemented
on Arm/Aarch64 and with TCG or other accelerators (if anyone wants to
run the gauntlet of struct layout compatibility, errno mapping, and the
rest of that fui).

It will also cover the support for architecture-independent grant table
and event channel support which will be added in hw/i386/kvm/ (on the
basis that the non-KVM support is very theoretical and making it not use
KVM directly seems like gratuitous overengineering at this point).

The XEN_BUS option is for the xenfv platform support, which will now be
used both by XEN_EMU and by real Xen.

The XEN option remains dependent on the Xen runtime libraries, and covers
support for real Xen. Some code which currently resides under CONFIG_XEN
will be moving to CONFIG_XEN_BUS over time as the direct dependencies on
Xen runtime libraries are eliminated. The Xen PCI platform device will
also reside under CONFIG_XEN_BUS.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/Kconfig      | 1 +
 hw/i386/Kconfig | 5 +++++
 hw/xen/Kconfig  | 3 +++
 meson.build     | 1 +
 4 files changed, 10 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/hw/Kconfig b/hw/Kconfig
index 38233bbb0f..ba62ff6417 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source tpm/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source xen/Kconfig
 source watchdog/Kconfig
 
 # arch Kconfig
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 9fbfe748b5..d40802d83f 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -136,3 +136,8 @@ config VMPORT
 config VMMOUSE
     bool
     depends on VMPORT
+
+config XEN_EMU
+    bool
+    default y
+    depends on KVM && (I386 || X86_64)
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 0000000000..3467efb986
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,3 @@
+config XEN_BUS
+    bool
+    default y if (XEN || XEN_EMU)
diff --git a/meson.build b/meson.build
index bc7e5b1d15..d1293305fc 100644
--- a/meson.build
+++ b/meson.build
@@ -3847,6 +3847,7 @@ if have_system
   if xen.found()
     summary_info += {'xen ctrl version':  xen.version()}
   endif
+  summary_info += {'Xen emulation':     config_all.has_key('CONFIG_XEN_EMU')}
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
-- 
2.39.0


