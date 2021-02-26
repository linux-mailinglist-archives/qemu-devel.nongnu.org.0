Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA37B325BEB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:25:32 +0100 (CET)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFTkx-00029h-Sb
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTev-0005Aj-SE
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:17 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTet-0000MV-QU
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:17 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so5329234pfk.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Oj6zdFic6NGpQV/DS08Hb8h3hPvrSha1nmKRgxJUgjk=;
 b=IFN84pTzpOU+RjHHdPYNNMgcUxkplIWFTGQN2+Rsn3JJSwSib3umTLJeyHvQ5vGrhS
 y9XX/Mpk2c4zz0moA3f+/ewArs0v2dxLnJdfpUYYS6JxhdsnvKIZH+Gl2gKMDF1MXhdE
 FKKBTywkMK0LFnTfM6SUq1yMGYqW4wFZQPPKqUtDO5RmSF51GHKCYfoQofGf23itc37n
 Vwn+7ofaMv5ef+k3Gfq7wVuq7rMVtP8sh9ohQ2xj3jht5uA3iFCe00JuU8LIxejORvj2
 n36MOrOCV2eJ6rQk/rAQ0E4IAzuNu/Gy0plFIyi0N1iTPcSAWDv9jKHEqpGcAOjmFaIa
 5vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Oj6zdFic6NGpQV/DS08Hb8h3hPvrSha1nmKRgxJUgjk=;
 b=jlb/v0Cx7byZxDolUWQ/B9m+e4zNTNWf+8gireb3DHd0gyYFrwL+DgZZRpqtkQ9Uwf
 sNZcuk7qyb2mMthLQbdZt1HrTLvuanB+oOj6mDcubDBUt5zOlyAVcZLGsP6Evv/VnIwO
 ps1Aj5JoudL6Cp8+WFHmVfIgiTgo0hl2d55Jeh90z3RPeyvBmRUpcRwqqGjXGDqu7Y5R
 MZP+HgXC1Y5wnHFVmyRLuZtALOx5+qy/sqvteD88JDvuuTI7CFeBQz+rvaISGsEbfTfH
 j3Izzo91pAM0NWPYt+9nkcKsuUuZLqY6rP8tko5ut7RYSzwOnF6HAWPBiNnFq0KP3mN6
 CRhA==
X-Gm-Message-State: AOAM530insLb7oaeoM1SzXVKI3iP/t+Zck2pKKZNu2ScCyGt9cpTnggE
 OrXAU4vEdUr+HdZeWKIHaitRQIibAq+Wcg==
X-Google-Smtp-Source: ABdhPJy6S6FUxjIOofUEAc8tj3b1e5QIZqjDq7NTAs9W1I+Qxrg6S0MIxAkkI/kckVXKJO+un1MT8w==
X-Received: by 2002:a63:4922:: with SMTP id w34mr991133pga.423.1614309554442; 
 Thu, 25 Feb 2021 19:19:14 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:14 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 02/75] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 26 Feb 2021 11:17:46 +0800
Message-Id: <20210226031902.23656-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..bc3f212ceac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


