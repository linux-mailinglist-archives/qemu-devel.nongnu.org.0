Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CDB4E3BF8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:54:08 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbDL-0007tJ-IE
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:54:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWb9a-0002VO-He
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:50:14 -0400
Received: from [2607:f8b0:4864:20::62c] (port=41920
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWb9Y-0002XI-SF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:50:14 -0400
Received: by mail-pl1-x62c.google.com with SMTP id j13so5091858plj.8
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttsoqqFhh3RaR52rpWp9JF6UkfTiR8IMJgoSzFIdVqE=;
 b=NVDqkKb5q/UZoFxgN2i9qxareq8GfCvZxfcaZnyVtRNmF4LEx0UsZHFNEwSZ345s1D
 +uqKWszhUQ4jXZ5nlZBVsHTMbmDUiAGwZttMentgLSwQweOX+OQXSy19CmNieu7qx/uU
 ZvG0Fvc+5EIVWZsDhf5vI7aYi3SFXFQ59jS0O3R/Zv65XUt7Uagi6ebekfrUpAics40D
 EBTWkl4L6LxcqQnIdp5HRRmb3UyKtoXvucSS0QOQUg3zOj5lA/D0dzJq4Uu1Bk1xsfoS
 aivuh+7RY9MDJk/8LE9N7bz0UOf6bt7HpI5wGNU+7ifPOvmzM/iEc2JZFMscV2lxICXP
 rh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ttsoqqFhh3RaR52rpWp9JF6UkfTiR8IMJgoSzFIdVqE=;
 b=kOjl3Vwm0cX2GezAp4wDvYmBHIxvMOIWuZvCZT+8gI6vipldTIuLeUE8EmNh0IsP7n
 sjolIlxBKOfDbju1QPY6fNyv0GBOyEvt7LlZ6Rb7/mOrEldOWi9kwVlRRBCsr7b2dK4y
 u/aEscJ4NkjfZN0Qs13gAAboMPjmFqy9iqayhMn++FHhhTX5/Jg9zcyzGs9pCFtYJo+p
 d0SokTNpMnOB81V5ZuhX6Iyr0Gr8lTED/4zI7/5y8OxhdweGtuq9OWGTzCphvgIfZdgU
 v4w+j8zJVT3Xl0WvilKEVKgyYpYEJo45Qlk18aOKbk++vLVnuDrGOfNCWSC5vNS7WPXS
 R4zg==
X-Gm-Message-State: AOAM531CCo6dnPwfxgd3/ry6vwcjXJJVy9qq9lk7SpIQUerKyf3cyVo2
 9HwwiE1R3izlFGu9Toy1SFA=
X-Google-Smtp-Source: ABdhPJxPX2UYz3a6b862btAmnLDZA3AILsTk1hiCvMWcMjPgF7k2VEDSgJvNdfvdk6ko4HCWDJrgMA==
X-Received: by 2002:a17:902:9a0a:b0:14a:199:bc5c with SMTP id
 v10-20020a1709029a0a00b0014a0199bc5cmr16937761plp.10.1647942609417; 
 Tue, 22 Mar 2022 02:50:09 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 68-20020a621647000000b004fa763ef1easm13518016pfw.125.2022.03.22.02.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 02:50:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Michael Rolnik <mrolnik@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] target/avr: Drop avr_cpu_memory_rw_debug()
Date: Tue, 22 Mar 2022 17:50:04 +0800
Message-Id: <20220322095004.70682-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

CPUClass::memory_rw_debug() holds a callback for GDB memory access.
If not provided, cpu_memory_rw_debug() is used by the GDB stub.
Drop avr_cpu_memory_rw_debug() which does nothing special.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/avr/cpu.h    | 2 --
 target/avr/cpu.c    | 1 -
 target/avr/helper.c | 6 ------
 3 files changed, 9 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 55497f851d..44c2b08bd7 100644
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
2.25.1


