Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1995930E9C2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:58:39 +0100 (CET)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tuo-0001z8-2l
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti9-0004cf-ED
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:35 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti7-0003bR-8Z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:33 -0500
Received: by mail-pf1-x435.google.com with SMTP id i63so1067624pfg.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tquh43lruzGWRcmOiBMYX1Wiqh+FHEpp7zn+YOCAYms=;
 b=Q7YCG5gBBR5dAENACZmZOp7ONIuHDlbayAnxtx6eFqMp9PaKBu+A9BpZuWWD4tm5Xk
 6Oesllt3amJOwSlKjvXYL8mGBv/rKLqW/M12ovQxJ8dVtmwPCBqVzbDBet95y3t1i0mT
 wgW9QDIfAYPZI9pODbb/WPo1B5A3m900957ncFYf7a5+M7/tR6MCv7pmyMswuGzpI2V3
 NwO4HLimCcKZ5ofNGmol34hNiv/nHtKxNvesjWylOm2zyIjQda/imjtDnNEWkyXcoMC0
 e658QHjiPlBBrTLQiwaRe704aNr/7n9VJ+oqEcXARSalP3TaqU/6xzpa+t2mJx931NZO
 T73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tquh43lruzGWRcmOiBMYX1Wiqh+FHEpp7zn+YOCAYms=;
 b=VkLJetjMdO4+upL8F0pA79jrB/WDwTvRBxt/xfr4Z16EkuI43TdbhvmRKgXNuw9irB
 ArBuWuNSFAn4ebq+Te1Q6kJ+PVBgPVrlOIk85gY1lr5/TG6gLXu2jaZ5TlKsg5eIjcDM
 xKGgWyx5cBMMb1i4vz2AlOZmUdJ1kw0hnnwb3VE70zLKeV6sz9bRIkgpK4xvhqWvA2T1
 nUqtXNKRNH5A4zZgYaeq3FAlG6V0zlCBSy0GdWqlmB0w0X/FUNZNgR0cv261aphUWzVp
 ES81TeaOy8e0vrc3cOLznUduZI+FuK6jyjq/11I5/FE81CktyKwaPp+ZdXhBCX7xz0jf
 rIAA==
X-Gm-Message-State: AOAM533QDbyk+ZXKhIrzLobxczlqjLAMzu/4hko9kJWKHR2pVzljzvZr
 4ntB7/35HN5orP8GYCrHCaI1e5s+b4qxz2x3
X-Google-Smtp-Source: ABdhPJzboqZX7rjxAy8bprtsZWdo0ibjYYxnLODfTTVe9JX6wsqjprlcKcbm9txLeIPf9PAN7oDuJw==
X-Received: by 2002:aa7:8bc3:0:b029:1ba:7a2:7720 with SMTP id
 s3-20020aa78bc30000b02901ba07a27720mr5798186pfd.3.1612403129958; 
 Wed, 03 Feb 2021 17:45:29 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/93] tcg/tci: Inline tci_write_reg32s into the only caller
Date: Wed,  3 Feb 2021 15:43:44 -1000
Message-Id: <20210204014509.882821-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c3a8511dfe..e8023b5384 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,14 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg32s(tcg_target_ulong *regs, TCGReg index, int32_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-#endif
-
 static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
 {
     tci_write_reg(regs, index, value);
@@ -907,7 +899,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32s(regs, t0, *(int32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(int32_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


