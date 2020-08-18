Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD0248807
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:43:41 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82pw-0007hd-OT
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LH-0005Ch-Ew
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38471
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82L7-0007WW-Ei
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6T+Fp5nse2UFE2qjL4ASZPlrj+hnm8DBvwFbw6WgtmQ=;
 b=jO0zysxj5ulEC2rCFweoilM1IZdtNcppc1DIkak6rvYP1SWg/uj6kMbpwS+AZ40ONSn+eO
 5gJB88MTo0vt8i+Ylza0XcK44u9ZfJ6MUO+xqDw1JjW3OvullPboE33rdLZC2Ud49BAeCc
 geq7ZSvxCrLOi1kApfFnASfukcpARwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-P1gYMoaRPrubXvvPa4Io3w-1; Tue, 18 Aug 2020 10:11:47 -0400
X-MC-Unique: P1gYMoaRPrubXvvPa4Io3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C964186A56D
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10681165D8
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 097/150] meson: convert hw/rtc
Date: Tue, 18 Aug 2020 10:09:32 -0400
Message-Id: <20200818141025.21608-98-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs     |  1 -
 hw/meson.build       |  1 +
 hw/rtc/Makefile.objs | 15 ---------------
 hw/rtc/meson.build   | 16 ++++++++++++++++
 4 files changed, 17 insertions(+), 16 deletions(-)
 delete mode 100644 hw/rtc/Makefile.objs
 create mode 100644 hw/rtc/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 70ecaa8135..f60fd019ac 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -24,7 +24,6 @@ devices-dirs-y += nvram/
 devices-dirs-y += pci/
 devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
 devices-dirs-y += pcmcia/
-devices-dirs-y += rtc/
 devices-dirs-$(CONFIG_SCSI) += scsi/
 devices-dirs-y += sd/
 devices-dirs-y += ssi/
diff --git a/hw/meson.build b/hw/meson.build
index 50b26db852..1fb1687e1e 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('rtc')
 subdir('semihosting')
 subdir('smbios')
 subdir('timer')
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
deleted file mode 100644
index e4c1b8617c..0000000000
--- a/hw/rtc/Makefile.objs
+++ /dev/null
@@ -1,15 +0,0 @@
-common-obj-$(CONFIG_DS1338) += ds1338.o
-common-obj-$(CONFIG_M41T80) += m41t80.o
-common-obj-$(CONFIG_M48T59) += m48t59.o
-ifeq ($(CONFIG_ISA_BUS),y)
-common-obj-$(CONFIG_M48T59) += m48t59-isa.o
-endif
-common-obj-$(CONFIG_PL031) += pl031.o
-common-obj-$(CONFIG_TWL92230) += twl92230.o
-common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-rtc.o
-common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
-obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
-common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_rtc.o
-common-obj-$(CONFIG_GOLDFISH_RTC) += goldfish_rtc.o
-common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-rtc.o
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
new file mode 100644
index 0000000000..7cecdee5dd
--- /dev/null
+++ b/hw/rtc/meson.build
@@ -0,0 +1,16 @@
+
+softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
+softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
+softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
+softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
+softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
+
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_rtc.c'))
+softmmu_ss.add(when: 'CONFIG_SUN4V_RTC', if_true: files('sun4v-rtc.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
+softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
+
+specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
-- 
2.26.2



