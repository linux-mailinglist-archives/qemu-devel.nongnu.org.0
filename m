Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE44A2488A4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:05:57 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83BU-0002xQ-MY
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lj-00069e-JP
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46855
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LV-0007bv-GQ
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rznvb+GNfSab0hei9u0ycC4zsMKQT4Ps2TsBa8ktE3A=;
 b=U/aKyTg+kkQIBQvI/Z+t9TTB7RQHlJ3WbLMlPl9WBSsHFmDW89H16mUsC3weSoFpjtaLO5
 9vqwfPWWM5VrpOx5oqS8f8Ff564fkPbizol8MfY+Yi3hxBxvbMdpCNVp4aPvZXL/Ef+CKN
 haTQHhYNIoC78NttR0IiDxRFrGdG9nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-xK010dFSPjecm54OoUxf9g-1; Tue, 18 Aug 2020 10:12:09 -0400
X-MC-Unique: xK010dFSPjecm54OoUxf9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5810781F01B
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16DCD7B909;
 Tue, 18 Aug 2020 14:12:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 129/150] meson: accel
Date: Tue, 18 Aug 2020 10:10:04 -0400
Message-Id: <20200818141025.21608-130-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs             |  2 +-
 Makefile.target           |  1 -
 accel/Makefile.objs       |  6 ------
 accel/kvm/Makefile.objs   |  2 --
 accel/kvm/meson.build     |  5 +++++
 accel/meson.build         |  7 +++++++
 accel/stubs/Makefile.objs |  6 ------
 accel/stubs/meson.build   |  6 ++++++
 accel/tcg/Makefile.objs   |  9 ---------
 accel/tcg/meson.build     | 15 +++++++++++++++
 accel/xen/Makefile.objs   |  1 -
 accel/xen/meson.build     |  1 +
 meson.build               |  1 +
 13 files changed, 36 insertions(+), 26 deletions(-)
 delete mode 100644 accel/Makefile.objs
 delete mode 100644 accel/kvm/Makefile.objs
 create mode 100644 accel/kvm/meson.build
 create mode 100644 accel/meson.build
 delete mode 100644 accel/stubs/Makefile.objs
 create mode 100644 accel/stubs/meson.build
 delete mode 100644 accel/tcg/Makefile.objs
 create mode 100644 accel/tcg/meson.build
 delete mode 100644 accel/xen/Makefile.objs
 create mode 100644 accel/xen/meson.build

diff --git a/Makefile.objs b/Makefile.objs
index c9720a92df..83622c58a5 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -39,7 +39,7 @@ endif # CONFIG_SOFTMMU or CONFIG_TOOLS
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = accel/
+common-obj-y =
 
 common-obj-$(CONFIG_AUDIO_ALSA) += audio-alsa$(DSOSUF)
 common-obj-$(CONFIG_AUDIO_OSS) += audio-oss$(DSOSUF)
diff --git a/Makefile.target b/Makefile.target
index 1ab8773402..8633e2b9fe 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -110,7 +110,6 @@ obj-y += trace/
 #########################################################
 # cpu emulator library
 obj-y += exec.o exec-vary.o
-obj-y += accel/
 obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
 obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
 obj-$(CONFIG_TCG_INTERPRETER) += tcg/tci.o
