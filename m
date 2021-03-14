Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CD033A734
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:52:33 +0100 (CET)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUum-000665-Ux
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsq-0004NF-Vu
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLUsn-0006ex-Kk
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:50:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e9so4548028wrw.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=PIsfCB11tkecpyathGQbXLv0+21/6sNWr5QYRGJ0nweokvPXq2Rj3S2e9SVRdrX3HH
 egPptRaz5Qe8tZxlkz0S9R3JmWd9wHrwV2VDxJdkRkT7r6Z9omU4K/rpF9QwQpa90ZjA
 UIro+V72ZB07u3ier+A0hzywDoxheyxx+nGHNvOZEm6ZCUMUzmohhtISGH9ha85v5aF+
 KZjo3Y3x/QBPqWEkPNd3NaS2joe4vVegxHJp0JExCQiONv8LxiWBKmUtAyQsn45JBjyJ
 BN2TDg/w9ViOSWCVxVy2JU2RNbSH25UkR/KJ5RR93Wu84TXS471Hu42qcd3ZaFhipYBF
 QlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=rtMhIwj6jUW+3xUs1G7X0vBXbkBWjqZ4NQ9R75TgOnG0UfrFRiqsqiqPLX6UGIpRm0
 0jTrhDBDx6qsKAcGWNxx7Jyv1P193yEqNsAHYxfvuj1KZjOnOtwXEVizMg/+Pl8b5bxD
 YTSmQAP4xq8TshcpQc6BvQtgP7xmBN7KmaKpjaoGEtO4RRNfVxmlZGjfZZYQxPCcpX81
 Ya8QAwWDCo1Dcj2T1AETH6f+HV2cev361JMU5lSNMXJuMiYIJ4tVY8Z45F5LbqIrOYeK
 ws95I5Ac/TjY4qDNbnrdYbpqHjwXZJNQp4DH391fn9dq8/zL1L6mcHMVfMhwjZtL7Fx9
 YnzQ==
X-Gm-Message-State: AOAM5301reuiOhemFDPAIg5HRfUljjZ5zJR16J4iAq1DbbiBgXYAVkP0
 +h/7ipqi1wySm2mfVXxTrHYyGFEECX0=
X-Google-Smtp-Source: ABdhPJyqpE728lFJk2ECFaMQK2kasLU1Y6GpI3dnFCRR0HaoldEvv/mJreQKmXO/I6JM5CBAAtrQ0g==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr23636618wru.357.1615744228313; 
 Sun, 14 Mar 2021 10:50:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a6sm11442749wmm.0.2021.03.14.10.50.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:50:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hexagon: do not specify Python scripts as inputs
Date: Sun, 14 Mar 2021 18:50:22 +0100
Message-Id: <20210314175025.114723-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210314175025.114723-1-pbonzini@redhat.com>
References: <20210314175025.114723-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Python scripts are not inputs, and putting them in @INPUT@.  This
puts requirements on the command line format, keeping all inputs
close to the name of the script.  Avoid that by not including the
script in the command and not in the inputs.

Also wrap "PYTHONPATH" usage with "env", since setting the environment
this way is not valid under Windows.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 5dd68907b1..bb0b4fb621 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -53,90 +53,81 @@ hexagon_ss.add(semantics_generated)
 shortcode_generated = custom_target(
     'shortcode_generated.h.inc',
     output: 'shortcode_generated.h.inc',
-    input: 'gen_shortcode.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_shortcode.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(shortcode_generated)
 
 helper_protos_generated = custom_target(
     'helper_protos_generated.h.inc',
     output: 'helper_protos_generated.h.inc',
-    input: 'gen_helper_protos.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def, gen_tcg_h],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+    command: [python, files('gen_helper_protos.py'), semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
 )
 hexagon_ss.add(helper_protos_generated)
 
 tcg_funcs_generated = custom_target(
     'tcg_funcs_generated.c.inc',
     output: 'tcg_funcs_generated.c.inc',
-    input: 'gen_tcg_funcs.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def, gen_tcg_h],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+    command: [python, files('gen_tcg_funcs.py'), semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
 )
 hexagon_ss.add(tcg_funcs_generated)
 
 tcg_func_table_generated = custom_target(
     'tcg_func_table_generated.c.inc',
     output: 'tcg_func_table_generated.c.inc',
-    input: 'gen_tcg_func_table.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_tcg_func_table.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(tcg_func_table_generated)
 
 helper_funcs_generated = custom_target(
     'helper_funcs_generated.c.inc',
     output: 'helper_funcs_generated.c.inc',
-    input: 'gen_helper_funcs.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def, gen_tcg_h],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+    command: [python, files('gen_helper_funcs.py'), semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
 )
 hexagon_ss.add(helper_funcs_generated)
 
 printinsn_generated = custom_target(
     'printinsn_generated.h.inc',
     output: 'printinsn_generated.h.inc',
-    input: 'gen_printinsn.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_printinsn.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(printinsn_generated)
 
 op_regs_generated = custom_target(
     'op_regs_generated.h.inc',
     output: 'op_regs_generated.h.inc',
-    input: 'gen_op_regs.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_op_regs.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(op_regs_generated)
 
 op_attribs_generated = custom_target(
     'op_attribs_generated.h.inc',
     output: 'op_attribs_generated.h.inc',
-    input: 'gen_op_attribs.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_op_attribs.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(op_attribs_generated)
 
 opcodes_def_generated = custom_target(
     'opcodes_def_generated.h.inc',
     output: 'opcodes_def_generated.h.inc',
-    input: 'gen_opcodes_def.py',
     depends: [semantics_generated],
     depend_files: [hex_common_py, attribs_def],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, '@OUTPUT@'],
+    command: [python, files('gen_opcodes_def.py'), semantics_generated, attribs_def, '@OUTPUT@'],
 )
 hexagon_ss.add(opcodes_def_generated)
 
@@ -164,9 +155,8 @@ hexagon_ss.add(iset_py)
 dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
-    input: 'dectree.py',
     depends: [iset_py],
-    command: ['PYTHONPATH=' + meson.current_build_dir(), '@INPUT@', '@OUTPUT@'],
+    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.29.2



