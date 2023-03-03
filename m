Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9C6A92EC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zH-000873-5U; Fri, 03 Mar 2023 03:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zE-00085K-6y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:56 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zC-0007t6-J0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:55 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y2so1790957pjg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832914;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0kfUACxjxhg5dNp8nYzlobKUc0cuKo9GjRqKYGyZNk=;
 b=qLTOQKQYbXOcZgLF2RjarNO5V1E7u0nQhyOS8r7PN5ur3XOMHWLoyxrlY9fOs6c+1M
 HUfq1FBbqeeht1fn1GcBOCGkKNIn+IZgXDTN7wPi82gLypgMGKSQ4NMqSxEv7eb0UfnY
 mf/p57VEO2ooc8Amz+8rHU5+E+SK8fU4StiMITl5hmAghiaK2WsNqfe8HcKlpJ4ucsQ8
 Ie4xkg4T/eNhfh43o4HBEsw0IjixW/o4zBCpTm0fSiQtd676EB4sQiFc7arlPOZJXjrR
 1bkfTQfZIcA/E3NR13WbgNEgJFJb4PBvKjgQekDK/dVD3vw33SV6GunLouz2iL/4xMNU
 gs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832914;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0kfUACxjxhg5dNp8nYzlobKUc0cuKo9GjRqKYGyZNk=;
 b=xCAy/MOhdNYi7kRA+/2URGc+tFK4HepnHSawVet49pxcPuA8CPl6+dtcoedOeTp+VF
 T33njFJfnUVglAa1JP+wKS3z7hnGItp9mSRODsqOXwaKoA/TBy4lDjheJOtRp/8NxOwg
 aKf5fAEVzQmTc+hr8fGZsfja+pzaO4n5n42PLZChsWuQlq6RNh328t2g2VY21CsZvSTQ
 Y6cEBToRIDojxTgruS407AE4rU+DGlfQZhB3PjoGyxrEfPKYVcZEBHxojFKn3eZpdVKt
 euvjQBFNHuSAMdslTcp1lA19Sn/YqAFdBRxZ5gVrVkz2zU6LCWlepiHUN4+m0ypTKnZ/
 G8Bw==
X-Gm-Message-State: AO0yUKXDBQAyj/lm3ysJiSssHmzxNS+GMf+P/2X7uQJNeu4Qzo+NzIA/
 BWPv5rs623u9CwamGilj72KWYg==
X-Google-Smtp-Source: AK7set/Fah9yVJBmS8pR/H3Z8db1xc51j259sv5z+8u0syJy9iZa5dQPUK9zpjxMD2gUappwRlw1qA==
X-Received: by 2002:a17:902:cec6:b0:196:8292:e879 with SMTP id
 d6-20020a170902cec600b001968292e879mr1629021plg.1.1677832913753; 
 Fri, 03 Mar 2023 00:41:53 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ka14-20020a170903334e00b0019ccded6a46sm963721plb.228.2023.03.03.00.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:53 -0800 (PST)
Subject: [PULL 26/59] target/riscv: Add some comments to clarify the priority
 policy of riscv_csrrw_check()
Date: Fri,  3 Mar 2023 00:37:07 -0800
Message-Id: <20230303083740.12817-27-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
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

From: Bin Meng <bmeng@tinylab.org>

The priority policy of riscv_csrrw_check() was once adjusted in
commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
whose commit message says the CSR existence check should come before
the access control check, but the code changes did not agree with
the commit message, that the predicate() check actually came after
the read / write check.

In fact this was intentional. Add some comments there so that people
won't bother trying to change it without a solid reason.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-3-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 75a540bfcb..4cc2c6370f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3776,11 +3776,12 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
     int read_only = get_field(csrno, 0xC00) == 3;
     int csr_min_priv = csr_ops[csrno].min_priv_ver;
 
-    /* ensure the CSR extension is enabled. */
+    /* ensure the CSR extension is enabled */
     if (!cpu->cfg.ext_icsr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* privileged spec version check */
     if (env->priv_ver < csr_min_priv) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
@@ -3790,10 +3791,18 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /* read / write check */
     if (write_mask && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    /*
+     * The predicate() not only does existence check but also does some
+     * access control check which triggers for example virtual instruction
+     * exception in some cases. When writing read-only CSRs in those cases
+     * illegal instruction exception should be triggered instead of virtual
+     * instruction exception. Hence this comes after the read / write check.
+     */
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
-- 
2.39.2


