Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AEB244745
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:45:25 +0200 (CEST)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WH6-0003Kd-Q6
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnI-0006ho-6X
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52210
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnF-00031a-P2
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJYRzFczP3G71nLXPxT7FoelYpxmkicx4WZGHD1y9RM=;
 b=OqAZutl6TX2UPZcwlrta5FuM08BmnFsTPjPGYUzPkxIOxpTlvK25y+KZu4s9Aox9SnbpHU
 YrW2FIylBTVN/k45ix89qKrSKR5DjKy4EPuA5IPEfmWRGtDk72AbrIQ3Zp+ut4ezcTLIeE
 l1Iqkraia7UaRYYsIgmtaYyuw9sBwYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-K6CSCTktPpW6dnADr1Glpg-1; Fri, 14 Aug 2020 05:14:31 -0400
X-MC-Unique: K6CSCTktPpW6dnADr1Glpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3007A881276
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54EF600E4;
 Fri, 14 Aug 2020 09:14:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 084/150] meson: convert qapi-specific to meson
Date: Fri, 14 Aug 2020 05:12:20 -0400
Message-Id: <20200814091326.16173-85-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 01:57:54
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs      |  2 --
 Makefile.target    |  1 -
 qapi/Makefile.objs | 15 ---------------
 qapi/meson.build   | 10 +++++++---
 4 files changed, 7 insertions(+), 21 deletions(-)
 delete mode 100644 qapi/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index 3b32a4c9bb..c332323b81 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -64,8 +64,6 @@ common-obj-$(if $(and $(CONFIG_BZIP2),$(CONFIG_DMG)),m) += block-dmg-bz2$(DSOSUF
 common-obj-y += hw/
 common-obj-m += hw/
 
-common-obj-y += qapi/
-
 common-obj-y += libqmp.fa
 
 endif # CONFIG_SOFTMMU
diff --git a/Makefile.target b/Makefile.target
index bf3fda92c1..386378b9c8 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -157,7 +157,6 @@ ifdef CONFIG_SOFTMMU
 obj-y += softmmu/
 obj-y += gdbstub.o
 obj-y += hw/
-obj-y += qapi/
 LIBS := $(libs_softmmu) $(LIBS)
 
 # Temporary until emulators are linked by Meson
diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
deleted file mode 100644
index c0a31be1a1..0000000000
--- a/qapi/Makefile.objs
+++ /dev/null
@@ -1,15 +0,0 @@
-QAPI_TARGET_MODULES = machine-target misc-target
-
-obj-y = qapi-introspect.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-types-%.o)
-obj-y += qapi-types.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-visit-%.o)
-obj-y += qapi-visit.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-events-%.o)
-obj-y += qapi-events.o
-obj-y += $(QAPI_TARGET_MODULES:%=qapi-commands-%.o)
-obj-y += qapi-commands.o
-obj-y += qapi-init-commands.o
-
-QAPI_MODULES_STORAGE_DAEMON = block-core char common control crypto
-QAPI_MODULES_STORAGE_DAEMON += introspect job qom sockets pragma transaction
diff --git a/qapi/meson.build b/qapi/meson.build
index f45b80bbfa..2b2872a41d 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -114,8 +114,12 @@ foreach output : qapi_util_outputs
   i = i + 1
 endforeach
 
-# These are still handled by the Makefile
-i += qapi_nonmodule_outputs.length()
-i += qapi_specific_outputs.length()
+foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
+  if output.endswith('.h')
+    genh += qapi_files[i]
+  endif
+  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
+  i = i + 1
+endforeach
 
 qapi_doc_texi = qapi_files[i]
-- 
2.26.2



