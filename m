Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54613CC6A5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:27:42 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4smb-0001Ng-KH
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seD-0006wn-JQ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seB-000215-R1
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id d12so12638637pfj.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rIxiJifn9NWIyljY9ef9dZx7dheact/TSBWFFk89i0=;
 b=enfnnCQ4TTZh+RdkoRMsuDmhXjofSvfY6UiF9toAj7kCUjXzycufrQxAAjrm0IxuKl
 zy4C6gdfZNxBcl/SGtdUlG1TpDCaqmOmwCSBpzGkoBeMS2bpnOGEb2BumhzpsKr0E/t9
 8BVxle5l8NvtwU2hY5dVqgs8S5KvNmYo4TGGCyR+txrShd61Ph2hOaWjkehaxzMvHGjj
 cV8l7BWIZ0QdHKNEENugvpPlXNSCx+3K1mwqCWHbsAEtCgtqOLgPqE6MHQhNsBiv3x6N
 efoa6hbQCPaI+a/C+6S9G3wwBb/iZaqzY14d2lEKiKVMkIcEtJ7sDMbYSbqAGtdKtnhB
 CGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rIxiJifn9NWIyljY9ef9dZx7dheact/TSBWFFk89i0=;
 b=O30lNO2MATdQrXBf/RiGZKBQd3kWRKZJnkkbWNmFPMUNsR4gjaf7UTtDm/7OQWLeTS
 NySaQWZHfBmFi+nuI9p+wy8CqYcrxMy2oa3Ia1gGSmst4DA3CiVygvJeMQCNrWn6LpOm
 sXPRorejODo+lA8RML51yHEOR3TwUKbMMpIqhIr+pRtRun7zDLQWL5rK/atUHsaCX4sM
 fVnl+cjrB3iPNXjnYpPY8lLBctDJxpfQ4ZaFVUfiL404eLxClEbItsCTOFywuw6RxZXB
 uJ+dO3w4cQGfTuvHsox6fU9p7PrTTjJJ+LKIaiVsa1WUryQmKKGLCPzx/6fzCzgJ/hcR
 FjwQ==
X-Gm-Message-State: AOAM530XlrALFURa2SQl182c5O9VCbg9LuzLu+ZZ7UoWgtoBr/zdOrsT
 8M6eSai0yHifzoGr3d1zKoZI/hA0gK3vsQ==
X-Google-Smtp-Source: ABdhPJyoOw1zxT4sBsobYPVdgDy4+YBISReuD5CfHmgYJGNxSfRCw/IWyL2fygT57G9EU4uvDYHG0w==
X-Received: by 2002:a05:6a00:170b:b029:32a:3950:f51b with SMTP id
 h11-20020a056a00170bb029032a3950f51bmr17572277pfc.64.1626560338377; 
 Sat, 17 Jul 2021 15:18:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/13] target/mips: Reduce mips_tr_breakpoint_check pc
 advance to 2
Date: Sat, 17 Jul 2021 15:18:47 -0700
Message-Id: <20210717221851.2124573-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The actual number of bytes advanced need not be 100% exact,
but we should not cross a page when the insn would not.

If mips16 or mips32e are enabled, the minimum insn size is 2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index fd980ea966..ef00fbd2ac 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16192,7 +16192,7 @@ static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
      * properly cleared -- thus we increment the PC here so that
      * the logic setting tb->size below does the right thing.
      */
-    ctx->base.pc_next += 4;
+    ctx->base.pc_next += 2;
     return true;
 }
 
-- 
2.25.1


