Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D36F42EA87
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:49:59 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHyY-00009M-9O
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHva-00057z-Rg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvV-0001sK-OF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id f5so7837321pgc.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=ikTOEJNxNpZIwraBMLu6ErL4zqcT3U06v/9cnW5N7M9GsCasSjWuhPUXRks9Y5vbZ/
 Q2MMHQQp1ixTqDktbT8NNOMABNuYceu0ymPL3qfU3tCpOcJk7ZVzGItzhv8rP6QT8TvL
 QPHsjSDzeN19K+JTf7tuS5vCS/g4WclxdmWzjKYpoV/27fh564Kt9eZGPn8wGcJPGvy3
 IXe7GnpUIujgEKBf7MkJgw282W9GDxHhaYmU+DA8/BRkknW5uWOAHlWlRiAfTSkeGxpr
 clCai+7NYaaqHHV13DOLDr6SAukUVMRI375rmQwJEHdK2fRue6w5cBo8eLJ6m//vKCVY
 Yamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=i3YU0HG3+tM0fCrof8ap4UuBHHKHOJ0nyh+e3KiY8WEcxk9r44uD37CNCnLrv7GcSR
 xikNOn3uc/EwMUukmriDR8n4eOvK437BwnfDBjf7BrF63rYhFogCMO5U0YUnkdA49rTO
 waaOI++cQiowrNzV5WJIZQvQWch5Zn4s7eOY3cedkT6TMuyvV3xJZ9sRfQTXvstNXUSW
 jy7/eeRUIwgRfJhdFbRe8ltxKU0GvGIMnCwmbmCqe9tGfXycocmI8F7dbF77ohQHbqtr
 YABGhyfLtPZ4w7iKKsD/bws/jrp9I+ijyXDPt4MjlzVRLyPnsXsTpHEecMtz4nGQ0muJ
 HcvA==
X-Gm-Message-State: AOAM531w9Od45zQiiwPEFd1Cj9lla4Eb5QKn/XDD99acPjNvglBs9FWH
 thbp1C2HS4z8dv6V36wP7KL6aSqdSw9D/Csh
X-Google-Smtp-Source: ABdhPJzyIs11D4/YA8oURWqRQaZbjIxXuFeQD2Ip4ncQfV5et2NM+1KgsbhVvlgI5AwDJYVv/6EzHA==
X-Received: by 2002:a62:7506:0:b0:44c:5cd7:cbb5 with SMTP id
 q6-20020a627506000000b0044c5cd7cbb5mr9928853pfc.52.1634284008237; 
 Fri, 15 Oct 2021 00:46:48 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:47 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 03/78] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 15 Oct 2021 15:45:04 +0800
Message-Id: <20211015074627.3957162-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
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
index 12c31aa4b4d..70f589813ed 100644
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
2.25.1


