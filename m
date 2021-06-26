Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C983B4D34
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:46:56 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx25f-0002CZ-MC
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vm-0001ws-JF
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vg-0000Fb-8z
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:42 -0400
Received: by mail-pg1-x52c.google.com with SMTP id d12so10117543pgd.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13Q3k7x622C0VwURZHkyf+R7o121K1QECu/gh8+RjTk=;
 b=vD/fVu3z9lcARZlbQO/d1c4wJJFGfHM6psj6fyrEIqSUXCCTI4pU6/LAH3zqxdVnqz
 o8KBPWMQ3qqpgfZZZay4K6b84MRTwUjh4Enom77u6jhrsg+LkaAzAaqHvkCKF3KZFtT/
 XV4g4TChbR6sfou+NNKGYOB7yUNsFNu8o/nPuQjKZk5MqvozrMvtsDVjqv7YvLl/4EfD
 ZFyb+Bn2jygetxhuuwet24uGqlTr6hOfl6++q08M+0bAAUBRc19NGkhPHlj2E4C/pBKS
 LJ+F8BEr+MxBuA+o5wXQWQZFaNSgHw+D3YcF8AQ3nFrxoFp7CnqJZGtDaYJD1iagFdd/
 d4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13Q3k7x622C0VwURZHkyf+R7o121K1QECu/gh8+RjTk=;
 b=PZIrr7RXPBAsA0rz8DDub7Cm6VXHKKE6AYznLlVZggwGS6BRNRhprfqGS/SIO1OkEE
 eVcw9gW3z8ShnV4lCiHHybyChDxp5MCr86FbO+Jk1qeHPqJS2UJlbiZePCnskdVOP4aG
 vUb1R2AcqEc8V9QCfTgcOq68DYm/9d2SFMITX3cquXgoK3QTQdllh0tgEfbOvxBPECzh
 8VWL5nfkSZI8tzlkephE7gee39cdg6nUHxBGdrJj8mIbrVMv08e28xzmdr8rzhVP6lCU
 3EI/8mPsI+pVm8OHwg/BifCTybdy2dGn1ivdQSm02IEhMon4oouiWKLWSdYaOJaEMWGi
 1n4Q==
X-Gm-Message-State: AOAM533tgzfNYxQHa/WXz1CzxIF+dYKrOdbDgL0sdEE6YXhIFqrQhzHE
 qm/WvMjYU99KEDCtzGgJQpTLkoBwkYrAfA==
X-Google-Smtp-Source: ABdhPJzKNUOkmOA7DQ4jp9pYnOT6b1OCUZRXRFLL2KbK77a/WWdQV8f97oiqMW9T5Hq7DiqlZ5dbFg==
X-Received: by 2002:a62:53c4:0:b029:2f1:8ddb:5918 with SMTP id
 h187-20020a6253c40000b02902f18ddb5918mr14058345pfb.80.1624689395080; 
 Fri, 25 Jun 2021 23:36:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/29] tcg/aarch64: Support bswap flags
Date: Fri, 25 Jun 2021 23:36:06 -0700
Message-Id: <20210626063631.2411938-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8619e54fca..72aa7e0e74 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2177,12 +2177,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
         break;
     case INDEX_op_bswap32_i64:
+        tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+        }
+        break;
     case INDEX_op_bswap32_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         break;
     case INDEX_op_bswap16_i64:
     case INDEX_op_bswap16_i32:
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            /* Output must be sign-extended. */
+            tcg_out_sxt(s, ext, MO_16, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            /* Output must be zero-extended, but input isn't. */
+            tcg_out_uxt(s, MO_16, a0, a0);
+        }
         break;
 
     case INDEX_op_ext8s_i64:
-- 
2.25.1


