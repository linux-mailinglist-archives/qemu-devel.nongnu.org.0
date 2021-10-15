Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45042EAB2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:55:11 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI3a-0002t4-1e
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvj-0005Vt-SJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:03 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvh-000239-O1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:03 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m14so7672282pfc.9
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKDZvsFfrcqUaND6Ypeeqcrc1C7r0SxXNdTD0IBK5xY=;
 b=R4i/kexnRTU4oJR8z6r3I9hPIA5XGLVLaC1yvJXrFzGeXU+F3wzcrIJza5UR5Cgpp7
 uUa9gH9Y+j304wrVLiqQxoTPsP2FUEEuP8niiaPHECF0BOxgZasKR1bdJRHr9NZ4xYXg
 v7x5FVSACmue84SXt+D/5PLoqCZBRCBHEN+C/7GkAqoB/kWqEKdsos0KXPb7LqOHTudh
 OruysBw10ZH3ZadTMwmt1dxDasgAH/e8EQmndrs4+0hYjuV/OqBTbn5AO/jCfoJvGP1q
 7Kd/OynYS9D4zMXaaCTzGrABJqnVJGPgsRCs/z0AogxOmNmBGKgGW9LUBE0jzqW14uNN
 kYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKDZvsFfrcqUaND6Ypeeqcrc1C7r0SxXNdTD0IBK5xY=;
 b=aCQgrFClcSajH7wXAQWZofht6CBcqgHxZRtwyhdtpw2it2LRd3MkUwJZz/EjRjpBO+
 TTS9wnTwyr8GuUa0O0Yn3RzbTdVC9RSYwm8nGcEYTFrEUMqVCBbN7gcVjcZRHdJAXahL
 2u8ekz6rJEJ1WCB78ndLy6OcRaYjaC/o3C1+T3A7fSpLI8p5Ll5UGb8sOtSBqDazQhsi
 DO+2TjCM12NkasfncHjH6EovRxI866oxfZLCYstkAK2k2fuvSq6krEzt+leQ1J6wTuLq
 UevJSOCBq/AK2n81Sz4TDgo3tSrySxFM5lRn//W03kOXBqm4CPNt93hA8p0vzbnyMoIO
 mOtA==
X-Gm-Message-State: AOAM531utOgucQrkPDsjETndOdoODygh+mP5xEF3gwCxqZJzjZ5LUW3Z
 qGbY1fXcfnF/MHZkTg+OoabsI1Em04lts1KQ
X-Google-Smtp-Source: ABdhPJwvKOXmExC9jaNOU/G46qc7ONE1p4I97K+vB8f1lZqOJivnZpNEvhT5w2aJ333/VSLPQnRwEg==
X-Received: by 2002:a63:d354:: with SMTP id u20mr7814798pgi.382.1634284020226; 
 Fri, 15 Oct 2021 00:47:00 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:59 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 06/78] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 15 Oct 2021 15:45:07 +0800
Message-Id: <20211015074627.3957162-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
index d8a3010140e..2734c223369 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -610,7 +610,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.25.1


