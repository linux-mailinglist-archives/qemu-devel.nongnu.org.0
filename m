Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE924D382
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:06:02 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94rx-00011E-NK
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94E9-0002wV-7S
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38961
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94E6-0001iv-EV
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUB2d128Uw8Jo7HHKbSiuJv6mjwFT5oCh/Ss7ZAYU/o=;
 b=ar73N3Wyr+6R33taKIzUZmPYW8QWcVgL/8PfPyfJfGkz/Z2AaTgstjkTDZ7Yu6AjiDeqTu
 1YWQGMn0G6dm/b5bncb5SyhsGW0lnTf+0wrwWAbQaB6FwJRpDkFyIrw2tSqIjWoVJPufae
 rx13MifIFPi7MuxTAuWH/Gc2fyoXuuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-QsNHghEhP76wJrQIH3_WsA-1; Fri, 21 Aug 2020 06:24:47 -0400
X-MC-Unique: QsNHghEhP76wJrQIH3_WsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D885E191E2A0
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8F347C0AF;
 Fri, 21 Aug 2020 10:24:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 090/152] meson: convert hw/smbios
Date: Fri, 21 Aug 2020 06:22:27 -0400
Message-Id: <20200821102329.29777-91-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:55:47
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
 hw/Makefile.objs        |  1 -
 hw/meson.build          |  1 +
 hw/smbios/Makefile.objs | 10 ----------
 hw/smbios/meson.build   | 13 +++++++++++++
 4 files changed, 14 insertions(+), 11 deletions(-)
 delete mode 100644 hw/smbios/Makefile.objs
 create mode 100644 hw/smbios/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 86bc201a55..73c49ddd3b 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -35,7 +35,6 @@ devices-dirs-$(CONFIG_VFIO) += vfio/
 devices-dirs-y += virtio/
 devices-dirs-y += watchdog/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
-devices-dirs-y += smbios/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 03ef30212e..dccc2d19a6 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
 subdir('nubus')
 subdir('semihosting')
+subdir('smbios')
 subdir('xen')
diff --git a/hw/smbios/Makefile.objs b/hw/smbios/Makefile.objs
deleted file mode 100644
index 23bb2bac07..0000000000
--- a/hw/smbios/Makefile.objs
+++ /dev/null
@@ -1,10 +0,0 @@
-ifeq ($(CONFIG_SMBIOS),y)
-common-obj-y += smbios.o
-common-obj-$(CONFIG_IPMI) += smbios_type_38.o
-common-obj-$(call lnot,$(CONFIG_IPMI)) += smbios_type_38-stub.o
-else
-common-obj-y += smbios-stub.o
-endif
-
-common-obj-$(CONFIG_ALL) += smbios-stub.o
-common-obj-$(CONFIG_ALL) += smbios_type_38-stub.o
diff --git a/hw/smbios/meson.build b/hw/smbios/meson.build
new file mode 100644
index 0000000000..9e762c7108
--- /dev/null
+++ b/hw/smbios/meson.build
@@ -0,0 +1,13 @@
+smbios_ss = ss.source_set()
+smbios_ss.add(files('smbios.c'))
+smbios_ss.add(when: 'CONFIG_IPMI',
+              if_true: files('smbios_type_38.c'),
+              if_false: files('smbios_type_38-stub.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_SMBIOS', if_true: smbios_ss)
+softmmu_ss.add(when: 'CONFIG_SMBIOS', if_false: files('smbios-stub.c'))
+
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files(
+  'smbios-stub.c',
+  'smbios_type_38-stub.c',
+))
-- 
2.26.2



