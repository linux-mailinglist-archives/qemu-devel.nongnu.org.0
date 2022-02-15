Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E074B68CC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:06:48 +0100 (CET)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJujQ-0004cL-34
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCT-0004Xs-QV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:45 -0500
Received: from [2a00:1450:4864:20::62e] (port=47086
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCR-0008UE-Rr
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:45 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qx21so3116221ejb.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5XJVTYcKatvyE2EVlCh4jGGCNj/NoYf8aEqk9uKu7c=;
 b=oyPKDIZE01mfGFMe/iylRm2ZGSpFIwqKyix4rq4kO6Halb74Irx85b7xlld3TjKow7
 MDSKpomivkmyDJfXnQV5ZuQimpVJBPsvVHeEmMqv32lZzzcaM8NMEizbEWDMbFTpbTFT
 ACK2AUSbT4SlbX9uQ9+RadpWqdjEDLQTeNfuUeZ8kpbyvsLy+ohzYUNfdz1FRDAFjED+
 ZuaJ+51vLmu+QHknW19eD380tHdyBvmHTKvyC4kXAuUJMCvQ/AGfpNfCjoJkqtVvlTEA
 br1PCq1Ga42osZzQHGSuyXPadQZF766BVxvWJQYj4gqzsciMNU1dWVogxhT4PblDou8V
 +qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C5XJVTYcKatvyE2EVlCh4jGGCNj/NoYf8aEqk9uKu7c=;
 b=5qDtN2odYgWgUIS3hqnXgpQqd328mBFJsCE4rxoeh1hTb5ZGAB7hIxG5M1QD1LW+YS
 HNYKRwNOZL3umUOeMM7w/JnzsgEfGgrwdYm8ty09J97gDUWsqoxGMhyVF7R28y0ogSDN
 aDc/G4/hR9XAIrtx+93+c7dXM58fXnUJDm9ZnS9tsXc1RiNa5ADI/2ACbwTVWwU9Ly8c
 XREJHk6yia8/8MaZz7Jyh3uGXvUj6wU+GvOMOuVWWvS74Laqn/Nvq6L+KTSVn2/SIFhu
 pwsFUII/EDgI12/Os4aeQzDp9FlOPNPEdlpKCZ2ieFmunlsOzC5HHwiqvTR84WU/hAhE
 ATVw==
X-Gm-Message-State: AOAM5323i5OeDPaWlQIptJLZOjFHeTmfGd9s7zYqbhDt6N0KYn+k30/p
 TmuaKrxJDU9nbOO4AB5euBqctxk0gB4=
X-Google-Smtp-Source: ABdhPJzlXgD7M4hUHne13JmzunwuBQT42qhvn2heI+g8GS7/Iu1GJ/J1gmN/iCahi0Z+TG4vSQ3xvA==
X-Received: by 2002:a17:906:77cb:: with SMTP id
 m11mr2370632ejn.116.1644917562565; 
 Tue, 15 Feb 2022 01:32:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] meson: do not make qga/vss-win32/meson.build conditional
 on C++ presence
Date: Tue, 15 Feb 2022 10:32:19 +0100
Message-Id: <20220215093223.110827-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

C++ presence is checked by the qga/ directory, so it can be assumed
when building VSS module.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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



