Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC1D460D0B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:12:25 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrX5c-0007vX-Mq
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyF-0000wT-D2
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:47 -0500
Received: from [2607:f8b0:4864:20::1029] (port=46998
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWyB-0008Rt-PB
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:47 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so12797993pjb.5
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=QSfMjLEpFRBFnPMQ9wI+OJa4zR78buU2t6HVbxDogG9rnOpUh9Gf7ZrYadL6P9JJTO
 H43+hTOkdqRP/4HqB4I3h9riHZAiZwP31yyNuJBTUqBALSfJd87tkwcAStrQH2G8FpeH
 PULieiSWBtmWRM+EF2O8GstKPGkHdaO607l8XnMvLvjTXpROcA50NEdKzTsGTQsUPNVy
 2NefnBr//IZ1Ot2Qd9O72DRyQVhuZHrof9l5AgjOzDiIM+3UR7a+Mb5CnaNTVg0qfm/q
 y4KzdT2X1h7kYEmEc4FOg8STTLJDEXvpZsbpcpgSLHqKDqXvS9zT/pNwr6FmGCaoMKV2
 8eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jJrA47L2UCydyypiiwSu2A5lwraazj94d2ktAj6bj/Y=;
 b=u2m0npLqyJn3KMkM4YlPBDhsv0sXhCy5DT6IJ1TavmPsLDwHCNEtd+8ZxKFbdj9NT3
 6Uk0/esWbexQHkCSlVoCjTUmUHPEy+JsgG86bsjV399IO5+Lr5jogOpszvEg7UbJQ4av
 50mHm5MhQz0GZZp9OqGPnwmUDEmfOkD4e7pmlUUfsrVlhG+9muaFpd6a6yj+wEF9uTlD
 E0jngc0ma9oC+pVIzeoZX5xh5G5rqrshMftNj+Yum7+BOQ/bC8awD+Nel/S3N7VNInDf
 GPFpNEKeQlJzxyDUyZoBY73BXp6Fq9V/GFM8HIzxbq09UAQ4bz+QjONwRC3sfgmLboFb
 3jxA==
X-Gm-Message-State: AOAM530Cbs2F8C0jJ4hO6qFGGxZpX8EPOq6gEhnN7sl0XSZrQwpYinOe
 OjTQVlo/qUjbqyC6YlfCfDtrxiQnDoG3Rz7P
X-Google-Smtp-Source: ABdhPJzO2VWp/D+Xeh172RuQqAPSRuGicnWTpblaxUlZtuOvIG+UVnTAz0P1OJvKleh3Hxu5JlIHeg==
X-Received: by 2002:a17:90a:af97:: with SMTP id
 w23mr34846866pjq.128.1638155072382; 
 Sun, 28 Nov 2021 19:04:32 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:32 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 11/77] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Mon, 29 Nov 2021 11:02:31 +0800
Message-Id: <20211129030340.429689-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea05..3dfbc177381 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa_ext & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.25.1


