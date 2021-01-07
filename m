Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28B2EE705
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:37:27 +0100 (CET)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxc2A-0002m4-RE
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhR-0001VO-1z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:02 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhE-0001gO-Re
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:54 -0500
Received: by mail-pl1-x62e.google.com with SMTP id r4so4140502pls.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1C9DAauAp7ESr+w+Jngt35D1tFX2Zjw12yc74O3Eyt0=;
 b=JbL+zwzBpEjWHm+q88jSzggyZVvivBjFJ4/DPrh79pZb9YeyFjDH2fnWiHiihqYgT3
 Grjye7O7ZEG9ofQh9kQvCK5DScFl2u5BNtDgfLfUkCQ63xVA+Uqc1Lcx62kuv0TLg4Uj
 Z2m9i7RKtHEkTPU2L5bTcIqabSr1PnmptOGt/fJQPDJyTxG5x3zvkDcdErCvvnSEddVu
 rLD3k8QooflCltJKbxIMDpx096bMi3FYdXuAxwZxR7lRlm0eLUDrfBOcnosmjFkNLOrA
 YmxYtuIEf2InBggn2lZ5yxjCxkDr6WeNVNzPQ0bqCIKnhQzdX2fL2wbdzMOhrkHzAXr0
 /7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1C9DAauAp7ESr+w+Jngt35D1tFX2Zjw12yc74O3Eyt0=;
 b=KzT/xrpHTDtdX5IbqkvfVQyKEm9VwQ8Fn6Egvk3UD1waNNe3we5f2Vic1QI4/Ks627
 f7P+CHNKw6PAnuYLE84kbBLoOFV/2Q8f5CjoGsNu9N6j+9BnBN4xkVLXrcL7+pdvmJjF
 a2FLII6img21srlyCl+5Suh7IuEpk0aIljraeHCslkcCUTr1w65J8QsZREAsjJ55zDvm
 UmIiV0FgM82cSocK1Ov+UjvVgEsueIH7dUh+NK7/kgBi/CYZYztmIJj7Y56hA97B0Wsb
 biFlgv6GblPExZtuEbejA01jkzuHj9yBWtffmrEWXp9/44n7MnkqAvgDXtHQ1r2APFYz
 l5xA==
X-Gm-Message-State: AOAM530Lfqi6SMQ5+2RhrMnBdC1l20DopNvM/xWaUKe88Mjh8CfuoOoF
 OML+wxcbXxA6tr7VUieEwwPQHMu1G7FcQQ==
X-Google-Smtp-Source: ABdhPJwfb5u8UMtoi/pN5pEW32Yz4eLUqcN4JCZ8OQgzVEYnHmepQXrfKxFYZzDr63PwLRxu9FnVHw==
X-Received: by 2002:a17:90a:bf05:: with SMTP id c5mr166021pjs.95.1610050544925; 
 Thu, 07 Jan 2021 12:15:44 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/47] tcg: Introduce tcg_tbrel_diff
Date: Thu,  7 Jan 2021 10:14:31 -1000
Message-Id: <20210107201448.1152301-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index e744a1ce02..e6fce9a049 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1146,6 +1146,19 @@ static inline ptrdiff_t tcg_pcrel_diff(TCGContext *s, const void *target)
     return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_ptr));
 }
 
+/**
+ * tcg_tbrel_diff
+ * @s: the tcg context
+ * @target: address of the target
+ *
+ * Produce a difference, from the beginning of the current TB code
+ * to the destination address.
+ */
+static inline ptrdiff_t tcg_tbrel_diff(TCGContext *s, const void *target)
+{
+    return tcg_ptr_byte_diff(target, tcg_splitwx_to_rx(s->code_buf));
+}
+
 /**
  * tcg_current_code_size
  * @s: the tcg context
-- 
2.25.1


