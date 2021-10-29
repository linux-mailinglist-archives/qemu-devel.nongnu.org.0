Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0703343F968
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:09:12 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNst-0006GD-4e
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjr-0004XZ-9u
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:51 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjp-0004VH-SJ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso10082101pjc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLQVCed6ybkZddngnPVpusUEwjUjBPVUL9+pI0YvcSI=;
 b=RmbeF/kLRFaGrWE4zaf1BdgJsat036NzuaEUje276ouEzfNsTDpAwENHhfYL/so7k8
 FwArnU0MTqrLwfGXGmxU1fuvCt45qphSm7pcXUj1lYKu1noqDO1pv/vKgL7qVDqxWzJl
 PiSayk4s33XBjgBRtaJcPfgS6/Y8eazc3A8gKNPHK6YQ8z0rQ/o+g7iD6K6ECnrrC35m
 3MYXs0zjSz4hEBXPiIeha/f3MmPRGhdIA+PVBmuNa8rh5HH0oWaKyK6g9BXt/YnbBVz1
 oPxviUkULjVIAyluIOVGFYkpy4eICW6UuL23RWa3wwmUp6GNbTAiCHfbWyh1djOuaoCv
 v0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLQVCed6ybkZddngnPVpusUEwjUjBPVUL9+pI0YvcSI=;
 b=kcK14xZC1XAnJ53DZvlgNa38ySpfoGcFY+MTAA7dUMw5davvTrGea1F7HwpPJSHVlH
 IK9f7ZWzg3qTfmnOpeGDuIhH+w/+G8P3DRx6V0Mh/4WSr691VsY2zLAcdsSVGlmReGCP
 KiZKp3XAWjkjsY2oyLMrOhgL/QGgeqtcXG6vdjebM4EuWfF9u8iRqCUe6+Iuw3KnHXKm
 R15/6CyZqd7jHURYKCNxV1ElBdVRBW2F65TXq4R76wor3QAPyAHE4u3HbDNbZkBhIyTt
 twTIOMURHlxGwmpEUnjZG6XBS7MV3FEe/y4d3zqjq7quvEe8FV/TwlBR6tao3GQ63ibp
 xM8A==
X-Gm-Message-State: AOAM531+RjiRoM/GvUjrNyroq8xEyAjI3QiglXg0BBirz4QQOs8ev4oa
 KKqh49uWv5tcL2KFal0RJ0nLzF/+yt1Qacdi
X-Google-Smtp-Source: ABdhPJy7seAcDOpiwe1btZM2Rl3ZUv3IlA0o1oTyhQQJU/jE6Zb1k/SNWCONryFNbnLkEqUoHYPjfQ==
X-Received: by 2002:a17:90a:4e42:: with SMTP id
 t2mr10206934pjl.108.1635497988516; 
 Fri, 29 Oct 2021 01:59:48 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/76] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 29 Oct 2021 16:58:11 +0800
Message-Id: <20211029085922.255197-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 83f4dbd8241..bc149add6ce 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -643,7 +643,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_ext_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.25.1


