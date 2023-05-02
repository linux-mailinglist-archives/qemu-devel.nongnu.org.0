Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42C6F4807
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYw-0002pJ-RE; Tue, 02 May 2023 12:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0002mJ-Ps
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYi-0000hx-1b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so563865f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043734; x=1685635734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQVUDi+CRoMJva8bEs9dFGVpgdctxMJkq0XbdWl/CUI=;
 b=Wr1dAyA4sF7zOtrSFgw9dni8vfD3k/2XJAzS233hheofcgvas/9t3YP7KGj+FMygTt
 d2qRJ8dJ9pCeQ23gxkTWPoZ43iDNf5hKjZpG16RvmyLRpFWV7v+gJQQsqIuKlkWBKCUU
 NtMLYkjreoX6Rd5BbmZQwtxgn2Wi9ojpDvN4/P215XjwDir2jx6ZLkUF65AzjQaW3sN9
 NZr+kwqp/LapoNWrglxKk1Ipr/di+gci1KvY8W6yfeoIeDn0oyDJEzlk9OzvWLQriDNY
 QWYugxcte88QYx2GFhXEUMZkOJBTIqfgrc4PNcILTmlyfIYLQUiYKasuRUsUBdXPYjMj
 L+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043734; x=1685635734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQVUDi+CRoMJva8bEs9dFGVpgdctxMJkq0XbdWl/CUI=;
 b=N9vpCYgnn0Fi1QWiKHPaa2CjgKYDfOBPcNU1+loAHFrpfEJwe6ukDzXNnBCR14p1Mq
 rQ4Bjw4CTh4mPyr3/VbwKkMI1gsclW/ryqtBwm2ejvZByI1jIA2sXUFO3BAy4VaAfus6
 1aT+2BER2fKeOQmeBgJ8PdFq7vPTuqeov4x7twpZ2WZlSc2MRzsOe0L6bTYZFb8LLFON
 BNennoX4paZqNPD+Gyfi/RNgRLmNSgITAen4FzaCub1g7VTR7Lj9jP0MXugKubUfYUvf
 CyORJYvh59wMxoLu/ziKa9qwXMsbfGhMHD3FuCLcB1BKvWGg0PSRSprbsHcd3UJKAdfO
 ENOw==
X-Gm-Message-State: AC+VfDxLllNP6AyyN0+9g/QjYfMn2T5XDn5xa8KSvny/U+YohPT0ZVsZ
 yaS2WsZ5gSr7/nRffJ8LO0jpRtw2qTwUuv14EaMdWQ==
X-Google-Smtp-Source: ACHHUZ7eOCviVnlVWEs9ysV410GGXqil8CThK93Q/JXNYwWoC3L6VKBKFMQHVLQB3w4hK2kORnt4FA==
X-Received: by 2002:a5d:4e41:0:b0:306:2db9:a33a with SMTP id
 r1-20020a5d4e41000000b003062db9a33amr4766736wrt.33.1683043734464; 
 Tue, 02 May 2023 09:08:54 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/16] target/nios2: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:40 +0100
Message-Id: <20230502160846.1289975-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In gen_ldx/gen_stx, the only two locations for memory operations,
mark the operation as either aligned (softmmu) or unaligned
(user-only, as if emulated by the kernel).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/nios2-softmmu.mak |  1 -
 target/nios2/translate.c          | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 5823fc02c8..c99ae3777e 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=nios2
-TARGET_ALIGNED_ONLY=y
 TARGET_NEED_FDT=y
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6610e22236..a548e16ed5 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -298,6 +298,11 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv data = dest_gpr(dc, instr.b);
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
+#ifdef CONFIG_USER_ONLY
+    flags |= MO_UNALN;
+#else
+    flags |= MO_ALIGN;
+#endif
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
 }
 
@@ -309,6 +314,11 @@ static void gen_stx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
+#ifdef CONFIG_USER_ONLY
+    flags |= MO_UNALN;
+#else
+    flags |= MO_ALIGN;
+#endif
     tcg_gen_qemu_st_tl(val, addr, dc->mem_idx, flags);
 }
 
-- 
2.34.1


