Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B9240C64
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:51:58 +0200 (CEST)
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Bxl-0006Q9-0l
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLN-0002YB-77
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:17 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23662
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BLK-0003GO-9t
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Ws839GXkHo0pgCx+WvKMCFqme1u/aoxjR4dtBjX32A=;
 b=WwhNjr/7y7tfB3nJ9fwDV5GX1A/agdnK8lFxMHPscnaOyuUEVBRpkv98Aqf1Hyahf/J1rT
 1P9qNbyup5HRmLL9XAX5l0C4rCa4Bil2wtV0lct4wTiQP2QIlJ0zKk12NHA6fy/lYRmadB
 BYFyh+Iy70HKA3eVvXFyIzfEwpVhSTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-b6rlVItIM_6ER0EDTsXRwg-1; Mon, 10 Aug 2020 13:12:09 -0400
X-MC-Unique: b6rlVItIM_6ER0EDTsXRwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E802A8014D7
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:12:08 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0228B5F1E9;
 Mon, 10 Aug 2020 17:12:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 108/147] meson: convert hw/ipack
Date: Mon, 10 Aug 2020 19:08:26 +0200
Message-Id: <1597079345-42801-109-git-send-email-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
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
 hw/Makefile.objs       | 1 -
 hw/ipack/Makefile.objs | 2 --
 hw/ipack/meson.build   | 1 +
 hw/meson.build         | 1 +
 4 files changed, 2 insertions(+), 3 deletions(-)
 delete mode 100644 hw/ipack/Makefile.objs
 create mode 100644 hw/ipack/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index f136377..76d9305 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -14,7 +14,6 @@ devices-dirs-$(CONFIG_I2C) += i2c/
 devices-dirs-y += ide/
 devices-dirs-y += input/
 devices-dirs-y += intc/
-devices-dirs-$(CONFIG_IPACK) += ipack/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/ipack/Makefile.objs b/hw/ipack/Makefile.objs
deleted file mode 100644
index 8b9bdcb..0000000
--- a/hw/ipack/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-common-obj-$(CONFIG_IPACK) += ipack.o
-common-obj-$(CONFIG_IPACK) += tpci200.o
diff --git a/hw/ipack/meson.build b/hw/ipack/meson.build
new file mode 100644
index 0000000..3f8138b
--- /dev/null
+++ b/hw/ipack/meson.build
@@ -0,0 +1 @@
+softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipack.c', 'tpci200.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 9796f95..ec4bb48 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,4 +1,5 @@
 subdir('core')
+subdir('ipack')
 subdir('ipmi')
 subdir('isa')
 subdir('mem')
-- 
1.8.3.1



