Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36622333AAE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:51:24 +0100 (CET)
Received: from localhost ([::1]:49006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwR1-0005Er-6a
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPO-0003uT-PD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPN-0003kN-6l
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso10709797wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=j29rPl5rWRUhrLws68j3T9C0red/zSlMR0o0e5wrd1tbGE6eHAb1LB6op4LP6RPA+u
 un/++wD7+jjbeerSFU6JNvjiIGIIogzNOqlAMvV6xpT50NuoWFsyNP3ocHSho0gZTNzV
 wu6cBuzar105JyTDhcsi8Xx4I7/jfVcGVXg1Dzc6M5HOZG5RQU5d2pduKqlqmOc2nFzq
 cEhqKm4mCuKMD57TBFncfpqDwgCHQol0Gb+vlJ+Ftodph1vRhDNtSSrWjTYoDZYAJhaL
 bqqxS028GhxwyfW+p6vQxaU6KrZ14OZ1LnZZEGwus+POsMx/jC/QdosVLyLw523DZv9p
 y1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=YcJ/TdGrS8Cp2QAyvF1T0Fxo22Sho52JHQiqnJeDnR9AZXc/zwNr0XFFbecff7Le+R
 WeSPxq3hLHrpNytFDR4APeag24LxrOu3JFNVFhxFwfEp+r2wizkF6VghKA1XKWKAlzH2
 1KzLNkoUvP4zvI2erxG00IS7p2Ew1MBq7QukIv7ApH5wEtL+z464ZZpteBKvrNmXumNk
 91JSlVsxImQSGFbXHsjQI2o7sE+ZDLCqYtUVp/7WinAUhnstqnFB0ZOpjrF7AuQSx6eG
 rNi8VJy89wSawxrewlqnUYKT1ghjq8cuaPGMWukfQNNq3fROQim3u3dtooqhPzz0zGlz
 qYrg==
X-Gm-Message-State: AOAM531idq6iCg5u0AkhpCT/LYQR114XZOgyknZlAesT9I1TC6GiuOxt
 GlqDJH7MfIbfjdVqGs6DXhPfx4jo7Ow=
X-Google-Smtp-Source: ABdhPJzVCYW2VRmUfgNCFcQfKGhKT0WKQxKjGJpUAGuCz1CSjSaQghf4vBkT8XPLbj8T1HQJ2slrTA==
X-Received: by 2002:a7b:c308:: with SMTP id k8mr2718090wmj.54.1615373380007;
 Wed, 10 Mar 2021 02:49:40 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s11sm9060808wme.22.2021.03.10.02.49.39 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:49:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hexagon: do not specify Python scripts as inputs
Date: Wed, 10 Mar 2021 11:49:34 +0100
Message-Id: <20210310104937.253532-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310104937.253532-1-pbonzini@redhat.com>
References: <20210310104937.253532-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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



