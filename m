Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B79599379
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:35:59 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsnd-0001XU-11
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseQ-0001aU-FR
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseO-0002k1-US
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:26 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q9so1838982pgq.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=Qz0AvaMII2u1VwUrmDmaFnnuSeIfmPOsw0NaPD1JcPnc52hEYGNminBioRgz6ykiBW
 YjSxxsOnCfsyjDcBoOJlMF1roNlBs+DP4OhHyoa4jsPfOsiRw+ZPhgw8fsHwkjgZfAus
 C1r29aIlSBBrtJvlA76psUsNE1ua2yLvyXrgGWQqjDUKT7EvaggpC0ubuGlkrHV32G7U
 A2lLeYSNeav2AtVDySn+ZJj0fF5YVTS96jr3BJvFJNFfs9xxTFwXZbeJwfVUkmSAbWNb
 GFeGvDUtNBRYCNMPa/w8Ueg0NjWpMWtVDm/2mc6vaRNpUhwZBoBhjDdroZ+JvZjJd0+l
 sEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=8A89G0HVZIZ6rTaoVRY+kxjytnls7PLx9e2aLYwn+QQglF9GDZcTmO82JaROtj5rHc
 KM4QC0FC8PSMBK3okzt+8GgIeqAYfzRVcY8ZfTUBuuDadISt+lrqTiLpHKVHzPZ97VjR
 DrhnOzXyUEb1TXxG9Z5Ij3b+A5Gkg6ThKpjs+phT+kyyVOB7ux92RrUkzO6qw2B9jRnr
 1mX/ufosqi4b/K9ylVcVDl9IN1weu/vrdXtj+nXMqM0R02IRFW+EO1jlLRcKjGNzSWbQ
 hUrH/6Ihf7UAZvgBiOGGqIbWMia9HrIaReZotaRQCE7ED0hzQVKVfGTmg88DK19B1QTt
 usWA==
X-Gm-Message-State: ACgBeo16IHRAVkxgH+gKw11wRRtZ56bBRK/h98PpnfguFshfrsJH867L
 yojweo73dhVzOEOr2HiwO1fHU9LXcvumnQ==
X-Google-Smtp-Source: AA6agR6t+H7PXOx+tJML3Umdz9kTuEm+iWMzvOm+CItZ9WoMaqzTNcztj3D29+XaAknCz1B1g7XUog==
X-Received: by 2002:aa7:838a:0:b0:536:101a:9ccf with SMTP id
 u10-20020aa7838a000000b00536101a9ccfmr902314pfm.18.1660879583639; 
 Thu, 18 Aug 2022 20:26:23 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 06/21] tests/tcg/i386: Move smc_code2 to an executable
 section
Date: Thu, 18 Aug 2022 20:26:00 -0700
Message-Id: <20220819032615.884847-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1


