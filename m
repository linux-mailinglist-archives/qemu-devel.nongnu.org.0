Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A662447A8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:05:22 +0200 (CEST)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WaP-0000mG-82
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnK-0006oN-Mc
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33915
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnG-00031y-Ok
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCxXfpTM81EsDq1JksQIVS4Yaq4rtllmbbY1pIXiot0=;
 b=I17htL9a36htfBilN/+ggrS31HV/aq4rk0F5mKM7WbjEv0/hR6rPA1fIm3YaQINWQs+qgK
 rZePq7XXqcBiYvxhj4iE9uvPvkE0ImVIqAoQDPdrO3MxJxXrklXi5do6XPj0wQISsjet67
 sFjOK69IKg1wnHVQIoddzRtXrah7fMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-njyDlpjeO3Ocazf537Q_Eg-1; Fri, 14 Aug 2020 05:14:32 -0400
X-MC-Unique: njyDlpjeO3Ocazf537Q_Eg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89ACE1005504
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B99269C9D;
 Fri, 14 Aug 2020 09:14:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 087/150] meson: convert hw/semihosting
Date: Fri, 14 Aug 2020 05:12:23 -0400
Message-Id: <20200814091326.16173-88-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:13:30
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs             | 1 -
 hw/meson.build               | 1 +
 hw/semihosting/Makefile.objs | 2 --
 hw/semihosting/meson.build   | 4 ++++
 4 files changed, 5 insertions(+), 3 deletions(-)
 delete mode 100644 hw/semihosting/Makefile.objs
 create mode 100644 hw/semihosting/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index bdf8bdf256..6a7ca0fcfe 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -36,7 +36,6 @@ devices-dirs-y += virtio/
 devices-dirs-y += watchdog/
 devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
 devices-dirs-$(CONFIG_NUBUS) += nubus/
-devices-dirs-y += semihosting/
 devices-dirs-y += smbios/
 endif
 
diff --git a/hw/meson.build b/hw/meson.build
index fe7c466460..66a2f6cddd 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,2 +1,3 @@
 subdir('core')
+subdir('semihosting')
 subdir('xen')
diff --git a/hw/semihosting/Makefile.objs b/hw/semihosting/Makefile.objs
deleted file mode 100644
index 4ad47c05c0..0000000000
--- a/hw/semihosting/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-$(CONFIG_SEMIHOSTING) += config.o
-obj-$(CONFIG_SEMIHOSTING) += console.o
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
new file mode 100644
index 0000000000..f40ac574c4
--- /dev/null
+++ b/hw/semihosting/meson.build
@@ -0,0 +1,4 @@
+specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'config.c',
+  'console.c',
+))
-- 
2.26.2



