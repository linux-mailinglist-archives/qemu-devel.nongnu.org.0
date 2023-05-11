Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C736FEDB9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Li-0007MV-Kk; Thu, 11 May 2023 04:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lh-0007MH-FR
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:29 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Le-0001yi-AC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:29 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-953343581a4so1285022166b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792505; x=1686384505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wNX1Pq98E0/bohWeUMs/8eeQ4iCUri+FDY9oiLUbo8=;
 b=n5gHSO/MGNkQU9z1FOgLloTlC2CT7mvym2hHWTYNAQ392P0jtWKlWRncgkvWFuMKdR
 JP+P7qE1lbr+YzCoJoaVfWEXXROn79swQtu2H7jmi0o3PkUGXsEdntwcXi3ra4RPbN33
 lacY7AvynSXqq1UbsTLO/V1e0BPnZ7bCfYxq0JMvcvPx5gotXIo3cZvAnB4xwQ5Utjhv
 +7vvOna6VenTm2igkhq2+ZcBzjChIZziic4bTP8rU8TYNkd2VLLU2cLa+V7NqiSHkvcH
 SpXMuDKUpYKhxx+Kw5yQsvKO1PHHPpJEPyepUgfFeLJe7FGEN7sxFEWpipk4VPwJQ+ci
 OYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792505; x=1686384505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wNX1Pq98E0/bohWeUMs/8eeQ4iCUri+FDY9oiLUbo8=;
 b=kSMyrqRRVDcoVtGkpa/2Kx26tm/3JQu5KhVL9MHaYZqpS3m0FySAeFA8zJVfPk+Wze
 S3ELN3mwLLApclxc7+TIuN7uGYsPYBlarRub7cXvfGFnvvKQxeQdN8wKJRD/R5XYFIuV
 Qp1clBUiHjdM244S8UOxtyNDeXmH9Cy5RrTfEM2Y9RQKXgPs4FbEyH0saB2pjg3BsYY9
 hkSYHUR6S0QS27hoatlUfo+o5xX8CUhEPo1EluArZGwYqItOaHm2Lg6BbOXgp6+if4kr
 d0nGImby5RpFbeTFaLua23kKYtNJBIJLVGP/OsDHyNak7VJk/7NE6cHDF5ANAl82Hw+b
 3bHg==
X-Gm-Message-State: AC+VfDyi7gIefWFHD4WKyUh/l9aq/NhlgJE2mjZe4ken1pAI/3gCvni1
 PPF8qKrVpJeWzYWCVL5DAj9ZdmtREwGRyxZHFsSgww==
X-Google-Smtp-Source: ACHHUZ75sKLaLp9rfLd6TWq3fCr0LXZwOyKqiBuoH6snL6wIuUb1yrnzF8YFp9sjd1BT4D8/6pJHEA==
X-Received: by 2002:a17:907:2ce5:b0:969:9fd0:7ce7 with SMTP id
 hz5-20020a1709072ce500b009699fd07ce7mr11015893ejc.11.1683792504868; 
 Thu, 11 May 2023 01:08:24 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 53/53] target/loongarch: Do not include tcg-ldst.h
Date: Thu, 11 May 2023 09:04:50 +0100
Message-Id: <20230511080450.860923-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This header is supposed to be private to tcg and in fact
does not need to be included here at all.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/csr_helper.c   | 1 -
 target/loongarch/iocsr_helper.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 7e02787895..6526367946 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -15,7 +15,6 @@
 #include "exec/cpu_ldst.h"
 #include "hw/irq.h"
 #include "cpu-csr.h"
-#include "tcg/tcg-ldst.h"
 
 target_ulong helper_csrrd_pgd(CPULoongArchState *env)
 {
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 505853e17b..dda9845d6c 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -12,7 +12,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "tcg/tcg-ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.34.1


