Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B432F2B88
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:43:39 +0100 (CET)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGDB-0004wt-Ub
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAC-0002l5-LT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:32 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGA2-0006xA-1A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id cq1so1065763pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hQEmfK2mjoKViE0Mico8qOyhYGfBsHKCdOM7kVbAmdE=;
 b=V5HynIdAOWAdRkelQHEIXCd0q+u7BjUdCQMEVyVAcElNneDgg4cRjbwEEQIhuq+mZG
 QaCynKSPLhKAnk7WwWNiFqGjR5N6TKzFbhXHVvKxh+jNDvU804g1ul+5w1bgLkdegSY4
 KowsEl4omZQAI876wNYul5KV+u5AqZz1ZsGHFTP6kcuiu+WOt4Kc5b9b9lLenrwvakv1
 NICWdP/C1P1iN17shCphej63fpbW/QN1eZwwihMr7F8lWln/z5+Jmp4dBHK86B4RP1Td
 c2hIS4bg6195R1hkcHbipwkJjc83VFZ8esCy7wHufzq1xcTsDntrx8ljuopz7DCnMU2Q
 oHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hQEmfK2mjoKViE0Mico8qOyhYGfBsHKCdOM7kVbAmdE=;
 b=QA3IlCRar0u5RUF4k0HdZHhw8omewLibBlMXoKMetKSDsOasUybKkug/7NsPIXGX82
 DDSI9gQUdUAkanszuD7Hc9OsQfgkNYJ7fP+5vevxwSJGSjEkMoJ/lvYT2xPHpiW84eTF
 veMU0BVRnd8sUd+2bSzbvoldsQDhglHN1fANSe+HSpVabL3rvlETEaNj6P55kRX3S3Ms
 qnzhsbGr6Zc+/GrveFUoHlGlIc0A/rB1MFcnjgNApRWGwOy0rwm0Zgj1xOgrnIMX6Y2G
 ectzbHXy24vCLobI5nXbaPpidciySK4oaWNqZ5xgseYrRP/wEUJhsadoR4KSYKsr0Kmz
 DJZQ==
X-Gm-Message-State: AOAM531kmvs89VthKauMALidlV6DwqoFTfhZWgAB61OKbCM+tWzf4xoM
 OmdNl2JRvnKH9nQTeIs+sjceOkOlg5hSB5r0
X-Google-Smtp-Source: ABdhPJzls1Wvm6loxQNLGah9NnMA0q1wm22aiuWHZ9o1m8TpBcd2PCG2OOD3dj7kEi9aE5UK26Tv4w==
X-Received: by 2002:a17:90b:346:: with SMTP id
 fh6mr3643596pjb.225.1610444417653; 
 Tue, 12 Jan 2021 01:40:17 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:17 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 05/72] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Tue, 12 Jan 2021 17:38:39 +0800
Message-Id: <20210112093950.17530-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a70a78386da..c8b1e4954ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -579,7 +579,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


