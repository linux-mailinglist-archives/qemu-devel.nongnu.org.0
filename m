Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729B244775
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:55:27 +0200 (CEST)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WQo-0007Sn-1L
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnL-0006pG-1P
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47464
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnH-000328-Ac
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhqRQfxgZKwJ96ol0mbenRayAvfbDPlr1SxB4DAAIBo=;
 b=NaUy7EPapakRbTqWvpag34OsbY7xRzR8maReWL8R3jvlViML1wWNnwdRzS59jgFnDt1g+6
 O6SPwVjQCJUQMOGhDz8uQG4dnoP1UpozXTFG9oag0vLRRiFUV1t+5nkhnGBRkeEjJ9OuGO
 8zGHwyJ0SqZFSclfHwaCvUoip3yJaEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-JxjZKmImOiSsFdur3euEcQ-1; Fri, 14 Aug 2020 05:14:32 -0400
X-MC-Unique: JxjZKmImOiSsFdur3euEcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E53761DDE2
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAE1D69C9D
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 088/150] meson: convert hw/nubus
Date: Fri, 14 Aug 2020 05:12:24 -0400
Message-Id: <20200814091326.16173-89-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:13:35
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



