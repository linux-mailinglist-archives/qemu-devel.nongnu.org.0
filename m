Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD393AE188
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:47:45 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv92O-0004NG-7M
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pw-0003me-T7
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:52 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8ps-0005C7-GI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p13so12464264pfw.0
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GyMXFOHuukBywR7FyV+46rTH8YDdZbnYXS3wX0EtO3c=;
 b=LhGPeMbPnbEOW2I3m5SJzeWAzM4qVQHV271Qsleb4tROvW/HRxjXI3pcHuGfxot3R8
 VSnFp2Jq46jHw1iaOpVTrgfAmg8mH2fIAi8AzYfGJMC+ZBaTnkgg2w0WNnuEPbVCqoA1
 NOWLHRgDimmEYS754Sl2l/n13KNbbRhcrQtvucxo4u4Fmo0sufWqpWiWs/nYevQMcL+F
 OGWJloJ0dJfTxtUKRqHy7OtGwBHncec7R+Dtmfp6F0nu5bGmC3AZhFe8im819AskyuX2
 dngcfAnW0fJEo8uYXuqMOkLaiRXbJufNn9JGXFXtMZjQx2IlWzblzpJ/blLe3NnSZ1XP
 UoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GyMXFOHuukBywR7FyV+46rTH8YDdZbnYXS3wX0EtO3c=;
 b=gsyXWmqspYfqvRnp3iCG8yJc8/z2XRLNod3pKNWXax3UsNXM1/u/NIR/NkTBKj+3ya
 HD/tjT4hlZ79ThcuVKnWAwNzUA42k+6sLBk1alHHhQ95qKo46OH45IxplWf1JApM3/iP
 53C7Pg0mwGSAZRFUlTQyvka0TlnXjXZEvSz40WVgi5C8g+OSLPigwCYa9D6TxtF3sC8v
 B0G8KmE1dBtB4h5sT65W7ZTmYb5oqZGoBCwTY8WgNdG2XaVzMpsIfEwyNXkKvsy+WG/U
 5SHBmdz7mAclh1su2d7Qm2mUSnxz9cNKyYGXYeZAo1S/d8B08BNNGkmOJKPP5aZjGE/Z
 hQfA==
X-Gm-Message-State: AOAM532ktTZWY5T4uLO386HVp9lfPdEK5Sbfo1ul9UrQzzTOs/Uo4lf0
 r3gU0fVomRi1hwhRmVhnI4yCk6nyvC/UhA==
X-Google-Smtp-Source: ABdhPJyN2SVfScm0egewQmXOBwVyAz8UrqHjrxTIAtituq4S9fCa9kWDeBqses+p68t8FH7x6iwf9A==
X-Received: by 2002:a62:b502:0:b029:2ec:a539:e29b with SMTP id
 y2-20020a62b5020000b02902eca539e29bmr17017986pfe.37.1624239287263; 
 Sun, 20 Jun 2021 18:34:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/26] target/m68k: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:24 -0700
Message-Id: <20210621013439.1791385-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154..05b96fdda7 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1520,16 +1520,6 @@ static void gen_exit_tb(DisasContext *s)
         }                                                               \
     } while (0)
 
-static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)
-        || (s->base.pc_next & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
@@ -1537,7 +1527,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
         gen_singlestep_exception(s);
-    } else if (use_goto_tb(s, dest)) {
+    } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


