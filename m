Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B535257D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 04:23:35 +0200 (CEST)
Received: from localhost ([::1]:52896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS9TC-0006xl-0z
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 22:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kele.hwang@gmail.com>)
 id 1lS9Rz-0006Xm-8O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 22:22:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kele.hwang@gmail.com>)
 id 1lS9Rx-0000q5-J5
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 22:22:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso3990169pji.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvQec1z6S6m+7LjrGHVyXY+YGifE0p2+6sqJ8u5R6UY=;
 b=UCTseUW9m+1Kl5zghZn4bXnT3xe8TM2vByEyt3VW0i4FcFzDm20C6NoRNSBzC63g2v
 KjVH/S2NBGjbbjCZlalDJWTJIDesigz4uKfIR8/H9q6+CCxMqlZFINQesjxrmtyDDsCt
 jmzN0kYdb8Teo/PFMspbrF+tzh0MEwbXw5zyz3guvpNPTuXhTU+dmUK25BMyNOHWq6yn
 2x6AUzQ55V2uDMfgdMz/PL8zh8gJob7DSxwiPaBMhMd+uaD7lcivlto2QaOqmcDqme0i
 o4fnlRoQ0UEdWPeNMTNa26j+HBeQVKC8sXWPrJ4eOEEskiwSvgJttWHMGIM35uUxbaeG
 2IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvQec1z6S6m+7LjrGHVyXY+YGifE0p2+6sqJ8u5R6UY=;
 b=pt1uGAwlnkOqsXuyTwXugNHPlPNU6pE7C1P6ZLdKdsTDeiiWXahfFQ9QcZsWGhfMbJ
 ByEU4wVtT2cNKhvfVtRpe530ozVjRCPyeFBvaIbB4Paf+RI2Tcqn+TER8ox7XO0sC19h
 Sh1KBlj9RPapW+6Vc7DqkWJNJc5i/zuViL3+4LqZoSpZdKbWDIqsiytdM5Yj34sA/AgR
 yrzPpzV05wvgaa7KkyHZlSyXYV/bZx7GzV7lCK7Y4ZdwLbkG3/67Oy+rn2loVDLDKOa7
 UxdQYdkUzfLv/aaA6u32NpM9OkLC5ZAo7kzE7jYsuUN0FmWLBB5SfDnhjrfGSwnYKp7w
 743Q==
X-Gm-Message-State: AOAM532qnIEsqn+1KuR7T+EX7CUn37LxaPQRKm2aigKOurK8qrbPbehY
 yjZybkcwer3hmhoyZeUVaaskuGtcC3EKl/dM/r8=
X-Google-Smtp-Source: ABdhPJx0LqBD9ZeO+cu3qGK3hIRk1n7KDmv1fuudZDGXwBjNy7RKHt67u4phU7Fi5s9UUOAcrgiVPw==
X-Received: by 2002:a17:90b:3553:: with SMTP id
 lt19mr11617613pjb.222.1617330135434; 
 Thu, 01 Apr 2021 19:22:15 -0700 (PDT)
Received: from rivalak.localdomain (69-131-184-203.on-nets.com.
 [203.184.131.69])
 by smtp.gmail.com with ESMTPSA id j92sm6504043pja.29.2021.04.01.19.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 19:22:15 -0700 (PDT)
From: Kele Huang <kele.hwang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [1/1] tcg/mips: Fix SoftTLB comparison on mips backend
Date: Fri,  2 Apr 2021 10:21:15 +0800
Message-Id: <20210402022115.207119-1-kele.hwang@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=kele.hwang@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Fuxin Zhang <fxzhang@ict.ac.cn>, Kele Huang <kele.hwang@gmail.com>,
 alistair.francis@wdc.com, j@getutm.app, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The addrl used to compare with SoftTLB entry should be sign-extended
in common case, and it will cause constant failing in SoftTLB
comparisons for the addrl whose address is over 0x80000000 on the
emulation of 32-bit guest on 64-bit host.

This is an important performance bug fix. Spec2000 gzip rate increase
from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).

Signed-off-by: Kele Huang <kele.hwang@gmail.com>
Signed-off-by: Fuxin Zhang <fxzhang@ict.ac.cn>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


