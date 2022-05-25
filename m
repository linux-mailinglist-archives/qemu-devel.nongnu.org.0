Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2405342B6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:12:12 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvUR-0005um-2k
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjothen@gmail.com>) id 1ntt0P-0002cn-RY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:33:04 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjothen@gmail.com>) id 1ntt0O-0007cP-7A
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:33:01 -0400
Received: by mail-lj1-x22f.google.com with SMTP id i23so24902698ljb.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=SQW3tbXRcm7w01g196uIiDidXkohVxyje/KoU0CG/0c=;
 b=pYC4QG/g9JNA1BwDDqStqrvZESynddI/wIvP5FNq4yecofrR7GQEGDNzRv2HITyX3m
 rJ9Mm4r5+ivibfFT8tJwBaK79AVFZXFYBr4XQMJ8Ys0nhlWYLtox8GQQglFl2myucmau
 wTmIEW0UBmcQHMHCXv9Rui3C3q5WwC88ifbXnYS+fldxt9GTSadx1k/pu/C/mi1sO3Rs
 I7TRC07u6jGX7B3EFyiNyzSPn8ekmje3qCw5Kcj+LMaKpMMy0rEg4EqsqDpsjOYMfB1r
 htKquM8Y5FfQeTuZZV6rIi+ERnyBllHenfmSuiMRhh3mHoaEAJQcylr0lD0hT4Zv8UVj
 TujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=SQW3tbXRcm7w01g196uIiDidXkohVxyje/KoU0CG/0c=;
 b=J4a6KtBOALlQQFX8gxHUTrU23Hq8BlFnrimyUk7xbEqnWFlQUlHq4FMu49lo2PBMBc
 8TPTBYLBbGKCkM/H9eMCyo0AjkBN9fFnclPIgo+k1+kqKoutEE65YLU/heHidNbpNHmG
 tME9aVgXy1Vta2elThspq2h+w+IGBoJqv3JkYuJY169JEQpZOPtC0xs3or68AD9AnLL8
 C4v2wSX9eHlJIzfL9HCZ9M5KTojI70PHSyoGxYjYqEHeqPk8vcFawKYUk08uR12lVZUy
 HzyzhhIk9S6Qz9xJVKhtmIbWw63Fset46fGloRAV+n8IehaX1TuH4Gy+CjEorsxfX52+
 eTuw==
X-Gm-Message-State: AOAM533yUGsRS9+WzXvXb0FilHZfIS22F0mr7Y2FKia4uHpKb6o4ohT7
 Ts6aaY4bCUhMf8zckz96IAwASqmkiDscqTcj
X-Google-Smtp-Source: ABdhPJxssNOVuLL8ojxLso0B0uFR4MerLCUveRK1W87/o4FAa7Qr4iC+qEh1nIYclZTPz9cPplaKHA==
X-Received: by 2002:a2e:9949:0:b0:253:dc75:b5ab with SMTP id
 r9-20020a2e9949000000b00253dc75b5abmr15654154ljj.30.1653492778335; 
 Wed, 25 May 2022 08:32:58 -0700 (PDT)
Received: from air-old.local ([84.213.16.196])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056512358a00b0047255d21152sm3160719lfr.129.2022.05.25.08.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:32:57 -0700 (PDT)
Date: Wed, 25 May 2022 17:33:36 +0200
From: Stephen Michael Jothen <sjothen@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net
Subject: [PATCH] target/i386/tcg: Fix masking of real-mode addresses with A20
 bit
Message-ID: <Yo5MUMSz80jXtvt9@air-old.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=sjothen@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 May 2022 14:09:03 -0400
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

The correct A20 masking is done if paging is enabled (protected mode) but it
seems to have been forgotten in real mode. For example from the AMD64 APM Vol. 2
section 1.2.4:

> If the sum of the segment base and effective address carries over into bit 20,
> that bit can be optionally truncated to mimic the 20-bit address wrapping of the
> 8086 processor by using the A20M# input signal to mask the A20 address bit.

Most BIOSes will enable the A20 line on boot, but I found by disabling the A20 line
afterwards, the correct wrapping wasn't taking place.

`handle_mmu_fault' in target/i386/tcg/sysemu/excp_helper.c seems to be the culprit.
In real mode, it fills the TLB with the raw unmasked address. However, for the
protected mode, the `mmu_translate' function does the correct A20 masking.

The fix then should be to just apply the A20 mask in the first branch of the if
statement.

Signed-off-by: Stephen Michael Jothen <sjothen@gmail.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e1b6d88683..48feba7e75 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -359,6 +359,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     CPUX86State *env = &cpu->env;
     int error_code = PG_ERROR_OK;
     int pg_mode, prot, page_size;
+    int32_t a20_mask;
     hwaddr paddr;
     hwaddr vaddr;
 
@@ -368,7 +369,8 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
 #endif
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
-        paddr = addr;
+        a20_mask = x86_get_a20_mask(env);
+        paddr = addr & a20_mask;
 #ifdef TARGET_X86_64
         if (!(env->hflags & HF_LMA_MASK)) {
             /* Without long mode we can only address 32bits in real mode */
-- 
2.30.1 (Apple Git-130)


