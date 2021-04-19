Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3C364B4A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:42:31 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaj0-0001NY-EX
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQj-0007ef-8C
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:37 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQh-0002f0-Lx
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:36 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j7so27111991qtx.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pF6fmfH76/v510dCB18bQqtlH7/Yj+pRg8bcSl8DNoE=;
 b=e9U3+aMYpZ1GqYCJnVskuDvuGKIylM0V9ZMPlrechq07ay4ZvUy5I13oFsTifc6jSK
 2VSFYVC+Ml/5n8edwkzk+Z9yxvpUl3Cd1ziUuRGVz98s4lhXiTIMtjER9jMvsXeltpJf
 yneHyVXsZQpzCeoEEEwwmDYEbfUP2aXumWv1zg9pmBK2x6m4ZCyh/YMpHKtgIEHaS3KY
 +eFQFY6CkREk1HNwWBoZHKihPkTfSm3NtTGx5h2OiBwjoanWaOdIHofqsAhV2G2GOuvr
 qdE4CBafK4CFy+GukdQhc6D2B1BzcA4Yl+uqqdZs2JexQ6Mg1DYeLRNUIiv9p1vumkuE
 GpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pF6fmfH76/v510dCB18bQqtlH7/Yj+pRg8bcSl8DNoE=;
 b=R4eDm/SL6MmQ1ve4faPdN5U/XHDIwmRfMZG+li0i6zbvtybX/WcNFbmQNvMvXleYNu
 ck1RmqsBqq8on/Li++d3vDxYVVLDGnaohBRd76If3KWFblw22gPDz4vZAdhMCvEfwNPE
 SF+4tFWdFYAGp/zIJlTxSKFKmZ9z9Gg39ms2miUCCs9QD2/+oyhnim63ofNMUL4P2l/w
 aSjzFtEQh4Al6crK8mGVZ3W2UKVtUjhRep0ZaFdJP4lvXzTb1Kw+y/j0bMPfDxuIrfp/
 uho04vLXW6StufuA9Mey72rm9QVaHoPMPbPWQYAp/tIOW48G+QonKSfp6L9mf9vf/1B3
 9NzA==
X-Gm-Message-State: AOAM530gxS+NFQ0UEFXY7Pqk2e2wC+3VliU4CyvSRbSuxgoMih65p4nr
 ahniqzXGoWxerG/r+TE+i5TIWo4WAvmtJEml
X-Google-Smtp-Source: ABdhPJw3jrbTyKOK9/3JkIzbFakBjNvnxd+HmVYHY06JzD2zoKWTwh8HH1LBh/H34u53O59una5w7A==
X-Received: by 2002:a05:622a:170e:: with SMTP id
 h14mr13291322qtk.287.1618863814785; 
 Mon, 19 Apr 2021 13:23:34 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/31] target/arm: Enforce alignment for SRS
Date: Mon, 19 Apr 2021 13:22:45 -0700
Message-Id: <20210419202257.161730-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2cdf58daa1..4decb2610e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5200,11 +5200,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1


