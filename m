Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EC5048A1
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:49:43 +0200 (CEST)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng91p-0003wU-Sy
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wt-0000dn-7N
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:35 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wr-0003FC-I5
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so15524693pjn.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctao6OM4nQH5DOtD+RHJ8jgaq6PvH+d/+VQiChfQs3Y=;
 b=lPQNaZrQHa0wXcZD1iwewNJ4tDzIuJ8474HPRZrXy6sg1jWo2CKRLueZPtSHYBTPRm
 yX865H9BIQnUIvQKPo8N2qWllwYQd2YA64+bM+Dfg1qEKGdH7x+JX/2zca4M658Gc2tu
 EMj6yZrUDai1QQq9iqjatgkBFNADbJwUheVk5abunrEU6w80OUZkQzYdYMbbkYgXA2Ex
 mzLB4Ugbab7FRIO1McRcuNE5IEfxhCM3bmKJ6Ahqct0/Hf48yP5X88KbtPM8KElA7BxT
 +TwI7qyijSUb0S+OQDOjQKoYoPDl0P0zXrFZWGvE+9FDaaw0Tsm0HHIz7DX2tfO7Sr6s
 iQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctao6OM4nQH5DOtD+RHJ8jgaq6PvH+d/+VQiChfQs3Y=;
 b=n2ylR4WwDu9T+1PIKEI+yNmpu/wtZRJge3zIU0NyJBh+pKbOhpvgxFdlSEaweV1q7v
 U2ejIy86gTtw3NIy9I9Im6R2tQ3aMOHfyPprDSJ5KGP+Xv7U+PHuM9TewCU74fULLqfk
 kdn1EuvOUUt0d2dFvl/jUfn9uUiYj92lsd3FsbbsJQmupKSQ7eSPjTEbNskJnKzt5tO5
 OadKYvMws2mElGuYxITPudk844uEj0itZfwv5Fio/ZfCkYRh0rFYVOHbrlQbJ1TaBhQ5
 Tp7DKlVzSu5CeRB4cCdRrqY6y27AmOUGqxfqSAIKeAoU8VOBfa2jQwFYPZJFdCl0ynGk
 +p1Q==
X-Gm-Message-State: AOAM532V48LRWow+PnGCWrDS/9wfPVYTIJIaDDeui+JO423oCrmvX7jM
 y7gDhaJAMfZxOmdweBnOI01mjiiHFVf7Zg==
X-Google-Smtp-Source: ABdhPJzZRZcsNlwG3xHoI9WV0KYVhpikFi8jLrpEEy91Hrz765UwRX1qXfA+pKbFSeBABUJvUbn7+A==
X-Received: by 2002:a17:90b:4d01:b0:1d0:f39f:6073 with SMTP id
 mw1-20020a17090b4d0100b001d0f39f6073mr9068144pjb.175.1650217472216; 
 Sun, 17 Apr 2022 10:44:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/60] target/arm: Update SCR_EL3 bits to ARMv8.8
Date: Sun, 17 Apr 2022 10:43:29 -0700
Message-Id: <20220417174426.711829-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update SCR_EL3 fields per ARM DDI0487 H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a29a4a215..f843c62c83 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1544,6 +1544,18 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_FIEN              (1U << 21)
 #define SCR_ENSCXT            (1U << 25)
 #define SCR_ATA               (1U << 26)
+#define SCR_FGTEN             (1U << 27)
+#define SCR_ECVEN             (1U << 28)
+#define SCR_TWEDEN            (1U << 29)
+#define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
+#define SCR_TME               (1ULL << 34)
+#define SCR_AMVOFFEN          (1ULL << 35)
+#define SCR_ENAS0             (1ULL << 36)
+#define SCR_ADEN              (1ULL << 37)
+#define SCR_HXEN              (1ULL << 38)
+#define SCR_TRNDR             (1ULL << 40)
+#define SCR_ENTP2             (1ULL << 41)
+#define SCR_GPF               (1ULL << 48)
 
 #define HSTR_TTEE (1 << 16)
 #define HSTR_TJDBX (1 << 17)
-- 
2.25.1


