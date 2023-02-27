Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FCA6A4F68
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVS-0008OX-1z; Mon, 27 Feb 2023 18:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVJ-0007xI-F7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVF-00015d-HN
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so7731370pja.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXHoQLeqrbXEjWVkbOYob2JhZTOWiyKZZ2KU5aalHNo=;
 b=gdidk/VhFLaj3VqljZ5o1gIlHpzeITDJPdc08wuGRMklA414hXkOSxLa2Lv3Z0jI52
 S/hMIcmkd+cfIA/FbGS/MXluTF94GNmR4QmHPH3d/2GL1lcodTa66iVYjqZtT5NuPF6u
 SIO6KvUjFM2YtF6gIxIms+biPOMDefiIf/TNIzyNtUPHBfO4s4N3D6rhM1XL1vifUxC1
 LNhYzAfTeesMvbv13I00XZiuealgk4ft3FsPfh6KqhP6YH4lE5YLkmjfHdp6f2yDFw6u
 dzy+gHVD9RfbZz/j53Q0bUCM7nnwt+XBIs2E7wiL2bh412nqPhNm6vUAmwhSuFHGY3M+
 TEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXHoQLeqrbXEjWVkbOYob2JhZTOWiyKZZ2KU5aalHNo=;
 b=2aEs4qeHjfybKlWoI06clz2n0PvX4f4ckDV9/Pk1tOZlt9fyRPisWrHBTYKCAD7uML
 PaVJDj3H6PIWmk3K3j4eB75NU7Pbt4rAjAWOhRRJpUXC242yLOjzLO+AP0ShmZNlgFrf
 PofhhmWuJ1upq2V7BA11lnK9wTVT9SBezp4kR04GNeckBaFYk6RueYpyxY0+RjpF4ZdT
 6N/WHmOhQJEVrHxKiovjVm7FfHrxU/Jd++ExdVDqIH2EilMbo88UtBvWHcDVaaJ/lTuo
 jAhKzPpscGPtMmgd0nQHECP/nASV31S6Grzjo/jD8cMlMyfZUJV2k/495i38XSK+2HSC
 YOsQ==
X-Gm-Message-State: AO0yUKW4SAUT/6EfFgwoZprRi8H81/di7KO4hSWJnt2Vwq6Xc6pZ4nLX
 WnmZ57yaO7rTH+ZeuT+RVKXFs5ucjsPPG0thDtY=
X-Google-Smtp-Source: AK7set9F/Yu0J95E2vD7q2pqd5oHV/mwSD3ZjICIK9NzhAVJdlz1zWeh619QnrUwFP2d44i8oCX/5g==
X-Received: by 2002:a17:90b:4a4b:b0:234:b786:6869 with SMTP id
 lb11-20020a17090b4a4b00b00234b7866869mr831600pjb.26.1677538911720; 
 Mon, 27 Feb 2023 15:01:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 v4 16/21] target/arm: Use get_phys_addr_with_struct
 for stage2
Date: Mon, 27 Feb 2023 13:01:17 -1000
Message-Id: <20230227230122.816702-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eb3f37495c..95424bca4c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -37,10 +37,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address, MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2863,12 +2859,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1


