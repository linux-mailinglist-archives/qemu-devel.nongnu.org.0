Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A94453C081
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:54:08 +0200 (CEST)
Received: from localhost ([::1]:49472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwslZ-0008NM-Mp
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgf-0004SB-Fh
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgc-0008UL-Tl
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id o17so5533764pla.6
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80S55FypfkD2P2t6Vkw3PZn9gYfntg1XNKdtyYp1U90=;
 b=DDh1dNJYUj7ab/yKsg7Jp6GsTSGOUo+qthEPoOPyYgwBxq44wGW3N7dSva5qSlc+MP
 FwSsB2KSQHyRNJM8mH8BwVNhJj0sCX7CyAkDm9AV/pe78xRDjcppzOpQUUM1r8XTW8Za
 sk3WuDBruuPIL3i5RngtGXNodvDnFblReRUEOtVkwwcpxuKPCZ90beaAu5M5PE79TAOE
 fuRVQRNon99gv60lmOWJYD7ZAKJf40dbq3crcOO2jPADjIAaYGfo9DLbyViNZTv1TZKo
 uCI6nCpQvdk7BHvxxkh9iqT9zrwNw7/a5ukbMQE8SjtJX2guFAv7ymUDvLEWlN/PMGNC
 /uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80S55FypfkD2P2t6Vkw3PZn9gYfntg1XNKdtyYp1U90=;
 b=101C/dLvByXDABKsO+e2AJKxOzRg0DnKwEa1/MPIg2Y9hn5bgdDVSL0KfujogDHrPJ
 SRPezELB2A9/30rEq749q2BItpt2ei1s2wqaQrPZbQ1gNrfpx4v1/xZB2vgZaKIX0nbv
 PZyFMyZGNCJpT12OnIijYbgYMTE37RGGmMuF+hWno0UPn0L3T3AMvq/KECzsl3NnfajB
 vfQGMELjOaJV82XuSTNVXbBI/gThlMaYvEfeqJvOXIFx0J/0MiOKDjrqtTcIBzZxs5AA
 pOHlbDQnXACCw5PGO2uF7H33k2glNwdT1ysoNbUu/Tue7V8IyMLDlKFInIDWPhOS17pe
 Xdqw==
X-Gm-Message-State: AOAM532PQ4++/yRjJo+Q2poBC2YqFgl609QVryT6MA8FlsIQrU+jDNSJ
 HzyesvTkKB/+1usX+xkjXmG5i5UTzIH+lg==
X-Google-Smtp-Source: ABdhPJwuIgwoYcZe5mfUy9R4CqL9VDxpZrewkYhXQaiMPTgpWdpKJra0wFrS8m22M0/80JKKLApe1A==
X-Received: by 2002:a17:90b:2404:b0:1e3:4db0:f32a with SMTP id
 nr4-20020a17090b240400b001e34db0f32amr14706764pjb.201.1654206537513; 
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/71] target/arm: Remove route_to_el2 check from
 sve_exception_el
Date: Thu,  2 Jun 2022 14:47:45 -0700
Message-Id: <20220602214853.496211-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We handle this routing in raise_exception.  Promoting the value early
means that we can't directly compare FPEXC_EL and SVEEXC_EL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 960899022d..8ace3ad533 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6159,8 +6159,7 @@ int sve_exception_el(CPUARMState *env, int el)
             /* fall through */
         case 0:
         case 2:
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
+            return 1;
         }
 
         /* Check CPACR.FPEN.  */
-- 
2.34.1


