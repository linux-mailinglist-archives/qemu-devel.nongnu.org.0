Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CF31F6ED
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:00:20 +0100 (CET)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2aB-0003a9-Ax
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lD2Z6-00036b-L8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:59:12 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lD2Z4-0005br-B2
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:59:11 -0500
Received: by mail-pg1-x529.google.com with SMTP id t11so3607563pgu.8
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1qn/T4gGXzb6f/oBNB+E/djMv7xY9YArB3S4guVTFRQ=;
 b=nMx+OASce6UprHCsjGygsDirKCIinXSBU8EsL/fSdbu3Ti5Q1yEu9wOvZdsQHlQeE2
 tDTBF3SDlpnRFMtqL85TogimGXSmX3cfx00hU/lrKraQC9gwuVMfQSaAGHbl233Syt/9
 Vj1QLm2vpkppeQSZdrhw1M1H2JTW86plw6ppzl1QzmTgNcSGIp6dndhbm16mhWWAY2X8
 Nog+PTir/pNCK9kSzAjEDYltVzV/C68UWAntyIZlsrdhrXY1ObSaHqu1rTtzCcrPBJI0
 OMXVFvImlk0oU6khkEUFMTLg3ybSI7fIO2vUuTPegcfTtaBBgEpiNbA8t3vP7x9OIx4R
 nbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1qn/T4gGXzb6f/oBNB+E/djMv7xY9YArB3S4guVTFRQ=;
 b=fUPG6dC7Zsr9NvglNhCOnzMXxlbIgF3MMA3CczcDiAigAh5XEbypkv6AxHsPvCCmhA
 M7aNJ8+FoID36F2+XcF14C8C94CP6cnW+uk1I6Zh8dDkiZMk0BFoDcbtVzLidB7Ul9+c
 YvdJa6trBZnLQyRjUfGHvzGS0uk+nh2mheTTXHkiMXLHhxYnMPNoq+NU7E1OObNTnoDU
 yWRD0t7jDQMrqD7ti64toLtUci6ex3OV7x/eWt8oodjHQ54JTWWqSge6OzKLMAqrPRJ2
 auI6hBuUwdbTy0U5XSnk8DhrN7CfyI8l2UXlogjOzQsVCN1MJiacFjRgzYUStIlyi6F6
 dzZw==
X-Gm-Message-State: AOAM532dJWOm7Y0oUofyLXbSvGoxe5idFBMo3Z1mwA24kdJxWgXdFX4r
 11suM259DAVRExd7Siu7KuFb1Se8w4MLEQ==
X-Google-Smtp-Source: ABdhPJxPoPiXdsbCL1PfEzQy/ZpxflD/FuRHoICW92n3MAxukh0u7Pj/PBL5OBKMSWp/ZmhgC9zifQ==
X-Received: by 2002:a62:7cd7:0:b029:1d5:727a:8fec with SMTP id
 x206-20020a627cd70000b02901d5727a8fecmr8506077pfc.15.1613728748338; 
 Fri, 19 Feb 2021 01:59:08 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f23sm1658873pfa.5.2021.02.19.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 01:59:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: fix TB_FLAGS bits overlapping bug for rvv/rvh
Date: Fri, 19 Feb 2021 17:59:00 +0800
Message-Id: <20210219095902.3602-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb4..1b49eb9950b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,12 +379,13 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+/* Skip mem_idx bits */
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, HLSX, 10, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
-- 
2.17.1


