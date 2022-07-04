Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D6565178
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:57:04 +0200 (CEST)
Received: from localhost ([::1]:55222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IpD-0005Ba-Lm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITw-0001kD-5c
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITu-0004z5-KF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:03 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y18so80928plb.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pC1o5dIEfj/X0ZzHAPo5CQX3pETnqwqvqekF8ivkFYs=;
 b=K1gBmBhG8cUNb3sUn5EzyKsvx3RvAjmTm3O+OiVXlr1u68WkSg5x3R1/L57j1+pmqV
 X9p4vr1/+ryPyBZihmpXwK99hcUnOXycuYXA8vW73Xsax3pe3UxvA44LhdvRK41PwLjM
 muMrD5cNy976MPPKZjnXMeoO0BPhSFHbdvBJvzW2RpLV/OzVcfeQToOO1i6XGwIFSYhi
 lsoMt8llA2ICXScAdEw1lFDWT7HLrG4MO5jsJB+CIQBd57hQdJgGBy8J5+aP+WKb+OBn
 7tbNbSe96uCfYnXV1IkC1KGfaRSPyWn3HLpr1QBcrZl12rBOqkefuJhULrkksNwPAdko
 1pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pC1o5dIEfj/X0ZzHAPo5CQX3pETnqwqvqekF8ivkFYs=;
 b=iQVqHEyAcNZadeMPkCk1mbP7ZGxCyVyDKf9CtCgeGr913VK/AmlEIqpJvay//veZrk
 A7kn30vpqeAa1zNqzSl41XNjo5UEG4++U/A9FEE0CmLSrZ9vvSwEEdf/+XVIf/x/pybh
 jQn6dj1gNdk9BDiAE5WdLH612cvdotXmUPziInzftEEYaLg3fFn3AbF8ZS/5Ru0fK41t
 sTUi9Cngce127SsBifDesA3eEvsfEiBZyfKIo5UZyA88pk9dkF0G8dTSFOVu8AAQDKNf
 tdmnnzIQuEaViaNy2CZ+jVNkkm55VdnNAkFsNDpxKZzPdhfu5F1aMrzFaPnaeQSL2ER0
 TdQA==
X-Gm-Message-State: AJIora+7eFWzYy5FKE/D3EPY+A6d9FEPbDzpyhuuxodC3zSKFJtCWHvO
 o0I+2ENvAdjFhf+p9WmJ6FC4URIo/Ts+HfYm
X-Google-Smtp-Source: AGRyM1vDdobSGhXJqRvqOGRydpwG+EswoI8asCcOT5Ho7QK7dFkah3xCRbJ1tt9zeq62npkT6puchA==
X-Received: by 2002:a17:90b:1e02:b0:1ec:d979:4a8e with SMTP id
 pg2-20020a17090b1e0200b001ecd9794a8emr33195636pjb.181.1656927301818; 
 Mon, 04 Jul 2022 02:35:01 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:35:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 22/23] target/loongarch: Fix the meaning of ECFG reg's VS field
Date: Mon,  4 Jul 2022 15:03:56 +0530
Message-Id: <20220704093357.983255-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

By the manual of LoongArch CSR, the VS field(18:16 bits) of
ECFG reg means that the number of instructions between each
exception entry is 2^VS.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-9-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 47c0bdd1ac..d2d4667a34 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -223,6 +223,10 @@ static void loongarch_cpu_do_interrupt(CPUState *cs)
     env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
     env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
 
+    if (vec_size) {
+        vec_size = (1 << vec_size) * 4;
+    }
+
     if  (cs->exception_index == EXCCODE_INT) {
         /* Interrupt */
         uint32_t vector = 0;
-- 
2.34.1


