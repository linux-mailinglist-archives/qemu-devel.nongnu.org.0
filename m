Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA21436286B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:13:39 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTuM-0002s4-T9
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThp-0003uq-Bh
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThW-0004Qh-C0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id d8so14467653plh.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZY8Z6GuKFk2peBpwdwT6RL45PsoJHkRVCx8Ex73fZxw=;
 b=kwLpd8dgEvQNJ9rF8MSlXupicLAGUdi7PM3EPvG8Y5ckjqrYjqpk6IyOo+5sEoNbbw
 rjwUC5sRnXhzQ2DRGI1GKzMMhA9ec3l2F9HTl7ybAcTugbaqlsh0cA0F1frcrQOA2CAz
 Voa5Gwiqg48R77jhYc8MlVkOEpdc9Bih3QEZg9xJJOUFoVyQnbz/6XcizqAQeKpTudN+
 YOuz/837HaJc4tVrh0sdHqRxjAE8+ps0a29L9ON3juchafgMfIO8S7YWUyCIRcid19RM
 15Vf2+bRxA08H55yUcKDzAohQ2ve0Ga5Tntt9w2Ecxr3nEglJMqWmFlSeNdVndhrIYHY
 A4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZY8Z6GuKFk2peBpwdwT6RL45PsoJHkRVCx8Ex73fZxw=;
 b=AKB8Uye1MIMqKFOxo8w3le6T1+JoA+ceoUQB6P0tiUexV1s2sbWXhjMkxtMg+XBKcs
 wF198j2urX51IJ1XfJn/KYl6Uezcn86e0/vANhUn3Dt6+KorvPKb4ijiyL/c/IPnjWHl
 SDNAI9hRTt8so8zj/qHAkgtlWWGgC2qa53mUFbNuihewjvDzLLo3M7R5c4BUTPpzsXFW
 EXsePVcLw9nWySVKN+P1lLnoVZ20a3UCzuHrf4wCaaoNxbZjGOUplF9M7TrjhVn3NmeJ
 tgBjAuauSxzsrSlsMMpH3/K4JgjaQouNvpU05nMkLbETz4FE3XVv20RFJ2Zc0/waiLd2
 67Hg==
X-Gm-Message-State: AOAM532uX5suuz7V46bNvWkk8HxiyIptHj9FGfqYarvchFl/wYpYzcBS
 QkP1vh2IyiKDjdkp/N2H/S8jJ/E86rj6xQ==
X-Google-Smtp-Source: ABdhPJwj5rQkiz6fWIB7coMPvtbT88BRJmZjX6/+elGXUNcMgKFTafeBzOjB3NwWFt+Mdmo8G8Q4ZA==
X-Received: by 2002:a17:902:bd41:b029:e6:933a:f3ef with SMTP id
 b1-20020a170902bd41b02900e6933af3efmr10966839plx.19.1618599617511; 
 Fri, 16 Apr 2021 12:00:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/30] target/arm: Enforce alignment for RFE
Date: Fri, 16 Apr 2021 11:59:46 -0700
Message-Id: <20210416185959.1520974-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1ddfce9dfe..6d2339ebad 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8341,10 +8341,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


