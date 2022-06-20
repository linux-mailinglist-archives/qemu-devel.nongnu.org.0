Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424B8552370
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:02:08 +0200 (CEST)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lix-0003FR-1a
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZq-0005SF-O5
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:42 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZo-0001Kq-OO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:42 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d129so10872826pgc.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+C/PGq+HnUIHwmNMLjSjjZWblYyrjc+K5YuntUcgNSg=;
 b=GrXasSHfi9NIvoS6x9HwseW4O1ojE/ZP3FoRgi7L9H5E0zKQnf+WiyDGS2KF+WgHUL
 Zg99uGfSwutgE+3LQzYFz9AqQvdt5T/1KPutM8jMokg8rkkh4zZoZoBxXLI0gIYsbHAZ
 DENBa7R3aGDHY4WCWbSCL+bndDbkEum0L0SWVlMuWZDo8lkKsGxrD/day3XY01XjTvZ2
 0kMrZq+sEV60fBoxLZKIAXyRBq6reNc0ULmyOX4m6HVvPiVNtNUn0ZRbq5KpFiEfEBlH
 Vkyq0nAC0iOQcvSuEC5e4u6Oz7lIkjn5ofbJYTGg3CXG8n8sCAVRaso7qo9lP48l485h
 2uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+C/PGq+HnUIHwmNMLjSjjZWblYyrjc+K5YuntUcgNSg=;
 b=52gZc6ZKQbpEoq6USDFqzEhYHzf3qNHRxYYFhVvtv7ZdDnPPL03fpRGgiiY44xaERJ
 RSP11mvNiJXs74MB5ljtLyfPnUj9aH7BRuwfBGqiLd0fPOB4Agc4vOqzq1vNkx2nT3mr
 NZP3s6QEBPc0dSG+RvP5xCViYEVj24HXPXid/zmpTjIj/P7eQgBvR8PXWEapIpcpgv6j
 XtNCoUJi6RdhFdbWu6FODA7m7RPNLRY0/2JqTMzIqZPg6wPKTTKPS5SXiVgPcuqG5SNG
 eKrDp+JxoHSey/tR7MhKn3EsRUjSTH3jxLe5RCmq9SIyZC8SASDpNwa3Ub45vCiUv/lT
 F1+g==
X-Gm-Message-State: AJIora8csqamfx3pv915KeVChbfO9SFWTDC8nwuAXGJnzX864fWLNEvr
 5bqyTo6VSFcMnlagKPIxr0LXn+OhWnyL/Q==
X-Google-Smtp-Source: AGRyM1vf0y9w1laenW+jN8QtCFGNKDHHnrm5iXS7F+lYIBAw0GBYfCFHplPuIfKZenlVhu7O97IzNw==
X-Received: by 2002:a63:2cd0:0:b0:3fe:2810:ba99 with SMTP id
 s199-20020a632cd0000000b003fe2810ba99mr22811835pgs.27.1655747559493; 
 Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/51] target/arm: Add syn_smetrap
Date: Mon, 20 Jun 2022 10:51:47 -0700
Message-Id: <20220620175235.60881-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
index c105f9e6ba..73df5e3793 100644
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
@@ -207,6 +215,12 @@ static inline uint32_t syn_sve_access_trap(void)
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


