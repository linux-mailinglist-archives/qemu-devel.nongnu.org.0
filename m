Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083AD4D1667
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:41:40 +0100 (CET)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYDj-0006kM-40
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:41:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7I-0007kQ-Oj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:03 -0500
Received: from [2a00:1450:4864:20::62a] (port=41535
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7H-0005nJ-5u
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:00 -0500
Received: by mail-ej1-x62a.google.com with SMTP id a8so38520880ejc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5I5WEupkbdbuziqZbRhYTBxxuiKa4WHhAuSKTnigY58=;
 b=CWm4ZtBk2b0BHsh8IRPfEwrm7nGdfLAiJfFi6wm5JHykJxCjNiGckBvB8dWKyShTGu
 hxDdQsfinjN8UWbLLc35p6+La4fMWCRT/Z0u+RSx6eBkpCLsr6tvOHELbDOBo2vNuFR/
 U3lRwLh+ixm6XQwsm+oZcDMQ3B4RgkAvOqTc6dZcyvl+lssfukRmsFvBzluI836J2w8o
 7uYPjk5lXBRDD1P7A4JtfxPDgEnnHtp2XdvRMM8uFazL1pUHJ4KoUlPlm566QkI80y6/
 2Jy/OWnRWFNciwXXD5QXx/7Fh8q1VBPN9Hb4xNfjQm7R67WPsLg3aF6/cfKUXAeH5qFX
 kF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5I5WEupkbdbuziqZbRhYTBxxuiKa4WHhAuSKTnigY58=;
 b=qQOWbaPr4Fk+dCvoeDL0Zj73eWCmATQPs6YMsaTe5hntLDjyA5oHA8HTzIzfzI7hwv
 kiG+HelTAKrRyT3FYGwTCwcygOMgT5DGE2KTP6wAR6GJhVslvedOrd2wAvTGXDrx1uru
 GOHaKwDnmlFtLpFL8nCjAYZsjGiJ2CDsCIcmprZck2qgPdivKsCFZ4QO5OEetH9QcuM0
 qWTZkWTdRlzzfRdFNtSUu3ydd60al/omYTQfwgSyShoCaLYoKZs8vJRyi4JaU/9KYOAq
 Jxo6O4uGla90L5GhTuoYkj4EthZCC5L24H4k1QA5yp+790xg63k5fGns7+4teamr3aMQ
 JzbQ==
X-Gm-Message-State: AOAM531CkopDe+kKhJDqivXFDO76mG45PTMH50wwi4SCp2ENk8hZvRcz
 ZolLSkyYDlErYgPGCNf+x/nHh7JFXw0=
X-Google-Smtp-Source: ABdhPJyh3KtAuQA2CTmMo11bKW7oH5efJ8jFV7blRVBZ2uXGvWQ4hc04yV9mTy2CUeVrGrNl30cdKg==
X-Received: by 2002:a17:907:ea4:b0:6db:56be:d4a with SMTP id
 ho36-20020a1709070ea400b006db56be0d4amr1334845ejc.649.1646739297947; 
 Tue, 08 Mar 2022 03:34:57 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/22] qga/vss-win32: check old VSS SDK headers
Date: Tue,  8 Mar 2022 12:34:28 +0100
Message-Id: <20220308113445.859669-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The VssCoordinator & VssAdmin interfaces have been moved to vsadmin.h in
the Windows SDK.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220222194008.610377-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                | 3 +++
 qga/vss-win32/install.cpp  | 4 ++++
 qga/vss-win32/provider.cpp | 4 ++++
 qga/vss-win32/vss-common.h | 3 ++-
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b871098dbb..101a3f2d31 100644
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
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index efc5bb9909..8076efe3cb 100644
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
index fd187fb66f..1b885e24ee 100644
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
diff --git a/qga/vss-win32/vss-common.h b/qga/vss-win32/vss-common.h
index 54f8de8c88..0e67e7822c 100644
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
-- 
2.35.1



