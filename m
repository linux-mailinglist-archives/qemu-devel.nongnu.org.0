Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A156514B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:49:59 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IiM-0000vR-5z
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITy-0001pd-F9
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:06 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITw-0004xx-Sa
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:06 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so13079435pjl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3lzEaDmfWBOIKO+QxHmwCzDxckFSDPKrWYW1q3Ynj7E=;
 b=Eji8bBRYDTWYJYdbImHik9kX9A5g4ldA1bHlcaq/Bey9J4vuTJ6EQUP6WGnCCyfwv0
 hpTw48oP/NSspwJFuyFnKZ4SMbOGMoNEXfxrxBrztyg458zV9qQ/HTjcmsufj4MXLruv
 LxKcsKUUTcZycejD3rB/P06XL0I8pY0WogiT4VuZK6nvpMsBdcI+u6xGGsf09g2jQOPJ
 P3Xfh2em8Dfedt/hecphxIX+wepqeCQucv/ud9t6HlLGEsg6q9ZLjmWx76tfObJc/AzP
 UAG184utEeRzGmQE0EicfUPmrZKbgM28ahIyelyM70LuWvm+/wfy/5qv0h63JQv7JTiT
 6ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3lzEaDmfWBOIKO+QxHmwCzDxckFSDPKrWYW1q3Ynj7E=;
 b=bPBe0nduQpHP5Lbt7uY0n2uykI/wWWSmxLBD4MisvJ3/KgL9Gy9jLvrrIuDeRW041a
 DBxEpOvw04WGGLEXTgoHeFDxxQHk1bwDEy3U670thx14xiii08E8T2lDk4AVMDNHlLGq
 jpfUESFMjxkCM5jvuFmbEjgnrskji0Er11o2ijssorhXh20ng2lq5dtWgaCcgefRWH8J
 6hlxyXqKt5lZE+kH11U2hR35iuJ07jyAY6cgT1dZcVIKYAcvP5LxZBklNaV9Ro5fb38D
 kXlkVMEdz9kzkvEAJOXr4rco31WHZvcVOEbEUL4s7F20uBys5E5DE+qOOd3ignAVIC7G
 3KMw==
X-Gm-Message-State: AJIora8wCSUloTulMyDGevCXG/Aq1L/8vCFy8M/bNxhE/tUALsNOT/H7
 0qZrfBT3a4cZtzgKvDTNME4JMrVv/QSYdnKs
X-Google-Smtp-Source: AGRyM1tS+Dp6TBV34FUlS6LL4hPr8eLQ42DC8FLjy0AGyANW+LbJBB+nNMZgKMPcnqfLSck8mTLvrw==
X-Received: by 2002:a17:90a:8b8f:b0:1ef:9130:f96c with SMTP id
 z15-20020a17090a8b8f00b001ef9130f96cmr113627pjn.20.1656927304149; 
 Mon, 04 Jul 2022 02:35:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:35:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 23/23] target/loongarch: Add lock when writing timer clear reg
Date: Mon,  4 Jul 2022 15:03:57 +0530
Message-Id: <20220704093357.983255-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

There is such error info when running linux kernel:
    tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked()).
    calling stack:
    #0 in raise () at /lib64/libc.so.6
    #1 in abort () at /lib64/libc.so.6
    #2 in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
    #3 in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
    #4 in tcg_handle_interrupt (cpu=0x632000030800, mask=2) at ../accel/tcg/tcg-accel-ops.c:79
    #5 in cpu_interrupt (cpu=0x632000030800, mask=2) at ../softmmu/cpus.c:248
    #6 in loongarch_cpu_set_irq (opaque=0x632000030800, irq=11, level=0)
       at ../target/loongarch/cpu.c:100
    #7 in helper_csrwr_ticlr (env=0x632000039440, val=1) at ../target/loongarch/csr_helper.c:85
    #8 in code_gen_buffer ()
    #9 in cpu_tb_exec (cpu=0x632000030800, itb=0x7fff946ac280, tb_exit=0x7ffe4fcb6c30)
       at ../accel/tcg/cpu-exec.c:358

Add mutex iothread lock around loongarch_cpu_set_irq in csrwr_ticlr() to
fix the bug.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-10-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/csr_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 24a9389364..7e02787895 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -81,7 +81,9 @@ target_ulong helper_csrwr_ticlr(CPULoongArchState *env, target_ulong val)
     int64_t old_v = 0;
 
     if (val & 0x1) {
+        qemu_mutex_lock_iothread();
         loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);
+        qemu_mutex_unlock_iothread();
     }
     return old_v;
 }
-- 
2.34.1


