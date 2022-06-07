Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA05415BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:39:17 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfyt-0000Ff-UL
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftB-0007RQ-Dn
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:21 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft6-0007EG-6o
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5675660pjg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swxajT381TgS1/Nf3oQ+qlH3g7Wj94ec884EPLSXaF4=;
 b=n1DpIQ/LMVvrHA7TxsZMtqrtiALLahHuP9JVkFGEowc7tRrlaYPvxF4UgSRTkYyo4a
 gWjC+qX4Pl3A0ZXRdO9nHtBA+4Gtmb3ELx8CKd2tWsBdoTYGABfltN7xLfMR4lAJtxf7
 H61D3ix54qmq2gVqgaYmogV2ABu6odj0bir6m+yrkq1OcX7V6KhvjJ9wL7k6OZH+Qfmn
 5QlpJhDmf38sLEnkIE7lgx/pAvqCY7d4Aek4hUoPcU5bL74RIdwNm5R0H4NAsp6FtNZ3
 F9AQCU9H325+VFZGay/wuDOZRVFvjfc+vj29+O3u4CfBwx0MAjhWZg/oUnrsyxzFfxmy
 BUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swxajT381TgS1/Nf3oQ+qlH3g7Wj94ec884EPLSXaF4=;
 b=Mk9QI3Xc7sM11hFBrzcWz2CundORfe/Lb70HFyjKHW8DpjG3Uu9UiKjwXGvMKJyU+0
 2tL2LjUqiLpgEedVVlaNprCEmlUmcg+cicQLes1xIoLkk85cAdUGoqT/z7IBq3ARkgc8
 1vE9irCaJfhmfJTPil/wPe0jcPQ1tQoTL0/PAVzzU3TqVIQ4ZpeXQqpqZOn/hGWXjL+4
 inDKk1z2vTTAngzr90tuqpbNTpNr3jjl6WtRDL3rtCBqqu62WT7NwPhw/OBsWBBUdCAX
 rTZLh+r84ADQXPRvMWsTpiNIfQESQfcDV3UMqsrMq+y37fq3WMN3Sg5xepHXtMk97dws
 l0Rw==
X-Gm-Message-State: AOAM530zgXuHZs3I81J3BdhgzZgPC6T1+8QGGSvLnhnRPA4lssuQPH2u
 FswXeGRigS7oMawsvFIQHXKzWj9ezJhebg==
X-Google-Smtp-Source: ABdhPJzRR/9S8z+8KbDNCP4nIho/B5FJvobVAaPDYrQ2adXSo65YXAscO/5h1kRFwq6zVgdALYTzKQ==
X-Received: by 2002:a17:90b:1b01:b0:1e3:421c:90f with SMTP id
 nu1-20020a17090b1b0100b001e3421c090fmr41869910pjb.59.1654633993906; 
 Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/71] target/arm: Use el_is_in_host for sve_exception_el
Date: Tue,  7 Jun 2022 13:32:02 -0700
Message-Id: <20220607203306.657998-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

The ARM pseudocode function CheckNormalSVEEnabled uses this
predicate now, and I think it's a bit clearer.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 135c3e790c..7319c91fc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6180,9 +6180,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, ZEN)) {
         case 1:
             if (el != 0) {
@@ -6199,6 +6197,7 @@ int sve_exception_el(CPUARMState *env, int el)
      * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
      */
     if (el <= 2) {
+        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
         if (hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-- 
2.34.1


