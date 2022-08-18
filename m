Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57559810F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:48:08 +0200 (CEST)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOc8F-0001I3-FN
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObqa-0002k1-K1
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObqY-0002us-Te
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660814990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K46ODmLUGICLcowpYe4IK3JLLd58M49i7n7kf9HoAUI=;
 b=TnSu4H5WEhyT3rG1IPyFPdmuUPMuoRWxhIDKzXkRihr1ePv28tRTUrVHRGqY/uuNgWwGGr
 WL43mvZtwt5Nz9mZon1N2Mr39wcZowgNZ+RoUqrsfi0Y6LTqrxmSkhxC1kJif5ASH7mAgB
 3Bt3O4eSoVPh88AJC8OoDyDlNReobBY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-298-qXrxJU8ePIGdQ9kaOsfr0g-1; Thu, 18 Aug 2022 05:29:49 -0400
X-MC-Unique: qXrxJU8ePIGdQ9kaOsfr0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso617687edd.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=K46ODmLUGICLcowpYe4IK3JLLd58M49i7n7kf9HoAUI=;
 b=T+eg5i0IuCOD/vP6kObDu0Q669hBx04NmVo+SBH31DdlQ/wJuJILuAL2OPnk+MKLXh
 /KbOBOM2voRsDHtlZAAHc0LRBEQVoUkw+G0b5uXy1qerWfoYDpGKtzU/P8RUapKngbH+
 qwNcdFA11n8AXkjvvctW4IKxqVqjy9HGOvTVwjWFAXRDm+XWjYdn+9cHca0Jy8Zmrids
 +RGYRIQjdtw34zEBbfYdEg8gXqRfC/W4sX6Bg7jGHRwNcJcgVAxZz6N/q3h4AZ+dAsCk
 M8nS+etg2Otz/m+WJhpUY3tsgmAuE0JN5fyg+MXTjlybFZDm4A1qT4zGYsCY37r9JE+Z
 bmrg==
X-Gm-Message-State: ACgBeo0VWzD4DkdAHyyCaF6BNywJm0xIZkEAtnntf+Ci/aA59/T3xdWx
 18d7dQlWDV1Rwne+bH12Y1+nS4dslvJdRtt9iF9hYO3QBdCPLDic+HIHu/LAK0wr+m8K8e050qB
 2276/LK1MCPmpkwXyIldMcyGTwQGwaVt55WLxQwony6owO0yl+k5pN8ZsZ5ayjK81bCY=
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id
 ef10-20020a05640228ca00b0043b5235f325mr1569657edb.320.1660814987625; 
 Thu, 18 Aug 2022 02:29:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR550z8bAB/amyVsUOcLF6HnjIfYru25lgORymYR9O0cRC35A7mNVcmo71M/b/lXTPREZbiIXQ==
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id
 ef10-20020a05640228ca00b0043b5235f325mr1569643edb.320.1660814987314; 
 Thu, 18 Aug 2022 02:29:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 ez23-20020a056402451700b0043bbbaa323dsm823659edb.0.2022.08.18.02.29.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:29:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove dead assignments
Date: Thu, 18 Aug 2022 11:29:43 +0200
Message-Id: <20220818092943.106451-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Found with "muon analyze".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 plugins/meson.build           |  2 +-
 tests/fp/meson.build          |  2 +-
 tests/qapi-schema/meson.build | 24 ++++++++++++------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/plugins/meson.build b/plugins/meson.build
index fa12047327..752377c66d 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,7 +2,7 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if targetos == 'darwin'
-    qemu_plugins_symbols_list = configure_file(
+    configure_file(
       input: files('qemu-plugins.symbols'),
       output: 'qemu-plugins-ld64.symbols',
       capture: true,
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 2b4f00b916..6258e2bd7d 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -632,7 +632,7 @@ test('fp-test-mulAdd', fptest,
            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
 
-fpbench = executable(
+executable(
   'fp-bench',
   ['fp-bench.c', '../../fpu/softfloat.c'],
   link_with: [libtestfloat, libsoftfloat],
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index c18dd7d02f..406bc7255d 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -215,18 +215,18 @@ test('QAPI schema regression tests', python,
 
 diff = find_program('diff')
 
-qapi_doc = custom_target('QAPI doc',
-                         output: ['doc-good-qapi-commands.c', 'doc-good-qapi-commands.h',
-                                  'doc-good-qapi-emit-events.c', 'doc-good-qapi-emit-events.h',
-                                  'doc-good-qapi-events.c', 'doc-good-qapi-events.h',
-                                  'doc-good-qapi-init-commands.c', 'doc-good-qapi-init-commands.h',
-                                  'doc-good-qapi-introspect.c', 'doc-good-qapi-introspect.h',
-                                  'doc-good-qapi-types.c', 'doc-good-qapi-types.h',
-                                  'doc-good-qapi-visit.c', 'doc-good-qapi-visit.h' ],
-                         input: files('doc-good.json'),
-                         command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                    '-p', 'doc-good-', '@INPUT0@' ],
-                         depend_files: qapi_gen_depends)
+custom_target('QAPI doc',
+              output: ['doc-good-qapi-commands.c', 'doc-good-qapi-commands.h',
+                       'doc-good-qapi-emit-events.c', 'doc-good-qapi-emit-events.h',
+                       'doc-good-qapi-events.c', 'doc-good-qapi-events.h',
+                       'doc-good-qapi-init-commands.c', 'doc-good-qapi-init-commands.h',
+                       'doc-good-qapi-introspect.c', 'doc-good-qapi-introspect.h',
+                       'doc-good-qapi-types.c', 'doc-good-qapi-types.h',
+                       'doc-good-qapi-visit.c', 'doc-good-qapi-visit.h' ],
+              input: files('doc-good.json'),
+              command: [ qapi_gen, '-o', meson.current_build_dir(),
+                         '-p', 'doc-good-', '@INPUT0@' ],
+              depend_files: qapi_gen_depends)
 
 if build_docs
   # Test the document-comment document generation code by running a test schema
-- 
2.37.1


