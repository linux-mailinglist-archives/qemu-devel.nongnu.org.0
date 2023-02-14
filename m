Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9F6969AE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD3-0006ap-A3; Tue, 14 Feb 2023 11:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCt-0006RZ-03
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:04 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCq-00027t-Oe
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 w20-20020a17090a8a1400b00233d7314c1cso8330478pjn.5
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWhVmviwicT2773S7A8MT/igFkSHAUSa6nNXW5mbKWI=;
 b=EL+Q0afUZWALWE0ZQgN3DqWr6oayznMVqdivYIGV08XURh2X2O/KUOkKilNRe73ckM
 5JiTyNodTIwJX+ZPsaIvEeJ2hbW/PPa4UvPuZ/uNk+Gwk1bOooZgGTZeNCWbInSEI/8c
 iW/uRMl5LvE90XFM5IIS3WZC5FZ/CvpwUluDDODXQA86hqvP8dz3zHS2pWWxEUsrkV89
 jnucasEl+frTgf0igtpGC1YZksUKZ52W6paOQfwPaFxvTIY0j3UqeM0hQ421YUcO1ab9
 dndKAK8oJM4QkZ/KN3hQbPxRIaGkiLIPcOQKFEpTtOcbXf6bTbzh+kfW7qznUcp/08WC
 mwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWhVmviwicT2773S7A8MT/igFkSHAUSa6nNXW5mbKWI=;
 b=fgSLuosnjvzsheIl2d5Xu7HGIsHpFQdd4mAMpNQf+N/MibjHYgOop0BgWkdDpfcqgl
 cGgCzeQPHzZ3QHuSie/4x7u9IKU1yW48uq9BqG1Y4AJXI9PBQZg+hDUUefGG7vqbvIkL
 UCLYcISSkV46p2bykgx000oC/SDep9Xu7dn/wuXnqULXvvb8z4dUABqQQxAeycM/qWFW
 WYAlUGWXPMM1pD38WWx/ZuI0Bjytbu3gW07j0P4/Kk1MdPMiT/HkuadOLgI2sh0tzyha
 lpqa588pRKrZHBxIucjf0hsxjFm7XeyE0k+sUUM1wTYl67KGOlEfGsOJJmgZLQlH925u
 300w==
X-Gm-Message-State: AO0yUKVHNnaONsH0dD9m0K8QnDn2rLF1DkcYcGVycg7XID+rZbJvEb/j
 9HjdtLWuHlCYQunLcMH3+TXtnRHVdQx1CzPyRtc=
X-Google-Smtp-Source: AK7set9y4O/y3nh9ZbbFepEccC8X3cBBb0xXkn6NI22tO2qzn0cUpqvCxAIBBKxDeNBjiV8TkAmL9g==
X-Received: by 2002:a05:6a20:938e:b0:bf:1662:b2f4 with SMTP id
 x14-20020a056a20938e00b000bf1662b2f4mr3403156pzh.49.1676392259167; 
 Tue, 14 Feb 2023 08:30:59 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Tue, 14 Feb 2023 06:30:39 -1000
Message-Id: <20230214163048.903964-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rather than increment base_reg and num, compute num
from the change to base_reg at the end.  Clean up some
nearby comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 811833d8de..8d174ff6e0 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
     g_string_append(s, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
+int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
-    int i, reg_width = (cpu->sve_max_vq * 128);
-    info->num = 0;
+    int reg_width = cpu->sve_max_vq * 128;
+    int base_reg = orig_base_reg;
+    int i;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
+    /* Create the vector union type. */
     output_vector_union_type(s, reg_width);
 
-    /* Finally the sve prefix type */
+    /* Create the predicate vector type. */
     g_string_append_printf(s,
                            "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
                            reg_width / 8);
 
-    /* Then define each register in parts for each vq */
+    /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
         g_string_append_printf(s,
                                "<reg name=\"z%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
                                i, reg_width, base_reg++);
-        info->num++;
     }
+
     /* fpscr & status registers */
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
@@ -310,8 +313,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
-    info->num += 2;
 
+    /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
@@ -324,13 +327,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
                            cpu->sve_max_vq * 16, base_reg++);
+
+    /* Define the vector length pseudo-register. */
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
                            base_reg++);
-    info->num += 2;
-    g_string_append_printf(s, "</feature>");
-    info->desc = g_string_free(s, false);
 
+    g_string_append_printf(s, "</feature>");
+
+    info->desc = g_string_free(s, false);
+    info->num = base_reg - orig_base_reg;
     return info->num;
 }
-- 
2.34.1


