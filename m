Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299D6AEDFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe9-0003nY-PP; Tue, 07 Mar 2023 13:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe8-0003kd-2V
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:44 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe6-00019X-BO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so14988936plh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLZEot0hF6NAbXrKFQ/07RYgG9Dd/Q8qZBFDowmkBRE=;
 b=bTXQ41JW5OkjFa4gDLVS347tpA6cn9XFCUpuwGxbMjpvNhTny2vhFJSjEmra1FfYpc
 k67JWruyxHtyU0ex7eXLkURtoJVlzbS78IDU1PLFoE+V97FtMigpYoebG0zzhxDJVrCY
 KYPBzjY55ZVvlrEbODW0RAHH9cg92lPos/iTW6uDkeBmnNvznq9R/WulsOa1/PrPuTau
 aeanjHtzam+nILWpCMdhdpqrEi9//M+HxLfcUxo9RSAHYQBbtBz4/VkvRof7/esrbiyc
 8XPParKyQlt0CyRFZMgK1WrrM7Pvu7lp4rn7FNjGUH6QNDhiNPnv+7PG09qfIySkA8gB
 TZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLZEot0hF6NAbXrKFQ/07RYgG9Dd/Q8qZBFDowmkBRE=;
 b=Dtk8KShuR98Vg+OEa9G9if7LWSqAdatETSUhXTBym5t1JW6M0R3eFzvH5IFMLHR1Av
 YCe0vWTbCgfJXbzMXPxeNrx325korXB9a8ZiUvEDTPBLm1BUsZzyGdFTLW5Kg20mp7bS
 T9l90Go4x0gqMmEACdqex4989KnTNdHVzQ3K6I9+aD7XqMpoNZILiWum4oHz8PPlpuQR
 bH4kCqDFE2QbcN4nRw70rcmmoe2dUf9ELOP0E1XjwAZ4ffJ4gkjOIaLAoy+vLKCwtJVj
 F1mD/aNwrVK6dGgdrR8M8YdN5zT8J/7k8dfmlcuYP2e+t/FsNAImZxdMti0dKt/t3n82
 M/gA==
X-Gm-Message-State: AO0yUKWupiA5szIguNy6M4LxkyCcfyqyw9gX4t2UKbBS+25VMkW+wLR2
 iYX03CLtFd7d+mmlvcWiYAc1pdrROEbLjOkaaHs=
X-Google-Smtp-Source: AK7set8TfNFNxEa0gdgLjMX+GDprARtMFOJTu0iJV1haTxZb6gUq8ItbrmkTasPTp4a5A1RXIwkG9g==
X-Received: by 2002:a05:6a20:3d24:b0:cd:832c:f9d1 with SMTP id
 y36-20020a056a203d2400b000cd832cf9d1mr18638368pzi.62.1678212161006; 
 Tue, 07 Mar 2023 10:02:41 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 64/67] target/tricore: Use setcondi instead of explicit
 allocation
Date: Tue,  7 Mar 2023 09:58:45 -0800
Message-Id: <20230307175848.2508955-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This removes the only use of temp.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 19cf4b6cc7..6b2065803f 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3514,17 +3514,14 @@ static void decode_sr_accu(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1;
-    TCGv temp;
 
     r1 = MASK_OP_SR_S1D(ctx->opcode);
     op2 = MASK_OP_SR_OP2(ctx->opcode);
 
     switch (op2) {
     case OPC2_16_SR_RSUB:
-        /* overflow only if r1 = -0x80000000 */
-        temp = tcg_const_i32(-0x80000000);
-        /* calc V bit */
-        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], temp);
+        /* calc V bit -- overflow only if r1 = -0x80000000 */
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_PSW_V, cpu_gpr_d[r1], -0x80000000);
         tcg_gen_shli_tl(cpu_PSW_V, cpu_PSW_V, 31);
         /* calc SV bit */
         tcg_gen_or_tl(cpu_PSW_SV, cpu_PSW_SV, cpu_PSW_V);
-- 
2.34.1


