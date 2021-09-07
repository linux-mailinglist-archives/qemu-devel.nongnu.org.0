Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A7402DB8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 19:27:59 +0200 (CEST)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNet4-0001rm-At
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 13:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNerj-0000om-TJ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:26:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNerh-0007up-Oo
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 13:26:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id me10so21121017ejb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLn5g4FoR7mR1rBmmqOEQtg9+IHNn2l9tgx/k2MCOHE=;
 b=mziI/V1qeEqZpNT/boJZXHzN+WvF5QPRv2XKbBYWEe1Q1cVT8IewAMJKVtfAtlYoVS
 Fajg5UTsAvvtyd3jXlzJsC86qZ3U+R7Oqm0a3Hcnam+7lymmy+9bBt3GbMMlu4ocKdgJ
 kV01T6NlctPA5z8wbLjA/9tzQvV8svUAmLsFEvBABHVY2z2SWkgeFazTPO+P21BcEzr9
 QkjbxAZXMKz+pNJv47M5EKHEGWgx/IxC3URAILS7NcnfRiLyYau34pZqKhsde6zSU1Ot
 3MzxSLfYVfydPTX21dHrPRS0FQ61f36EBVur42vCplbR8y95pYMYerYeHRZ3zfDWZq9y
 9VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kLn5g4FoR7mR1rBmmqOEQtg9+IHNn2l9tgx/k2MCOHE=;
 b=uiyLqaP+AoqFldyO7KeLxY5WUpN3YV57emN1Z9O4EWL0WAjvzuzLkA1w5B288DFDQG
 Uea/fMGcb1zq6Bq9Ddm6zzAPcNjLGnLrYl8UyYyhktc6QJF90Q82njoUrea84EnZDjXE
 HfnYVzEuf1kAUxXNO49ke5hVQXB3DAflu1XCsHvIrYZZKDgrAqqxio9PKwZBXBxeSWT9
 S36AS6Ff7kbTNH64tcxDTGI/nVkDMM5p+9z9bTbtisVL/MV7H9wFoJDyaqu/v/meQfAI
 +jTLyhFqKXZc88MRMwK8KwiZgutU8HIaKRfvk6qdmbB0hyv9vLvqNrh+hlEi+UtlgOOq
 2h9Q==
X-Gm-Message-State: AOAM532o8Sb+appbGnjcJpiCIeuAFU4Wx+JD550/tE8s3p0QKmUm6Kj3
 8FlJmsWibQBqdSUr3W4gETKV5oAtSJ4=
X-Google-Smtp-Source: ABdhPJySqzI/qdjNWgCjaJt0rQK5IpYIiE0qgMrpA/pQryb4a+AeX9SWk8OY6M/G8YZsBTb4ftCAXw==
X-Received: by 2002:a17:907:2083:: with SMTP id
 pv3mr19306918ejb.402.1631035591928; 
 Tue, 07 Sep 2021 10:26:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d23sm6895330eds.88.2021.09.07.10.26.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 10:26:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: look up cp and dtrace with find_program()
Date: Tue,  7 Sep 2021 19:26:25 +0200
Message-Id: <20210907172625.227568-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Avoid that meson prints a "Program xyz found" test once per
custom_target.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/keymaps/meson.build | 3 ++-
 trace/meson.build           | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 05eda6c0d2..44247a12b5 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -38,6 +38,7 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
 else
   native_qemu_keymap = qemu_keymap
 endif
+cp = find_program('cp')
 
 t = []
 foreach km, args: keymaps
@@ -55,7 +56,7 @@ foreach km, args: keymaps
                        build_by_default: true,
                        input: km,
                        output: km,
-                       command: ['cp', '@INPUT@', '@OUTPUT@'],
+                       command: [cp, '@INPUT@', '@OUTPUT@'],
                        install: true,
                        install_dir: qemu_datadir / 'keymaps')
   endif
diff --git a/trace/meson.build b/trace/meson.build
index 74c3214a13..54e509c17c 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,6 +2,7 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
+dtrace = find_program('dtrace')
 foreach dir : [ '.' ] + trace_events_subdirs
   trace_events_file = meson.project_source_root() / dir / 'trace-events'
   trace_events_files += [ trace_events_file ]
@@ -39,13 +40,13 @@ foreach dir : [ '.' ] + trace_events_subdirs
     trace_dtrace_h = custom_target(fmt.format('trace-dtrace', 'h'),
                                    output: fmt.format('trace-dtrace', 'h'),
                                    input: trace_dtrace,
-                                   command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
+                                   command: [ dtrace, '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
     trace_ss.add(trace_dtrace_h)
     if host_machine.system() != 'darwin'
       trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
                                      output: fmt.format('trace-dtrace', 'o'),
                                      input: trace_dtrace,
-                                     command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
+                                     command: [ dtrace, '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
       trace_ss.add(trace_dtrace_o)
     endif
 
-- 
2.31.1


