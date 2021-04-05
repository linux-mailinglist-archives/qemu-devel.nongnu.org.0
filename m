Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39835432B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:08:44 +0200 (CEST)
Received: from localhost ([::1]:46656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQqI-0008WE-JP
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQOy-00085z-BQ
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:29 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQOu-000652-Dq
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:28 -0400
Received: by mail-pl1-x62f.google.com with SMTP id h8so5757060plt.7
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kPA2dY0kCBjioBoIDS+oak9/tGoYS6peLIn1K3t2p0=;
 b=ke5b9+6Itgq4i0fyQmaIgHoY9Ylq2dyXb06i+Yi4GJjx8ArZ0u45o8z80+Egm7nBNN
 uZL/yFEXbYOUowitRNHXMvl9q0nIRjm/iJPpCY4kBVloCsoAl/2IIm0f2D8ajBafoJva
 kSTDj7PJBJ774NwXhoTpONWZMpYR1V4Ados4E2PUkI2D/WgndLKV/8Mmpx86+HS50UeO
 K9K1GVxhaUPf6G2iwfcx/c6hwQOXjgf12algfRqmZmigosWGtNmUcfji8P7u9z8TekMy
 bqOwbfedZirpSIRyYe1+R0Ar/GoDIe2JJSOzusLmzcFKp11YfZ1wkRgb1jXRnq2G5ksn
 7fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kPA2dY0kCBjioBoIDS+oak9/tGoYS6peLIn1K3t2p0=;
 b=gKmmLFovP/QEgL5fIVKFw4OiqtIguG/yIv1Z6JjUtXbqdtDK1aj9RSh6yFHHmeGkiv
 N5nyCi1/bv2pSt66hHfgTI2hcTCFX7A9Jk1wAbyXxoGYyclu5UmmcOmAbIzq6L1XEO9J
 WmAMkF9uuepBIMf1bDIjTw7URYA62uR5QULnYlQRsvGUHfgvcmdr5pTRnmxt5fa//BAa
 zEZtqLbI7H1FbDbDRo9SphYVmCDgcXAYU9tDQcCHNFJ/UdTuDDtjMTSPfB68GosuXHDB
 kDF5sHSMipecR1RMCz3t/sbG0n/MgO194SGrZnKYFrjWPPptm2Dgd9Vkbw0HRnSj2hEP
 TH9g==
X-Gm-Message-State: AOAM533UZ01PPsjbgta399/+kNP0O0vkHNgVJ22Kr7Be/DYJynbyWUHu
 TXwAVlIRNZwgag8k6cMABz3ebRVEG0QrMA==
X-Google-Smtp-Source: ABdhPJyJ+YFK5O/pmrE0XwJkKyiUc6ghnk9gktZHoSsk84Ehuktzzem0ugZL7lh99zrON2aTVBjX7Q==
X-Received: by 2002:a17:90a:5106:: with SMTP id
 t6mr16528179pjh.177.1617633622317; 
 Mon, 05 Apr 2021 07:40:22 -0700 (PDT)
Received: from localhost.localdomain
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id q5sm15752999pfk.219.2021.04.05.07.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:40:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 1/2] tcg/mips: Fix SoftTLB comparison on mips backend
Date: Mon,  5 Apr 2021 07:40:16 -0700
Message-Id: <20210405144017.20193-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405144017.20193-1-richard.henderson@linaro.org>
References: <20210405144017.20193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kele Huang <kele.hwang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kele Huang <kele.hwang@gmail.com>

The addrl used to compare with SoftTLB entry should be sign-extended
in common case, and it will cause constant failing in SoftTLB
comparisons for the addrl whose address is over 0x80000000 on the
emulation of 32-bit guest on 64-bit host.

This is an important performance bug fix. Spec2000 gzip rate increase
from ~45 to ~140 on Loongson 3A4000 (MIPS compatible platform).

Signed-off-by: Kele Huang <kele.hwang@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210401100457.191458-1-kele.hwang@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


