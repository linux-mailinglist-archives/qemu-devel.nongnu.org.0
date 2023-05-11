Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D276FEF3C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wj-0000KP-6j; Thu, 11 May 2023 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wg-0000JS-Aj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2we-0006fe-OR
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtVLeNTxK+vIAXfjRkDVm3axVsbNof/WJB4Q6ER5Tgw=;
 b=Bx+0oA8/jdoVmTiICPrba2ZHgS5srBeTy4wvlHiJa1MAJ/64lVY/0H3I0T+tBkOrxOpTeJ
 Zqkgt38CtkhXr+Rl08TndPwXqFh90rBY3KkkpimYll7DV3Sj1A/WCZT6XymhBJzIHDAMeh
 /7jKskN+GJCo43h8QGrSWTr0z1Ui59w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-724xJWpfOiGiJmOMyIBA8w-1; Thu, 11 May 2023 05:50:42 -0400
X-MC-Unique: 724xJWpfOiGiJmOMyIBA8w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a348facbbso1047261966b.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798640; x=1686390640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtVLeNTxK+vIAXfjRkDVm3axVsbNof/WJB4Q6ER5Tgw=;
 b=ap3v/mYJ9Gya2egWgTuSsMD1HMWO8zDbrNdJ+3AVfbD75niWQoJWA4JnHYffLgwF+V
 iRtPqIeP7AeKEi+zHGvdTm2wIuHimuS0RbkutJprHQOFq04mQzhgMEZF8Qx+WFitPJlb
 ncol2FoVj9sVNaHhZAjIuuvmo+WYigQN1OJtskXZAic5DYSlyddnScV3l1Y0HUtNK3lc
 rHAln1TcgoZ2bGRIHd6MY7ku6XxNCS6UtRljK0d5yIUgfwR5eLzY1mMpQOr29BZXlYR0
 kOe+4j8BedTDH21Jt4gaj7S0Kgwl76FBrl870OjNlCjNK8KNtNj7A15+lEmxs/rjB/xR
 f5WA==
X-Gm-Message-State: AC+VfDw/dVNDx6k4KDSC51Srz+dk4aYstWxHsxEx6xHcN4c00Pm0RMXp
 rr8uG5ksTXEtuQnOQ6+bijBu09A18aVukQpV86SEquaCTE4cgVJDzwg3AT4Ku5BP9JAaWjhSqyE
 Q2FdUcLduhp3Lyw1EVAi4P+ihNjQMvBgwQIayV9OCGkuIQZ5Iv/21h/egVWy2umPmEsQxaMunJ3
 4=
X-Received: by 2002:a17:906:da8d:b0:95e:d448:477 with SMTP id
 xh13-20020a170906da8d00b0095ed4480477mr18103024ejb.33.1683798640425; 
 Thu, 11 May 2023 02:50:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TqynYJ4zyqRDvxOu6nM+5BGjV3Uz4wU7ebj95LxrFq1mHLh3URcTd/F3j4e0nlMs6jw74Ig==
X-Received: by 2002:a17:906:da8d:b0:95e:d448:477 with SMTP id
 xh13-20020a170906da8d00b0095ed4480477mr18103010ejb.33.1683798640050; 
 Thu, 11 May 2023 02:50:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 ka11-20020a170907990b00b0096602a5ab25sm3768744ejc.92.2023.05.11.02.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/24] meson: add more version numbers to the summary
Date: Thu, 11 May 2023 11:50:02 +0200
Message-Id: <20230511095021.1397802-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Whenever declare_dependency is used to add some compile flags or dependent
libraries to the outcome of dependency(), the version of the original
dependency is dropped in the summary.  Make sure that declare_dependency()
has a version argument in those cases.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 144fa406503c..342986f6f90f 100644
--- a/meson.build
+++ b/meson.build
@@ -888,7 +888,8 @@ if have_system and get_option('curses').allowed()
   curses_compile_args = ['-DNCURSES_WIDECHAR=1']
   if curses.found()
     if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
-      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
+      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses],
+                                  version: curses.version())
     else
       msg = 'curses package not usable'
       curses = not_found
@@ -977,7 +978,8 @@ endif
 if sdl.found()
   # work around 2.0.8 bug
   sdl = declare_dependency(compile_args: '-Wno-undef',
-                           dependencies: sdl)
+                           dependencies: sdl,
+                           version: sdl.version())
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
                          method: 'pkg-config')
 else
@@ -1198,9 +1200,10 @@ if not gnutls_crypto.found()
     # as it "spreads unnecessary dependencies" which in
     # turn breaks static builds...
     if gcrypt.found() and get_option('prefer_static')
-      gcrypt = declare_dependency(dependencies: [
-        gcrypt,
-        cc.find_library('gpg-error', required: true)])
+      gcrypt = declare_dependency(dependencies:
+        [gcrypt,
+         cc.find_library('gpg-error', required: true)],
+        version: gcrypt.version())
     endif
   endif
   if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
@@ -1234,7 +1237,8 @@ if not get_option('gtk').auto() or have_system
     gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
                         method: 'pkg-config',
                         required: false)
-    gtk = declare_dependency(dependencies: [gtk, gtkx11])
+    gtk = declare_dependency(dependencies: [gtk, gtkx11],
+                             version: gtk.version())
 
     if not get_option('vte').auto() or have_system
       vte = dependency('vte-2.91',
-- 
2.40.1


