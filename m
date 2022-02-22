Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910454C046A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:15:18 +0100 (CET)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdRF-0004KV-BO
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:15:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJa-0005lj-2K
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:22 -0500
Received: from [2607:f8b0:4864:20::c34] (port=40725
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005Lk-2f
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:21 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so19641916ooi.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0fDRU9fUV36kn4c3Xnw7jDoaNqJ76Gr20/A1kgalcYo=;
 b=dsa03m3hZRLah1dzxEvl17QOvRfgGEydYfVu3pZjcMShMYygQOVtPNFU1+6FxLKRHA
 ILFQqGzWbbaBx8dwOj/I558xAhWzszLg46B3e/6EWOBEe2NAnyPhW8KqdaugFHtdLbt6
 fD/+6cHcgazUdQLWkxw7Gr75lO2CHDLFoY7UyGzk02QRE9MwupQbQWQ3eJlWadqeJ+GU
 7a0GCLmHbcJ3WvGdu//kfPo8VvTyQaixdyyOCAbHK1bDVPGrmavsUIPeD1PspXhgLx22
 I0/fZbudiOCrnxYDjbFo2EXfzsZtaj+TwtyzH3aUwovfAgP6SKfcYnEppAhYD4dZW2jZ
 lc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fDRU9fUV36kn4c3Xnw7jDoaNqJ76Gr20/A1kgalcYo=;
 b=M8gfV5tZStNun72RSP/Wq6seWC5uABUleI1rwaOITZEWViEwTTjPeEZc9MklJ5L3FV
 BkunshB2YvmGyzx4DahydSyNzUNXoagYNd8bvqDZ2hwhpvfsoGN4v5eqtKTuBr+zRdmw
 MAA6XBi+HnI2s/lkY1c+rnFPrFYv/tNKfHngfRksXQfyQu1yvRaHVAn37A8j5NarUtxN
 Rdu00DKrIlSXqRqeIK5TCBT9z+Q75A4EnqDnplM638Gr5yojJZV5OLVTtCe0ikb8zWaF
 sBLD5JuYHZ9qZXEe9Wl9rODIc7E4zvaK8DZEQC71WMKBqHusqFWV1y9Xxv1Fl9YzB+9D
 A39g==
X-Gm-Message-State: AOAM530gu9H+QRrZalOmjaxAM1liQSvzS1D9CwGddVi1DS2CyMqJauLW
 Abe9kxSV0K6P+RpmekrnEbSO1/ACdH6V+Q==
X-Google-Smtp-Source: ABdhPJwbR/XWxaGT4SN+/Nj4k0PFHF1hJUrmVuV8OBwj49r1BkU/F406ib1zgoUoGNiHekLIBU5Hdw==
X-Received: by 2002:a05:6870:da0b:b0:d2:c66b:2e27 with SMTP id
 go11-20020a056870da0b00b000d2c66b2e27mr2757157oab.142.1645567630974; 
 Tue, 22 Feb 2022 14:07:10 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Tue, 22 Feb 2022 14:07:00 -0800
Message-Id: <20220222220704.2294924-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the definition for ratified privileged specification version v1.12

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5ff4c134c86..60b847141db2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,6 +86,7 @@ enum {
 enum {
     PRIV_VERSION_1_10_0 = 0,
     PRIV_VERSION_1_11_0,
+    PRIV_VERSION_1_12_0,
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
-- 
2.30.2


