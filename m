Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B016391759
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:30:42 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsgL-0003yQ-Kk
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV7-0001dD-PD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUz-00035n-U1
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id z17so901648wrq.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qHVT2mA2TWjPyo6mee0Tv5AQZrQhpH5e6Tzk+OdaYw=;
 b=pZ46IXtvzWEFNsVPXg7mulQ8YclaSoDz/LR2AJwKW/98JnspqYM5lq6kms1mhfuMbm
 I+mGHiOOKO5nDMB/vNRACFa8H60W89+LJV70Ro6RKOFDm8UUi/7eTHg5W4MOXj+5rll5
 oWv7YT0QMTuV5SfL9nooMQlP7qA2fjgmQwsvNnVUXMmsICSRN+G7aSgEAvTxt0R71oCG
 /t6Y2vVyfWh4MZ+8v6U45MVw8kbTfZ9ser7YLm6A2UQhxYHQwDleY4eNFj9tmyd1akGx
 La94JAAsQIpeS0WOOaNp+sJgh51Sg1Kpi1XhldE1SYE7J1ZFCkYjFnlFglCs5/JCXm7E
 6bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qHVT2mA2TWjPyo6mee0Tv5AQZrQhpH5e6Tzk+OdaYw=;
 b=btaw7bbVKioQ59LHZ8v2xxQYzmEO99PHcBMiEpuSU+hhW4J0M6bEE0VTXLf/q0JnLO
 B5sN+dBTuug6AQRlDKsu6aWGyVnZiUR98j6vDkb31ce+CPy7lIx54dngLpcjuidGsh98
 pO1MsjiB5mYgRKsAZrHsQJ11rm1aWMN29Tht7Inh8yuqV/1zYgiv0iZkwmrq5961arF2
 eLEHy6EcPIoWSo+SASfWefiKqV60s4KK5M35P6l2HJ/8e4WTl3DEDf23u/sLtOEr+qqh
 j7yt1uYmruTuZECu/8b2o3kFYvgVR4jpo05tYgtb1RJBD1l6h5bgzy41EeGGQCw9cLL5
 jI2A==
X-Gm-Message-State: AOAM530DXFqyUpqXXazteakXUiy/r4USXAZzONt8I0tx7ZADWtlpmJz6
 wVF5zlUGjvFG64ekaDsi37aE/A==
X-Google-Smtp-Source: ABdhPJzebsx/LvF1Quk/oR+/PuI19UCJneO2YtR/xGFbr5h7SBf1KzwoMp9MwZ+sEo1POs/IOjlGJQ==
X-Received: by 2002:a05:6000:137a:: with SMTP id
 q26mr3186178wrz.216.1622031536174; 
 Wed, 26 May 2021 05:18:56 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id u132sm12625069wmg.31.2021.05.26.05.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:55 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 4/4] target/arm: use raise_exception_ra for stack limit
 exception
Date: Wed, 26 May 2021 13:18:47 +0100
Message-Id: <20210526121847.1935454-5-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that raise_exception_ra restores the state before raising the
exception we can use restore_exception_ra to perform the state restore +
exception raising without clobbering the PC/condbits.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/m_helper.c  |  5 +----
 target/arm/op_helper.c | 10 +---------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index d63ae465e1e7..c793dc486f0d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2600,10 +2600,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
 
             if (val < limit) {
-                CPUState *cs = env_cpu(env);
-
-                cpu_restore_state(cs, GETPC(), true);
-                raise_exception(env, EXCP_STKOF, 0, 1);
+                raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
             }
 
             if (is_psp) {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 3b3daa955598..23365b33feac 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -90,15 +90,7 @@ void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
      * raising an exception if the limit is breached.
      */
     if (newvalue < v7m_sp_limit(env)) {
-        CPUState *cs = env_cpu(env);
-
-        /*
-         * Stack limit exceptions are a rare case, so rather than syncing
-         * PC/condbits before the call, we use cpu_restore_state() to
-         * get them right before raising the exception.
-         */
-        cpu_restore_state(cs, GETPC(), true);
-        raise_exception(env, EXCP_STKOF, 0, 1);
+        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
     }
 }
 
-- 
2.30.2


