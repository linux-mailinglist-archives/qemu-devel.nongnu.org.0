Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44862447A7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:04:30 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WZZ-0007ZO-P9
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnT-0007Dl-Em
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43744
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnR-00036L-9o
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x350yu0iiIWdawy91SCA3LKUTDwTaxSjcoiN5Aj2s1w=;
 b=T1fU+sncfgWdqno8sVVAnPpEoVeWaJl7NG1UQuawB/o7x0YOl1BoC7tv6edFeKnQeGwwh6
 gztgj3BHKBSHnQEdQFEMLIsfnTIXTwfoLq3H+cu1VWEzXlCtr1bPq/vSvZ+tGkTgorOtG3
 GeEsBdUZU/m/2nAYpkOz8xVOLyQ23Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ruFj84gRPnu_he1L9oL3MQ-1; Fri, 14 Aug 2020 05:14:42 -0400
X-MC-Unique: ruFj84gRPnu_he1L9oL3MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E55E1DDE0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C068C60C04;
 Fri, 14 Aug 2020 09:14:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 106/150] meson: convert hw/rdma
Date: Fri, 14 Aug 2020 05:12:42 -0400
Message-Id: <20200814091326.16173-107-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
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
 hw/Makefile.objs      |  1 -
 hw/meson.build        |  1 +
 hw/rdma/Makefile.objs |  3 ---
 hw/rdma/meson.build   | 10 ++++++++++
 4 files changed, 11 insertions(+), 4 deletions(-)
 delete mode 100644 hw/rdma/Makefile.objs
 create mode 100644 hw/rdma/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 78860ae9c7..748a718b0f 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -19,7 +19,6 @@ devices-dirs-$(CONFIG_IPMI) += ipmi/
 devices-dirs-y += isa/
 devices-dirs-y += misc/
 devices-dirs-y += net/
-devices-dirs-y += rdma/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 0bdd6a2613..f704e51361 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -6,6 +6,7 @@ subdir('pci')
 subdir('pci-bridge')
 subdir('pci-host')
 subdir('pcmcia')
+subdir('rdma')
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
diff --git a/hw/rdma/Makefile.objs b/hw/rdma/Makefile.objs
deleted file mode 100644
index 819bb12a35..0000000000
--- a/hw/rdma/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-$(CONFIG_VMW_PVRDMA) += rdma_utils.o rdma_backend.o rdma_rm.o rdma.o
-obj-$(CONFIG_VMW_PVRDMA) += vmw/pvrdma_dev_ring.o vmw/pvrdma_cmd.o \
-                     vmw/pvrdma_qp_ops.o vmw/pvrdma_main.o
diff --git a/hw/rdma/meson.build b/hw/rdma/meson.build
new file mode 100644
index 0000000000..7325f40c32
--- /dev/null
+++ b/hw/rdma/meson.build
@@ -0,0 +1,10 @@
+specific_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+  'rdma.c',
+  'rdma_backend.c',
+  'rdma_rm.c',
+  'rdma_utils.c',
+  'vmw/pvrdma_cmd.c',
+  'vmw/pvrdma_dev_ring.c',
+  'vmw/pvrdma_main.c',
+  'vmw/pvrdma_qp_ops.c',
+))
-- 
2.26.2



