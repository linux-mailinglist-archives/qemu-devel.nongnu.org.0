Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F94DAA25
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:00:47 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMiE-0004uK-0v
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:00:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgJ-0002E5-Mp
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:47 -0400
Received: from [2607:f8b0:4864:20::1032] (port=55283
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgI-0006RV-7j
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id b8so1303028pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzx/rQUMOE81+2YuxRoc7gBccURuvdO8lUHsdT2k1Vo=;
 b=V/Gmw8eJiU25V1Kr8BDZ/HZMTGWTucmN9cND5W8m6wfSb5bAG45ovLjgxutXIq88Yt
 ZZQTvGqKThBIU6JR3NK6YNJ3hOrOqrUBGHGGmPTL7hItoDfwe5u4mnfMeL6MkLDVzQr2
 byCCwaK2ImElaf7hZoTkp4KXnNB2eJscdPSJPmBwK6qgqtUhHWhU7EYKu7dKIqag+pv9
 kZftYbA6U38yJcl8mhkdqF6ofp1vS+4SMwyciUMlbzsKDqddsXOSl0Q4oQA2ElmtRcbA
 lOhkCARIWXOfpFYCyuPB+MMinESrAQl15tUiXujfZVhchlSPu64Eo0jnnI/rRRQ4F71V
 VSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzx/rQUMOE81+2YuxRoc7gBccURuvdO8lUHsdT2k1Vo=;
 b=eBUS91oPPCvDN12uJMrb+tkNhXdlG3m/v2xb+UUhcotdiOzuVbdE9nBnkDO+aV8RsP
 rmoEeEn9rYCJJVjqqjVcfL6Zmb47B04HiPgnI5JOzleOBFI4Gyl/NfRF6qw1QtmPm5u5
 1p3WivnqFkhTY+tijnAre2iLHz3Zzubpo5NXSGdRs/wzPBHRv4LoHb7CTxM22LNOfPbC
 SBdgRgmw909V8WfPsowyb3KP+nlJAclXuK9UVRmXQ40itpvFcWV3ENreMOwtp08HLj4n
 /+u+vVrWYZFCsgDrknSPHkZq7eSXd3m31AiNlQswvLgTriC8iAiNcJrq3DlshhvbuL92
 MIKQ==
X-Gm-Message-State: AOAM533MO0H51Tgb8Y9rQ+3J0krAacHy3JiewZyKdAxe9woI4ZmCGpyP
 5soCx1pK7pzrwUPiz9GcLr1qlRE9SUi3ug==
X-Google-Smtp-Source: ABdhPJwQplIouYHtH0Oz/pjSq9q3RfqaPyR+A8oaqgamqmo4RovvXVmx3jO1aCAcSNiy8UIQ9yIeBw==
X-Received: by 2002:a17:90b:4d0f:b0:1bf:6a2:5637 with SMTP id
 mw15-20020a17090b4d0f00b001bf06a25637mr8588430pjb.106.1647410325025; 
 Tue, 15 Mar 2022 22:58:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/17] target/m68k: Fix coding style in m68k_interrupt_all
Date: Tue, 15 Mar 2022 22:58:26 -0700
Message-Id: <20220316055840.727571-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add parenthesis around & vs &&.

Remove assignment to sr in function call argument -- note that
sr is unused after the call, so the assignment was never needed,
only the result of the & expression.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 2b94a6ec84..0f41c2dce3 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
-        if (is_hw && oldsr & SR_M) {
+        if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
             oldsr = sr;
             env->aregs[7] = sp;
-            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            cpu_m68k_set_sr(env, sr & ~SR_M);
             sp = env->aregs[7];
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
-- 
2.25.1


