Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C231D3925F8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:16:15 +0200 (CEST)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7RO-0004Ex-Pg
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PR-0001Z1-C5
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:14 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PP-0007DF-Sz
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:13 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 29so2710284pgu.11
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UoxBYLGz1RPfPHU5SsrpnEXE2PmprFjabmvNHor6v/o=;
 b=OSsljFwqnG6yAYxRCl+xTx4bq6IqteVk7ygm0Ld1zhlngHNqUzq7GBVU9WbvyAUw3W
 e4XPzYGFEDlcTMz/0KvEVdRq20/AD6wt+SUUAcwt2H2WUl/o3+e7Cj+uAlKLGtL9FlII
 iOFZzuemVT78aExW+5LYpSBtKrC/iCFgkCO1bIDgE1/u2iH+0K8ICC154ycL/kFI0uE8
 pz75Ud6NNAxCQRQJtGKoCkUbQ/Bu2j8TICUYcqxLsLbQTY8lhzrEDRjS54Rmdp/BJjR+
 lTdNN0WC5JBjxN3CSDib7FSv0C8m/W5VQYpOfmDG56oikNmjRbDYRy8pMl1EfRz2XSXa
 +Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UoxBYLGz1RPfPHU5SsrpnEXE2PmprFjabmvNHor6v/o=;
 b=nITj/dgB0LhcYrbxgaY9FrDJsMm4cfqMqNU2dsUuw8b+MvAvsSR7m7KM/jl3pHQ5Fv
 7LBXAu5EBGFsR9FYmWnjBUEBXMkPd9FUGZg3q+075oGPnZ09LQIMYIsBqD3iWPtEgEOn
 h4nK51imbURDagm/b+DG3em5mCj+FvbWC1GSs3bl+Z+i9RJkhiMtro3qrfdxqOC73NEI
 dwDsNBGUVG3KVeMHhZl4SFHTW4Y/meZ11cpK13yzClput32y+0NShapOedL9+Lb9vhB1
 wpxzq+cB+dE41EHE3pFtGSYUaQsZyjUmjrriqpE5JuFFJxqkT5NHF/9wOYSmgglB7fA2
 yWUQ==
X-Gm-Message-State: AOAM530c1SOX3YHA/kacdbM7SkUYYmPpbUj1MVMWLCeltbBDYpbQ4Li0
 DaEuRjgHC5nOclP/JBvraNCu4eyWVW2ZOQ==
X-Google-Smtp-Source: ABdhPJzoHGPy+mM1vnfke5ie73IuFuG7XZuXZ+BzujqIDdKeaZT7eaDhor/LZP0dYZ+DSSPZkTxlAA==
X-Received: by 2002:a62:5846:0:b029:2e8:fde9:5c6d with SMTP id
 m67-20020a6258460000b02902e8fde95c6dmr1822074pfb.56.1622088850663; 
 Wed, 26 May 2021 21:14:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/rx: Use FloatRoundMode in helper_set_fpsw
Date: Wed, 26 May 2021 21:14:01 -0700
Message-Id: <20210527041405.391567-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the proper type for the roundmode array.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 2139def3b2..b1772e9538 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -120,7 +120,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
 
 void helper_set_fpsw(CPURXState *env, uint32_t val)
 {
-    static const int roundmode[] = {
+    static const FloatRoundMode roundmode[] = {
         float_round_nearest_even,
         float_round_to_zero,
         float_round_up,
-- 
2.25.1


