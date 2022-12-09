Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1A648089
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:59:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a7w-0002dD-Ke; Fri, 09 Dec 2022 04:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7M-0002SS-Kc
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7H-0006pN-P9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0n0bVmDrZ2FHFtVoaKgdD/a3Eqg4PTanH9cZE1aPtpc=; b=ZRav8D8jLvxx6lBluVsjooCnEs
 q8Uv4/u/8KrFHIzrZRt4SbA/q+b7/DQKr5YExYSvyNY7oAeSIZZXz37ibaFYVWd7GvW/c7vzdJ3HR
 lxh0mIK6dIcMOairWI1BEyzcFHkn/3ZePO0TmNSN9FiP2MrwjyVMRgOdQ/Cm/Kb0yCFFjdCQn/Cyi
 WkKUd3eMngRTFR8unin+a5Cj8fRhCTs9mo46GdP8bgtUDku97OyGrD7EYQ18zEk2W4QCXYVa6EAHp
 zvmpdFHllfarRjlIpr9m3/L9YHQgJ3qRgg7b8wEladPml2OOUrXF03na4VQeBKkEHG/0wChBhJvmO
 cxXc6xlw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a78-008l4H-1Z; Fri, 09 Dec 2022 09:56:18 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYI-Ox; Fri, 09 Dec 2022 09:56:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v2 02/22] xen: add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU
 options for Xen emulation
Date: Fri,  9 Dec 2022 09:55:52 +0000
Message-Id: <20221209095612.689243-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org;
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
on Arm/Aarch64 and with TCG or other accelerators. It will also cover
the support for architecture-independent grant table and event channel
support which will be added in hw/xen/.

The XENFV_MACHINE option is for the xenfv platform support, which will
now be used both by XEN_EMU and by real Xen.

The XEN option remains dependent on the Xen runtime libraries, and covers
support for real Xen. Some code which currently resides under CONFIG_XEN
will be moving to CONFIG_XENFV_MACHINE over time.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/Kconfig  | 1 +
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 3 +++
 meson.build    | 1 +
 target/Kconfig | 4 ++++
 5 files changed, 10 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/accel/Kconfig b/accel/Kconfig
index 8bdedb7d15..41e089e610 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,6 +15,7 @@ config TCG
 
 config KVM
     bool
+    imply XEN_EMU if (I386 || X86_64)
 
 config XEN
     bool
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
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 0000000000..755c8b1faf
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,3 @@
+config XENFV_MACHINE
+    bool
+    default y if (XEN || XEN_EMU)
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..9348cf572c 100644
--- a/meson.build
+++ b/meson.build
@@ -3828,6 +3828,7 @@ if have_system
   if xen.found()
     summary_info += {'xen ctrl version':  xen.version()}
   endif
+  summary_info += {'Xen emulation':     config_all.has_key('CONFIG_XEN_EMU')}
 endif
 summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
diff --git a/target/Kconfig b/target/Kconfig
index 83da0bd293..e19c9d77b5 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -18,3 +18,7 @@ source sh4/Kconfig
 source sparc/Kconfig
 source tricore/Kconfig
 source xtensa/Kconfig
+
+config XEN_EMU
+    bool
+    depends on KVM && (I386 || X86_64)
-- 
2.35.3


