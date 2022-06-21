Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B7553BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:53:29 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ksK-0006Jj-GT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3kly-0006bz-Vc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klv-00015F-Mr
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:54 -0400
Received: by mail-pf1-x42a.google.com with SMTP id t21so7901455pfq.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmSLzTIbm+WJzToIYu7L7rIll0Ev3qx7GQceaN1q5e0=;
 b=ljeYoYnrjZKh9qVTzpI0plB0wMr5HaLuUw2dr+DaPGQ/X/vj89jXkWojVI/Ultcdfk
 umSmn4pHOyPSwY/fknaks2giMHEijfv169uJ5JVcohFlagoPshREAAOeZ7G2sMeT3LGX
 dK8kXuPCebebIZWa4m9eSy4S5YIZfS1KKLWGR3Cqa2DsfdrBYCMQg/Yx1I5wBCKzyQhi
 nhe47LJycLzR2uv4U8ZWUqIogzIQbYIO7Cc6NoJPozIBV1lHqpMoKIXDogitYmSGy8ym
 y5gnjq3LmVAPAgO4wVhv/haF11THElTMlDhXjla9eFETovruIfEdqvGw+EqSuAjcBJCu
 ++cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmSLzTIbm+WJzToIYu7L7rIll0Ev3qx7GQceaN1q5e0=;
 b=3igRJchG0QGkbuZML4vlzH6M0kqF1oc+1u5SUlJwEhtwy6N+qHfQ4STe3aONsJSxAS
 CcdLVF09WPNMOQLbE5SOgGn4WUSy6Enmsd591lOlLbsTBxWdQSlWe8yrmZ4ZZjcL037B
 TYDlVnt3AJ3v+Tl6GqFKRKzD0cgRo4A4RWcek8iD60vLiBS4AVy3YE9Gp0qIlOs2COe+
 kiZglj2o5gd6nWsM6WQ7pFo0Vwv8QERZC8WevCS0gD/+XUCbZTfmUWWseh0Br+bsb/yJ
 p7Cx+Z4jb5haKNDqvjnUX3TY1Idx0P4noMoTJ2UHcjsGfr/nn6a1znWgJpp8xlKhto0k
 6lQQ==
X-Gm-Message-State: AJIora8gC/7KBTrXwJIsXZ7sc/lyU6E+s9veuGQT105DZlEHNSJzWaJW
 0msUrd3KfFC7oXPUXhYPbhgphe1pGl19JA==
X-Google-Smtp-Source: AGRyM1vPSVyAHwV8znT86fNNQm6D92uh0evBumBLV5n30ixwRQiGO7j0mXB6nzTSI/UDIWDomHTz/w==
X-Received: by 2002:a05:6a00:b81:b0:51c:3bfe:7d89 with SMTP id
 g1-20020a056a000b8100b0051c3bfe7d89mr31878592pfj.31.1655844406342; 
 Tue, 21 Jun 2022 13:46:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 2/9] target/avr: Drop avr_cpu_memory_rw_debug()
Date: Tue, 21 Jun 2022 13:46:36 -0700
Message-Id: <20220621204643.371397-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

CPUClass::memory_rw_debug() holds a callback for GDB memory access.
If not provided, cpu_memory_rw_debug() is used by the GDB stub.
Drop avr_cpu_memory_rw_debug() which does nothing special.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220322095004.70682-1-bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.h    | 2 --
 target/avr/cpu.c    | 1 -
 target/avr/helper.c | 6 ------
 3 files changed, 9 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d304f33301..96419c0c2b 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -184,8 +184,6 @@ void avr_cpu_tcg_init(void);
 
 void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
-int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
-                            int len, bool is_write);
 
 enum {
     TB_FLAGS_FULL_ACCESS = 1,
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd5..05b992ff73 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -214,7 +214,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
-    cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     dc->vmsd = &vms_avr_cpu;
     cc->sysemu_ops = &avr_sysemu_ops;
     cc->disas_set_info = avr_cpu_disas_set_info;
diff --git a/target/avr/helper.c b/target/avr/helper.c
index c27f702901..db76452f9a 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -93,12 +93,6 @@ void avr_cpu_do_interrupt(CPUState *cs)
     cs->exception_index = -1;
 }
 
-int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
-                            int len, bool is_write)
-{
-    return cpu_memory_rw_debug(cs, addr, buf, len, is_write);
-}
-
 hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr; /* I assume 1:1 address correspondence */
-- 
2.34.1


