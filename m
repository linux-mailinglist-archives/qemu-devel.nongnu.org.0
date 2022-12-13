Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718664BE81
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:35:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmy-0000hq-4a; Tue, 13 Dec 2022 16:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmu-0000g2-2q
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:08 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmo-0003Dw-TU
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:06 -0500
Received: by mail-oi1-x22f.google.com with SMTP id v70so1049807oie.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EHWQ74OByxZK6+6bk+BFaesKcqluoqr4XzyR1zvNEg=;
 b=Gk1fOzRC3WJm44NRNJYyGD0xGEfKt24xNB9nCingYr746yCIS/yryamoOABxGsByqB
 55zJlE5OVlaIQYvMBv0+skk25hbwmeeIlO14ntojHrzOd1r3gYOhphn4b6jmqonaoBl7
 xhv62L8Q/JRfbOuIJoao4XV+iT4/2RQ2tpjiNIDl08DpVeU6X8esuLEQOvUAq0leXNA5
 9xHdP98szmYCo9dhxYgXv3R1BYsb/C2t3pTvN3x3rL7Gwp+x+0/dBYiUaASPy7VfUQjU
 MFNcAtBEY07t6sSKtUh7wfJtGuZoTMY4tzZ2ENpQsmbGVFZvfgnxsolzhVAXx9jOY9Ze
 zyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EHWQ74OByxZK6+6bk+BFaesKcqluoqr4XzyR1zvNEg=;
 b=JQ6mbLcHYoxU4y7Uzxiibs+MO7nfBSNyaUMyFEt/E1ta7FjNAieyBRTeapLfHuf1+f
 Iitahfs7Gdm6wALBPW3FhAY9MCWIz6RQ6ANqnOFpcUg45qyQ/NSMfsfApcHuUJnoeJF3
 qe1NIhjlxOXAk4fnyD3McBlkgOUtleIxDLh2DyKui7Bt32NTgtkNYs0zLeZItR9TI5HX
 IM5Td7V/MsmFSOCHDDz5bOH3fVUX8aK+88B7ESMtStMFRWdv1AOozG0Oh4cVwGWb9gHw
 950jTqfFP7fyzGL78pb45Qx9hOcWqi7aFB2J2Xh/K4Z2asdcp67ke8w+T4L1yLz6IQ2H
 s92w==
X-Gm-Message-State: ANoB5pm6StUt9NhFobZE1zvCZjSkfw7zotq99cakAefwxH3VYNrCb5jH
 bFkWwUArd5bqlnXSU1UxPmIMjr0wKJYnt00Eqbk=
X-Google-Smtp-Source: AA0mqf7j88q3RNHlAZ5PJYOythYw6aIaB1lyFfa4EhLZ8Gi+eDevKy2qjDpThQB9QJkEpq90/sF/qw==
X-Received: by 2002:a54:4596:0:b0:35e:1be8:2354 with SMTP id
 z22-20020a544596000000b0035e1be82354mr9309906oib.48.1670966762238; 
 Tue, 13 Dec 2022 13:26:02 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 18/27] accel/tcg/plugin: Avoid duplicate copy in copy_call
Date: Tue, 13 Dec 2022 15:25:32 -0600
Message-Id: <20221213212541.1820840-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We copied all of the arguments in copy_op_nocheck.
We only need to replace the one argument that we change.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/plugin-gen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9e359c006a..77e6823d6b 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -397,9 +397,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
 
     func_idx = TCGOP_CALLO(op) + TCGOP_CALLI(op);
     *cb_idx = func_idx;
-
     op->args[func_idx] = (uintptr_t)func;
-    op->args[func_idx + 1] = old_op->args[func_idx + 1];
 
     return op;
 }
-- 
2.34.1


