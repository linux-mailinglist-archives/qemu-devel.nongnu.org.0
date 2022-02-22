Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C64C02C9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:05:08 +0100 (CET)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbPH-000633-PF
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:05:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1W-0007rp-W7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nMb1T-00080a-1q
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645558825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSESw2B9YtkSPumdF/JVLh1UotaxwApvHyO+vHsYoXg=;
 b=GrDRxhzVAFofH7DEcFx0P3WKt4+tiFSntAsS5CcVg1VT2o+Y+4M0CWlOlHC1lQazAK34U2
 QFfQ5pYNURlKA4+tV5goKYFJc/rNPG9CrCGtcdfOhLYOMSxr/qZpk/mWYDZ74rhifr+SDB
 NrfNfgvBKsZ7w01oummEfWxvYINdL6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-fCt7dkLfNPyIjdo5CJHVjg-1; Tue, 22 Feb 2022 14:40:24 -0500
X-MC-Unique: fCt7dkLfNPyIjdo5CJHVjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00EC1854E32;
 Tue, 22 Feb 2022 19:40:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6DCE5DB83;
 Tue, 22 Feb 2022 19:40:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] qga/vss-win32: check old VSS SDK headers
Date: Tue, 22 Feb 2022 23:40:02 +0400
Message-Id: <20220222194008.610377-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220222194008.610377-1-marcandre.lureau@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The VssCoordinator & VssAdmin interfaces have been moved to vsadmin.h in
the Windows SDK.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build                | 3 +++
 qga/vss-win32/vss-common.h | 3 ++-
 qga/vss-win32/install.cpp  | 4 ++++
 qga/vss-win32/provider.cpp | 4 ++++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b871098dbba0..101a3f2d31ee 100644
--- a/meson.build
+++ b/meson.build
@@ -1933,12 +1933,15 @@ config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
   }'''))
 
 have_vss = false
+have_vss_sdk = false # old xp/2003 SDK
 if targetos == 'windows' and link_language == 'cpp'
   have_vss = cxx.compiles('''
     #define __MIDL_user_allocate_free_DEFINED__
     #include <vss.h>
     int main(void) { return VSS_CTX_BACKUP; }''')
+  have_vss_sdk = cxx.has_header('vscoordint.h')
 endif
+config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
 have_ntddscsi = false
 if targetos == 'windows'
diff --git a/qga/vss-win32/vss-common.h b/qga/vss-win32/vss-common.h
index 54f8de8c8851..0e67e7822ce6 100644
--- a/qga/vss-win32/vss-common.h
+++ b/qga/vss-win32/vss-common.h
@@ -64,12 +64,13 @@ const CLSID CLSID_QGAVSSProvider = { 0x6e6a3492, 0x8d4d, 0x440c,
 const TCHAR g_szClsid[] = TEXT("{6E6A3492-8D4D-440C-9619-5E5D0CC31CA8}");
 const TCHAR g_szProgid[] = TEXT("QGAVSSProvider");
 
+#ifdef HAVE_VSS_SDK
 /* Enums undefined in VSS SDK 7.2 but defined in newer Windows SDK */
 enum __VSS_VOLUME_SNAPSHOT_ATTRIBUTES {
     VSS_VOLSNAP_ATTR_NO_AUTORECOVERY       = 0x00000002,
     VSS_VOLSNAP_ATTR_TXF_RECOVERY          = 0x02000000
 };
-
+#endif
 
 /* COM pointer utility; call ->Release() when it goes out of scope */
 template <class T>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index efc5bb9909c0..8076efe3cbb5 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -13,7 +13,11 @@
 #include "qemu/osdep.h"
 
 #include "vss-common.h"
+#ifdef HAVE_VSS_SDK
 #include <vscoordint.h>
+#else
+#include <vsadmin.h>
+#endif
 #include "install.h"
 #include <wbemidl.h>
 #include <comdef.h>
diff --git a/qga/vss-win32/provider.cpp b/qga/vss-win32/provider.cpp
index fd187fb66f67..1b885e24ee17 100644
--- a/qga/vss-win32/provider.cpp
+++ b/qga/vss-win32/provider.cpp
@@ -12,7 +12,11 @@
 
 #include "qemu/osdep.h"
 #include "vss-common.h"
+#ifdef HAVE_VSS_SDK
 #include <vscoordint.h>
+#else
+#include <vsadmin.h>
+#endif
 #include <vsprov.h>
 
 #define VSS_TIMEOUT_MSEC (60*1000)
-- 
2.35.1.273.ge6ebfd0e8cbb


