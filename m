Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21173493E0E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:13:42 +0100 (CET)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADae-0008DS-P6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:13:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACr0-0005qo-Te
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:31 -0500
Received: from [2607:f8b0:4864:20::429] (port=39791
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACqz-0000GS-4y
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:30 -0500
Received: by mail-pf1-x429.google.com with SMTP id c66so1466639pfc.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvWkyzVYHiRbO4j7VKj2/lyHZVfm1IW86yV/EqrLJwk=;
 b=VJeoYKGi47pi6vU7jHg2DI9H/jio9H8E2XENw4XCxfXSw3Sjb8CfEpwLUfoNd39DY4
 etAPdIsWA6yb3z6SB0CErpGLOEuA+s0yZtPgMRY5yDzC6o7vwPXPbGEljTAuivLnrBve
 8n1lxDWVG1OQ7noeCuHI4biHw3IqM50XbO+51zrM/SPZyqZJB8N94U5OULChLqfNBDEB
 5bd0w27l1jEyw3Qsf67xoZAsjxV67cvHbvdz27KUNQNqKqAVEI3jwpAncDTqx1GtlYC5
 NTPn2R0qlDQzKY1+pnylXgOUbtfgNzyAclx4TBwN4G28Y6ogzMBpUr6CaYrxGqmoNDtJ
 4ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvWkyzVYHiRbO4j7VKj2/lyHZVfm1IW86yV/EqrLJwk=;
 b=QRqU+ZBrsw7zghBpWzMAmiAg9se4KyINyK8esVW6Qzp9tycSKqbP3bUGYT2+x2suQP
 npNE1h+XJ299OOczuSnXhg/u/Al+iek+Rshy8UpigF65TY8tsaibnvE5OEJ0/A0kWMLS
 KSu7bp0Ao2ZtGwmt2QO8HrAKPjEFEQCSbBD2on+LgSHWOtUr0ShSCUeFId+KV/peCoIN
 B8dSOoA6j5D0BiiQ5dk6dsrO4FErhqH94ofTHMn8HyRHv+AWvJ7JLOjUDjKckeOtHpDI
 w/1XfpCEWyA0KDmMeI6w+A1QSZYfZFl0G+vKzZOcjxocveqyiaqO5/ujt0pw6J81SmCa
 9frw==
X-Gm-Message-State: AOAM533Ozvs3DEH0rVlFD07Z9207YUiAq1zndFPco2Zvye9CJJPHmPkH
 bPFB7bI8IrRnVqNWCXWkiB1eMw==
X-Google-Smtp-Source: ABdhPJyNFmfh/yquFa6NigcGmPKx7hWh/gwlFkXenV5QfZvUlbBM4fl+s3GomJqIfq4Xqu9qM/mofQ==
X-Received: by 2002:a62:1c12:0:b0:4bc:6d81:b402 with SMTP id
 c18-20020a621c12000000b004bc6d81b402mr31076739pfc.40.1642605987895; 
 Wed, 19 Jan 2022 07:26:27 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:26 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 01/23] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Wed, 19 Jan 2022 20:55:52 +0530
Message-Id: <20220119152614.27548-2-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a9e7ac903b..f7f178b63b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -186,7 +186,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


