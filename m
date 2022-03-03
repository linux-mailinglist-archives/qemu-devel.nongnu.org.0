Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749784CC595
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:04:49 +0100 (CET)
Received: from localhost ([::1]:58766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqkq-0007cB-CU
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbH-0007Na-Pn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:55 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=36772
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbF-0001nJ-Rp
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:55 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso6817786ooi.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVrxFJG9XKBpol7NLsKIXCTAGZL6CqEwO0MNz8y3nng=;
 b=QEklmtMv+4cB1kAvuhgrcvidwEgXat61HJnbb0BrBo5wPe75J/7Uw4b7FtTI188tG4
 2m7HwTW1Du2gDwzLqdB4Y3EPa1UP/LlJ9MiqBunEYcFp9fH4lyDZ4lMQDce4yRIoo/Jj
 y3AkXx3sz/4wrltjlF2f8/KSrKjA0U08kpEc9VJqAwj4STKs5JNx5SdxUnIyWvcHq0Lt
 UyFVPQq8qY1kpp/n4x50Ty81Ur7GT0ANuSBXjNqD3YAODjuFmij55fWTHBuXcpBde7pa
 fYT9t1JAFdA3/IR+ebIEtk5wRWLvQaWBJ2X6KW5cATlHbDPQjUFNHqLY+Qx5QwKHlTcf
 x4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVrxFJG9XKBpol7NLsKIXCTAGZL6CqEwO0MNz8y3nng=;
 b=CmAXhszu+q915wPj03NPy3ji4nOf6WMOebLvf2PjdWWPJPlXTNHxQBEQTyF+no0rlt
 J4pN9yTI1Lp8eB3jNIPOat6wZpqtKSbvXqwYrsfDwZG9aowtg1Cf1yMXOeVpQUqYtQwk
 UwnZov9MrJzt67B4HemlSS1EQ6orspbv1ftOiXQXabsZIHyF8vMFSPCSsuN6wsK5vctt
 dkLm+fsfdV/19hGWbnauINtJu4x9276DF55P2ecL7zBXvTj2+gqr8qgLWurwsiPfvdv/
 JNTGnqptafjebQWk9xP4ajr/bQ+uYvb80Gmon0kScUkivxPz4JgXJl7VYOQJUtCwKxuf
 ki+w==
X-Gm-Message-State: AOAM533zov3j4FlEdL6WT3XrS/d8nvRZJQKNV5DLB4GCV4xMHuGHMeyw
 VFWslDzj50NciDIFKdyzKCsjmUlVCosQZQ==
X-Google-Smtp-Source: ABdhPJwX2p++7KN9Jh5qD18EABRv9cstK+nZAkqt9XUBrBQR4F1MTefloBnmu/XXe3OThltTHUoQTg==
X-Received: by 2002:a05:6870:6394:b0:d6:e1a0:22c5 with SMTP id
 t20-20020a056870639400b000d6e1a022c5mr5082494oap.138.1646333692560; 
 Thu, 03 Mar 2022 10:54:52 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] target/riscv: Add the privileged spec version 1.12.0
Date: Thu,  3 Mar 2022 10:54:36 -0800
Message-Id: <20220303185440.512391-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2d.google.com
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
index cf748102efa2..7f67e920c650 100644
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


