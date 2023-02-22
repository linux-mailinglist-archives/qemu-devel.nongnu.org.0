Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4F69FB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuEF-0007Af-1w; Wed, 22 Feb 2023 13:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE7-00079o-Oz
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:52:29 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuE6-0004LN-6W
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 13:52:27 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 l13-20020a0568301d6d00b0068f24f576c5so1675022oti.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvvhFufYKaxYrfOxF5GlRHGMfqK+pFBiVwcRuEAhcPI=;
 b=lNM4ZWhvCG6bS8HQ54ocfKa490tMQstmpHVIU0E9zijywVlLIiCxAg/FEYXp7t4H0/
 ER04PZkpbQwNXEk+/1TJe1iiAbFRi2jAe+gHkrzna9m8u7dc93gKo4JQ23xnrWvZ+/sG
 rYva6WLVM/3jKqfTDoeJuF2T7XXguGN0MmDCnkGWeRkf6r6q36Qq/BGIzBhHwziAjtHf
 rqKU9kBZzoTSdzzJ0hCiqmkH7sFR7gCvRovkvjdttp8mUGdMUZqoEHp0EwOTG4ky2fDI
 6pL/xNhkx0vErlQlvkXelijrp0MB0uXBcnNlMRWpoDRjZL9t4IRsJo4AYZvevG6N81jp
 8Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zvvhFufYKaxYrfOxF5GlRHGMfqK+pFBiVwcRuEAhcPI=;
 b=TbMHnBOO+slPlmyOtk6TSbwkJe2/NISKmPXrdiaRlaXI9Ljq53x8xc49djeHnVbBlg
 dwx/Xj2RJs2+3tppcULK7C1oo660MhwE69heiGMZZBq0xOwavlZJ6ppbBxl/fNIOpI+p
 4jtbLwWNTxVKxqP1EfFpog5kaDuYQb2lyMzRYs98+TiWXpnBSDAOebBNj/0nsVXpcKQB
 RmGzXjsX8/Mj2cZAZduZl99jOuZN5mF4K6y/4tlHPEoi821qwAvdWh1nFhjBL14XwnpL
 QAqV5BNKLpM9jNWdOIFYizVnv/Qso1A2lqgNPlcuaTIYUB8E06SbcVWH5WJIq28OMZSv
 rq2A==
X-Gm-Message-State: AO0yUKVqV0teHH4izdBTiB+JlO6cc3Z8wMxdmTGPntnwwXfwjMzBvLHI
 b+HBtDCccIJkMsghW9XeBcuNtiLHnPgwR1CU
X-Google-Smtp-Source: AK7set8wL5d+kOjymM4LgkwHIvlrSH849ezofvRzyEyEwC46GMc6RZcCwoAGmfROJ3ueH3Mr/uy2CQ==
X-Received: by 2002:a05:6830:3101:b0:688:56f8:bacc with SMTP id
 b1-20020a056830310100b0068856f8baccmr456016ots.0.1677091944567; 
 Wed, 22 Feb 2023 10:52:24 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:24 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 02/10] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
Date: Wed, 22 Feb 2023 15:51:57 -0300
Message-Id: <20230222185205.355361-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/csr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..e149b453da 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1356,9 +1356,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     /* Mask extensions that are not supported by this hart */
     val &= env->misa_ext_mask;
 
-    /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
-
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
         val &= ~RVD;
-- 
2.39.2


