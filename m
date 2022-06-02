Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FF53BE72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 21:12:52 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwqFX-0003Q3-0e
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 15:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwqDh-0001ix-NP; Thu, 02 Jun 2022 15:10:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwqDf-00043M-R7; Thu, 02 Jun 2022 15:10:57 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-f2cd424b9cso7937733fac.7; 
 Thu, 02 Jun 2022 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCPIn/2eQw1cUfP7alZxGtkDHu/v05BRFfK1JW6940g=;
 b=Qy314tLZzFCwKlH3+yGmO/hO/gZfanEdWU3MZOedR8ayac8FxptjxiiOVgKNfng9m/
 ssKQZSlSfnuuc93TBILuszIaKnzqw9cvmRk1uzrWXbdaeuNj/evvwFoUBoHURd7rwyhO
 qdWdX7XPCNv3fxo5j2FWnwEUjRltlajBsxHWXGDz25ZVECbnC4OuyHTT3imYYVNxxme/
 1UsQWl1f1hPnTjqOxUvqaZf6DlyeV2nqGWM8bMg4hu+/KiKvKQqGtYkPCM1bTvQZWQqA
 vV7fTNviqH7223jfQ9maqou+HO6xhVxkLQ0wHUzbaAqOv/xEiEL3/FWVTLKJ2JQyLaK3
 ABRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DCPIn/2eQw1cUfP7alZxGtkDHu/v05BRFfK1JW6940g=;
 b=R74vTp1UvLZPHT2qfO0FJ/bgqsJNeE3P1f2uCds4RIRYj/JRyYT4lhQxbRZ8T5BUys
 UIVnsYg4Cm80ax3W6ozw2t6wIppwEmQC3qnenyq90Cl+4I/7I4BkobOk10RshAQG8z3k
 EoFpXWz6jyPWwF7oI+PI8Dt+hYDdqZvKB2mbc6LWBvASpBcdFDqyEpKQlJ4Hdump/Q/v
 X0M/WBXWdMhb1ze53aT7CJMKZv9FUXoxtjYHij73S0yq+6OVOl5VBSJprfyxisP9ZAz1
 7aYSwbSrzdDyVYxON17Ilar1WZIIWFYizF32VZ1uB1sFwT0ba29BJiXT93BQMlJ9UnCx
 9T/w==
X-Gm-Message-State: AOAM533YklC0xu/EC5pK/0vIhJIV9dBh8Gk6AoSra9CM3uTN5fy59Lkq
 TSdYiqrVUmftZ5HXZ6i4kDZnts/ZVpUZ/w==
X-Google-Smtp-Source: ABdhPJw04WmHb1mlXnlsZjT8DTWPJE5gNlj8U2Bf4IsB5Ui2iobuaOInY8uwbsGncthxZpd5+1QSwg==
X-Received: by 2002:a05:6870:d211:b0:f2:91f4:3dfb with SMTP id
 g17-20020a056870d21100b000f291f43dfbmr3661711oac.226.1654197053912; 
 Thu, 02 Jun 2022 12:10:53 -0700 (PDT)
Received: from balboa.ibmuc.com ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 a30-20020a9d725e000000b0060603221262sm2539567otk.50.2022.06.02.12.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 12:10:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/ppc: fix unreachable code in fpu_helper.c
Date: Thu,  2 Jun 2022 16:10:48 -0300
Message-Id: <20220602191048.137511-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Commit c29018cc7395 added an env->fpscr OR operation using a ternary
that checks if 'error' is not zero:

    env->fpscr |= error ? FP_FEX : 0;

However, in the current body of do_fpscr_check_status(), 'error' is
granted to be always non-zero at that point. The result is that Coverity
is less than pleased:

  Control flow issues  (DEADCODE)
Execution cannot reach the expression "0ULL" inside this statement:
"env->fpscr |= (error ? 1073...".

Remove the ternary and always make env->fpscr |= FP_FEX.

Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Cc: Richard Henderson <richard.henderson@linaro.org>
Fixes: Coverity CID 1489442
Fixes: c29018cc7395 ("target/ppc: Implemented xvf*ger*")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index fed0ce420a..7ab6beadad 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -464,7 +464,7 @@ static void do_fpscr_check_status(CPUPPCState *env, uintptr_t raddr)
     }
     cs->exception_index = POWERPC_EXCP_PROGRAM;
     env->error_code = error | POWERPC_EXCP_FP;
-    env->fpscr |= error ? FP_FEX : 0;
+    env->fpscr |= FP_FEX;
     /* Deferred floating-point exception after target FPSCR update */
     if (fp_exceptions_enabled(env)) {
         raise_exception_err_ra(env, cs->exception_index,
-- 
2.36.1


