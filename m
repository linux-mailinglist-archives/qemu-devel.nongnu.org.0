Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC72488B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 17:07:58 +0200 (CEST)
Received: from localhost ([::1]:51100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k83DR-000863-73
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 11:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Lf-0005yE-2K
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31233
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LT-0007bd-Mm
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pl0jAkenLkFo4zL19mkOAUPmJs0SzL6RKuibTucn6yE=;
 b=Eqs2/eB8dMxR6xOVkAd1RjBA0lMVUCAhXlNpc583JRmqm05VD1xOEiC4OwbeeFujAO0hqy
 RfIMAlzSmP1EqJ+jpKEgGPoh2syKXWUJ18vrsetoT7btTxMVVB9mNmK4G6CizOhYOK1ra3
 z4CIU8Qz7OuVcOwozKqa5NhaAZhEDeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-WnZOzAUfMPSkFrD1TN_0vw-1; Tue, 18 Aug 2020 10:12:07 -0400
X-MC-Unique: WnZOzAUfMPSkFrD1TN_0vw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6351481F01B
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:12:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 136167BE68;
 Tue, 18 Aug 2020 14:12:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 124/150] meson: convert hw/adc
Date: Tue, 18 Aug 2020 10:09:59 -0400
Message-Id: <20200818141025.21608-125-pbonzini@redhat.com>
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



