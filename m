Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCAD6A4D43
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7w-00079x-9A; Mon, 27 Feb 2023 16:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7u-00079B-I5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:42 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7s-0004G9-VI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:42 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so6570770pla.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqRacT2tJoZKKdITfpeCSvUX7DLmXKR10MZm1Xd6FlQ=;
 b=kJBf4+bT/qbaY92b04U58ImKnfw5BQ8Aw524q3B++T0M+SK8H4RCkc5w1FlycdsVJp
 zdcWwnqD4e/WAIbSMVb8VGQ8aBaXAkJvmJvpyazRxJC993bKgVtKn2l9GPjGPjDfiDqS
 zRaXwvDUOYkGgfMlJ9WOz/Oar+ld5U6Ly2D3fbmOFgTtz7UpSTDmlCMMFajDDxE3fjEB
 zG6VLgfn+YO9cK8Vpg8RRFkR59mHgEYYKwEhzm6OgUtNfhp+IeXC7JE3OjhZvlJrWaP/
 JMQc5h05q3bT8rwyMX5rpSpkmiMSZoQvJ34GCBQMoZJRY9vz+1iYUaCIcICd1vC0OKJa
 MgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqRacT2tJoZKKdITfpeCSvUX7DLmXKR10MZm1Xd6FlQ=;
 b=bpUgzif2SleNIihHlQxu1U9W5QQxmg5o59tRAC62r0PVNvdRRBHD8w2j7hR+ZXDasm
 aHNCrMbAxSs6bFDWcjZRE+yOWwMQDHo7Rj5lJ8F9WBF6LzblGIb65kXMZp9+GgYDemXC
 oAtwVyQxYMXwuIubZE/106NgAY08Cj2oaxvuNTD1noK0P4eDaGwaK5iFgnUjYWHXBKf4
 IrjHUtl1KwoSe0NOAoOIIFTc82z1Nz6cxBJe+ODy5S8Rn2YaYbRk6dyV9VJCohXF/CAK
 FEkDvVcwox2xxE3u2Gi6uHp/R4uZLXtGJwElNHDI5WVhb11uit3uEsD7a4lC0arT7H54
 fGkg==
X-Gm-Message-State: AO0yUKXji23LoBZKUB2ENiUsCrWSJMmL/dd5zYq2P94tgQJeU1dXc0bT
 jJY3upLrksS1qgrSmZl2iVmAJZ7OhfinQbTCXaU=
X-Google-Smtp-Source: AK7set9V6ckG7g+bpROruQKmpq5eS12rwtZ3QE9eiYraY5axPCX84SUQKG8gFadN2oSVPrmJr0ROLg==
X-Received: by 2002:a05:6a20:9389:b0:cb:2a12:b5bc with SMTP id
 x9-20020a056a20938900b000cb2a12b5bcmr1029435pzh.28.1677533620153; 
 Mon, 27 Feb 2023 13:33:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
Date: Mon, 27 Feb 2023 11:33:20 -1000
Message-Id: <20230227213329.793795-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Rather than increment base_reg and num, compute num from the change
to base_reg at the end.  Clean up some nearby comments.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 811833d8de..070ba20d99 100644
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
@@ -310,27 +313,29 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
                            " type=\"int\"/>", base_reg++);
-    info->num += 2;
 
+    /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
         g_string_append_printf(s,
                                "<reg name=\"p%d\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
                                i, cpu->sve_max_vq * 16, base_reg++);
-        info->num++;
     }
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
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


