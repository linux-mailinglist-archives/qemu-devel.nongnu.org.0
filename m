Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE8362A55
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:30:15 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW2X-0005OI-RD
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdK-0005hm-RP
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:12 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVd9-0001en-7A
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id m18so12423559plc.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bn7hUPo4Fn4gj8R8dHIFe5YgNO7lh3cxv0iB6D6VY7Q=;
 b=X4soKN45ZDO88UrGTj2gJ3dXwlu8xzzaBMveQlzjQtSBKMRYmN6tZfZTWdAsqMJOuO
 3+O968i9OB8s+1ApqEPKEbygJ9NFwIvbJzmLB3IqfXtqSGo3RCLPyswZ3XjsSqc0tG6a
 6Kv3l4CIEI3mvjaHwukCYaD0Sb8i/BSv0mPP9ZiXqbpNytdoq6Ig/g09FuwBXLI+6fYw
 xIAXE6P6Wolcm5DNF3Ci7B5N3ssf0/i+vRkxH2fmzUCETUHfxjATjyNl3y3dcL+ff1Ue
 krxtYVgtY7IaLX178ywEvYg2Eu08Ovd+1dRLsMryLIKdeSdO99gYa+AFZIxAqvjNJS+J
 hSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bn7hUPo4Fn4gj8R8dHIFe5YgNO7lh3cxv0iB6D6VY7Q=;
 b=uHm9AFiLdKW5IDJ1U6OOzEivN8DebzMnfm5cDAu0PDvyRYc14bHiU3kKAx3g9u+7P6
 VUVVECD1Gcgf6fW3rvcIPvNCJUX0HhvXQNcC42s/4+50oD/4X26PX//Z2TN3x5MtJYbJ
 JUemXwqlOdb/VxppKsjC+MGw1R9AZ3ETE4j6oChLizouf7w3EZljs6+usJooz6Ljh38J
 KQnop1lmyT3XRHjMqhP/qahmMyAU7CtdQcCNIZyG13NM9gj7SSJxhzYpDCu5fzpjtJmc
 JzyeZoBg5kLTRCFfLHDwcv0sGooKBrRB/ZGn/lrNFlbGeh3yb8cOdnjcoToBNLXCF5HW
 tLZg==
X-Gm-Message-State: AOAM531TzQ/RXGrpecy+VUoMkAZeokKrqXZLwWHmAsnROpJgrvJlYuX4
 xg9HGcqx5UP5N/JxdRCL6AOlhyQ0+5A7OQ==
X-Google-Smtp-Source: ABdhPJwksdgE11tJ13sYk18EnvHWN28KG0+s5w+INYluqNL+QKpkVFML8ZKsmA8MnXMBLiwWytx7aQ==
X-Received: by 2002:a17:90b:812:: with SMTP id
 bk18mr11902958pjb.145.1618607037536; 
 Fri, 16 Apr 2021 14:03:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 45/81] target/arm: Implement SVE2 gather load insns
Date: Fri, 16 Apr 2021 14:02:04 -0700
Message-Id: <20210416210240.1591291-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit gather non-temporal
load insns.

64-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1SW
* LDNT1W (vector plus scalar)
* LDNT1D (vector plus scalar)

32-bit
* LDNT1SB
* LDNT1B (vector plus scalar)
* LDNT1SH
* LDNT1H (vector plus scalar)
* LDNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422152343.12493-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5cfe6df0d2..c3958bed6a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1389,6 +1389,17 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+### SVE2 Memory Gather Load Group
+
+# SVE2 64-bit gather non-temporal load
+#   (scalar plus unpacked 32-bit unscaled offsets)
+LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+
+# SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
+LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+                &rprr_gather_load xs=0 esz=2 scale=0 ff=0
+
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0356b6a124..a74c15b23f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6015,6 +6015,14 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     return true;
 }
 
+static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_LD1_zprz(s, a);
+}
+
 /* Indexed by [mte][be][xs][msz].  */
 static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
     { /* MTE Inactive */
-- 
2.25.1


