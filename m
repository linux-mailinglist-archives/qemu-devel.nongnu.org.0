Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA724D3AF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:15:29 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9516-0001eC-BP
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EV-0003P0-6E
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48710
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EM-0001mC-Dr
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaGCnkLq1J3mjmOFXpJRr8e/B9IOOrs8jkBkMapreho=;
 b=eXVQR1qtrXJioZgcY30EDPGw/Zw4hDWm6eQgyxa27h4EAdAGgIVJ/DTwBXRO5ISO8JOtDq
 +rRXiqpoiWQ2IaX0EAjvViokOCGbLwYTswtOeOFB0qG4Qr83P6Z58gio2iMBlsRD5qOMxD
 5oO6WqQN0IKrnfL52Ryzum32Km0i2Bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-tJAvn54XOK2NdaQB0JxwPA-1; Fri, 21 Aug 2020 06:25:00 -0400
X-MC-Unique: tJAvn54XOK2NdaQB0JxwPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71750100CF71
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:59 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCC3756D7;
 Fri, 21 Aug 2020 10:24:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 110/152] meson: convert hw/isa
Date: Fri, 21 Aug 2020 06:22:47 -0400
Message-Id: <20200821102329.29777-111-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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



