Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D24659825
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:24:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEHZ-0001VF-KU; Fri, 30 Dec 2022 07:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFx-0007vA-W0
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:02 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFr-00051C-VG
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FnJqccJ675bg/fy/l2hP+iOAvZoroA7wpA8mU+aT7uo=; b=jL2gF9G4Pg+454r7eiTht/GEYT
 gCJWFxYxrpLL7NqAQWoUNB1xAAPDRrS5GNVD4XyPcsiHvk8Pl9AtsWvp1LoZQxSPesWP+6KMBvW/V
 Dd87BNrs9XrLHL4M0ZVxYNkHL/yoxZ5m+hFNp/v1fSKC/zQdcewDezVFfh3l9PF8Krvn7W9AL4scI
 cN+MOgXYgQev88N1zsjdNxk7kcTdmFEIe37Xv69PNlD6NtcWF7pUshsU7TN0Xt0D7z16yjr6YpQbb
 ZXddX0gG2jYdbjNNAVWDmZrl3Yn0qm2ZVany6hldochdJ2K1jVLzt0eJAPYOcDTuhvE1O5b0Gi7L6
 QUVjYuwQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFk-00Ac7u-C9; Fri, 30 Dec 2022 12:12:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005NvI-4v; Fri, 30 Dec 2022 12:12:37 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 02/52] xen: add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU
 options for Xen emulation
Date: Fri, 30 Dec 2022 12:11:45 +0000
Message-Id: <20221230121235.1282915-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
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

The XEN_EMU option will cover core Xen support in target/, which exists
only for x86 with KVM today but could theoretically also be implemented
on Arm/Aarch64 and with TCG or other accelerators. It will also cover
the support for architecture-independent grant table and event channel
support which will be added in hw/i386/kvm/ (on the basis that the
non-KVM support is very theoretical and making it not use KVM directly
seems like gratuitous overengineering at this point).

The XENFV_MACHINE option is for the xenfv platform support, which will
now be used both by XEN_EMU and by real Xen.

The XEN option remains dependent on the Xen runtime libraries, and covers
support for real Xen. Some code which currently resides under CONFIG_XEN
will be moving to CONFIG_XENFV_MACHINE over time.

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
index d22ac4a4b9..c9fd577997 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -137,3 +137,8 @@ config VMPORT
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
-- 
2.35.3


