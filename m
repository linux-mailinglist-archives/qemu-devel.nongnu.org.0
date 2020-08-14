Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A4244796
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:01:27 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WWc-0001zm-FT
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vnn-00083n-CE
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:15:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59460
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vng-00039g-MW
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NSbOfWCrI6b/KL5ZSnotqBYW9sbxsmW87Ogx2fpl+o=;
 b=TVGdd6MXD8ZOxTFk8VHvRGtD7JhkBhOIlqzPkxGbsl1LGWZbM0n6ZrRWoSfmlc3EUTxHOo
 7mK5z/ACNahDnTqkb0kg+rnj8IxtLcLfh5tRZ0SlBvgiXoKYxOMyaMNZ3Afy5XzmVVR/2Q
 Nak4b3igyL3vXtu9B+z1jZsAGBG2G+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-RUHon37yOyiYD53z8RrN2Q-1; Fri, 14 Aug 2020 05:14:58 -0400
X-MC-Unique: RUHon37yOyiYD53z8RrN2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E781015DBC
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A5865D9D2;
 Fri, 14 Aug 2020 09:14:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 124/150] meson: convert hw/adc
Date: Fri, 14 Aug 2020 05:13:00 -0400
Message-Id: <20200814091326.16173-125-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 03:37:30
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
 hw/Makefile.objs     | 1 -
 hw/adc/Makefile.objs | 1 -
 hw/adc/meson.build   | 1 +
 hw/meson.build       | 1 +
 4 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 hw/adc/Makefile.objs
 create mode 100644 hw/adc/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index c0cbc0f132..4bdb674ef0 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -1,7 +1,6 @@
 ifeq ($(CONFIG_SOFTMMU), y)
 devices-dirs-$(call lor,$(CONFIG_VIRTIO_9P),$(call land,$(CONFIG_VIRTFS),$(CONFIG_XEN))) += 9pfs/
 devices-dirs-y += acpi/
-devices-dirs-y += adc/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/adc/Makefile.objs b/hw/adc/Makefile.objs
deleted file mode 100644
index 2b9dc36c7f..0000000000
--- a/hw/adc/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-common-obj-$(CONFIG_STM32F2XX_ADC) += stm32f2xx_adc.o
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
new file mode 100644
index 0000000000..0d62ae96ae
--- /dev/null
+++ b/hw/adc/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 624335be90..ffa3f06dc0 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('adc')
 subdir('audio')
 subdir('block')
 subdir('char')
-- 
2.26.2



