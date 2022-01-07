Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B2487058
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:26:23 +0100 (CET)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5exS-0007Jq-Cu
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:26:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dZ9-0001A7-Vg
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:57:12 -0500
Received: from [2607:f8b0:4864:20::334] (port=41928
 helo=mail-ot1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dZ8-0005Bc-Dc
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:57:11 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so4975913otl.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpFlMaPtAV8PGNPWTK3CGyRMHE5OZo4qgrPLCNS5aSY=;
 b=Bd3Id2FTZmvNrhQKKsOv3iKGi0M0u0uzkvPDrsjCFwBmtfMB7IIx58EECoWruYn02H
 80N8IMDIpm2OUWWt9PVPnrS/TwARNg21OEx9sdb1Rs1soO0/rgu1yCnEx7Bq5+Xv5Fva
 6BAmGGNjE/ZjauBEkZ8yYlBQdgAHeegWm9mqN/Qk9x1Yf7nOvP1dITxKWKrzgMPm0nhv
 ZsZv0aUipUbp873f0+tgHT9n1WuioyMaYhbBGjYzidvzgoFDSUzvB2mzeZwc2F9Lps5l
 Rw4EXQbcXOClJEyz8TPwMmxF/A9BwXZb5COYMPV03Bp/Ub8s3ShHIul1K2c1BY228jw5
 3A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpFlMaPtAV8PGNPWTK3CGyRMHE5OZo4qgrPLCNS5aSY=;
 b=Nav8h9jmwhFfbF8/78OzZZRxohWnjdc3uFEWb18sDfIgN918neDT2RqtHx93wHXvKM
 2INiYxkfBv+PdD9MQxRu/SZA5kdkCSKP7rDyWRqhPbBB/ytqltX/ZoIkSea4NKCB0P9M
 ZqbgG0ASpf6ULE1xzpKZJOE0uomsGm5SPx6FEzjhyopjQ/rKwvljoAw30O/N/YqwHPBj
 a+iRqNlKkW6hr53SrZVJEx27RCwdUWLlQySlZMaabuJFfZo95fDjSyq1GWubweqb2ycp
 qKVPgpeLjpAXboIUuC9NBUGUSqfyxn5HaddoaJKz41RQ353LjLiGj3D4AgbWzbmeljSm
 W99Q==
X-Gm-Message-State: AOAM531iEUScxKZdFxDhzi2i5ri8hh6I+QZGXBdIBRtq1cvnJIzzuOca
 viBOwDx7Job25cVmRS/8hP/g5IpneXny18D2
X-Google-Smtp-Source: ABdhPJxQJzdCzdsV4dCZO7PMRU7PzbgFtVdv4sSlejLbx1qOlWtQ6ME09XS3bRpJQvfc70omFuC63A==
X-Received: by 2002:a05:6820:556:: with SMTP id n22mr37704ooj.60.1641516567871; 
 Thu, 06 Jan 2022 16:49:27 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:27 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/11] target/riscv: Fix PMU CSR predicate function
Date: Thu,  6 Jan 2022 16:48:36 -0800
Message-Id: <20220107004846.378859-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::334
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:01 -0500
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5d5..53a621fdbaef 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -90,8 +90,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -117,8 +118,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.30.2


