Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA206A9454
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:43:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zt-0001AB-Mm; Fri, 03 Mar 2023 03:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zn-0000av-LD
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:31 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zm-0007pD-0n
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so5423706pjb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832949;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82h2vRR5TSHW1u0Jlt4giv+BcWArhc5iaQ4XkWCBX7g=;
 b=qJCsSRycIws//tyhMVjGLu6ywxNbUWq/EpBAYtt06a5aefUYr9IFX6c51tozNobEbO
 mNaXIP774C4yY/J55Wv4vaVZbYU5AGBBP+3oX5PBvLr3A1/Jcggfwkzn/gOmZTvKW21l
 5dPXStv+gHjE1LKElcX8wDarRwy/ykr1x+B5WduZB/fHkIHXp9OzKy3vYd6EnNiY7wVk
 jYmXkJ8mg2saBK8GTkdDvSLu2pGDNAscnrv20F3SP8zl/H1U+bJX8+4D3twnLbVwX8JA
 dJeBGxxyhEQkbeFhrCfoawRKdk//MWOM15MWk3oTzLGCaymC3oNFQj4CwVXCrSRo9k7S
 OrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832949;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82h2vRR5TSHW1u0Jlt4giv+BcWArhc5iaQ4XkWCBX7g=;
 b=2FI50lV1ZnPWr0whL4EIfeyuXt8mD9RyGcmZPW/DUMtFO1rTj40vzhHtuGMHLHmnnz
 o6zVwy+QmaN40LB+0u0vdU9OI1XjuAJ8yL+jxONRO9grpZiuPIQwgre8y63qq0vkqGwe
 Dq1BEtKxv+P7BysJdFlxY45giennLAtk/XJ5BglZwviehevCimaEY6V/f6vcDq/uQLcb
 WExy9d3mALinS0X6mMbUn6OD+9lBG1Yw1HIVsAoMfsvw2zVrIQP1YwGX1/7qTx4CHQXy
 gRWuVUUXPtpT/7WZYCUL4lKqXFRD2cc1upYWrTc60CGpOgF8eOVpUK7YJDsAEvOGYBP6
 dcuw==
X-Gm-Message-State: AO0yUKXgykUIH+WNyUTcq5bhZAh50brdye7JJc/0N1vgArtj4ABwaSNE
 JgiHi4+1ac7/0RjMqbkKkV5w+g==
X-Google-Smtp-Source: AK7set+8Om/t/KPnpoGXM3eem1NSHfyvFzkxi8WyxVpX4Vu3HXvCoLIMpf7IYVLPGZAjCD+V8sPgQg==
X-Received: by 2002:a17:902:db02:b0:19c:bfe3:6f73 with SMTP id
 m2-20020a170902db0200b0019cbfe36f73mr3509935plx.16.1677832949204; 
 Fri, 03 Mar 2023 00:42:29 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 q15-20020a170902f78f00b001948ff5cc32sm952250pln.215.2023.03.03.00.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:28 -0800 (PST)
Subject: [PULL 54/59] target/riscv/csr.c: use env_archcpu() in ctr()
Date: Fri,  3 Mar 2023 00:37:35 -0800
Message-Id: <20230303083740.12817-55-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We don't need to use env_cpu() and CPUState().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230224174520.92490-2-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..d047d8b45c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -108,8 +108,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
-- 
2.39.2


