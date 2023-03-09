Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932256B2E31
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMX0-0004kM-UC; Thu, 09 Mar 2023 15:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWy-0004ha-Er
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:28 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWw-0000om-Vp
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:28 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so7371499pjg.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Ijnr9MBASlA4UX3d1077fp3vEcVoh6UyibEi0BuEyQ=;
 b=aiwmUo7862qBCjw1VMD7siQU24u9qFuh1p8qr9DBfoqc2JWU7tXl3uzN9b/flCF1Wd
 sE1e5LGACK6f0pqvDC8XRmzK+JU00bj9U70Zllxn3P6c8z91nWkzUqCUNqOZfwtKZqGl
 JjMsW2OdtIM3RD6rPqbam/i/goKsQmecvkSpU+kDtEfaSD7Z35eOU3ULp1TzvBzd/mKP
 q5Ul5FlzhO4C4PCFDv8efFgwS8DzSaANKmTzp9WXpRsoVh/f2bvFuCs2VJ1Ew5kiH7uy
 f7zH56OQKW2kaqROgCA/mMJ7iXWwMrETMHgO5lsn70wGGScfXaEs0G65//J+aN+GSZuw
 6A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Ijnr9MBASlA4UX3d1077fp3vEcVoh6UyibEi0BuEyQ=;
 b=3HzvUX9oXK6v1Wu7ipJrfSidEE48v2Hsv2xdr7Uiom3QFB/0/5MI9ERkgZj+1olJ46
 bFxHA8VjnXwyM6/VqHOrwcRxzzqUJr0I2Pb5FgFf3dTEQTbrIbk8kJ5UD/yHbScnZVC4
 qJrGpE7WzzpGLfoUwEJHh3joZ/1euJWJvIHOYgbyg+RZ6rE3rCOw7X8GaAHeQYWTLhpg
 xnJOY5+PBRQ/4G6Coyn8MTTxI93HbIjb31cgnTRuYq0OX9TinmyRzhVA+hMydolF1zwa
 Bhag+Prj6ZsKIckX1OXBJmFzdpeN2XMP7uf2tGQd4CRJfLZmD3o6/ptqNL4urtbmRdIs
 wdzw==
X-Gm-Message-State: AO0yUKWk+Szu9dtG9EvNn2K9RrlhDcF4SwlYjV9zqxtAOd+76PfX04dZ
 ZYSDhH1aNpBpTTHBjuWwvl/BCRurPelfzQKcPEc=
X-Google-Smtp-Source: AK7set/VdCudPCOF8jV4n9NJZGijxWK4OYrusRFARhTb8nqdywp9lhsVsaRYRQzzXC2mvFWqR3knSg==
X-Received: by 2002:a17:90b:4b44:b0:237:72e5:61bd with SMTP id
 mi4-20020a17090b4b4400b0023772e561bdmr24600464pjb.49.1678392385565; 
 Thu, 09 Mar 2023 12:06:25 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 38/91] include/exec: Remove guards around `NB_MMU_MODES`
Date: Thu,  9 Mar 2023 12:04:57 -0800
Message-Id: <20230309200550.3878088-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-24-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 7d9e1f50d8..e230bb59f5 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -56,9 +56,7 @@
  * Fix the number of mmu modes to 16, which is also the maximum
  * supported by the softmmu tlb api.
  */
-#ifndef NB_MMU_MODES
 #define NB_MMU_MODES 16
-#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
-- 
2.34.1


