Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C2124D398
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:12:48 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94yV-0004H1-8K
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ec-0003Ss-5I
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:22 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53284
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EO-0001qB-8S
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zph8b3o0acW1hqgMdUrd8CqQt9M1Q9Sg6LBnXV8UIfQ=;
 b=Dlc3omhzen/XLYI7Z6hDsEMSU5p4ZG1BU3doTemIXj3U+q6eDUOO6wsTHHV6eZIa78zOlf
 o+lrdWlxfsCLAT7AgM/UqmyT/4GpzGxuNcuqqW6Xc3DUZ462RbV/WuYzAPhU36STWZS3Kf
 bzw3jPXwIqCt0MN59gjF9uAAz3fllFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-Mlbw3i57NCuozj4R2otREw-1; Fri, 21 Aug 2020 06:25:03 -0400
X-MC-Unique: Mlbw3i57NCuozj4R2otREw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD5F51009440
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B33C795AE;
 Fri, 21 Aug 2020 10:24:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 092/152] meson: convert hw/watchdog
Date: Fri, 21 Aug 2020 06:22:29 -0400
Message-Id: <20200821102329.29777-93-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 01:00:15
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



