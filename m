Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E51160643C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:22:38 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXNP-0008Sr-5B
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXMy-0007ru-TE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7I-0004Fa-AV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7G-0000yZ-Pn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d24so20074201pls.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=ytVfOy4F4qePykXFlVDdDEgi9sAAnSZBx7G42avzlxUlzwN2OTblxrtBqDgpdfYezo
 Vz9Sg7nI7tKEK634W+xc+9gtdJCBS10lGa1sw34jA0MoMk6zZ7ou1+xzkOv5811k0JZt
 YaqpFSxcXQWNTX2wZiW66/9bTn7XesVNX6c3FwQaA928FinoxBPnf4ZtvmpsAzrD5PvR
 XN0YoXJaa4T3vURxykeMm8Evy58FYibFjJIek7QdtiYcr2GUPkHsu0AVR1pSg/cx4g6N
 A0pb0zrYpSEne52/+pE/XNXR2LTe2j1775V4q/NceLKEwJw5d02GYLPbBiCQtSB3oV89
 79pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=Cp5jltbyKvc2VyeAFZ3zyYFPtQXbwqjfYSoBuBy3q3V39sF8h+QWTK/aKBgNd6V7K3
 bTBgybNFng2e7A1KyuJpjS/gZBW/fPMbU29A0D+WFlxF97Cbg9sjNHCIAwJOZzHzk1ds
 pf73kae22ERSt3g/BW+Z4sjfdVzWyGO+727ngn+A1KgWmME1fBmAqROmI1KOpuiVpdTC
 5+NuFbV2MCSJzAPsPJcM7ILjZ8ePM/B0aS0a+KG0m5jJz+xVlHIytVBknoJowEYiDev7
 GChOKOBC4J+SDoq4JoFtO5zm4k3wWTi000EA8aEfLBUgwGdeJEr/T/9PzE/wQtCXmJIO
 D1Eg==
X-Gm-Message-State: ACrzQf3rYS8sSPawA91YbEuoAOqWvDSJ3N5O4YmvXfzYXjc/1B758LHI
 TZ31FRBMoEQ05rSRQXpT6ILQERz/fAF/hYa4
X-Google-Smtp-Source: AMsMyM4URK1WwnXBmiEmuTobA7o/LmDM3khSIEiVkGJ0IHkhy5rxjpvsaVmXuwc2i/S88XI0N07+Jg==
X-Received: by 2002:a17:902:a416:b0:178:a030:5f94 with SMTP id
 p22-20020a170902a41600b00178a0305f94mr13697736plq.162.1666266817360; 
 Thu, 20 Oct 2022 04:53:37 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/31] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Thu, 20 Oct 2022 21:52:18 +1000
Message-Id: <20221020115242.2301066-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

While we initialize this value in cpu_common_reset, that
isn't called during startup, so set it as well in init.
This fixes -singlestep versus the very first TB.

Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..6a4022eb14 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -235,6 +235,7 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for softmmu */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
+    cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
     QSIMPLEQ_INIT(&cpu->work_list);
-- 
2.34.1


