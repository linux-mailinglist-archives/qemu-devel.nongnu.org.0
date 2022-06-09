Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DFF5455B3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:34:03 +0200 (CEST)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOqv-0007Cq-O3
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmB-0003P5-AW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOm8-0008QK-V3
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id s14so21129058plk.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/iHX6ANtN/zAKSj1imBD0tjZXjeiBLskpYlkOhgS0I=;
 b=l1YhcKHCsUdN75BWIz2PutUjbFgF20zXfGtsSwDGjhgVc3gHSEnd3DZUs4g0+joSvD
 +QwBlfNdXvcNV2ve38F4HPA6RXHap4DBW+TLV43gER1gM9fTMnOADik/sRP9yjcexvmf
 lghnzSZrdTgjXc/JR+DF4DKSNEAXHevtq6DN/BncymEVO6Yeko/GtqE7T+LU8hjKI6GC
 /fD1v2soX8uI5XSI1/5coEKM4GIzE7NQaKY+xwOmGFQl0NOpX9tWS4LDhDP1AtvfyNZk
 rrJvaqZpIN1U60R9OFCa8i2ivCOUyjULMpQBE8z9Q/atvL6r7cSoZSqxm1aRQuKCuV5N
 6WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/iHX6ANtN/zAKSj1imBD0tjZXjeiBLskpYlkOhgS0I=;
 b=eIdsBp7o9VGqLIsG/F1MFFVEDUk0Yjyv4uNxMByHVeTCHytLi3qS1tG5FN5Gj+6syB
 1Oj7PwpRbxUPNHKBTmG8utzWFYQGYYBoUT6Dl5oiO0u66jJmlyt251YJ+jPUgXiu58eb
 aV6nZ1Gs4TfIWnC3wbos6858zdz7bA+eBcFr44Z+O2Hv9JqvBdNchJrCdmI1+BtATH0R
 nBXCBqr88jXG25SOgCU6+ForwX9qfuyBJbcuIQmCDvJqhykuCOIMTX4Mv7dWeW6ve8HJ
 /oIG1rqMN4mUOWnaG2c3mVCqE3wS2rJbbgsT3Uh3o3ogpF5OOkYz+TxbqNerceFCGhBW
 t5mA==
X-Gm-Message-State: AOAM533VEfjOMoMrZ4yNg7kE8H6JtybIhDHh8fuE9ilpP5u04sjmt8aq
 wQNMGHyod4rqCXLKvnpORliNIoNcwZ0Kjw==
X-Google-Smtp-Source: ABdhPJxNSYoenoOXWydUOipRzQjAYdq0paCzt6oW5IFALQRlrbx3dprmAjHm6aWv2n0wk9a+r7FLZA==
X-Received: by 2002:a17:90b:350b:b0:1e8:5177:fe7d with SMTP id
 ls11-20020a17090b350b00b001e85177fe7dmr5205317pjb.142.1654806543691; 
 Thu, 09 Jun 2022 13:29:03 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/23] target/arm: Mark exception helpers as noreturn
Date: Thu,  9 Jun 2022 13:28:39 -0700
Message-Id: <20220609202901.1177572-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42..5161cdf73d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -44,9 +44,9 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
-DEF_HELPER_2(exception_internal, void, env, i32)
-DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
-DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-- 
2.34.1


