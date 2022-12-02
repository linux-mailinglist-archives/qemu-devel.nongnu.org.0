Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A60A64000D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymf-0002fi-T9; Fri, 02 Dec 2022 00:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymb-0002eU-Tn
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:21 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0yma-0003N9-Dc
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:21 -0500
Received: by mail-pg1-x52e.google.com with SMTP id r18so3528896pgr.12
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ca1OA5nQYbr0k/TE8wJLN+t11Y9wq6hjnrCkBaDjgo=;
 b=AAdkyU4cKB/RrG3PnBdkdCIdw2bR3erTuc5g7gp+sxpSu1VituhKp6ICwblV/rK9vJ
 Q1ucoBc1ZFrMo8HsaUwoaVZTDXA9HhCW2T4VSDTOgFnrmWilm5I9OKt3oCao89UjtFrA
 iyPBjprL5UANMnuwXGYScCab/00HtlCZ4UVfElt2R1F9rqIYUgIl/Ds8McW8rj02mTsD
 u8sYHzj7qrjzsUAEntl6BWpDvCFMPS6O0FI7MA4toO44VSzi0oWYbEDRyK22Qhrfhrwu
 pvQBQKQ87wfzdT9iscCS7iBIs6GNuDsql99eZtzsPZt+PYT1eeDsbSqDoNeVdYcr6uIH
 YYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ca1OA5nQYbr0k/TE8wJLN+t11Y9wq6hjnrCkBaDjgo=;
 b=RfxWYYDaZ65d0xk9ALVD0ldNqoIt6mKSIJNQEPOOIWv64evna41Zli1FJBqRdJWjvP
 rAeR7uvdDtu8J0Yb6SExkZht7q0HMvA6K16FLhPIN2jw+XqzRY3why0xucfMvQAZ70BY
 NaLjSQqPWGt255qgNrsFZ3ExM3WHyA33/3mgXrlGttjNxOtbi+4tg0si9xqbWyNH/qm/
 /97+njItJ4zXW3jPC04+y8d1iKC6NyVkt/dX8Uu/guG8EBSlyeWZtan40qlz2X4ps2Uc
 RTTynFZuJgnwR/PwZwHBcAyBhln4FzEp5QoUDAVxqVJinFHtazIjtaWliKdiKaSBJwnA
 jxqA==
X-Gm-Message-State: ANoB5plkBQJjIz/IwU4dVMXyo7WRkqs9esQRDUro1bbttGGJDR07q13T
 Nuff9SEESV25dFh7SojHuBtzOwnqzM2zutPQ
X-Google-Smtp-Source: AA0mqf6sGhJPEWkIZj5yg7cGOlv72cCd+hIdUnUHzA7i+OWFPdDC0kg5uHH4b52UD+ElebuLqSMk3w==
X-Received: by 2002:a63:4946:0:b0:477:7c87:1087 with SMTP id
 y6-20020a634946000000b004777c871087mr48936505pgk.452.1669959619117; 
 Thu, 01 Dec 2022 21:40:19 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 19/34] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Thu,  1 Dec 2022 21:39:43 -0800
Message-Id: <20221202053958.223890-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the ABI of a function call.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


