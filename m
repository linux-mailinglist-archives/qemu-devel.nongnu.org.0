Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7B248863
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:57:37 +0200 (CEST)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k833P-0004is-W4
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82LE-000548-7e
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44017
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82L3-0007VR-1a
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHYQLCRCnN6yVHrWNrBtsGvSH+AR79Wdgf0NvoHLBfM=;
 b=S9PYl/a8JqobpcOegg0ZoA609JVuu3IEliMF89SpVwVA2m4OmpkKTZHlTM/cVnfXHz9hru
 BZ2aZfMCIMUuwDuLHp8UMin2mlZVZh3xULCleok7tWjRJ6o09a09mV6bg3yArH0X7Sx/Zt
 a2VdIQLda/xwiw76n1YvQ410PhGcjYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-u0cZV2aGO02fXGeQEcsj_w-1; Tue, 18 Aug 2020 10:11:42 -0400
X-MC-Unique: u0cZV2aGO02fXGeQEcsj_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FA422FD00
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC2F165D8;
 Tue, 18 Aug 2020 14:11:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 088/150] meson: convert hw/nubus
Date: Tue, 18 Aug 2020 10:09:23 -0400
Message-Id: <20200818141025.21608-89-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs       | 1 -
 hw/meson.build         | 1 +
 hw/nubus/Makefile.objs | 4 ----
 hw/nubus/meson.build   | 7 +++++++
 4 files changed, 8 insertions(+), 5 deletions(-)
 delete mode 100644 hw/nubus/Makefile.objs
 create mode 100644 hw/nubus/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 6a7ca0fcfe..86bc201a55 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -35,7 +35,6 @@ devices-dirs-$(CONFIG_VFIO) += vfio/
 devices-dirs-y += virtio/
 devices-dirs-y += watchdog/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
-devices-dirs-$(CONFIG_NUBUS) += nubus/
 devices-dirs-y += smbios/
 endif
 
diff --git a/hw/meson.build b/hw/meson.build
index 66a2f6cddd..03ef30212e 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
 subdir('core')
+subdir('nubus')
 subdir('semihosting')
 subdir('xen')
diff --git a/hw/nubus/Makefile.objs b/hw/nubus/Makefile.objs
deleted file mode 100644
index 135ba7878d..0000000000
--- a/hw/nubus/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-common-obj-y += nubus-device.o
-common-obj-y += nubus-bus.o
-common-obj-y += nubus-bridge.o
-common-obj-$(CONFIG_Q800) += mac-nubus-bridge.o
diff --git a/hw/nubus/meson.build b/hw/nubus/meson.build
new file mode 100644
index 0000000000..9287c633aa
--- /dev/null
+++ b/hw/nubus/meson.build
@@ -0,0 +1,7 @@
+nubus_ss = ss.source_set()
+nubus_ss.add(files('nubus-device.c'))
+nubus_ss.add(files('nubus-bus.c'))
+nubus_ss.add(files('nubus-bridge.c'))
+nubus_ss.add(when: 'CONFIG_Q800', if_true: files('mac-nubus-bridge.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_NUBUS', if_true: nubus_ss)
-- 
2.26.2



