Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D319F43F673
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:07:38 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgK77-0003pD-T2
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdl-0002X8-SI
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJdf-0000MV-S0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:37:17 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p20so2845608pfo.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9nAuHbLddeYpLBlIUYDAM/D6SQqxNNj6qaNtq7Jlaw=;
 b=hiWXlvSrk7KxCaKwklWj+mlvZNNCAu5Ur5NdKK8rNCmddPMomGmCiIoBHQRH/ti4CT
 +hd5Sv0afVtiIHvscLxQXqxY5iGg7dXxL4Lh9EEwK5KT/xsVcpFUqFPVFgyo3RDm/0jc
 b2ceKTVj/3ODCgurm3KI8mIkz6GmvSDuddUqeYci+ce4wDAcM8I8LyD4oH1rGlu+wCrD
 ksUJ4rjp6A2J982RLIWVww0aDQD4D/1gR9IusQ/ARODVhgUW1brHZDsMk0QTqyv24/LJ
 jWDTpTnZZJUY1ljy+Ub4rAEdYMWu8xcfa6tl0XP/rsg0BwITr+k9XHaXSmeIA9xWQ86I
 IjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9nAuHbLddeYpLBlIUYDAM/D6SQqxNNj6qaNtq7Jlaw=;
 b=Bnjk37HP+SvFYOmK25AXgWZ9GuL7CiPrraZDKmFG/Jvt+DZWswgDBs+y+4sWdhJ6Zy
 5+7VseMcXaL1R86+1YFnxwicUTP3Ux+Sq7DfNJKHYWVEPqMG6J0CIFksomjDk0slmSwL
 HZgoHXdTv9LgNIXor6P4986uGw36ZTuhyJa85A4vzxXev6VKnJRjk3lDBxcRKtpl9y38
 y1FmOhRmHXAPzm1pg9+r6MolTpq/0/u35SmkAwz6yGx985/Z1wWJhQHtJwxi3Pd0quEW
 WqzxoTYiVpWhsM9vsfDYv1cTtCV5fBkVr+GazTWXJqpruJh7MN7V+RYvvL0lfXQvsGSx
 VJqg==
X-Gm-Message-State: AOAM533sEsE8iX6Rp3JeETqwe8V6cV2/Q+sk4sY9D8xuAzK2pEPhLb8y
 W15N7QL/OhTev0WqSaCZJeu4Bsg0FgOXkg==
X-Google-Smtp-Source: ABdhPJwoUIiK34VzbgX1qJPclE45XTZU5CK9OtfQiZLMKR7wuh23t21l8OilgAs8faR04x260sc/gA==
X-Received: by 2002:a63:18b:: with SMTP id 133mr6344166pgb.156.1635482229054; 
 Thu, 28 Oct 2021 21:37:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b8sm5228232pfv.56.2021.10.28.21.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:37:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 47/60] tcg: Extend call args using the correct opcodes
Date: Thu, 28 Oct 2021 21:33:16 -0700
Message-Id: <20211029043329.1518029-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pretending that the source is i64 when it is in fact i32 is
incorrect; we have type-changing opcodes that must be used.
This bug trips up the subsequent change to the optimizer.

Fixes: 4f2331e5b67a
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 024a22cf39..6332cdceca 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1508,11 +1508,11 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         if (is_32bit) {
             TCGv_i64 temp = tcg_temp_new_i64();
-            TCGv_i64 orig = temp_tcgv_i64(args[i]);
+            TCGv_i32 orig = temp_tcgv_i32(args[i]);
             if (is_signed) {
-                tcg_gen_ext32s_i64(temp, orig);
+                tcg_gen_ext_i32_i64(temp, orig);
             } else {
-                tcg_gen_ext32u_i64(temp, orig);
+                tcg_gen_extu_i32_i64(temp, orig);
             }
             args[i] = tcgv_i64_temp(temp);
         }
-- 
2.25.1


