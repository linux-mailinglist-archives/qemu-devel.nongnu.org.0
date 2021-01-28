Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662BC307184
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:33:35 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52kA-0006NP-E2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aj-0005hO-JI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:49 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ag-0005fL-Pv
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id md11so3436588pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFXwe7/lgpsoi7BHwGAB+iNJY2cLRCPx5UvuWr2ycbA=;
 b=oI7GU2WD09wGZp5KsTGlEmfTIkWmUvF7ec4tfPDEGVopw4IZCPVlpjpALNS10YnqOT
 zLn3gP5omBzXEK61v+EKs/fZHKIpuckkG81bshFADaDYaHKDzlls3TXIJD5SZ3p0ZIXE
 QDMd7vDztat+djebQxGTbIg8/vNr0ueIkepEKAL0pXimOrENaFS3er/w67qJWYO29uYk
 vzl+Cb6lCuFbueMggGjaX6HE24coddsUoD0JViyvHFqZyA4EIk94ih5WMp+eQN8gjJ/J
 cjyW14fwa32bbT4QUYMaCmAGo3m1ILmWF79oiAquiVs8Opm68XdP/SGrUcNF5jcwSg+q
 OKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFXwe7/lgpsoi7BHwGAB+iNJY2cLRCPx5UvuWr2ycbA=;
 b=eerHC/7+s2wodbWU2AcwCqiRVqYHf5xq6soWv2ND01bipPH+lLZ2ybbI+1F/IK2GDf
 2JGRRuZDa3L3MO7YlwmARAqfOJXjfoinJHVTzbZCZ4xB8YMRW6lPMOliKd/VImERwBGf
 5hd2qaT3WS+MpFTDHUAv4DsEw/SXFhPAcuCsUFaP5keBbIHOIeeq6mCA0ZvRmGD878p1
 KyxwJeddSDFj0Q1mZ/bvMwxp3P5oQ7qinLHk+evvu9xIJCjhMTEvKu1q2ZvMo+hxStCM
 aVkhBcqI8mr//EXebLYOvMZmUHq33/VIN9vCZxcLYvecw3BtmyPJwMBvW2OmgAPnmKxz
 STEQ==
X-Gm-Message-State: AOAM532S6u+xAuYYyo1e2YAnQ81DWbRHcqP62+92YmB6LxWTfixJV6kB
 eZjSUBrmWf8oZ/fEdky+xqt+Avu57JKLvMnx
X-Google-Smtp-Source: ABdhPJz+rEoJjR/hM9FqvouZF8+lU4b2ATmTREvfzY50sY2jRZJOjrxMdNtKSc3JWhfA/VUEny+6mg==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr10050218pjc.143.1611822225630; 
 Thu, 28 Jan 2021 00:23:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/23] tcg/tci: Inline tci_write_reg32s into the only caller
Date: Wed, 27 Jan 2021 22:23:14 -1000
Message-Id: <20210128082331.196801-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 0e1b8e8383..438d712ea8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -115,14 +115,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
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
@@ -906,7 +898,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


