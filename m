Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC4457296
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:16:00 +0100 (CET)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6YR-0005d8-FR
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OX-0005P3-ED
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:45 -0500
Received: from [2a00:1450:4864:20::432] (port=46836
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OV-0004G2-Ej
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id u1so18935798wru.13
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gWdXhd877W6Cpz07Ups1lngnxiZGupRJray2quMJVW4=;
 b=r5MZCLXTcz8FvXubx/0JCP0YJW7FAMW8u8OUPB39tujKfeufc7CGxgC8bKlrVHJ94h
 V6RV0+FGNlHGtZgK7AaYZzPY4p5S1YW3QTObG3EXgAtk47z1IYoewH1thTyMIv6qhykL
 c+Z0zwj0njdbmGZk2I3yXp6jftPwygfTehtXa1k9evA7mbQ7c1iILvTreurwdcs5F848
 soReuYVrhn8R9q8CJjfySGy8dKfuRxKHsWbFUAwsBm0w3XiRct04hnpTujaXoTcDbBiV
 JggR1tMAf6zt4qBPTRZy6VJQp+ane/haQcPnFr8WK9ahgZZwH/zdhVNqQ0iuRgkS5U4x
 iwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gWdXhd877W6Cpz07Ups1lngnxiZGupRJray2quMJVW4=;
 b=xGGdM17+nYOWNo4CnVpAi9p9y+FWTSjtNHa7t+yQpmKpfQ4NEVwpWCzUK/dmswFXL6
 yo1C7IT/qutnaz/pbUCrxGqkJdSrJPk1fLLTy5oBnFanytMAJkH9hC+oSupTOVvlJaGP
 JELhT0aAl/RNRGRu76y1xHGbtQrOiDcbK4lullL9RW5qcghiqsBiaKnnzVO8TuebWdWi
 BzPgcM0VXEjN44r2eLUnfBFHi5BAqN4VTxzLYkhr8MR8UECM+T2nJegm/1yvY6LGqx83
 EIgEXLjfJy7T+L7SGU4b7cKk2ItnDiYKefW2kuiJDRJeF0zepu8L8s0/t3jHrpFMWxXl
 3O9w==
X-Gm-Message-State: AOAM531OVyhRme68VQHDzKsgvnmpByUlS4zvfN11oBgSq9onAw1RJa0z
 ByNP/terB6JIhyL2VtLr5TNVRSCl5roiaQhtLVM=
X-Google-Smtp-Source: ABdhPJw9uXJqBqsuWi9IxjjBsF/GlwdJqhS07bfwrwrjff5mJV1Djv4c8u6cHon/H2ycJwTN+6GhUA==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr8733859wre.140.1637337941847; 
 Fri, 19 Nov 2021 08:05:41 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/35] target/ppc: Remove inline from do_fri
Date: Fri, 19 Nov 2021 17:04:41 +0100
Message-Id: <20211119160502.17432-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason the callers can't tail call to one function.
Leave it up to the compiler either way.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ee1047d7e5..9439dd7f21 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -593,8 +593,8 @@ FPU_FCFI(fcfids, int64_to_float32, 1)
 FPU_FCFI(fcfidu, uint64_to_float64, 0)
 FPU_FCFI(fcfidus, uint64_to_float32, 1)
 
-static inline uint64_t do_fri(CPUPPCState *env, uint64_t arg,
-                              int rounding_mode)
+static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
+                       int rounding_mode)
 {
     CPU_DoubleU farg;
     FloatRoundMode old_rounding_mode = get_float_rounding_mode(&env->fp_status);
-- 
2.25.1


