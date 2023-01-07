Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B053660CDF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:58:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zS-0003iy-RL; Sat, 07 Jan 2023 02:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zG-0003eN-46
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:30 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zD-0004Ak-0q
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:29 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o13so210655pjg.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBOgYpv333T0kvWfOzK8OyO5m5CWQXdmtNLgnaS07y4=;
 b=ClToO4F7ifW59piIAoqyJyYoRLZtofH4nn2HzVniL54+8UBDHv4CKzXiDNTF/NOyb4
 PWGPqNPFyT0gFwmdlZJD7KdKRSJZzABhHFVP5z8tP3SrJ8xJp9gVPdEVIBXzjOdqbG3O
 grh6wbnv9MFfsxY8Vv5GHHdlV9E9L3LPCya9cDZUC9IVeq7hagBCwTaWDqIsrBKyLXKV
 7rhFsmOYiMIO6/jNtNnRJVclLSIPaXCMpsdBQDfIi/MWJwiH+qsm9r/uhdi6mkHgGFBw
 ghQO59C6knVlf4pJva+bOX+2sSL3O9f8MFNdtIjhEs9nOrJnQWHQJIpRcJsDQzHmLgRJ
 oQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBOgYpv333T0kvWfOzK8OyO5m5CWQXdmtNLgnaS07y4=;
 b=iI+VdpouoOvRwZBVqxiF2ZemcV2Lh0OdrPWw05EZ/xdXkylR7Duf2zCW23uzWT0efi
 iAynSg2+d4ZUClatEjPqqaZiutv0RA7jiZx/ha5+77zq1vusi07LTkuaotfBGLLBt+V3
 rdMGCQgdux0aySKTNF/xMapg7G3dNCgv1zkRyvJK37JuY1EndMbpj0WNcu5U5pB1y5G8
 5b8D6s344J7RCIIwbe+KCWoFQud/5WT2612HykqlBZ6Tr3oY8egNg3/j3M9i1Iz3O5UZ
 1wT/4JxpXW5ZBwHLrfIa8O7XC3ZU6ZXvp1SS9gjAw2WT8hnkg0sHuPeF2goVh8VcmyoL
 OQGg==
X-Gm-Message-State: AFqh2koLFeTf3syCRzYlCcnIken3BELshth5Jl1f7c416SqAKTZf3Uga
 lgCJP+YVm/iSCd7nhhGmg2NFX2OmLGEiD/v1
X-Google-Smtp-Source: AMrXdXvUaIkaHxyg+2oBjgQ51wEEYys4VL7MA73UShe7g70nBndIw866mq+Ll8t4wapqu7CIVgERqg==
X-Received: by 2002:a17:90b:2485:b0:226:b9ed:178c with SMTP id
 nt5-20020a17090b248500b00226b9ed178cmr11283046pjb.40.1673077883674; 
 Fri, 06 Jan 2023 23:51:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 04/27] tcg/s390x: Remove USE_LONG_BRANCHES
Date: Fri,  6 Jan 2023 23:50:55 -0800
Message-Id: <20230107075118.1814503-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The size of a compiled TB is limited by the uint16_t used by
gen_insn_end_off[] -- there is no need for a 32-bit branch.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2cdd0d7a92..dea889ffa1 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -33,11 +33,6 @@
 #include "../tcg-pool.c.inc"
 #include "elf.h"
 
-/* ??? The translation blocks produced by TCG are generally small enough to
-   be entirely reachable with a 16-bit displacement.  Leaving the option for
-   a 32-bit displacement here Just In Case.  */
-#define USE_LONG_BRANCHES 0
-
 #define TCG_CT_CONST_S16   0x100
 #define TCG_CT_CONST_S32   0x200
 #define TCG_CT_CONST_S33   0x400
@@ -1525,10 +1520,6 @@ static void tgen_branch(TCGContext *s, int cc, TCGLabel *l)
 {
     if (l->has_value) {
         tgen_gotoi(s, cc, l->u.value_ptr);
-    } else if (USE_LONG_BRANCHES) {
-        tcg_out16(s, RIL_BRCL | (cc << 4));
-        tcg_out_reloc(s, s->code_ptr, R_390_PC32DBL, l, 2);
-        s->code_ptr += 2;
     } else {
         tcg_out16(s, RI_BRC | (cc << 4));
         tcg_out_reloc(s, s->code_ptr, R_390_PC16DBL, l, 2);
-- 
2.34.1


