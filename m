Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A246B24889A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:03:03 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k838g-0005hr-Jm
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LO-0005XR-M3
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41978
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LE-0007Y4-Jt
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQQAJwxKlo3IUiHDoEF4H7J1nWASTuJ2QBSPXF2DQwE=;
 b=OQiL0CtJZIL59r6XpGHa7jun6+AHLRmlrhlNemc5FG6ZpJfeJLRtpxNx1o267BFX6juc3u
 bkQDugMwyGqVNuSh0sXx8hbR0UDP4mN/psK4e54sQxTQsg6DJFjikm/O4DslklhWYRRt65
 U6SqzHf7IKvGwSTR6Omf+3rhdzgZenw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-0-C7xHP8NxCYYIP-hAJmMQ-1; Tue, 18 Aug 2020 10:11:54 -0400
X-MC-Unique: 0-C7xHP8NxCYYIP-hAJmMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34DEC81F01F
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8AAD196B6;
 Tue, 18 Aug 2020 14:11:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 105/150] meson: convert hw/nvram
Date: Tue, 18 Aug 2020 10:09:40 -0400
Message-Id: <20200818141025.21608-106-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
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
 hw/Makefile.objs       | 1 -
 hw/meson.build         | 1 +
 hw/nvram/Makefile.objs | 8 --------
 hw/nvram/meson.build   | 9 +++++++++
 4 files changed, 10 insertions(+), 9 deletions(-)
 delete mode 100644 hw/nvram/Makefile.objs
 create mode 100644 hw/nvram/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 20832841d2..78860ae9c7 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -20,7 +20,6 @@ devices-dirs-y += isa/
 devices-dirs-y += misc/
 devices-dirs-y += net/
 devices-dirs-y += rdma/
-devices-dirs-y += nvram/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 53c347c395..0bdd6a2613 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('nvram')
 subdir('pci')
 subdir('pci-bridge')
 subdir('pci-host')
diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
deleted file mode 100644
index f3ad921382..0000000000
--- a/hw/nvram/Makefile.objs
+++ /dev/null
@@ -1,8 +0,0 @@
-common-obj-$(CONFIG_DS1225Y) += ds1225y.o
-common-obj-$(CONFIG_NMC93XX_EEPROM) += eeprom93xx.o
-common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
-common-obj-y += fw_cfg.o
-common-obj-$(CONFIG_CHRP_NVRAM) += chrp_nvram.o
-common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
-common-obj-$(CONFIG_NRF51_SOC) += nrf51_nvm.o
-obj-$(CONFIG_PSERIES) += spapr_nvram.o
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
new file mode 100644
index 0000000000..ba214558ac
--- /dev/null
+++ b/hw/nvram/meson.build
@@ -0,0 +1,9 @@
+softmmu_ss.add(files('fw_cfg.c'))
+softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
+softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
+softmmu_ss.add(when: 'CONFIG_NMC93XX_EEPROM', if_true: files('eeprom93xx.c'))
+softmmu_ss.add(when: 'CONFIG_AT24C', if_true: files('eeprom_at24c.c'))
+softmmu_ss.add(when: 'CONFIG_MAC_NVRAM', if_true: files('mac_nvram.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_nvm.c'))
+
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
-- 
2.26.2



