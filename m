Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C226C5A49
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf76d-0007FR-2a; Wed, 22 Mar 2023 18:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf76a-0007F2-34
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:38:52 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf763-0007mE-Bw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:38:51 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-17aaa51a911so20940695fac.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnZuvoOyH81mzIEVt1YEnFoKwxp+YLpZDq3yraeAc0A=;
 b=PvNcIysSHPBqfSF7uxK+27UCSBubTl2tEidE5l4rhlkfccDZZ8lq80eHm232h8Zcoo
 d/8GCkew5Xfkl1vZ4Bszx7U0BuOLAQdMRnfTN+sXUttj8mvr1BdZ7ZxdI6lyITIFKuTC
 D0Wg3uaJntwiaA90X8ar0RXSSrxw2Xno/Tuyc/qQMayKlr3dSmyf40UYECl5eOT0Td9l
 S52nGHWgidvE1L4BABgUMUUXfpMpEz2a4J+NNGlqYwYPWSqYkXADfrxwWHjXNj2coPq5
 B9UTyUnasp6xLZelT/xt96Gxi+EJ8079b/RU0qU4VSZZtZXHCm85mJFTj9UyV/qaIxk0
 Qd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnZuvoOyH81mzIEVt1YEnFoKwxp+YLpZDq3yraeAc0A=;
 b=ZAcerA3nDETLlsI6hzJdoTluT/iKXuOl7JxeQEt0ZmC8U9hsAP85X0T2oRnXbiKxra
 Txsej99HBtYcGqC5xDSpUIPB+sriOnRsZWey4MzM48KTxAzcnF/ICqjT2GYRcVk9cz+G
 c/dcumWWmkZJTTu4NMANBj+TQ4y1ZPhlt3X4UySusTpjwkFwzZs8wlwy3qr23axR0rdK
 /s8oPjYrvnfKBgzrDCkdclPJ0YDJK8QJX1ZoJalxvEtSrn4pfzplfUIvxBArKk1TRCKZ
 2uvetUJiiS9Uz1jHxzP2C4uIAxG693lkKRCcZEW4SbbYl59PXo5wAledpYZCaKEXcpH9
 +J/Q==
X-Gm-Message-State: AAQBX9c0I1OZNZg69o3fjvr6EjKiOf5tl6La4fwg9QPHFKzzUfnJNEoS
 iCh58f7RDatICp8aB+ezxftlKOu36wwSKtyoxjo=
X-Google-Smtp-Source: AK7set+zKHkfT9ug18RbxYw8swDozTHo4jTqzfDj45y8L/liTEYfefpST3bmZhAtrW1+BYNJzMjBgg==
X-Received: by 2002:a05:6870:e301:b0:17a:d06e:6bdc with SMTP id
 z1-20020a056870e30100b0017ad06e6bdcmr693287oad.25.1679523699702; 
 Wed, 22 Mar 2023 15:21:39 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 25/25] target/riscv: handle RVG updates in
 write_misa()
Date: Wed, 22 Mar 2023 19:20:04 -0300
Message-Id: <20230322222004.357013-26-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

RVG is enabled when IMAFD_Zicsr_Zifencei is also enabled. Change
write_misa() to enable IMAFD if G is being written in the CSR.

Likewise, RVG should be disabled if any of IMAFD got disabled during the
process. Clear RVG in this case.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 839862f1a8..1c0f438dfb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1381,6 +1381,14 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= RVE;
     }
 
+    if (val & RVG && !(env->misa_ext & RVG)) {
+        /*
+         * If the write wants to enable RVG, enable all its
+         * dependencies as well.
+         */
+        val |= RVI | RVM | RVA | RVF | RVD;
+    }
+
     /*
      * This flow is similar to what riscv_cpu_realize() does,
      * with the difference that we will update env->misa_ext
@@ -1396,6 +1404,12 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    if (!(val & RVI && val & RVM && val & RVA &&
+          val & RVF && val & RVD)) {
+        /* Disable RVG if any of its dependencies were disabled */
+        val &= ~RVG;
+    }
+
     riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
-- 
2.39.2


