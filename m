Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5F563EC4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:10:21 +0200 (CEST)
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WKi-0002wd-KR
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDR-0003Cw-V7
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:49 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDQ-0004sp-Ga
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:49 -0400
Received: by mail-pl1-x62b.google.com with SMTP id q18so4160037pld.13
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xm7U7AL4nOnjycULzYDw79xiqJVDueo/kCsQJyWcsKU=;
 b=CRCBep4YA3KLJs2P6ugE+pCtNc8XR9Qbbqqp9wpjnIwdl83pbl5GewLVBEkwkxmunQ
 4I10zr7Ud8e2cZOeUcU2E0UCLsknTdoWFLYYscKRnUe6QP1kUAbynEv5xxB+LtbkpIYo
 C0bTLo5V1Qx/JxSinlXRphvFL+g5AlICgRUWBSFTcQUsFc0vD0M08f4Ef+WjP6WsLHYN
 JoUtNC7tMhevKFv0pxkdtM9tgQmOX4GpDhbNWCKgiOqVO28A4EI0f1uFQDkkYYxAH3Jl
 dF4WSHY6qhQ8K1nq5aDFrh4KeVdSXnmcjj52nnY8ia8LgkgArfzMczCe/UPHEMoWL/Rd
 p48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xm7U7AL4nOnjycULzYDw79xiqJVDueo/kCsQJyWcsKU=;
 b=J8qR9gA1P/o8gtz8EiBGO/3sTH8DtzQr8sUIKASCrtWgaJ/vbxGTu1TZLxHX7uIj80
 zOdTOoE+pp5MJT9vY/01gj53R7nARFE0Y1Qbqwfsd0gqmdM0LiYD/jlYWwamIkBv48AO
 +U8XZ4tDjZUwEiedpBT0jNHcCDIowbc7qdYXPjNBzBTDMPwsQN+LeA8chbRauTFLj1S5
 g5Ves4lkzE4a4dMu4CqziT5dEJdz9WqaWZOB796Qenmh1rYI4DNWm2ygF/bkzERAKWa/
 y/Odjjx1pFmrTgIxErh2VUuHj0G77HPA/8o7i7jkA6fvToDPTJDwM9pmLcnlRX5Yi3YQ
 MOtA==
X-Gm-Message-State: AJIora/gc7mwN93KyM6M3UNNxmqvU88P3+7tfIETHl36f41/Dm1kVsyd
 bFVPzwgP5ri1TDYEsDDUmcz/2BLwwKzGrxaI
X-Google-Smtp-Source: AGRyM1tXQsE4D8TgBSawG7gDe8vvP9FBiZJlSgqT6gIXG4a7MIC75SdWENP7TFN4rE6mssBpjvqn/A==
X-Received: by 2002:a17:902:8216:b0:16a:6376:ef81 with SMTP id
 x22-20020a170902821600b0016a6376ef81mr25273603pln.2.1656741767190; 
 Fri, 01 Jul 2022 23:02:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm5232178pjl.32.2022.07.01.23.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 23:02:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: svens@linux.ibm.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 4/4] target/s390x: Exit tb after executing ex_value
Date: Sat,  2 Jul 2022 11:32:28 +0530
Message-Id: <20220702060228.420454-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702060228.420454-1-richard.henderson@linaro.org>
References: <20220702060228.420454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

When EXECUTE sets ex_value to interrupt the constructed instruction,
we implicitly disable interrupts so that the value is not corrupted.
Exit to the main loop after execution, so that we re-evaluate any
pending interrupts.

Reported-by: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index eac59c3dd1..e2ee005671 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6593,7 +6593,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER);
+    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.34.1


