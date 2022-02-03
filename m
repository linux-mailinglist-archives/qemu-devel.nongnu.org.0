Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53834A8B5C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:16:19 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgeY-00027G-Rd
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0U-0005NK-DK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:54 -0500
Received: from [2a00:1450:4864:20::531] (port=38659
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008JQ-CK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:54 -0500
Received: by mail-ed1-x531.google.com with SMTP id j23so7488020edp.5
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDhkSKJIsTHr2sd6jj36FMu/3VAbQYpKNZ0XGav9eqg=;
 b=Q5lzqtaa1zf0tr3XeRHLu3vSmxVljirPIfVuVhgxD8pyKDoTDw5klDbl6txU1dOMRW
 YXh6pYrWmjiNshwyo8y49xH7EKfINa0qkTPOSwvhACGKkFy8Yx4hwYndo2/RnneXFzbG
 zHu75rtitAwnbNP5Hcphs3AanLtf7ZqIduA1P+lDCxIBHTvunyfYKCXKJQ4eFGCGWfu0
 5UhgREuk6Dl/6u0KJDeA1EZhq3fUN1CV4UIP4ZRL3upyhJUiExtERyinWlaEfJ/YrkNG
 LfZ55pb+w1iNbDb8qPvWaPen0BD+fFnMkgjebPCRDyvYL4MKMSsD2iUMFAKzPOt72Rkm
 +jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zDhkSKJIsTHr2sd6jj36FMu/3VAbQYpKNZ0XGav9eqg=;
 b=G49DN0ll8DzLtyy6iCC1+l1Ti7W2G3rGwNONUDYk3cFiJdSv3W6EjVIszQZzfFaOpa
 cPJd5FCVk7B04KDSGkAkUqrLstNytV6JYh8MckwM0M0Gr9SFhXjog2GOLHhKu0XPot/X
 sU3kNwwZR7jBWXtn0wOrzpLgQFmUAPng3Ki7tvHogoqHeFImtD/g2KO6B1U/OECzTI2U
 /AIR3SYbYGSbO1/vVRLNJfYXVcOwaMq3+0bRrgj0N1j4MYlEVPURSytHI3HxyBXuqhzt
 I2UbQB5NV5nMfCBXFfTTFCOtzTe8XTVA5LjdT+GEmeAcNXuiCG0+6yfdOkTjbnXoVwF+
 1BSA==
X-Gm-Message-State: AOAM5317quawhM7DGdQW1EYDkGL78ZKThuePHf0g5z/LmaydDk7iMEn4
 71vzlQ54jRsCUh3NigWdOB557kWsIRY=
X-Google-Smtp-Source: ABdhPJyVTa61i+MC0ALhLid9henPow9k6EE/UJuEgi/1GSSvDXLC5lO6PIq4r1WzDm0JMq3TLkPp6Q==
X-Received: by 2002:a50:ab1a:: with SMTP id s26mr35730115edc.85.1643909658268; 
 Thu, 03 Feb 2022 09:34:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/27] meson: do not make qga/vss-win32/meson.build
 conditional on C++ presence
Date: Thu,  3 Feb 2022 18:33:55 +0100
Message-Id: <20220203173359.292068-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

C++ presence is checked by the qga/ directory, so it can be assumed
when building VSS module.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 41 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 8f3aff5fe3..8d4c5708d8 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -1,22 +1,29 @@
-if add_languages('cpp', required: false)
-  glib_dynamic = dependency('glib-2.0', static: false)
-  link_args = cc.get_supported_link_arguments(['-fstack-protector-all', '-fstack-protector-strong',
-                                               '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
+glib_dynamic = dependency('glib-2.0', static: false)
+link_args = cc.get_supported_link_arguments([
+  '-fstack-protector-all',
+  '-fstack-protector-strong',
+  '-Wl,--add-stdcall-alias',
+  '-Wl,--enable-stdcall-fixup'
+])
 
-  qga_vss = shared_module('qga-vss', ['requester.cpp', 'provider.cpp', 'install.cpp'],
-                name_prefix: '',
-                cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
-                link_args: link_args,
-                vs_module_defs: 'qga-vss.def',
-                dependencies: [glib_dynamic, socket,
-                               cc.find_library('ole32'),
-                               cc.find_library('oleaut32'),
-                               cc.find_library('shlwapi'),
-                               cc.find_library('uuid'),
-                               cc.find_library('intl')])
+qga_vss = shared_module(
+  'qga-vss',
+  ['requester.cpp', 'provider.cpp', 'install.cpp'],
+  name_prefix: '',
+  cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
+  link_args: link_args,
+  vs_module_defs: 'qga-vss.def',
+  dependencies: [
+    glib_dynamic, socket,
+    cc.find_library('ole32'),
+    cc.find_library('oleaut32'),
+    cc.find_library('shlwapi'),
+    cc.find_library('uuid'),
+    cc.find_library('intl')
+  ]
+)
 
-  all_qga += qga_vss
-endif
+all_qga += qga_vss
 
 midl = find_program('midl', required: false)
 widl = find_program('widl', required: false)
-- 
2.34.1



