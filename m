Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F237C50BE75
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:18:22 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwvG-0008Sa-2x
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXR-0002Ec-6z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXP-0007MI-MH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:44 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r83so7789018pgr.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ysJZrdf3qEL6SmyFziC5eyUqxmIxqoso+UNr/N0Gtr8=;
 b=ev1zUGXGpi74e4rFtqnjtVCZ9PnQ/gBF5vvJVq1p/0bpeqirUVruBc/sSdYWL07G5e
 4UYO9qN7i9XgQgGPVTklCa/zSRGehvQeXHXCNSzAmVRcqIdz9eNq+87wHfyoxjQCs7pv
 1uuhsJPVzOaL2Bpl5n9BEerRYF6Lp516/KrWZlq+hadXVCAw6QobfEb8spDRGe0qBWU7
 4/Iy88ybc7wfB2YySNx8vfmTqq6dW4dRVlCO6XaP4YIf55QjaVHX3ImrwXGt3dRxuz/t
 zFDT+L5ueV6AACC6L+5Qqs+SVMYRViRuMOiivalwWEQRF2wm4ZH+/6hUci7RJlE7NrMk
 50HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ysJZrdf3qEL6SmyFziC5eyUqxmIxqoso+UNr/N0Gtr8=;
 b=16FYM/DufM/SjThrSzOTTShYRElK+NRuEQG5sYmr1dz+FqiwJbyfbzHa0VB+PwzNh7
 WcI060w5+Y5CkMP9ytkCxakHoZv6dzzYurH4/rucibqoJkz/sZ/cGce8gwVtUly18avd
 mhn8tAXkpCcEaJvd6ardrG0UeqelctMLChoxPla5C6Rd14OyvWwMZSifcAXQs6JYM9dX
 Gjm6L8ivB/GLc2+lCx85ELJfOwNDDenwv5DwJNhVLTuKn+9wG6M+t81/yAebUeuA4k1a
 sjvUAsE9I2B5wfJMkRVGD8VyLElELYYFdeATUWHPWRkRRgh1TXJnuLGy5K3I0b2pRR2F
 DCVQ==
X-Gm-Message-State: AOAM530KwwEPrTseGSoUOJFCDz8437UlbeGjCkBS6+48zAQnBOz4Lwhf
 7HQDzRsFqgJsAHffPG5c08w529hW2WAPWjkV
X-Google-Smtp-Source: ABdhPJyDeQMTbq/B2tCLrVlhsdbNkLLEY4ESSm49H1MKU0SP5H4OQxKTmB5RULAMDl32PiOgPbQqcA==
X-Received: by 2002:a05:6a00:2292:b0:50a:6683:44a5 with SMTP id
 f18-20020a056a00229200b0050a668344a5mr5968173pfe.16.1650646422449; 
 Fri, 22 Apr 2022 09:53:42 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 35/68] target/nios2: Cleanup set of CR_EXCEPTION for
 do_interrupt
Date: Fri, 22 Apr 2022 09:52:05 -0700
Message-Id: <20220422165238.1971496-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The register is entirely read-only for software, and we do not
implement ECC, so we need not deposit the cause into an existing
value; just create a new value from scratch.

Furthermore, exception.CAUSE is not written for break exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-36-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 25a89724d0..3d9869453b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,9 +54,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
     env->ctrl[CR_STATUS] = new_status;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                         CR_EXCEPTION, CAUSE,
-                                         cs->exception_index);
+    if (!is_break) {
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
+    }
     env->pc = exception_addr;
 }
 
-- 
2.34.1


