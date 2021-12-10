Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E977446FC3B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:01:39 +0100 (CET)
Received: from localhost ([::1]:35128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvaqX-000712-5Z
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:01:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamO-00032C-7k
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:20 -0500
Received: from [2607:f8b0:4864:20::102a] (port=40568
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamM-0006AG-Jo
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so8831310pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VmtjWLLaITyA/tipDAtaMtQ7I1x6XXgAVuqbhBYJ20=;
 b=nkiVwOvmnsSnjF4zOuOkiaqTd8SbJEggmvbfyuWbVxiq2UQbB2yWLK0qEX0p7tcPc3
 9ht/1IowTmXsHE9zTrEr/yauxXYqfC/eQoTGShhpyLem5JWXjwILSUFkgjWyS10oFWYk
 tQ8hq8E07BoUaPLGNqkpvT/rffFChj/P9X94Gq461Jb1y8GLY3O71+h2YPzUL3jr8qg7
 LKVU6prWmyNC7sPoQlc8X2qdU/L8K4QoE+AuIZ+KAna6UbCOOqVmxIXn1Nhs2dqS+tnL
 bf4P1GuFqAx8hZYxVHqLJeEHRw9tzxYDGwT+xSLukMhTatUSzF6szT8wm9AAhbO3Fgu7
 EbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VmtjWLLaITyA/tipDAtaMtQ7I1x6XXgAVuqbhBYJ20=;
 b=hcVcdkKy0ui6S4q2kyWcaVk+qdkQBLPofxMF4quatU/myEF92Cw1vSJ6cf5Yuq38rg
 ELtthjZmeuyVpE+wfFtd98kIodjgkuUsLzDVXSCreztx+2P0GRpsjmXnh2mqVUUfjpdb
 gleC8LxgqC7M+HxjjWyrDfb8BTUcsjOYyRuNE+RUVM5zjeWLVs8mRPDw4Jck6tLs6joQ
 FaqA9/D4nK4NTgtrPvL+Ax64NI4aWLggKhcTZd5Gu3F1aCBIdlfC4wGaY8AnDeJI7/aa
 i6Dnwr53kopqbr4anF7xBnI7GPxGJ9z0y+tdN8RncFQRTRLH0gMkdh7oN1vLgT4Z9wMn
 +ozQ==
X-Gm-Message-State: AOAM5321JNiX7emQmdpK42C616cQF+Uw2QvM0ux4EhwQLF356gdjbk1Y
 99kSHGAwX42xGR6OgLY7yA0SHYR/u/+2m8Iw
X-Google-Smtp-Source: ABdhPJw2jVjXps5zd2+hNWBSmzcFme/DecAQUyS/QpONfMn+CFlbsg6uUgTU3zxJrO/B1RUC/uGqVw==
X-Received: by 2002:a17:90b:155:: with SMTP id
 em21mr22642479pjb.12.1639123036932; 
 Thu, 09 Dec 2021 23:57:16 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 02/77] target/riscv: Use FIELD_EX32() to extract wd field
Date: Fri, 10 Dec 2021 15:55:48 +0800
Message-Id: <20211210075704.23951-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
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
index 12c31aa4b4..70f589813e 100644
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
2.31.1


