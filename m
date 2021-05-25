Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB43905DB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:49:20 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZJ1-0006UP-Gi
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbv-00047o-Cf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbi-0004dz-Nq
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:47 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so10383928wmq.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EnO0itZYbrbxESWmgSmA77c4wZXV2dVMYZGqAqxlr+A=;
 b=NLzzn6C8MvegL77ggb+863qVxkfBJzxXnxQMjZqldKGyS+r8l214A1/B3lZZHpCWTR
 RtxinCfxuoOavu/KmqIfrMLDo4oYgq7PRzjdRyUBfVzMFGXGBwX+d5O8hG8QsMIOTqL+
 eroxbag9fvX1Q0LPbjp+c1XQ19d61dcIr0MxX+p3Mm2/PqtLpYjhA5BB48K1NLbqLJ+g
 lghSEvNpAcvxYfgSg3PbwefAMUm3ARVajU62rKN6lwNGSxHbvaUcFLSt1zJocqruGwK9
 kkoVh/RnACDQpfsSAzhtjhpvWXe2vqQJtBhq5tQ2DEil1jqMEvL0JewO5YFX0CLTH2oJ
 wY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EnO0itZYbrbxESWmgSmA77c4wZXV2dVMYZGqAqxlr+A=;
 b=MA4EHoty7gfen3YnUYeX962Ez0SmxRtS1/TZ2jbMq9kZYJj+sXlbhIB+wPqbXpQJr4
 0Bp3np5/uRPTsxpvBTqJmNFI/onajEBAFcQOlRkNsjA/br5VzrFr8MZVJE4TbVUZSype
 OVuIznLc3cuG0QRa8nj2TjyxJKS8UHpgMJ9WlzmFpatVs05Bi/Rw5r44hKYBtKn0z718
 SHWgwizICWFsDR/vuhWarRwh94b16vSk+is4ffLWjnDk8OFuI0PO83YH6Df51VNjO9E0
 dz3/khkoLpf2WzFsZHFBgsmZVwH2BhpncBFVonbwid7/8pbeF7rbqy9xTvqM9abKkRfB
 xuiw==
X-Gm-Message-State: AOAM5301CLCh31CEBUJ+bpQbw0HU4VmnJt+030QBRJhZ3nMU2y1gO/cY
 64GtwC/pkbU8KzuougTDWDMA4HaBB9LZGfbQ
X-Google-Smtp-Source: ABdhPJwJ5Xt+35yO22YDTvxqt9DIo4M3SLIAZ4xBK53aQdlCddtQMJqliUrCq1URAqrlZ2uKyyDTug==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr4290516wmi.117.1621955069917; 
 Tue, 25 May 2021 08:04:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 066/114] target/arm: Implement SVE2 scatter store insns
Date: Tue, 25 May 2021 16:02:36 +0100
Message-Id: <20210525150324.32370-67-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-45-richard.henderson@linaro.org
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469c..5cfe6df0d24 100644
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
index ba39ff84a54..ac43bb02be3 100644
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
2.20.1


