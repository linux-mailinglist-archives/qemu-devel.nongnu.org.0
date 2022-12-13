Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40F64BE5C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmk-0000cq-1E; Tue, 13 Dec 2022 16:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmh-0000cC-D9
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:55 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmf-0003Dw-S0
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:55 -0500
Received: by mail-oi1-x22f.google.com with SMTP id v70so1049422oie.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AADJsK1S30bnJazg8/q+dVkIQuSQjRIPsLPoQjmDJDw=;
 b=iitDdmIfdl6DKWI5km3kvb8jeGi8uGmBr/j0jyHHPXH8dtDj0TZ4iqz2WrcMf6R7my
 VQx6ei64MTRif+2nb0+xFhFr5bfFICudb4xdKi89D7GcJmlVywzm+gchIGZePyRuD+HS
 512u/7f0iAAkwxuwdY54VNKrCsH3i57ZKDZ35VtW+mChxBbgyvCZJ009M72yD0k7SPRw
 QBBlPILVOuaYbmPXJGpym383JYTsUcbjwqwJlpxN7Lu2beoWsRPNXBLC1cxUr9GoIHH9
 BpxZSdteDg+oRxkmK+lC8lMisRoJ+lNKMYDZFc55rpn2C5uCbokg5qCBUcTz6+6uZvTo
 XcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AADJsK1S30bnJazg8/q+dVkIQuSQjRIPsLPoQjmDJDw=;
 b=hh06pQiW7SCC4vCbF2DHUWLTt8cSTKS5LAw4J+Pa/BnLW6LnEoTtuvw18T8dWQ3S/v
 1dieMNyhquLr9oIuB4zfLj6muHlfYPUbvv733+lFtDCZum3v6TSpD9KHzDI91MpLNTHr
 1ldmKAiQHTQMDsrAbNQtuOz41PA+obbd60KSOLEuqjUW+uEJ1775GEsShUmkFmhjdqLm
 HJT9PEhOvLH6f/K6q8sZGfqk2cbb/9EOwn29mGZHQZwlpzLzXp9+8Td33+PSN8wFsekh
 sr8OGg0uvijK0etawdzEHMkQQ3TvvNF+el0s1brHlL5g4QEL09EA+CV6Yc/HSKnBa+D9
 4A6Q==
X-Gm-Message-State: ANoB5pn6i+MchjUmmF8up1qFcfk4dWi2zRabDK3n7nvNfABpHRiqQ9g5
 08sPt5A43illV9DEKuTQYsSe1PTS94lI3Ve2ZwU=
X-Google-Smtp-Source: AA0mqf56x8vw6lZaP61EOJF5wdDIxXJx9cl2LdoUmUuNWaKCEHyL4AsVGyUJUU6TdMNhiR1uBL2aOA==
X-Received: by 2002:a05:6808:64a:b0:35e:34b9:f793 with SMTP id
 z10-20020a056808064a00b0035e34b9f793mr9295179oih.20.1670966752538; 
 Tue, 13 Dec 2022 13:25:52 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/27] tcg: Simplify calls to temp_sync vs mem_coherent
Date: Tue, 13 Dec 2022 15:25:23 -0600
Message-Id: <20221213212541.1820840-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

The first thing that temp_sync does is check mem_coherent,
so there's no need for the caller to do so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f58013a5a..36a33a122c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4075,12 +4075,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
     if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
+        temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        temp_sync(s, itsh, s->reserved_regs, 0, 0);
 #if HOST_BIG_ENDIAN
         TCGTemp *its = itsh;
 #else
-- 
2.34.1


