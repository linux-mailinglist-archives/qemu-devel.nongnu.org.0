Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B062488A2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:05:05 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83Ae-0001D9-Sl
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LU-0005eO-1L
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LF-0007YZ-Sz
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaGCnkLq1J3mjmOFXpJRr8e/B9IOOrs8jkBkMapreho=;
 b=CPxoFgSLs4mmhB5sxuRseXDz+2Ks1FRiM/QGFtjmxmxSj/dJZIBe/RR7/+tJdvQ888kLLu
 R3rpZhxgslCB+ttcSwzNm3gf7/slnM+5l68qbGASfcoAT+jDOnRHMc90n7DWGzaYIvD60Q
 ue0SZsjFoHKbK3MWjPQTrEexxQfrM9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-uBKWJbGpNN2uDGoSXf4KrQ-1; Tue, 18 Aug 2020 10:11:55 -0400
X-MC-Unique: uBKWJbGpNN2uDGoSXf4KrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D079180F040
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB3F196B6;
 Tue, 18 Aug 2020 14:11:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 109/150] meson: convert hw/isa
Date: Tue, 18 Aug 2020 10:09:44 -0400
Message-Id: <20200818141025.21608-110-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:22:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs     |  1 -
 hw/isa/Makefile.objs | 11 -----------
 hw/isa/meson.build   | 11 +++++++++++
 hw/meson.build       |  1 +
 4 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 hw/isa/Makefile.objs
 create mode 100644 hw/isa/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index ac8278edf7..a28e211e78 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -16,7 +16,6 @@ devices-dirs-y += input/
 devices-dirs-y += intc/
 devices-dirs-$(CONFIG_IPACK) += ipack/
 devices-dirs-$(CONFIG_IPMI) += ipmi/
-devices-dirs-y += isa/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
deleted file mode 100644
index 8e73960a75..0000000000
--- a/hw/isa/Makefile.objs
+++ /dev/null
@@ -1,11 +0,0 @@
-common-obj-$(CONFIG_ISA_BUS) += isa-bus.o
-common-obj-$(CONFIG_ISA_SUPERIO) += isa-superio.o
-common-obj-$(CONFIG_APM) += apm.o
-common-obj-$(CONFIG_I82378) += i82378.o
-common-obj-$(CONFIG_PC87312) += pc87312.o
-common-obj-$(CONFIG_PIIX3) += piix3.o
-common-obj-$(CONFIG_PIIX4) += piix4.o
-common-obj-$(CONFIG_VT82C686) += vt82c686.o
-common-obj-$(CONFIG_SMC37C669) += smc37c669-superio.o
-
-obj-$(CONFIG_LPC_ICH9) += lpc_ich9.o
diff --git a/hw/isa/meson.build b/hw/isa/meson.build
new file mode 100644
index 0000000000..8bf678ca0a
--- /dev/null
+++ b/hw/isa/meson.build
@@ -0,0 +1,11 @@
+softmmu_ss.add(when: 'CONFIG_APM', if_true: files('apm.c'))
+softmmu_ss.add(when: 'CONFIG_I82378', if_true: files('i82378.c'))
+softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('isa-bus.c'))
+softmmu_ss.add(when: 'CONFIG_ISA_SUPERIO', if_true: files('isa-superio.c'))
+softmmu_ss.add(when: 'CONFIG_PC87312', if_true: files('pc87312.c'))
+softmmu_ss.add(when: 'CONFIG_PIIX3', if_true: files('piix3.c'))
+softmmu_ss.add(when: 'CONFIG_PIIX4', if_true: files('piix4.c'))
+softmmu_ss.add(when: 'CONFIG_SMC37C669', if_true: files('smc37c669-superio.c'))
+softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
+
+specific_ss.add(when: 'CONFIG_LPC_ICH9', if_true: files('lpc_ich9.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 6ca82b0375..86598544e6 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('isa')
 subdir('mem')
 subdir('misc')
 subdir('net')
-- 
2.26.2



