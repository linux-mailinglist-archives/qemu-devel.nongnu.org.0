Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3ED3EDED2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:53:37 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjc0-00020K-US
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZm-0007v6-Rq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZl-0002lQ-Ie
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q6so13900607wrv.6
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guPfsm+TdDEggxYauLResM2Qs6zxvhc5Miqakb7nXb4=;
 b=W6TT/wnZp+2ZUhb3pM4GknHB0LbF86q7+ziSXfeaAjL87gOcB+XYNFT/NmZeB8AH7P
 lmLOamsNrzibtmbdjBefpoVHrhkcjtb5xnCzm7rpBqTjLzOBaXpYMhfmMduzDSa8eRXt
 hhhnw3xiunPe3Fo/tHmGpKpdFtYkdLatCJB7WKEwKZvF9gWbt0SFXE+ooQL10x6pLtrV
 i/M5csLvwwoAkBeK1T1fARiHBiwcPV9VYv1FYZ6Y7XyOWfqoeQwaYjcFjXtu67/ADUsY
 x/eA2WUmqKKGjQS9eiCrEARlddAjqfN1Nk574D4Yjy7kYBRsAPxKduxlLrMOhsIGfGRZ
 TOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=guPfsm+TdDEggxYauLResM2Qs6zxvhc5Miqakb7nXb4=;
 b=IfxpqOLL9Xzmoc09RaAirvMOWktyob7GArCfBtVIXvzO9WQD3tUHjLy7ho9/SyBnUY
 IRSdygzauUUuNt50Zd/jQWJBDtP4kbMA+SCC32u8/BA/GCbv5ARZllhEYdR/F+Pxm7sD
 8NjMcEsmB9bWZmkVJkmu51UapmWNqDf0RJ+nsxY7vh9sqXUTt+r35jik2JIP9eLxxHmA
 HCLLB6keML5oPTOjnbitkgNquCqRM3bQRndqjsVkp1E+T/Bs+64spbH4d/OVnYwh+J5W
 8YhdCKbT2RlC9Ht/M/SeN1L31uWbRvT+CZ+O1WQP2CJbOsesosOifCi2cWfbGyYvazdc
 /n8A==
X-Gm-Message-State: AOAM533opoI8E2sG+gZoaGBHbLtWvjge5u/5iJTCv9Ssjh9TGs20CO8c
 vqha0JkukVp5rMIw/QdVelk050BFEGQ=
X-Google-Smtp-Source: ABdhPJyKo/uR9AhqBzYTy7zwvxPP2M0fV5Ug/rxt30eXXKz4qv94GzWHGZTkJsWz9tKer9LC9UOfXw==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr321875wrs.395.1629147075982;
 Mon, 16 Aug 2021 13:51:15 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p18sm335560wrt.13.2021.08.16.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/mips: Remove gen_helper_0e3i()
Date: Mon, 16 Aug 2021 22:51:00 +0200
Message-Id: <20210816205107.2051495-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_0e3i() is unused since commit 895c2d04359
("target-mips: switch to AREG0 free mode"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a58d50e40e2..c0f8a04b472 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1249,12 +1249,6 @@ TCGv_i64 fpu_f64[32];
     tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
-#define gen_helper_0e3i(name, arg1, arg2, arg3, arg4) do {        \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg4);                    \
-    gen_helper_##name(cpu_env, arg1, arg2, arg3, helper_tmp);     \
-    tcg_temp_free_i32(helper_tmp);                                \
-    } while (0)
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


