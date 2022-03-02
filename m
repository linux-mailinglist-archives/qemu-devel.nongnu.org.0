Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A304CAD89
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:28:44 +0100 (CET)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTiN-0005s6-FU
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRz-0006kd-GX
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:47 -0500
Received: from [2a00:1450:4864:20::429] (port=34542
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nPTRx-0008PK-Ka
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id d3so4115173wrf.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3Wm5zyvRpbzPis/TBvRWMn+RknvyzFIxPlVh7GOxBE=;
 b=CDH2POxq2Q9F7PnPNYxWfAtZpDsQ1B8xgEUGbCaR6DGU6ml01mwhI3D4Bc5aDQT83K
 TgaNci5eObpoKtMP+K7Rzxdgaxwka23IULJWVrezaYpe2oXwlkVEX+823Gt8lav74+q0
 iATTANEdSxxL3fU70CsvLrBqg5OPa46/vp/fL2nSyF0eRzA+61GghXTc7rKRBeLJgYe0
 wJdBhYlFI1LdsXI+dsg3KP9i7dGJwZhvG86sMjfiWs+Uz5DDW19gT5Sfd6+cRBuMr/gQ
 sSwcMP6/sgJKMz40DGjHNzucKCCCPKMW79LU8aVOoquw6xA84pnz3z1u55Mu3BbttABG
 E8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x3Wm5zyvRpbzPis/TBvRWMn+RknvyzFIxPlVh7GOxBE=;
 b=i0wG03uX9Yx/DpdMmQNaBeQfkXjaM24HdST3SgdHpnMh+gEQk8H8DNjF2quyDv7kYn
 A/qxLjvh9Tm59jrfYVMWjQ7rdIlO6ezb2I+vT2cCcB6ME3DQtxKSXe/8ZXlOxPrDlHP9
 nAVyGEIkQgTzAuv4GNLmKyrZCB8Kzf0gMhGJVIBTOPEr5ce1b5QETiGm3OfZP5ijl6yT
 QFVpMd1SosBBdu0xEVVA5jjEd4ch53U08cAzHfe6yixgMOZM+rXOpfJ0iYuC3XY2kA3S
 323JSoNk3wpNjISDjjAG1Vxq/604dmMQqWx9/Bex32tGccEG3oAdQvua7KjlDFTdKsLZ
 /56Q==
X-Gm-Message-State: AOAM530gTqy59LyZhCM9In81MfOvw22L4qRDNGtOWx5M/mX/DmGtDEKt
 LgKbiRV3HHa1T0d6qMx42g903167MD8=
X-Google-Smtp-Source: ABdhPJw29ECLu90Mi0YwxwmPx4Oe20jdomDSf3Fb7TPzQ11sF5czTJqI5uEA9BVxRlLQQLw4V2sMhw==
X-Received: by 2002:a05:6000:16c8:b0:1ef:f880:79eb with SMTP id
 h8-20020a05600016c800b001eff88079ebmr9192611wrf.134.1646244703786; 
 Wed, 02 Mar 2022 10:11:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm7720811wmb.48.2022.03.02.10.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:11:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] qga/vss-win32: check old VSS SDK headers
Date: Wed,  2 Mar 2022 19:11:28 +0100
Message-Id: <20220302181134.285107-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302181134.285107-1-pbonzini@redhat.com>
References: <20220302181134.285107-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
2.34.1



