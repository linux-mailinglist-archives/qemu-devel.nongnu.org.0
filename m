Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76492447AC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:06:51 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Wbq-0004Jg-TJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnM-0006u8-QG
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnI-00032Z-Jy
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WDdT7Yf8vTezEDuWurk22ER4j+BIDWuWinVB2Aw+DA=;
 b=EjkGZ+SWU1Vcwz3RWXhrOb9c4jExePcdS6pAIkjLxjBDWhRBqEQ7XN2n5/xqsNJ9yyPpJ4
 PI+J6abV02f5AvJlvJYHC65LVgZFOSEG3wfEjNYLpX3oPaRNk+qnuu8H6DsRC9+eYR8gAs
 N5lxV7sowaWAIPXG9N8+2ekaj8P+qus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ZblD-8HhMTGa8bHI2M_6Ug-1; Fri, 14 Aug 2020 05:14:34 -0400
X-MC-Unique: ZblD-8HhMTGa8bHI2M_6Ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6627C801AC2
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2387269C9D;
 Fri, 14 Aug 2020 09:14:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 091/150] meson: convert hw/watchdog
Date: Fri, 14 Aug 2020 05:12:27 -0400
Message-Id: <20200814091326.16173-92-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:13:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/Makefile.objs          | 1 -
 hw/meson.build            | 1 +
 hw/watchdog/Makefile.objs | 7 -------
 hw/watchdog/meson.build   | 7 +++++++
 4 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 hw/watchdog/Makefile.objs
 create mode 100644 hw/watchdog/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index df72b25a64..9ebd13d7cd 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -33,7 +33,6 @@ devices-dirs-$(CONFIG_TPM) += tpm/
 devices-dirs-y += usb/
 devices-dirs-$(CONFIG_VFIO) += vfio/
 devices-dirs-y += virtio/
-devices-dirs-y += watchdog/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 542d675618..f2209d900c 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -3,4 +3,5 @@ subdir('mem')
 subdir('nubus')
 subdir('semihosting')
 subdir('smbios')
+subdir('watchdog')
 subdir('xen')
diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
deleted file mode 100644
index 631b711d86..0000000000
--- a/hw/watchdog/Makefile.objs
+++ /dev/null
@@ -1,7 +0,0 @@
-common-obj-y += watchdog.o
-common-obj-$(CONFIG_CMSDK_APB_WATCHDOG) += cmsdk-apb-watchdog.o
-common-obj-$(CONFIG_WDT_IB6300ESB) += wdt_i6300esb.o
-common-obj-$(CONFIG_WDT_IB700) += wdt_ib700.o
-common-obj-$(CONFIG_WDT_DIAG288) += wdt_diag288.o
-common-obj-$(CONFIG_ASPEED_SOC) += wdt_aspeed.o
-common-obj-$(CONFIG_WDT_IMX2) += wdt_imx2.o
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
new file mode 100644
index 0000000000..9b8725e642
--- /dev/null
+++ b/hw/watchdog/meson.build
@@ -0,0 +1,7 @@
+softmmu_ss.add(files('watchdog.c'))
+softmmu_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true: files('cmsdk-apb-watchdog.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true: files('wdt_i6300esb.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
-- 
2.26.2



