Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8224D386
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:07:21 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94tE-0004R3-6v
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EO-0003Gv-Pl
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58929
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EE-0001km-5H
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhJyUa+dSE0FXMINu5aCA4cZPPWRN3ZNkO0lvO4SppM=;
 b=H/GUPghoDo9be8KIyQTRO1t1xyfpwBIin7jDLl2XmCQIJzhxTGqvWaespH/mjYTcDwNKoG
 8BxQrdKhSxh+H10X3tIQTCeBFgQSyW5+eG0Y5bUsSKUz8aY6j6s/gcsN9Oo2xl45J9vrGs
 cKv7h5LBcGQPWVLNzPJ/o7JAWs8Lj9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-670rUuZFPxSMt7Hilfe25g-1; Fri, 21 Aug 2020 06:24:56 -0400
X-MC-Unique: 670rUuZFPxSMt7Hilfe25g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3961381CAFD
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC87460BF1;
 Fri, 21 Aug 2020 10:24:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 102/152] meson: convert hw/pcmcia
Date: Fri, 21 Aug 2020 06:22:39 -0400
Message-Id: <20200821102329.29777-103-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
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
 hw/Makefile.objs        | 1 -
 hw/meson.build          | 1 +
 hw/pcmcia/Makefile.objs | 2 --
 hw/pcmcia/meson.build   | 2 ++
 4 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 hw/pcmcia/Makefile.objs
 create mode 100644 hw/pcmcia/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index b6461c2f5e..f28da5869d 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -23,7 +23,6 @@ devices-dirs-y += rdma/
 devices-dirs-y += nvram/
 devices-dirs-y += pci/
 devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
-devices-dirs-y += pcmcia/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index d4abb67715..ed25644237 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('pcmcia')
 subdir('rtc')
 subdir('scsi')
 subdir('sd')
diff --git a/hw/pcmcia/Makefile.objs b/hw/pcmcia/Makefile.objs
deleted file mode 100644
index 02cd986a2c..0000000000
--- a/hw/pcmcia/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-common-obj-y += pcmcia.o
-common-obj-$(CONFIG_PXA2XX) += pxa2xx.o
diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
new file mode 100644
index 0000000000..ab50bd325d
--- /dev/null
+++ b/hw/pcmcia/meson.build
@@ -0,0 +1,2 @@
+softmmu_ss.add(files('pcmcia.c'))
+softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
-- 
2.26.2



