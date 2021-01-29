Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B69308E22
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:16:10 +0100 (CET)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aBe-0002uO-0w
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6I-0005wi-Mv
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:39 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6E-0007xy-AX
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:38 -0500
Received: by mail-pl1-x634.google.com with SMTP id d13so5901910plg.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/S1S8UJkodH9Fn5r/TRF3MeCOBnFTM9S6Ep0lCvcNE8=;
 b=lmnahPEpbzaF0Lxm2nODiz7kAFOgShnSJrpdSnsMxxZjEJ1fD65XXuczeCle7kQiPD
 I++sgoYpsXy5wv2wdCCBGvlQd+o8aW2lc5XL9HYb7L13EoiHBKeoFeg6UripcMntQ1PO
 bxRIjKmoXcM7i0PEfaLafOnTkVakwosFet1h6tQYZ5yGZTfv/DeXcBDarspKWfuS5okr
 QuFDBVMFZVtVn/4d/5Sh3v5l0JMmL9qw9555G+8pdBfvGSom6ttDVLPwE/EA3qeJBQZB
 jblDulD33TXg2UBxWJlUQue17OtDkxytZp5YBaArOcKvTEwNJmsERkAj5CBXdLZD8JDU
 UzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/S1S8UJkodH9Fn5r/TRF3MeCOBnFTM9S6Ep0lCvcNE8=;
 b=PslX7xtpIFvcR5fwCknlLNbMrthseapDbRW3mkycTL1u1K+VDsxFUMlc9yFl2dTLBb
 VLYf5vBTG7NEb9yxUXx0z2U+JBI2JcFduso3ggM6htmmnulgIq8xPYzXXi02b0bjKt3V
 2TkIR5DAHz5rpjRjnHBGH8uv9lGxGnPEbv2JkJngcKU/TZ9rZnCfXOLfdBG1rIUJoFkm
 mNSeA2CYEMcI52q/GUuQsVUiEdL1AaxiXKhFHhLz+Fo8IEMhCuLlA00QhkGY9bYVRci7
 /TJwbZNH6daFSzEqOsjdTrWY0xBJdDMOElPDpHkyzlRe924ok5kEy3tjEYK0dFbOhkYT
 T2kw==
X-Gm-Message-State: AOAM531rLAeYhjQoYR7+CWTbipKypbqOyfB0urDE37gVnf0pkQJ/hTsg
 BIFCw9B9e5EQvFuHdtwBMrAPD5TwSrX9VyOF
X-Google-Smtp-Source: ABdhPJwZxwYCnECxODTJ/9nuZCrNy5rV9eSgdYug31zBQrMyp1ZeoCWkILHsj+k2HTdFrdZXAJnPOw==
X-Received: by 2002:a17:90a:9414:: with SMTP id
 r20mr5803904pjo.222.1611951032965; 
 Fri, 29 Jan 2021 12:10:32 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/24] tcg/tci: Drop L and S constraints
Date: Fri, 29 Jan 2021 10:10:05 -1000
Message-Id: <20210129201028.787853-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129201028.787853-1-richard.henderson@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are identical to the 'r' constraint.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 15981265db..9c45f5f88f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -46,11 +46,11 @@
 # define R64    "r"
 #endif
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-# define L      "L", "L"
-# define S      "S", "S"
+# define L      "r", "r"
+# define S      "r", "r"
 #else
-# define L      "L"
-# define S      "S"
+# define L      "r"
+# define S      "r"
 #endif
 
 /* TODO: documentation. */
@@ -390,8 +390,6 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 {
     switch (*ct_str++) {
     case 'r':
-    case 'L':                   /* qemu_ld constraint */
-    case 'S':                   /* qemu_st constraint */
         ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
         break;
     default:
-- 
2.25.1


