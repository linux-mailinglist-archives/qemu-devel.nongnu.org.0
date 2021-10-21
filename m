Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341B4367FF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:36:52 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdb3j-0000Fm-4Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxf-0001Sr-6u
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:30:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxc-0007iG-NY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:30:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id c29so1144014pfp.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBfQIN6Ydfkt3PTgqXoo621RfqewfUyk3imuXZV2vN8=;
 b=ZtbQC5aPeSgYZ5+lqjRI2bKnmkUcBc7Rcabp1NgEGZxFZ/lZtRYqhNJppkvrW2AmD/
 ZcfPRUKhl50faOTCCK/FlJQMlHW96VrzeFWUKRf/X/qBeqEac4ziOgyRK10EdLNqII2c
 V4MHr9u8bLUNTH6trgxo77Z/1JkObSwc9BTuJvb0VqFd4yqSkd0ZZ4XqTJ1WanKT9LpE
 /sXiu8huY2xQptIvydeD0/5mfX/QBdifC3zMBJ6mTXmRDyAnXmwj3FKsmzweRX48hNWN
 ZvK2raTw2Gp6nnmZEojrjdv5KavM/XA60pKt2+Ka2D7Ps6Xvkh1R82kH0iJ/4UXsnw4G
 3JbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBfQIN6Ydfkt3PTgqXoo621RfqewfUyk3imuXZV2vN8=;
 b=jx1cs3DiKamnjK6t4WFmv+4bl28ty8fWl3WRUTSnuKfgjAZleJav4OJHPGY1fXiG4n
 Pp+uIwdwf6va37Mlgw0DGs6X+WkaxTJVua1qohok7Q+403/svYiepxVlLe9/asINeUWT
 f5vIe8sex5Nne/59OUtJTz6PlnjQFpDFCJJUqCW2Mk4KDGznfktWBPRo67Pdn2PN272p
 qGiCqPjqDyTCer/ubm1qjhefZ/kYLzkB+nywL3CIi1tNvMmQ7fSvrS0buCiwDVEaBADg
 Y5/JUWUj5iJ0PiKql4mTveIZlSUFOSdrMOQPsWlX7/w2nJHQMSDChpcGDYvcYPxJT/vo
 Sm1w==
X-Gm-Message-State: AOAM531R26m4/vN3yUYymzYzSkUnPxzRfjyMstdbxQzInZ5BeyAffpF5
 U+vw23ZvdQuHtcHIQrQAqmgyZQ==
X-Google-Smtp-Source: ABdhPJxbpFFpEAWlzzUveIeh8kLn8P+5pFFs5KdUl19TWJK142JhQLjQCwszzdkKmqJNcRhPiaUvYQ==
X-Received: by 2002:a05:6a00:1901:b0:44b:e041:f07f with SMTP id
 y1-20020a056a00190100b0044be041f07fmr6520700pfi.52.1634833830910; 
 Thu, 21 Oct 2021 09:30:30 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Subject: [PATCH v5 8/8] target/riscv: zfh: add Zfhmin cpu property
Date: Fri, 22 Oct 2021 00:29:54 +0800
Message-Id: <20211021162956.2772656-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1b3a7784b06..e6e3ef183ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -618,6 +618,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.25.1


