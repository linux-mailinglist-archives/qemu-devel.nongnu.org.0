Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63D46FC7E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:15:02 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvb3V-0000qK-TM
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamx-0003vs-Hq
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:55 -0500
Received: from [2607:f8b0:4864:20::42b] (port=41674
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamv-0006He-PD
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:55 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g19so7768401pfb.8
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RnqLoIMtIKL3HM6SV5JHjayAFC1Eh8hEupFhHM74x8=;
 b=fQndGaAONu2GFkykHlohkr/+pU+Nz8uEqjzQcun3iW9fyXpelumeCiovAdyLfHUHG1
 cNtTiGErjYpiPzf7uowh6lJSNSXArijD/h2rVlP1VWSv/Wv+iVt1b8J0XlvGuPrDuwGZ
 +iWdrej0XEBzPH+PXjFfrDh0PLh2vPZeyM+7GHb9pz9c3NhmlJInWPjRpidXn4vmlQWJ
 b/MUF4fTeDhM+vSRKNcAH1PLqgjeelz20QUBAbZ/r143nYvQXAMp/AhvYvjwxSvK5a/E
 WOPqgSe0zv4GNpCbt01jTKXedwngNMo5DphRp0HzjbakO//ljExmd/B2OZNJ/93RMc9O
 0Fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RnqLoIMtIKL3HM6SV5JHjayAFC1Eh8hEupFhHM74x8=;
 b=GenhqxLZk9RJOpOFRPkJ4d8NakzjX0leoR2BnwY/dRFcyG3ZlIiDeJi/IwHYTUOlql
 UAaZb5CzT6XJj8Yk+iQXCMuZYUGKvsOD0HmrrR0nfrcs3wcQD9grqe1XWtmS7WDEglEU
 g8F5bTMWpmIBbjjt2LHII3EqpVdr7zVOMOqE221QkXF1igAGjlAG9l4ATtOqRZ8P0rNv
 rBzrfQMoeKEPht+w0w1TU+gCddGVDo0vw7lDoLWRyOXByzE+XdufNQdq2RmwtuS0IyIY
 M1Yti+eaUzSrjOAnpJpZOP6tZwqweKIrnsGIQo3fRqreV2DTaqFJzMsJfP9e0/w57B/X
 CK5w==
X-Gm-Message-State: AOAM533fgLxAf8Wu+H/9L4poaWro/5bKEWJU3bJACay4YeGSuEYL+J/m
 rNlbOXjCWCA+xzI1HXsVB184Kr2wIqg4iZrF
X-Google-Smtp-Source: ABdhPJyv2vI7fq97JrtejJk6Kr9wyOMdY7PSu0JYq4Ib+d4qADEDXMHjedJlsYZ01hOGeTmTdabKAw==
X-Received: by 2002:a65:6895:: with SMTP id e21mr2634253pgt.546.1639123072377; 
 Thu, 09 Dec 2021 23:57:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 11/77] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 10 Dec 2021 15:55:57 +0800
Message-Id: <20211210075704.23951-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5d1eec1ea0..3dfbc17738 100644
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
2.31.1


