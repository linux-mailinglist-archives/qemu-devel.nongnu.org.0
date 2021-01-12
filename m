Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B419A2F2C22
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:04:20 +0100 (CET)
Received: from localhost ([::1]:38090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGXD-0001HD-Lt
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAK-00034g-Dt
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:40 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAI-0007DO-SG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:40 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u4so1296617pjn.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oWqS09mobglarDIvNUpVzSMzAwW7kec1mgSd/2WbS6Y=;
 b=kttpHEH22kJucC7tEmba9LWaBPjcVe9AMA0rScyRGnVpqnVeCKFiQD1y8p3XrnYU8P
 UeEHSllzNOcPtvUS22M08iWPcVfDsYKgyNLDr+drH0ACDtO/LlvS9hS9EfOObxOzn6ux
 7A89YPHcCkRrDh11tVOM+hgHE2nQlVuJq8JdsnG7n7N4zGXD2pbjzS6eWdEWr3qT3Bad
 04WAtvJIzwrKp/yvNiMKFORg1DzWTnAQm1Lqt6WhY+ns3dXCZgHLqHShnbDHo8tsALPo
 YbHwNiQRQSS+4NLkZHwgMaPhOQTOMy/azgDY5LXbe0/2IsMOfXyvmQVgs7LWltaTPNEy
 BEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oWqS09mobglarDIvNUpVzSMzAwW7kec1mgSd/2WbS6Y=;
 b=CPEMPnxAVofN67JOE63HjWpjaUsp7RG04/A+EYOFAokd/Ohcutsk9vZ47yXaal8DRv
 fLz2L30URmgwtTSCz/7FvXTDw+OwuMPHrJqEih7kjR04Y2UawD6Wu7UFB9BMzQTy91Z5
 9fTgOnaKx6JbiTaThCzgB/GdyBQBhNjwHbP555qI3qcQTLA9Qv98QQabmRyHftwAtSrT
 5HDMqwizW20Vf6GdDrZXbfdi7cKcNmenhuSSvas4uHNueN+kvxBq2SNrZzT2tuPuh/Sr
 WuoktanwCjdaQJJCzI1JEjTom0L9+AyGxngXmgCc2WmuPXw4na9Ef0XGsmaXZ3OGA3XT
 MBhw==
X-Gm-Message-State: AOAM531PKDqo6MfElmUAmQNNcP7Vwu5n8xz4xZuR9zljj1yJADU/SypC
 F/Qo3LpDVek4P71zFfcFhDuNEyszZqJgyVLN
X-Google-Smtp-Source: ABdhPJxZppFelwXvnZW+y3FAF3oYKDSQrt3h1Hzz1QgZLyzr7ZLH1IvNj6YNug6mvdQ8xj8LpcfqJA==
X-Received: by 2002:a17:902:242:b029:dc:3baf:2033 with SMTP id
 60-20020a1709020242b02900dc3baf2033mr3964228plc.36.1610444437435; 
 Tue, 12 Jan 2021 01:40:37 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:36 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 10/72] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Tue, 12 Jan 2021 17:38:44 +0800
Message-Id: <20210112093950.17530-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7a6554447af..30f1593efb1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,6 +56,11 @@ static int fs(CPURISCVState *env, int csrno)
 static int vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return -1;
+        }
+#endif
         return 0;
     }
     return -1;
-- 
2.17.1


