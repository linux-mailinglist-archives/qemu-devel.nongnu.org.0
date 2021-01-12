Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181492F365F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:01:51 +0100 (CET)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN3G-0003FT-2C
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzW-0001QC-Cp
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzU-0006w6-UT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 91so3237145wrj.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t9mHNHYfhgucBJqyH8TdMdoSYXb99VvjrbQmZv5BKGc=;
 b=tuWtxsHYqdvuxemNZpRRgzVvmuilXLuEcFj2AY++YIZH00zNEBEigaTlko+PT/qqCi
 Jf1kZjNohGlw2jUth+2WKe/oFnVbl9dnQIS0ashTrsQFO7nKqiBVir6CkgrWW0NqGlT6
 RjHtohsv22YkUTNs/Qs5Xa8Nhh236W1fAnMfmi7py1UDlMouaBjqG5ufOSOJy329yWbE
 IK3Ou0IZ3K8mEQPU5wETiLzoeTTbEo1avhbE+4hsKY+4BN3JpFfr1w3oUYE+hOSMMCD0
 jNgUUWqxHQHrQzN88OvURUwKQijHhzDmvVT8yv5Vx1JReAz/yq2CQq0cMo8rmVAL/kVv
 SDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t9mHNHYfhgucBJqyH8TdMdoSYXb99VvjrbQmZv5BKGc=;
 b=uHRrcyPiufmYqOuS4zCq2WkDqZIWYyxqxbZZiT+FLkiOXYz2zWtocR24Z+7YKqr94h
 D/j1OEt1SZAsGWnT2G60JEdsLnDo+Oie6g1x86KrR8LuCLeMO9Z+d4/468V8zba7apy2
 7afgPLJ0nIDvKUk6s0ODpJ7KHwpSJ+tAKGH/1grYjAGszU09Fzjdl0Qfkka5un+OHeKC
 +8itO5cVUfAN+M0CBjDGxyuFcRYbEal0fZ5VvvL4qbwJ2t6Ow1pTM++n+fr4npCOKuiS
 og7rdBbf1OHk14mixtIc0tYzcKuxTbxstV42VbEZI/44HhM+os18YcUTgo93GYmPRsnR
 d8PA==
X-Gm-Message-State: AOAM533jZnXfKrT7cEr+jeNoTy5aZygLvIMb3fRR+sdWKcQ44dmxYKjg
 K5MGZ84xbK5uIxxSFU+U2Lt8k+6NNFwpfQ==
X-Google-Smtp-Source: ABdhPJxLz2MP5oJoONIiafiFrAYg0tyMJjk81+Wt32g3WB2WRP62QlF4nj4iSqcdQXh/IdcLHzDhmg==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr5297219wrq.229.1610470674662; 
 Tue, 12 Jan 2021 08:57:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] target/arm: enable Small Translation tables in max CPU
Date: Tue, 12 Jan 2021 16:57:31 +0000
Message-Id: <20210112165750.30475-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cf9fc4bc61..da24f94baa2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -669,6 +669,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr2;
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.20.1


