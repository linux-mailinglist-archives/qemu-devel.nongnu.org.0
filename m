Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E816FEF3D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2x5-0000rC-FY; Thu, 11 May 2023 05:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x2-0000ic-7s
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x0-0006kc-Fb
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zj4hkECaFqe0+nYtTaCSliiV5fO1Yqr+2CHBgOOT08I=;
 b=HjCP3g1QgNdEuVTL6LreB9G2swqt2/Y9z2Cr3zIiTAlR9EaOaxo6Vox90LdK5cEpj+yNNL
 l9HqCuXuU2B26CKAkBrwazOpeZmnFs7Am3xlP20M27BgZ+2Cjh8B8ui+tC5oYiqdNJb69V
 HU2Dio5KLzgNxtfeijQtoQ4rp3Ltz9U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-fqdD7gsbOfebf_oi1Po9ug-1; Thu, 11 May 2023 05:51:03 -0400
X-MC-Unique: fqdD7gsbOfebf_oi1Po9ug-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a356c74e0so812940566b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798662; x=1686390662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zj4hkECaFqe0+nYtTaCSliiV5fO1Yqr+2CHBgOOT08I=;
 b=Khm77IUVRugKHi0X+JWv6144mvMNr4yPcxvkA1/c1x04i4NPNcxvUouYi4/EHK5osw
 OfJkatUc7b30K8oAUUtr9E00H91tsarxlMIdtzFkaezxD1f4F3kFO/s5dL1GlRf+okLk
 8Rtm3nCLx8Bp7n/0uDfGeJmwARaWjOfnhPmKsSp45SpJIEQNo0+VOS1knuzT8PyemR2E
 bogUyTLVc/HY/AFeeYxF/x4t8HqCc1FIbZUjzhjFU+H1AW99U1dst2XW9NqS7HpMWNKf
 +oyM1FYqUrmvnhIZ14FKUiC6lrqIYe/Glbz3RA9vVU5C9dL+iRkildF0/72o3c8I6Tg5
 Xvig==
X-Gm-Message-State: AC+VfDyRQBi0BiOWbvlepvRTZMux7z4eT2eefGuSwi/EKkGcsr+3OQy+
 +3+mrMa3cJmwaP17dtxy4RH511EPWJm/+h/hAqYP1YLHqNrQXGO2Q11by6V3+oA5QTU4N3reK7/
 421ocMdQrE/pJRlW2QRVUG0G7jzPn42i5cNB2JipyDErVRfi3IDIB4XPP/nGU8dRZUQsOElJ4x5
 M=
X-Received: by 2002:a17:907:2d1f:b0:968:db2f:383 with SMTP id
 gs31-20020a1709072d1f00b00968db2f0383mr11562985ejc.53.1683798662373; 
 Thu, 11 May 2023 02:51:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52zeQqivKo23vkOJUbRcExNMOLuvTB4XjDOgq6MpWPdKXaSdQkbZ9ZXSjyJplJn0MRh9E9dA==
X-Received: by 2002:a17:907:2d1f:b0:968:db2f:383 with SMTP id
 gs31-20020a1709072d1f00b00968db2f0383mr11562968ejc.53.1683798661997; 
 Thu, 11 May 2023 02:51:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 30-20020a17090601de00b009662d0e637esm3791444ejj.155.2023.05.11.02.51.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/24] build: move compiler version check to meson
Date: Thu, 11 May 2023 11:50:14 +0200
Message-Id: <20230511095021.1397802-18-pbonzini@redhat.com>
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

Use the slighly nicer .version_compare() function for GCC; for Clang that is
not possible due to the mess that Apple does with version numbers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 25 -------------------------
 meson.build | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index a7c3fcc26609..b58ea2aba1f3 100755
--- a/configure
+++ b/configure
@@ -1128,31 +1128,6 @@ if test "$targetos" = "bogus"; then
     error_exit "Unrecognized host OS (uname -s reports '$(uname -s)')"
 fi
 
-# Check whether the compiler matches our minimum requirements:
-cat > $TMPC << EOF
-#if defined(__clang_major__) && defined(__clang_minor__)
-# ifdef __apple_build_version__
-#  if __clang_major__ < 12 || (__clang_major__ == 12 && __clang_minor__ < 0)
-#   error You need at least XCode Clang v12.0 to compile QEMU
-#  endif
-# else
-#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
-#   error You need at least Clang v10.0 to compile QEMU
-#  endif
-# endif
-#elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
-#  error You need at least GCC v7.4.0 to compile QEMU
-# endif
-#else
-# error You either need GCC or Clang to compiler QEMU
-#endif
-int main (void) { return 0; }
-EOF
-if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)"
-fi
-
 if test "$static" = "yes" ; then
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
diff --git a/meson.build b/meson.build
index 0c5d2cf634fa..a751d86bc3ea 100644
--- a/meson.build
+++ b/meson.build
@@ -190,6 +190,26 @@ endif
 # Compiler flags #
 ##################
 
+foreach lang : all_languages
+  compiler = meson.get_compiler(lang)
+  if compiler.get_id() == 'gcc' and compiler.version().version_compare('>=7.4')
+    # ok
+  elif compiler.get_id() == 'clang' and compiler.compiles('''
+      #ifdef __apple_build_version__
+      # if __clang_major__ < 12 || (__clang_major__ == 12 && __clang_minor__ < 0)
+      #  error You need at least XCode Clang v12.0 to compile QEMU
+      # endif
+      #else
+      # if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
+      #  error You need at least Clang v10.0 to compile QEMU
+      # endif
+      #endif''')
+    # ok
+  else
+    error('You either need GCC v7.4 or Clang v10.0 (or XCode Clang v12.0) to compile QEMU')
+  endif
+endforeach
+
 # default flags for all hosts
 # We use -fwrapv to tell the compiler that we require a C dialect where
 # left shift of signed integers is well defined and has the expected
-- 
2.40.1


