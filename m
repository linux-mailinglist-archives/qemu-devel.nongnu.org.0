Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC981565120
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:43:16 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ibs-00061m-21
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITi-0000yC-Tj
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITg-0004zX-Gk
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:50 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 9so8441175pgd.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DK+o36Kb2qI9WXT+tA4Mnr7sNiWthsvqHNWaprqXJrY=;
 b=xz+lRHRzVw3nsEdp2BMdCv0SlEaF53WHj/gSEc3giXJkAjs5fw94wofm/zKp7z3QKZ
 qnjERsowGhY/zoEf9AubwYHtdGsHSgFgsuy1KstTj6iEQnPc86C8EwU3QjDtKB5T9JqN
 DAp4sPXSgOETzhp8h6uKNdNKFujmLksqyhZEv/wUtdofpkAcysqXmdPxdPmGMzRcK0Zv
 p6kDVm1vHK3Boy0CoaqhptE2sWvpNgWIpHbodGK4/8xRbl2M8UcYsPRjw4UCG6/JX7U0
 +NAF5pechy3pEgOt1GmkqNkh69WQtmpZDAZ9DDB1FqyR86BLokwy3TvsZh5rhdz1wp0Q
 /OeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DK+o36Kb2qI9WXT+tA4Mnr7sNiWthsvqHNWaprqXJrY=;
 b=1ye+9zRUG1mqCJON22Rf/0j6VVE8W0nh7RAfy2BH0atAMeJOq03DNn41KG9WlJfZnu
 jndIpIlPKGl94kyxWd4Fw1crtpU/RslNbeif3EvEvcx0sudMxuVv4U4SDr4rUSN6cJpf
 3kOxZztpwQDynNjv3lVYhyCVOwiWhmxzOn28NncUGxLvKMkwfCWm1VNAouMW3W6bOd3Q
 Iny1At3YxP9jSwtsh5Wtep+ghH2RE1IPqlfjfWbL5FPZMJQpdvx9aPkXm3muyOxFucgh
 z5VSmzqtoZHvrkSdWaZO7rj2UDvmNc4IJUygrwVwT+CkK66d6WwzRKiPXpKk7Zx+s4lV
 lFMA==
X-Gm-Message-State: AJIora/hYTIOjl8DlejxlXdsFSXI3nYjhUtGgBiDfEtoDdrsJbydeXPg
 Kua/1m6UthOqhKuhlusYBkuyi+fEYah3SeXI
X-Google-Smtp-Source: AGRyM1uCKpz58wxYCgizV+4uWunfa7daeX2wsBGyxnimRnRMHRhM7Bmg2rZlEUDdOKePgnLfs19QbQ==
X-Received: by 2002:aa7:910b:0:b0:524:f8d9:a4c4 with SMTP id
 11-20020aa7910b000000b00524f8d9a4c4mr36336103pfh.5.1656927287219; 
 Mon, 04 Jul 2022 02:34:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 16/23] hw/rtc/ls7a_rtc: Fix timer call back function
Date: Mon,  4 Jul 2022 15:03:50 +0530
Message-Id: <20220704093357.983255-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Replace qemu_irq_pulse with qemu_irq_raise in ls7a_timer_cb function
to keep consistent with hardware behavior when raise irq.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-3-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index b88a90de8b..780144b9da 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -425,7 +425,7 @@ static void toy_timer_cb(void *opaque)
     LS7ARtcState *s = opaque;
 
     if (toy_enabled(s)) {
-        qemu_irq_pulse(s->irq);
+        qemu_irq_raise(s->irq);
     }
 }
 
@@ -434,7 +434,7 @@ static void rtc_timer_cb(void *opaque)
     LS7ARtcState *s = opaque;
 
     if (rtc_enabled(s)) {
-        qemu_irq_pulse(s->irq);
+        qemu_irq_raise(s->irq);
     }
 }
 
-- 
2.34.1


