Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3F351472
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:28:18 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvUn-00069N-NI
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPK-0000my-Gj
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPF-0006it-IZ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:35 -0400
Received: by mail-ej1-x632.google.com with SMTP id e14so2301888ejz.11
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oyCDE+1lD7kLG1acPwyIoCzbCo2TYifb8td0U1UsLDs=;
 b=B7lPxbydJS4HvZeuuNaa9uGN0++iJNCjr21gzaDGe7nB+VzDGfWZoOWi3QOr6AhNHr
 Dd/dSqKvbb/lnWvi4vU2vxrKSrCEZB7DTugMgshP2nX+/aZha06h8oVhxTgFSaWFoBx2
 OkfT7KkiOSHJ4fnhfp+LOMaXEDf4RbFjKByHklA97CPd+kuugRwQSQZ8u4qsrZ5L0bNa
 yZyXvo2zpgRicoqcrk1DzUaR+yUsKya7Mz8av9Buy6WmFE29e/ZhMy9sOrTWfRZKOtsX
 bRYcJkpE8mlp9bE5oZs4wb7mCTjnk2blVN6RZBDx1Vpw083pY8TLFoSGsxXog4BHyS42
 9GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oyCDE+1lD7kLG1acPwyIoCzbCo2TYifb8td0U1UsLDs=;
 b=nldt8HyOneO3p6c28tH9p8d4RfD+AtHErk1KRFLRwzyTsGrZmTSvNpTORdS4jzt7Fu
 c/CbGEtT/HdWiyOEA2imA8zYkgFA6T2EIioVgzGYps7NesxqJVKgYvWoHADwVLxIOmOe
 Z3xjEnmrIApOIEsVvuNjC9vu/c8o1aPube/PMnpwZC0AwCDQZw0zx1Ya6bSf5FCIhpJc
 o8h3NaZIjSRffYmg5N1/X4+jMVvAYf1KujyhDfOkYBhf+m14PPFphUzygYUlyqUMadVY
 kuqm6ANtS+NHNC3AP9NgVTx8t7zwCPO93mr6ya8NDUOfaPAkhz3vzA0OT7NkSlaEVcjx
 VveA==
X-Gm-Message-State: AOAM532AsLCiqMPkIFmOfU5+/QWZjsx4SiKRfTapJnKZ5bKQalnaMHGR
 zZ7a1uK7MhLCQA2HchaFW3yWPkKY3Xw=
X-Google-Smtp-Source: ABdhPJx8Vc5f0G5Rc3R8tEUkdzg9ixL23FQUHJtacCYzYweLOPdEU/59eYFIONbZ9QWTbcJ7ikvgUg==
X-Received: by 2002:a17:906:33d9:: with SMTP id
 w25mr8875373eja.413.1617276152181; 
 Thu, 01 Apr 2021 04:22:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/12] hexagon: do not specify Python scripts as inputs
Date: Thu,  1 Apr 2021 13:22:22 +0200
Message-Id: <20210401112223.55711-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
2.30.1



