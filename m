Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51646EC500
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:45:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoxk-0005oK-G9; Mon, 24 Apr 2023 01:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox3-0005Ij-MR
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqown-0004Ee-R9
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so2409700f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUxjn8m10fBk8f3TxtdoxukkDWbqJjziW6krAeWvMi0=;
 b=GbNGFaxW0qBKRrcFsI99gICoCIObEvTA/N6Z0GhHXiLFdq5EhV6QOLgapVD+8gWKYX
 vd+7BPcKsD2L3sak9T2wB3MWoMNjqNCsCdWrH8tnnXbyZalawADaxvIcz/6GMQur9Krw
 7sNB6GJCatjyN54U55VK344k24nO80u6NscLRvL7VmlftVotrk33utNtqRoFDwuM0caI
 2YIxlpWZzfI1M705+/SzJm+y3LgiV5qCBKv5K9tT9DTamMdg81gIeK2XUgYxykqL53LQ
 24Df6j+1ley5sfSfp57+QlSetzKnz8QXWMd8mdH+snxvVn/Lwc1T7ymTeThokTHJWTzD
 oPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314868; x=1684906868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUxjn8m10fBk8f3TxtdoxukkDWbqJjziW6krAeWvMi0=;
 b=ddqtCtBVGtPNSv+ckCp+6fkPKDgeQ47XcZuL0zaBxUTIbAYSJs9eBjQnWVjp2haJp9
 w6j2NIqCVztehYx3rx7QNu91+z1+eJvlFpBQAFgUvjUrsyCD3imgjwHE8ywTmgSxDG0k
 R9vXMIquEYFo7Rm/gCBAn+mZ9IpPUo9Rho0kmoAlp+n/NgdxletYV9+ryY22Rg2JwCd/
 RISsPOsXEuzn/BihRPULcBOK5/4TRevIbNsMGohZWuefIlQAEQ9qO0IwGx9npyqCJmQi
 W40SAopxtO6NZp4KjLp65QCb2aSsjj+2Z/55f1uAQyyjwzRGOJS1goh1Ye/SAL3KAJuX
 AyoQ==
X-Gm-Message-State: AAQBX9cXdv6rWi/4OZ11Ao1p+INOU06kl4NGiEFz7NdqKeHuPfauuj4L
 05b03JKeU7qvQfOSL/Am6954SYNg1DPDGT3lMzA4MA==
X-Google-Smtp-Source: AKy350ZR8jdXSz2UK+NeDe+WuhGMQOgGi+jRMXzhCaNoziGhYYk712ZVjf2xP4yFP38b2JLFCbBktw==
X-Received: by 2002:a05:6000:8e:b0:304:6d32:d589 with SMTP id
 m14-20020a056000008e00b003046d32d589mr3425375wrx.18.1682314868201; 
 Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 03/57] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Mon, 24 Apr 2023 06:40:11 +0100
Message-Id: <20230424054105.1579315-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c8e2bf537f..ce87f8fbc9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1314,7 +1314,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg dest, TCGReg src)
-- 
2.34.1


