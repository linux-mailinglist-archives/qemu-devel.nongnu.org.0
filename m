Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA651623B
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:33:19 +0200 (CEST)
Received: from localhost ([::1]:39358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl38w-0002K6-S3
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Ts-0006tP-64
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0001Iu-2w
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so10494135pjf.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3plBYXX6SApkM+t7ZXN6wJ18Jh8soXA/Q1mctbH/v48=;
 b=Pc1fUI6F2kZ7VZF6EA7yj+Gt6lolPr80CN5Smrz5vWwO5nmQGuFEKPQVwrRQ2DmV/E
 a6DOJuLL9LbuuA7z73cYZooxhJq+nHtW4cbzXXHyYTJlcmh0px/zN1w1FlOHE91eSDo+
 VcEDpgIBszlxeMhpX1r2TzkZJuVUnf98pfOYkzvquh3lQKmI/59GRh/kx+J4oInRke1e
 lVqZR0gnA1TgYPhcyT2EM9YzUsbexmB7sa3g5TJCRw542d12fO/CPPobGxY/ItPOxpGo
 iuNm/xwWSqZEE8hPZCWF2LgZYcPFeny+/6Bbj8Ud5VeanWP8y7Tgm1w/rbCQUTwnQqQS
 srOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3plBYXX6SApkM+t7ZXN6wJ18Jh8soXA/Q1mctbH/v48=;
 b=wjHfSwfmLYNI/1SLR768GXfBJ0T1cmTM4LRzferzbhb054bOYIG+HUxOgAu+RLlX9e
 QYujnRIDb/KtHfMu5I1KKVQjVas75R/5ICPXAYpo4vQ68yuQ+RoPO6Vp8rsImmiANBQ7
 8E74jhAdim2MzASH2n+JwPRfgH7j2dWF0ynkUNs9uAu/+NmdRj3tryf+VHgQeYqXhBVl
 h1H7qnMSOrxFq2wFxj7okYvgyO118PGvc/8EmBcVdWjnaSPRFSkpgr3riaPtzBWBRSwQ
 /oeeLxf7DeAPnPD15swKZOjxrrXEc9fGFUHebpSLUUfeJqmP3gt9wkzO6EbaMCn3fKX1
 eHxA==
X-Gm-Message-State: AOAM530OuPdTNMKrk9jddGwIoxFvQ28KoPYTW8i/QDxnAYbbEvSMP785
 Z00zndk82l5bvb/y+ce6tcQ2my/NiQk+jw==
X-Google-Smtp-Source: ABdhPJwUb8Y8S90DoMLADKYIK99LhwKq/nfL1FVyE+pg5zu+1C+GCBmZfo8s5g120lv7BqMWqhJypQ==
X-Received: by 2002:a17:90b:4a02:b0:1dc:4710:c1fe with SMTP id
 kk2-20020a17090b4a0200b001dc4710c1femr2252865pjb.208.1651384247795; 
 Sat, 30 Apr 2022 22:50:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/45] target/arm: Remove HOST_BIG_ENDIAN ifdef in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:50:01 -0700
Message-Id: <20220501055028.646596-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since ee3eb3a7ce72, our host endian indicator is unconditionally
set, which means that we can use a normal C condition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b690346469..4359739081 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8602,12 +8602,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
             r2->type |= ARM_CP_ALIAS;
         }
 
-        if (r->state == ARM_CP_STATE_BOTH) {
-#if HOST_BIG_ENDIAN
-            if (r2->fieldoffset) {
-                r2->fieldoffset += sizeof(uint32_t);
-            }
-#endif
+        if (HOST_BIG_ENDIAN &&
+            r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
+            r2->fieldoffset += sizeof(uint32_t);
         }
     }
 
-- 
2.34.1


