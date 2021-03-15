Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D533C4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:43:58 +0100 (CET)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrG1-00050v-VL
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBa-0002xG-O1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBX-0006vx-M3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:21 -0400
Received: by mail-wr1-x433.google.com with SMTP id e9so6112662wrw.10
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=fdgq4Se4b2x3gP0a8PaFKuzMzz814ismew+D1zfGElWkqlf/9CdQnlIdCiiQIvn1QW
 DBkQEOyGgF23tUO6zffY/x6abqQfNCbzMVyAkhGh1RavqRxv4unUwffOZ6xFSttG+J/p
 bZYorr4dEyOFPmLyeehQy0OxTYvz7JUUVdsPpNYcerZkeQ73kjmAUSCOxc1RiT5VXEP+
 8W4YzkSv7R+Uvpn6BceZtXNUaFn/zuIsL09ZcFL5kfv+8th0B0iAZewQkEIw7wRrR6R8
 +nBhucEglrsH1MJbyETQh2q3ZYTE+d0sSNALT50o/i4F9y5KrrK7RFWkhEHLDczUKlbZ
 cUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vmlbfjIORtFM9ouDG6TC7+H2AhddDKhJKH+zFhlyOCk=;
 b=OJqj+jmo3jgr02jFvA6LFJBJOQKWSTrwdBXT4gPMcQfPjGTrjP08EMsKyT3xtQmnXR
 d8wbYGicE80ItLsjroph9X3VqgH9eMfs8bNSjdsY/zBYTUk8K08SN+QigvZ3P4OIrVyK
 ifwQ3SzBX8EinWgPPEciQ27IVRFYXcmwGXSDl+u1BpElolz9BnBrOqgeDX5jEmZsKAdU
 4CILvN4IBQSyY2y7KS4cefLYcvJj4EV+SrwsH1b+36BxHpg9Qe2QHN2EoG24XTHTiaUY
 sZAIO+hXqZRQIH5wSxr4DZf8OTsaXEEl+tlQXAUt04yXmkt+hVRyTXxABYMfit9FhYdk
 GkBQ==
X-Gm-Message-State: AOAM533B/acqg1FQr6HpWTYRDraxMNtxa0xbt7TNvkgQZCfFX+Dju0ZT
 hCE/Rhw6WKT80jQ9tO4itbzuR0ybV2Y=
X-Google-Smtp-Source: ABdhPJw2xhPBf4W+Cc1fhCPcyxBdKuqFr9tAK0gX1H09ecSLi2YWHib6I3pjPKfPn+wJK/n2N8pheQ==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr740197wrq.191.1615829958259;
 Mon, 15 Mar 2021 10:39:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.17 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hexagon: do not specify Python scripts as inputs
Date: Mon, 15 Mar 2021 18:39:09 +0100
Message-Id: <20210315173912.197857-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
References: <20210315173912.197857-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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



