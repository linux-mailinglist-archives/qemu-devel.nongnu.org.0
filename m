Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C063C59FD98
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 16:55:27 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQrmv-00033u-5I
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 10:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1oQrlO-0001Sh-R5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:53:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1oQrlN-0000eV-5R
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 10:53:50 -0400
Received: by mail-pj1-x102e.google.com with SMTP id e19so16101173pju.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=M2tMOjf9fYxP60myD7cKw9cbjZ/hZ5WuCLYTWrIXiTQ=;
 b=TNUDbl5cG7xsW9OrxigTy2+DESzgn0NX6U7MrHpxbqdNH8V9POPgTBoBOolWzuW65l
 oqImS2HogwUktSjVW7ovBtpye2up3yofj+Qk78NJCqvqctXvIgLFMwx8YPWENFTBGE46
 5iH7aXuFAScTlRf9S3kr8gG2JU5JfA08uMf4BSOeBcQneKE6Fe+BtwzBMgZhmt6zm/PU
 OwztWNgII4gVzPesuO6btqgK8GAya9alN2SvCo7BgJIjzZPhCwZc+1dNGKSdiXSR5jUJ
 Qlz51DE69ikq0TFaLiw4DKEtshyxblU+Wx2wVUy2sJSoIj7qB8JfdqOGxYvDeZo890Qi
 ving==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=M2tMOjf9fYxP60myD7cKw9cbjZ/hZ5WuCLYTWrIXiTQ=;
 b=yybXtA2XaTSirsanXBT6o2ZzzJrXipMLdDSDsn5qMW56Z8txGqkKznPcRYjdlRAEGl
 BGLrLyX4i082osbArUp9lAaxEBjuQQf6zTpD6JOckFI2Z3xpKGpCN/Pvvxq4bQ66mllS
 18pnzOb3ClXqG1IcOskQNTsriF9GyhxYEmcgv5X/qk1QNhiRf8ot6pVmVSS6NPdpl+7T
 OF3q4mwBkFSri7PS3qqDe+tEtaUc5RoODRhbN07exPocbS7g4FcjvkLEPL/9pgfP7SDy
 0+djj23735JrtS9gTqNNETM/0mTI1H66cCCfyJ06CtwS+yaCU+sKGaEGiKjARXPe2ENc
 AbZg==
X-Gm-Message-State: ACgBeo2feb3vxgFtsEuKiSnZEk9YP6wTdoIPEk7QrdUCB3Nife/vF/2t
 W01IyvQIxIxMkCMz/L653iYrdA==
X-Google-Smtp-Source: AA6agR49bIU/Uf+PsYoPR3qamaTgkGgKyAr2Qg1uyJaPFSzI6WcOmkDXL2D6uvW43yBS5IwSNCbcQg==
X-Received: by 2002:a17:90b:3d92:b0:1fb:3854:69d2 with SMTP id
 pq18-20020a17090b3d9200b001fb385469d2mr8617637pjb.26.1661352827579; 
 Wed, 24 Aug 2022 07:53:47 -0700 (PDT)
Received: from rpathak-ThinkPad-T490..
 ([2405:201:1010:106f:bcaf:cdc5:62f3:5cf1])
 by smtp.googlemail.com with ESMTPSA id
 k9-20020a654349000000b0041c45d76b6bsm11215897pgq.38.2022.08.24.07.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 07:53:47 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: rpathak@ventanamicro.com, rpathakmailbox@gmail.com,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH] target/riscv: Remove sideleg and sedeleg
Date: Wed, 24 Aug 2022 20:22:55 +0530
Message-Id: <20220824145255.400040-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sideleg and sedeleg csrs are not part of riscv isa spec
anymore, these csrs were part of N extension which
is removed from the riscv isa specification.

These commits removed all traces of these csrs from
riscv spec (https://github.com/riscv/riscv-isa-manual) -

commit f8d27f805b65 ("Remove or downgrade more references to N extension (#674)")
commit b6cade07034d ("Remove N extension chapter for now")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 disas/riscv.c           | 2 --
 target/riscv/cpu_bits.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7af6afc8fa..a709d66167 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1304,8 +1304,6 @@ static const char *csr_name(int csrno)
     case 0x0043: return "utval";
     case 0x0044: return "uip";
     case 0x0100: return "sstatus";
-    case 0x0102: return "sedeleg";
-    case 0x0103: return "sideleg";
     case 0x0104: return "sie";
     case 0x0105: return "stvec";
     case 0x0106: return "scounteren";
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6be5a9e9f0..7251121218 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -190,8 +190,6 @@
 
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
-#define CSR_SEDELEG         0x102
-#define CSR_SIDELEG         0x103
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
-- 
2.34.1


