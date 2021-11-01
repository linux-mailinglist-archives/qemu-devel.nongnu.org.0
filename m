Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2EC441FE7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:20:06 +0100 (CET)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbuf-00089I-Q0
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9F-000866-KK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:05 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9D-0001FG-Rw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:05 -0400
Received: by mail-qt1-x833.google.com with SMTP id t40so16520396qtc.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=V2lTA/Y0SyqkI3F/CVO9xLOPxUcBsX96fctV4MaXRrmuy/GFlWThtW+eIMBiBLzJ1Q
 k0fNssuOgFT7FW/qtw1Giww7NalQV9OKG21SkYCghWbjWY5Pch6FQWlD9PdGZSlliCG8
 FC+nnJehUVwsWXceiPNTcXyxozB4Nb0+/w5mEauCG/LRUHX6wJueHgiazK20hx39OrjT
 KQPIWgXWcAKE77sFe20QIFECq3JZAwLpWZjbKC7Liae961MFjfJCQZ2PDTw5O8+UUBsX
 cLJq32is9OSkPzjlA92PMPltDq3dSamMLogjEOL51W+vCL2nAaAgu75nwtJgjbsHpntd
 JZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=k9GU40NemSbWa1ApSlthFpXl34KXP6hJGU23qQ5Ermnr3pQTbP5GAzMbjcig0frUs2
 IBkjNzzZR+bavTE74Uyu7aaXaXcdxtpFFz+mpd291QSspSDy1jvet+DVDNt4Hu1KnYQD
 u//Z7xI441nx/lr3nXqROPpIBg1GUfpw0DuGi1kmQ/zUMnrYErT6U9pzpCp/RQbt7siC
 sS/jJwhMFx/pubDds/pj74W9K0HJvptc/md3jbAc2jbJnpHlOHG3uXnegfiegArp9jqS
 30lw4DkX5i92jbqXoiET0f7jydHhVKluOzPdqkSaUcyvhM5DNpqeKNt1hywweHiyMDy9
 xnog==
X-Gm-Message-State: AOAM530Mn1oDsAaFTSZUDVtvPmxYNSVUpp+fS+j5KA1jHqswp6rm/+u3
 2BBq5NGRO8KfYGbN6X+JpZlfuc/yqe35iw==
X-Google-Smtp-Source: ABdhPJx5xUg+zkzQto13rFD6lj1i35sQPUPQjrEgHUbwtqbhe7+6eDk9DjBAjEIv7ovm6wjmSqcj4A==
X-Received: by 2002:a05:622a:1305:: with SMTP id
 v5mr31970764qtk.62.1635787862856; 
 Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 54/60] target/sparc: Remove DEBUG_UNALIGNED
Date: Mon,  1 Nov 2021 13:27:23 -0400
Message-Id: <20211101172729.23149-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The printf should have been qemu_log_mask, the parameters
themselves no longer compile, and because this is placed
before unwinding the PC is actively wrong.

We get better (and correct) logging on the other side of
raising the exception, in sparc_cpu_do_interrupt.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index bbf3601cb1..0549b6adf1 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -27,7 +27,6 @@
 
 //#define DEBUG_MMU
 //#define DEBUG_MXCC
-//#define DEBUG_UNALIGNED
 //#define DEBUG_UNASSIGNED
 //#define DEBUG_ASI
 //#define DEBUG_CACHE_CONTROL
@@ -364,10 +363,6 @@ static void do_check_align(CPUSPARCState *env, target_ulong addr,
                            uint32_t align, uintptr_t ra)
 {
     if (addr & align) {
-#ifdef DEBUG_UNALIGNED
-        printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-               "\n", addr, env->pc);
-#endif
         cpu_raise_exception_ra(env, TT_UNALIGNED, ra);
     }
 }
@@ -1968,10 +1963,6 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
-#ifdef DEBUG_UNALIGNED
-    printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-           "\n", addr, env->pc);
-#endif
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
 #endif
-- 
2.25.1


