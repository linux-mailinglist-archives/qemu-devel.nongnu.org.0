Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0F351306
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:06:52 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuDz-0004eZ-M6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kele.hwang@gmail.com>)
 id 1lRuCY-0003ky-DU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:05:22 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kele.hwang@gmail.com>)
 id 1lRuCO-0006cn-2u
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:05:20 -0400
Received: by mail-pf1-x434.google.com with SMTP id g15so1132348pfq.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE9vmTkvemDce9OT5Iafy9bqxX3TVnqZSIyzewkIYdY=;
 b=SBL+s5lA1ZBCAfo3TsG3LKuAIvnpb5NSoNsmJm+77u4kTdtTklW4K88wHViRtdEpt6
 v1AGDS/bQm44pyd3IhiMiSN1EcTyJiX9rwwyXFs+DSF8Jz8zh1EfY+FzTeJh62JfZ4vM
 XFCECCcXRccJ4/Ubdz2XEV/w9QXMyDlCacDvYmVXujfqEe3FoN8SSOdOxBUVcN2ktTtf
 Y1ZYxA5TfN/OJErXLdJrAJRJZEd8xYehAKS8F90Vu6CUSXMTJzxLvM6g/mxgXY3t0kEI
 tAXNP2GU9ZXWZNJUAfMHGYmfpR7HGlD2eGrTSP1CkdXOH0ZCAQA1X8gVy/P5eoD4fPEa
 /E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE9vmTkvemDce9OT5Iafy9bqxX3TVnqZSIyzewkIYdY=;
 b=NWXIlFo35wx5H4xhwu3HuXVHJShiFk8pNvrNpftDuWKAPSqFwktlc57sx+IxNczejj
 wxVAlMJ8kyHplXmuPS5ujxd9Y5rCYdpFc5CXAPZSZ/J2kTNnBwL5HyHb/jDpUmpe9+ky
 EFxrfLhEWbv89oER7/0Fl4N9ofB/jTx6OT+wdXcRLCp9V9IoP3qdzCrIupgWnOaKXnRB
 x9u7uZ0KhnMERj/jP3BKewmyqrRyxz0s7V9rBGObLkjKDyd0a2OCQh7VLtM5EJ+y21el
 sQza8rz6enM+3xhD6DpPJvE/PYbkdCWntCDmF5G17zDWSKQer5tU/6uspqR2T+jbRB4L
 cq/Q==
X-Gm-Message-State: AOAM531o4SAxoKa18XSfxljd/bR1yAPTlrGW6f02CqqUf6mM/uHlKV62
 giLhfXH0umowtW0ZCVCPm0Q5GsvDnokvgdob
X-Google-Smtp-Source: ABdhPJyhFSsn1Uv4bdAEW9O+sWZbA8itKog7IR1OUFM+zN7fh53rOCU2iLuYcspWod5VFgQsWrvKHw==
X-Received: by 2002:a63:5626:: with SMTP id k38mr7076116pgb.128.1617271508471; 
 Thu, 01 Apr 2021 03:05:08 -0700 (PDT)
Received: from rivalak.localdomain (69-131-184-203.on-nets.com.
 [203.184.131.69])
 by smtp.gmail.com with ESMTPSA id 12sm5021401pgw.18.2021.04.01.03.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:05:07 -0700 (PDT)
From: Kele Huang <kele.hwang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [1/1] tcg/mips: Fix SoftTLB comparison on mips backend
Date: Thu,  1 Apr 2021 18:04:57 +0800
Message-Id: <20210401100457.191458-1-kele.hwang@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=kele.hwang@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Kele Huang <kele.hwang@gmail.com>, f4bug@amsat.org, alistair.francis@wdc.com,
 j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The addrl used to compare with SoftTLB entry should be sign-extended
in common case, and it will cause constant failing in SoftTLB
comparisons for the addrl whose address is over 0x80000000 on the
emulation of 32-bit guest on 64-bit host.

This is an important performance bug fix. Spec2000 gzip rate increase
from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).

Signed-off-by: Kele Huang <kele.hwang@gmail.com>
---
 tcg/mips/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 8738a3a581..8b16726242 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1201,13 +1201,13 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
            load the tlb addend for the fast path.  */
         tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
     }
-    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
 
     /* Zero extend a 32-bit guest address for a 64-bit host. */
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, base, addrl);
         addrl = base;
     }
+    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
 
     label_ptr[0] = s->code_ptr;
     tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
-- 
2.30.0


