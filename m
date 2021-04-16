Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FE362A69
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:37:24 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW9T-0004r3-BN
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdB-0005gg-GG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:05 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd9-0001eE-5s
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id p2so4545552pgh.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=RxYxRwwINCDWwbj/euXXFTmjR/uiBAP90lqdHqCSB+tydAcaQKht261yRa2AUio0/R
 r+yBfCJsxVuHXv1G1Uvyrk4+/+qvHoNZH5ggG03lLW0KfKe8n+1U6E4r+MmgEtOqHHtl
 Q+vL0fpC4zuaBm66kYaJXS3PyuM5FgGJAMoQyIx9h6Qr4MqnLyOgtfU+L6aOBGfVCHbX
 RjILcn1LwBBSb9DGbelxw25r1Jw9Rjucu+XPwddscCZ2WR6kndX5+NUnq0K684zk8oqc
 RvCLmK40lN60M7MD6zXg7gIp8fv79uqzy9Y5VfYf5cSZw2LXmm64CtpnQz2PTcVvzYwQ
 /XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=U2zNtzsn+VKhJ6TzTLaLwPFtjVGtqwozRmQ9xHXSfTaQRkFnj3gaQ1gWDe8k9g64mS
 PlYZOlr4mLiUa1VK/X3XTF6hI0CvhTcEOtJcsx3wr/+HQMgtGBAPCluXR8C4H+w43WgD
 1VmhKHe919/AJ8heG6Xt9jmjBih5UNbp7Sao962V0H7T6vcqdSNBzQq5M+tgAy9LCNTd
 nOPn+4BHc26o68A8fqeSaVnUgAoZBJDJz2xgHvHKRbqb4K3bVVanS4GFEJUwbBUE50nP
 u8OR+K51oe+muLmV7x07YcKRtnpR5iuII5koGEupvkONwt7X8ng1IlhRs08qVdffEZfh
 6dkw==
X-Gm-Message-State: AOAM533SaL2pRKyDiDu7JBMzegQgJajf9oybP48Q5uSOsAznB9pyPXAn
 N8D2MS/WYVySj4c9fW7lRvFHgc9cnvEJKg==
X-Google-Smtp-Source: ABdhPJzp3S8jY42LiDVT2JIMTOI5WU6Y+wMArxpw87lIdrjL7SJeVbguujwUbRV/n8tU2Wa9m/CHtg==
X-Received: by 2002:a05:6a00:24c3:b029:253:e598:2c62 with SMTP id
 d3-20020a056a0024c3b0290253e5982c62mr9686369pfv.30.1618607036385; 
 Fri, 16 Apr 2021 14:03:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 44/81] target/arm: Implement SVE2 scatter store insns
Date: Fri, 16 Apr 2021 14:02:03 -0700
Message-Id: <20210416210240.1591291-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index eea8b6f1d0..0356b6a124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6167,6 +6167,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1


