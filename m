Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF766A92DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0yw-0007F2-Gf; Fri, 03 Mar 2023 03:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yk-0006es-Sh
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:26 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yi-0007lv-8z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:26 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a2so1994407plm.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832883;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSXQ1gv8F6gBWFEiNu0PyJfk2U181G5/O9/ILiiVGXY=;
 b=EHgivzUCJHpMIL1y3nJBd/u3gFrhIlr7Rvu4b/1bteOrBNQZl06WiZJaECFZF1gKJ8
 BJr6UZd56OV+vznQ6lVp6crcH554X6ToFvcoKBrV+KV0h/B9JacfSV5ZwCilvBMMcTJM
 mqrhFRLY5UZtwB7T/a1EnDWQyx48NdnjQoHhK1tgfhvUwgeK1AQGjHne1UhzjN+r0bTm
 liL05Qn7GQAV9VTwLXVzjtFNFetzFREPTO1KqxkrHjQ2YfxwVTtv8KiKbzY8mstmKEoM
 P4pf2fmL8v0XaIzfe9zuu19iwogc0AQFm9LgHIgDYoaJAnO9U75cA3lU5K+Cz8xPVNNu
 H5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832883;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSXQ1gv8F6gBWFEiNu0PyJfk2U181G5/O9/ILiiVGXY=;
 b=RU9w31oQOs/bdDoKsosALaPVYx46v/i+kJXInLCJ14cxZ+cCeEOPaj49DH6t78g60J
 jcqgKqUBZnLg/nAmcuXlI8MJPt9w+fPsdmWgVWDlTewMW0bDoEvz+6DndDubWjraVw9L
 L0O7a4lg2T+Lms3ljfdLqtGj5zHlgoShWykGgrBshNo56Il9kSs/4A9bOWYJIyAG+Uh1
 3es0WiNlXKsUGgOWFbGRsJXtopoosrJnc6IO6hPBhoGr7NbakepK4OmGDIWAFfLL1l20
 pWD4elqxnuPMKloKCmmmSgRNkVawnU9f69pUreIK22j9vvyYogtgVCTr2RY8tRHVITkO
 q0DQ==
X-Gm-Message-State: AO0yUKWKBxH39LbcVZ50KC6MgKtBmzpSbahT83L4qc63WFWlzg346TAG
 +pa7/camcSFbY9zSHt8IiPB7nA==
X-Google-Smtp-Source: AK7set+tyRsSDYvzg9KmsebpvTOdoyIZEXWpWREFcI/gAiuO+4wOu2fNV1p5qUxZJ7VLNcDacaTQHA==
X-Received: by 2002:a17:902:e842:b0:19a:b4a9:9ddb with SMTP id
 t2-20020a170902e84200b0019ab4a99ddbmr1481757plg.49.1677832882946; 
 Fri, 03 Mar 2023 00:41:22 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kq14-20020a170903284e00b0019cf747253csm974701plb.87.2023.03.03.00.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:22 -0800 (PST)
Subject: [PULL 02/59] target/riscv: do not mask unsupported QEMU extensions in
 write_misa()
Date: Fri,  3 Mar 2023 00:36:43 -0800
Message-Id: <20230303083740.12817-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
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

The masking done using env->misa_ext_mask already filters any extension
that QEMU doesn't support. If the hart supports the extension then QEMU
supports it as well.

If the masking done by env->misa_ext_mask is somehow letting unsupported
QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230222185205.355361-3-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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


