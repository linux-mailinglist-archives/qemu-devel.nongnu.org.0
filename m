Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BC27D67B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 21:09:47 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNL0U-0007Jp-HE
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 15:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwA-0002Fn-1f
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 15:05:18 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKw8-0001gW-BI
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 15:05:17 -0400
Received: by mail-pg1-x544.google.com with SMTP id g29so4645915pgl.2
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ro+8tc5U3YoDYLJHgFJhwGBQOgcFJAzFR3QPTbXt9U8=;
 b=W3sSnziOd6gcEFYsmOuKnvcU644KzXdXb5ryC17MNqYRCKmZdYeVXHN31fTwbBnmUF
 6bidWQ1QobLFqnibiOFAC5pJEGeOfdW+uiw+RKmidlrXL2VAw4x43Z/+wUmk463lmBKL
 G5s3AfvtlCGtlQh9pI28egoMjkXy4ELZRFCxzpf0wwDx9sTo4cDU0qh8aGg9Hi2KLR5Y
 IQU9Dnes0Pr2Ke5cls+XUoEd9luYy3g9XIwu5IbHjN6ee0RMJ7VrByf2fgmeX1uvEp7f
 Mhngd2TPvS06tRf05V07a4qFrlSU+8kF+6JY1uZUrjaK4ElDwY6SI2OD9tNh51LbjGAL
 i78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ro+8tc5U3YoDYLJHgFJhwGBQOgcFJAzFR3QPTbXt9U8=;
 b=dzrR5Cp3vA+Kzrw8G7F0rgK8/Lh6w+AjJDggMD903ACTh3nKRiqCF6jmsqTezu/244
 LnYHfSjYeiC7uYurE907HL1AuETqVicUNrFDignhBI/1OrOGPNGN6OKTL5JmigyD0o3B
 1se0C1m21N1zh56hv+dvpnEJbRJI88RqiNaHihaoOBJNxECLVYW4FP+l5NqdpHG/LWWi
 rQZnwVBrnzusrYC/vv2GqzaIDvAZCoClrCYT3BXbhLzw/XnzA+zWLfW3xidx1qxNHAT6
 4/8dBq3zabP0JbWyuDp5NiVZZLZj5roVOfKHnEba5oc7CwvYXrM7jUkOrCzvvoR+oaoj
 FrQg==
X-Gm-Message-State: AOAM533MYJu8qTBt0N1T8UghaP2dq6VPfDhtx3Urt4Lg7Zhp5HxMBdqs
 f9yLUatnYw53G+3VkFUALQOzWe1DgQm0Uw==
X-Google-Smtp-Source: ABdhPJxnjk8N8XphMQvV8dtbcW3Opffbry5l5//kM8ChvQVatySyMm6OE3aSqVrtUEZVzerOny1Uvw==
X-Received: by 2002:a05:6a00:844:b029:13f:dd99:d1a4 with SMTP id
 q4-20020a056a000844b029013fdd99d1a4mr5600379pfk.31.1601406314825; 
 Tue, 29 Sep 2020 12:05:14 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v5 02/68] target/riscv: Use FIELD_EX32() to extract wd field
Date: Wed, 30 Sep 2020 03:03:37 +0800
Message-Id: <20200929190448.31116-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d28..bc3f212cea 100644
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


