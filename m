Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4916FC3F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:30:38 +0100 (CET)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6txd-0003ed-HF
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttV-0004OJ-Gk
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6ttU-0003bL-9B
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25462
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6ttU-0003a1-4Z
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajDOVbPHWi72NoV7MIp4a4+jzaXjbTWs3x00zhiGkGc=;
 b=NC6SlPW7iL20j5KLcmjuR3g38n3smVvpbdCP/jn2KzAXRBoATreMBEXMhzim8qQf9mU0qc
 IJtE8hKR0f4FTAtHTp0TH8mXGNyc7kxNGYv9c81eZ3uIqC68bmfyPjR1rA6sKBWWEU/jPE
 aBiP53RT09wzEJsM/tZFqW1fi7K5iYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-VDdbP1KpMF-sdBvUG87giw-1; Wed, 26 Feb 2020 05:26:18 -0500
X-MC-Unique: VDdbP1KpMF-sdBvUG87giw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 031691882CCC;
 Wed, 26 Feb 2020 10:26:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9447260BE1;
 Wed, 26 Feb 2020 10:26:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 04/10] tpm: Separate TPM_TIS and TPM_TIS_ISA configs
Date: Wed, 26 Feb 2020 11:25:43 +0100
Message-Id: <20200226102549.12158-5-eric.auger@redhat.com>
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
References: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's separate the compilation of tpm_tis_common.c from
the compilation of tpm_tis_isa.c

The common part will be also compiled along with the
tpm_tis_sysbus device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

---

v2 -> v3:
- added Phillipe's R-b
---
 default-configs/i386-softmmu.mak | 2 +-
 hw/i386/Kconfig                  | 2 +-
 hw/tpm/Kconfig                   | 7 ++++++-
 hw/tpm/Makefile.objs             | 3 ++-
 tests/qtest/Makefile.include     | 4 ++--
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmm=
u.mak
index 4cc64dafa2..84d1a2487c 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -20,7 +20,7 @@
 #CONFIG_SGA=3Dn
 #CONFIG_TEST_DEVICES=3Dn
 #CONFIG_TPM_CRB=3Dn
-#CONFIG_TPM_TIS=3Dn
+#CONFIG_TPM_TIS_ISA=3Dn
 #CONFIG_VTD=3Dn
=20
 # Boards:
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index cdc851598c..c93f32f657 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -20,7 +20,7 @@ config PC
     imply SGA
     imply TEST_DEVICES
     imply TPM_CRB
-    imply TPM_TIS
+    imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
     select FDC
diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
index 9e67d990e8..686f8206bb 100644
--- a/hw/tpm/Kconfig
+++ b/hw/tpm/Kconfig
@@ -2,9 +2,14 @@ config TPMDEV
     bool
     depends on TPM
=20
-config TPM_TIS
+config TPM_TIS_ISA
     bool
     depends on TPM && ISA_BUS
+    select TPM_TIS
+
+config TPM_TIS
+    bool
+    depends on TPM
     select TPMDEV
=20
 config TPM_CRB
diff --git a/hw/tpm/Makefile.objs b/hw/tpm/Makefile.objs
index fcc4c2f27c..3ef2036cca 100644
--- a/hw/tpm/Makefile.objs
+++ b/hw/tpm/Makefile.objs
@@ -1,6 +1,7 @@
 common-obj-$(CONFIG_TPM) +=3D tpm_util.o
 obj-$(call lor,$(CONFIG_TPM_TIS),$(CONFIG_TPM_CRB)) +=3D tpm_ppi.o
-common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_isa.o tpm_tis_common.o
+common-obj-$(CONFIG_TPM_TIS_ISA) +=3D tpm_tis_isa.o
+common-obj-$(CONFIG_TPM_TIS) +=3D tpm_tis_common.o
 common-obj-$(CONFIG_TPM_CRB) +=3D tpm_crb.o
 common-obj-$(CONFIG_TPM_PASSTHROUGH) +=3D tpm_passthrough.o
 common-obj-$(CONFIG_TPM_EMULATOR) +=3D tpm_emulator.o
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index e769c1ad70..028af5b782 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -54,8 +54,8 @@ check-qtest-i386-y +=3D q35-test
 check-qtest-i386-y +=3D vmgenid-test
 check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-swtpm-test
 check-qtest-i386-$(CONFIG_TPM_CRB) +=3D tpm-crb-test
-check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-swtpm-test
-check-qtest-i386-$(CONFIG_TPM_TIS) +=3D tpm-tis-test
+check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-swtpm-test
+check-qtest-i386-$(CONFIG_TPM_TIS_ISA) +=3D tpm-tis-test
 check-qtest-i386-$(CONFIG_SLIRP) +=3D test-netfilter
 check-qtest-i386-$(CONFIG_POSIX) +=3D test-filter-mirror
 check-qtest-i386-$(CONFIG_RTL8139_PCI) +=3D test-filter-redirector
--=20
2.20.1


