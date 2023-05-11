Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C716FEF61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xO-0001pr-VV; Thu, 11 May 2023 05:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x7-0000zI-H1
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x1-0006kz-Ao
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px4Ef2y8fI3o2Q6OhRjhkrlJeU2fyggh2VF0TGSUSwk=;
 b=SpyQLP6Q5SSSrcADCshhniFK7Wv8EkXlESc11YTjtGu+yuW+0EatosPsVLE9fVuU4IRCjD
 h45nVH3F4f+1OtgSRvAGQm2K6iqeCcLBzkRAdO1J3jolYivRFCejREp7xZkStEmvyxFNx1
 YSgGG7TmNp6k7a53a3Sx8tO3oET8woI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-8H9YVRVtPWuXb3mtFiJ0CQ-1; Thu, 11 May 2023 05:51:05 -0400
X-MC-Unique: 8H9YVRVtPWuXb3mtFiJ0CQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-95f6f291b9aso1045431466b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798664; x=1686390664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Px4Ef2y8fI3o2Q6OhRjhkrlJeU2fyggh2VF0TGSUSwk=;
 b=UKr+1B74WpPFax8DXaO39uLrH1zkeH8EVVo9UKxAZ6A67rzlF+xJIeq9aNxfM/fYxD
 w0GenNNYroHlPD88ol3XASHn/piprQ/AWPxcgE++ugx5NkwpBkIjPS0/eBiSYMNaUU24
 U0YhzecgG7XKDdbuKt4MN8qqNgV2sd2aVPSPyyUf8IhHDffR4xK5Rff3T9pyzDzyJm5i
 NQIbrCVde3MHoel/mzvjvG9LVOJcF3WNABF+XYp7yK2CdulPXL9mgxZ4Mu1Nhcm3C74R
 4aKslzFH+2JTglV33xkeXGnh6awyg1yTuJoJoVNisZm7zLco4LOW+thhqGihm4jP+Kqd
 257A==
X-Gm-Message-State: AC+VfDxeReWbhKVX5oFrDEM7enJ/oXZyvIEwrXBb1JRuB45Ae2XHbL5u
 Zh7hQxZYrHJS9a/Yq8+JwMbyzj3CpThgJ9+JaE7gLzCVb0fxpbfaCoKByuKkGpW27PtHHq4UnSu
 Yp+TlRfoplKmRKBugY3Ed2ZH5Cd/nJOuXEWme+nBtgUj/J6m78a/RoMVAuVT3mLnuCd1PQ2ezvq
 E=
X-Received: by 2002:a17:906:ee82:b0:94f:1a23:2f1c with SMTP id
 wt2-20020a170906ee8200b0094f1a232f1cmr17208910ejb.50.1683798663904; 
 Thu, 11 May 2023 02:51:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ADmkXMPwzRux2MG7/N8ub3frBVRMwo23FiGXcUrZQfOE+yumE+zlaPuYyBYSvNxf/imdd/Q==
X-Received: by 2002:a17:906:ee82:b0:94f:1a23:2f1c with SMTP id
 wt2-20020a170906ee8200b0094f1a232f1cmr17208897ejb.50.1683798663507; 
 Thu, 11 May 2023 02:51:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a056402068800b0050bc9c38fb4sm2695380edy.69.2023.05.11.02.51.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/24] build: move --disable-debug-info to meson
Date: Thu, 11 May 2023 11:50:15 +0200
Message-Id: <20230511095021.1397802-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 5 -----
 scripts/meson-buildoptions.py | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index b58ea2aba1f3..6e5e91908a4b 100755
--- a/configure
+++ b/configure
@@ -694,10 +694,6 @@ for opt do
   ;;
   --cross-prefix-*)
   ;;
-  --enable-debug-info) meson_option_add -Ddebug=true
-  ;;
-  --disable-debug-info) meson_option_add -Ddebug=false
-  ;;
   --enable-docs) docs=enabled
   ;;
   --disable-docs) docs=disabled
@@ -972,7 +968,6 @@ cat << EOF
   bsd-user        all BSD usermode emulation targets
   pie             Position Independent Executables
   debug-tcg       TCG debugging (default is disabled)
-  debug-info      debugging information
 
 NOTE: The object files are built at the place where configure is launched
 EOF
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 4c7f13fdfc40..8d2e526132ae 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -36,6 +36,7 @@
     "b_coverage": "gcov",
     "b_lto": "lto",
     "coroutine_backend": "with-coroutine",
+    "debug": "debug-info",
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
     "qemu_firmwarepath": "firmwarepath",
@@ -47,6 +48,7 @@
     "b_coverage",
     "b_lto",
     "datadir",
+    "debug",
     "includedir",
     "libdir",
     "libexecdir",
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index dd1c83f6f1b9..8030d63edd3a 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -11,6 +11,7 @@ meson_options_help() {
   printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
+  printf "%s\n" '  --disable-debug-info     Enable debug symbols and other information'
   printf "%s\n" '  --disable-hexagon-idef-parser'
   printf "%s\n" '                           use idef-parser to automatically generate TCG'
   printf "%s\n" '                           code for the Hexagon frontend'
@@ -258,6 +259,8 @@ _meson_option_parse() {
     --datadir=*) quote_sh "-Ddatadir=$2" ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
+    --enable-debug-info) printf "%s" -Ddebug=true ;;
+    --disable-debug-info) printf "%s" -Ddebug=false ;;
     --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
     --disable-debug-mutex) printf "%s" -Ddebug_mutex=false ;;
     --enable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=true ;;
-- 
2.40.1