diff --git a/accel/Makefile.objs b/accel/Makefile.objs
deleted file mode 100644
index ff72f0d030..0000000000
--- a/accel/Makefile.objs
+++ /dev/null
@@ -1,6 +0,0 @@
-common-obj-$(CONFIG_SOFTMMU) += accel.o
-obj-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_POSIX)) += qtest.o
-obj-$(CONFIG_KVM) += kvm/
-obj-$(CONFIG_TCG) += tcg/
-obj-$(CONFIG_XEN) += xen/
-obj-y += stubs/
diff --git a/accel/kvm/Makefile.objs b/accel/kvm/Makefile.objs
deleted file mode 100644
index fdfa481578..0000000000
--- a/accel/kvm/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y += kvm-all.o
-obj-$(call lnot,$(CONFIG_SEV)) += sev-stub.o
diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
new file mode 100644
index 0000000000..4db2388e2f
--- /dev/null
+++ b/accel/kvm/meson.build
@@ -0,0 +1,5 @@
+kvm_ss = ss.source_set()
+kvm_ss.add(files('kvm-all.c'))
+kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+
+specific_ss.add_all(when: 'CONFIG_KVM', if_true: kvm_ss)
diff --git a/accel/meson.build b/accel/meson.build
new file mode 100644
index 0000000000..26c503e480
--- /dev/null
+++ b/accel/meson.build
@@ -0,0 +1,7 @@
+softmmu_ss.add(files('accel.c'))
+specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: files('qtest.c'))
+
+subdir('kvm')
+subdir('tcg')
+subdir('xen')
+subdir('stubs')
diff --git a/accel/stubs/Makefile.objs b/accel/stubs/Makefile.objs
deleted file mode 100644
index bbd14e71fb..0000000000
--- a/accel/stubs/Makefile.objs
+++ /dev/null
@@ -1,6 +0,0 @@
-obj-$(call lnot,$(CONFIG_HAX))  += hax-stub.o
-obj-$(call lnot,$(CONFIG_HVF))  += hvf-stub.o
-obj-$(call lnot,$(CONFIG_WHPX)) += whpx-stub.o
-obj-$(call lnot,$(CONFIG_KVM))  += kvm-stub.o
-obj-$(call lnot,$(CONFIG_TCG))  += tcg-stub.o
-obj-$(call lnot,$(CONFIG_XEN))  += xen-stub.o
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
new file mode 100644
index 0000000000..314e3cfff4
--- /dev/null
+++ b/accel/stubs/meson.build
@@ -0,0 +1,6 @@
+specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
+specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+specific_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
+specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+specific_ss.add(when: 'CONFIG_WHPX', if_false: files('whpx-stub.c'))
diff --git a/accel/tcg/Makefile.objs b/accel/tcg/Makefile.objs
deleted file mode 100644
index a92f2c454b..0000000000
--- a/accel/tcg/Makefile.objs
+++ /dev/null
@@ -1,9 +0,0 @@
-obj-$(CONFIG_SOFTMMU) += tcg-all.o
-obj-$(CONFIG_SOFTMMU) += cputlb.o
-obj-y += tcg-runtime.o tcg-runtime-gvec.o
-obj-y += cpu-exec.o cpu-exec-common.o translate-all.o
-obj-y += translator.o
-
-obj-$(CONFIG_USER_ONLY) += user-exec.o
-obj-$(call lnot,$(CONFIG_SOFTMMU)) += user-exec-stub.o
-obj-$(CONFIG_PLUGIN) += plugin-gen.o
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
new file mode 100644
index 0000000000..2a335b50f2
--- /dev/null
+++ b/accel/tcg/meson.build
@@ -0,0 +1,15 @@
+tcg_ss = ss.source_set()
+tcg_ss.add(files(
+  'cpu-exec-common.c',
+  'cpu-exec.c',
+  'tcg-runtime-gvec.c',
+  'tcg-runtime.c',
+  'translate-all.c',
+  'translator.c',
+))
+tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
+tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
+tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: files('plugin-gen.c'))
+specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
+
+specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files('tcg-all.c', 'cputlb.c'))
diff --git a/accel/xen/Makefile.objs b/accel/xen/Makefile.objs
deleted file mode 100644
index 7482cfb436..0000000000
--- a/accel/xen/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-obj-y += xen-all.o
diff --git a/accel/xen/meson.build b/accel/xen/meson.build
new file mode 100644
index 0000000000..002bdb03c6
--- /dev/null
+++ b/accel/xen/meson.build
@@ -0,0 +1 @@
+specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
diff --git a/meson.build b/meson.build
index 7f0cdb4b40..abb014869f 100644
--- a/meson.build
+++ b/meson.build
@@ -701,6 +701,7 @@ subdir('monitor')
 subdir('net')
 subdir('replay')
 subdir('hw')
+subdir('accel')
 
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
-- 
2.26.2



