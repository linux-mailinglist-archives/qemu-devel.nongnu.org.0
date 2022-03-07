Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4F4D0641
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:19:35 +0100 (CET)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHxG-0005SN-5D
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHue-0000um-Tx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:52 -0500
Received: from [2a00:1450:4864:20::62f] (port=37536
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Mv-26
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:52 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bg10so33860475ejb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x3Wm5zyvRpbzPis/TBvRWMn+RknvyzFIxPlVh7GOxBE=;
 b=YGCBJlp3CPJbSztuaVbzR1r3QSBKb3zoYkm2sqLDgZPlUso5o8LuO7qeJj3BbU22cs
 4cPQBEyKE8q55uI7Ge0MyMq7pEXSHcAXBMP3hxbk6f/zKqJiMc6Zj0ZjPMZhuTM3L9yY
 uGodp8W5zwNMMES5j91rycIyYD+iOS35dRNO2ZSHj2lCeSFlwz66su0DfLb6P8wW9csx
 DMqZER+JsG2VXO4SSxmUo/wwYrTq1gqptcEWJc/SabMmMVfx8pcTQxdsTz8ceq54nHZA
 essMfzh2673YAarX+rfsfvXPrdBysAm2RQAU8UuZay5uN6jjtuOvmI+VJbxs5n6+pSBJ
 flQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x3Wm5zyvRpbzPis/TBvRWMn+RknvyzFIxPlVh7GOxBE=;
 b=V4ts9ABR879CtA6sg9FAgWDk6wWPePhsLf7uspsvxj0B4lxOVUMzqw3/mz+ZBNYJoL
 vCElhtW5wO/xmF/OTwiJyccGT0LzB8PUTorYI8dviewflASp1TXfoe1TTsU6QZw+FMEm
 q/1V0IbSthMsZaav3bltgxyldU0cMhiko/bAZ7NBiqqLlCkL2jDOxSo6gc7YoSQYwdkK
 yT8jtsD2c/9b+E5JQ+AqY8S5iZ/Uw4jI/iMv1+BntQfqGeCxn8cWWP8POwsGtCFJy/cW
 //bcyfdAWD0UiBmLDokpV24unpL4yzPIDxWGZmN4BAam1z3jmvVraFA220XMMiMooKWZ
 Cg6g==
X-Gm-Message-State: AOAM533oRU1v0sB+LY9lPja2ArEANg/Z/pyR/J0fRdJy/DaTffCT/kNS
 q/kF6TqTn8S4mUnNzXCDzw1eO6244Jg=
X-Google-Smtp-Source: ABdhPJzwdJgGDZCQ1KAUj0hi9rvX46lPgcW477Wfq9vZoGJQzoo80/FLt5/Yv1YYdUsY3h+A15orew==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id
 x17-20020a170906299100b006cf6b24e92fmr9936737eje.748.1646676999636; 
 Mon, 07 Mar 2022 10:16:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] qga/vss-win32: check old VSS SDK headers
Date: Mon,  7 Mar 2022 19:16:15 +0100
Message-Id: <20220307181633.596898-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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



