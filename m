Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE616071D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:15:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnBL-00008K-D0
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:15:07 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH5-00039J-6m
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGw-00033y-9X
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGu-0005fK-NL
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:49 -0400
Received: by mail-pl1-x636.google.com with SMTP id l4so1565481plb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=EfeGSJN5LIhg5P+Ac3FuxmvuWKqRbCNdRXXzUEEng4lzd0Dnc2SBJSjZEcQ7xZRHcV
 NVNeThNK+I6jEFlXktISA7aKos0ENj1/t4plNIckQHdrdapFPvfeEBl4niT8Ud/eyfqJ
 6bNuRChAEYNbk46dhkuE6PhXr+O4bJXke0JdZwCksIigrYD1t7KOxScJFvsYYrSdIaUj
 JqixMuF7Wl4LG6t05FpuUfJqgLb/dPD4dXjw6zlCL7KAF+JG1d+weSlto02bBy0lWc6Q
 G3BUiCcSmxLlF7s5hBCfoTCqTJrcf4P9Ph2UDQmkmSr53bmPRvKLatNeiVaw5D4j6mJJ
 oEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=5VWhI0n2EPn0YXNuDBVMlqzlDuXlAfapAQ2gNC71t4Z3a3g63gPkxFr9ZwvelTPnCT
 /rRTs9hnwLgsR878VQ81zsXsjnX0aUBg/OfI7MNZeTGGF3EPnvRKQOxxVe3+TSqfdaEi
 2es8h7vXESf7WuFOzKa94YaSbLMkSZ22V8ZKzAzKT1tqD5vvz8dWgJUNRMfqy/FB25kM
 M9Z6ZLbLRITRJ5M/nmBSRyBoZLBetjVizGAsFJ8JZ+J1w922tdIIzpAKAex5hoKhD1bn
 MMC35wpL7YVJMvg3GJW0+CPKXlVwI8VtvjNUT3Ik/CS5bWTroriFRybyd4aIys4aLcBU
 EMUA==
X-Gm-Message-State: ACrzQf3ble+M0IQgUAZ7WyvfkGHxlpHkCRqFOr377mioyqX/Kh+Aj7FN
 vccjU9S69zDCB7wrvuNKcPMRR46+dtfS2XNv
X-Google-Smtp-Source: AMsMyM6ZZ8uwxVUssJYFoiI0aynJfeYUtKGIvorm5BkZRpzN4HiAzG7U7hrlOz9dLhoUaeEz6X7h+g==
X-Received: by 2002:a17:90a:4607:b0:202:e22d:489c with SMTP id
 w7-20020a17090a460700b00202e22d489cmr57407036pjg.80.1666336607257; 
 Fri, 21 Oct 2022 00:16:47 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/36] accel/tcg: Set cflags_next_tb in cpu_common_initfn
Date: Fri, 21 Oct 2022 17:15:21 +1000
Message-Id: <20221021071549.2398137-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


