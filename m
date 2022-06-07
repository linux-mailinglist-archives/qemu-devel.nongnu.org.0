Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F85541730
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:01:00 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygJu-0001WG-7y
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftO-0007yW-01
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:34 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftJ-0007E1-FO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so16421711pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/BD6nh7cQl/3oZZqER53B+a4/wNAUufNSOwzZ1BBOk=;
 b=Pa6DV5haIlOmJXGAWwl+YZaEm7RnC7QUiCo7kygGgxOnYE3wfYkCoKhrmvtobkw64o
 coBCUGxH7Gnsy7m5AOW9flYVE9p8Co1qFMBhD1TNTApqktdgqCoMRpbiyVg6ZmAXj+8h
 kgNu8miUzno8nAG3Tm4lFEtJVjclxyfSKQHvVg4/GPjT19OIHQU8BcJgkdtkKEJVpXzM
 aMEMy+rU4RDsF2L1O0fz20Ej0H2NqA/KSlYKdyIRqtkIJo1X2UTnskXPo5uPlF7LnJZN
 hSURKPuubeidn8F9zEusTLAJEbRCdvtEtyVWK4B4H/YQlWnuGBlylT7c02FBhosm1Cgr
 Zn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/BD6nh7cQl/3oZZqER53B+a4/wNAUufNSOwzZ1BBOk=;
 b=f7owqTCJIpAjeYca0kQA+CIZ4z0d8raVpBgUlfW1fbsNnZnyvO4aavWU8piNGhaYrD
 A1Fs+V3+CQVHvZmyYk0BZC+0CCfPg9XU9BwuptYz6QADv3mnUBuz5T3Ux5tzd/hMBsXO
 PAKN3oVxWd5t7CV661MYCzm9falS9VtuE7EKMJRl5PrV9bfc1QS5juOVUbcLimEiDXro
 e8QfQ+uFtGsZn787et1jreQ5RyV48fv/zNxZBpen4rP7bQ7yOZp9QaxMKi0dO8fKxC7Y
 wKBt0vfXlBVRPlEaeiuUUZrh4DxIPPYyY6KHR+NnluXk4N16BRZJyOkmhhWYm1YQc5Js
 xutQ==
X-Gm-Message-State: AOAM531yz9sGKCNvmc3k9NfCI7A75ohU1EGyG6Rl9Czn2fpJXvzyOEsY
 JBziRrBwuMO/PyhvkJxmMMAViNBci6Fs1w==
X-Google-Smtp-Source: ABdhPJwJPeZZu9KGJmEXPCcY2ECudao/4kMlT7HM09zyuAyKY96O4sGcQ8/erN1W0tYXoMwrmTYJhQ==
X-Received: by 2002:a17:90a:fa16:b0:1e9:805a:bd72 with SMTP id
 cm22-20020a17090afa1600b001e9805abd72mr3205492pjb.70.1654634008752; 
 Tue, 07 Jun 2022 13:33:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 23/71] target/arm: Add syn_smetrap
Date: Tue,  7 Jun 2022 13:32:18 -0700
Message-Id: <20220607203306.657998-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This will be used for raising various traps for SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d..4002766302 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -68,6 +69,13 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+typedef enum {
+    SME_ET_AccessTrap,
+    SME_ET_Streaming,
+    SME_ET_NotStreaming,
+    SME_ET_InactiveZA,
+} SMEExceptionType;
+
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
@@ -206,6 +214,12 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
+{
+    return (EC_SMETRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL) | etype;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.34.1


