Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C5408AF8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:21:31 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkxl-0001E6-NS
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbB-0002va-8O
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb9-000639-QV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id q26so14262229wrc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e2TTDs5+tuHORnO8NeKFNOSmiYrLPaNVfoCzWcqAEts=;
 b=KF5Za98fE3H9CwcwsbCDl2PBzHxyPt4rgjy0rehJNqu+fymzDgnZTX2XFInOYO6nqh
 +QN+BBLxkbxzXvZOzc54OFjJXHbk6RNeUl+1U/iwvvSGeNm6lJyd/3I32rOmVE+0ofmm
 p/zF+Yx28uFz4AOK+S9FtFUQ70Z+EyHyV0UQ3UlSpp0VKfhAHFfIF64g0SnkEOp3YIjD
 EsFC+a1siIkLT+uorqzS0yQd0c89sr3loF0MUgAiQZ02a3OA/KP2AsCkpzP01P+LfiZS
 8AzyEx65XASM2FkvFdAETrzxLdgub6MK+Uzy2ktBpDe7glAFsbc7j3XHXH8HqY9RSFNY
 PN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e2TTDs5+tuHORnO8NeKFNOSmiYrLPaNVfoCzWcqAEts=;
 b=hg8ySI45obONi5bGBg3xlPj2Zf2Jmld7wKmbLHF1dE9rR784SQu6mP1X2QGpZTu2h4
 XCMOMLy4y5M1ePOS88Zb50iSBkczioKEwXfgRxl8ndjQRaUdWdIXprVIqdlnScVhjEwY
 nJWPW3HpQCBsR0UGp0O/7EKEDvJXcREPMSmhoRnzeN5X7mSIAdRw8gci7xg7Gb3axRrN
 bYPOf5tFQOSsQROr1u1/2K8twXCBk5e5fktpQLUZrnIqN8+S79aSLAz5paqT/6iGIMNB
 IjfsPpU0VSdYUAkYTPKypbJpP3+7OkXwWL3MSyZocYf03dN1/FNg6zAaKumh4z5pBxQs
 in0w==
X-Gm-Message-State: AOAM533qmw6bWBziVonBpIuS0R2877QZsdZtR7QqGsLI8At6aIDSpg3z
 FNdznD+VsoFlxaCdJe6N3eGwb5I7ZFA=
X-Google-Smtp-Source: ABdhPJw1Q6dJMbPToyTXDeyoA0uLsSsPwet7T8BMMl3P2t9BSTLXfTg7KuGPMCvgVoeRfV4X8dHHuQ==
X-Received: by 2002:a05:6000:1623:: with SMTP id
 v3mr12311426wrb.288.1631534285624; 
 Mon, 13 Sep 2021 04:58:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] meson: look up cp and dtrace with find_program()
Date: Mon, 13 Sep 2021 13:57:35 +0200
Message-Id: <20210913115742.533197-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
index ef18f11d64..e401e7c415 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,6 +2,7 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
+dtrace = find_program('dtrace', required: 'CONFIG_TRACE_DTRACE' in config_host)
 foreach dir : [ '.' ] + trace_events_subdirs
   trace_events_file = meson.source_root() / dir / 'trace-events'
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



