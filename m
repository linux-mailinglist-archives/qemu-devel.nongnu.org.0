Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A54240C1B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:37:13 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BjU-0003Uj-HE
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKh-0001MO-83
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58537
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BKe-0003B5-AS
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJ9OVokfJnGAhtD/lxsDsJtm9yPBxnkQ0IWINN8PfuI=;
 b=NxLhvwGGg2jJ4LhNaVyWmI/HzE1p+HYbGlfZVdQtxGcenydWpqJCb6RqRsBLenxttxl3n6
 v3O1svNIM/gl1hkZw87d9nHyK1QrbHvj3rHC2mMHWGQnL9WU8vYS5rjEj7ukWhdUnA67Jw
 PxH2W4zjCWkBS/3sV90BGJ2Hd4KnbcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-lqPjHnwNNuyqn9DW-Qbg-Q-1; Mon, 10 Aug 2020 13:11:29 -0400
X-MC-Unique: lqPjHnwNNuyqn9DW-Qbg-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E271800473
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:11:29 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B7955F1E9;
 Mon, 10 Aug 2020 17:11:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 084/147] meson: convert hw/semihosting
Date: Mon, 10 Aug 2020 19:08:02 +0200
Message-Id: <1597079345-42801-85-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:29:25
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
index bdf8bdf..6a7ca0f 100644
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
index fe7c466..66a2f6c 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,2 +1,3 @@
 subdir('core')
+subdir('semihosting')
 subdir('xen')
diff --git a/hw/semihosting/Makefile.objs b/hw/semihosting/Makefile.objs
deleted file mode 100644
index 4ad47c0..0000000
--- a/hw/semihosting/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-$(CONFIG_SEMIHOSTING) += config.o
-obj-$(CONFIG_SEMIHOSTING) += console.o
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
new file mode 100644
index 0000000..f40ac57
--- /dev/null
+++ b/hw/semihosting/meson.build
@@ -0,0 +1,4 @@
+specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'config.c',
+  'console.c',
+))
-- 
1.8.3.1



