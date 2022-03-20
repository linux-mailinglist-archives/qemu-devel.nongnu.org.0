Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234244E1D09
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:16:25 +0100 (CET)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzAG-0002s9-7Y
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:16:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5h-0008Jc-QD
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:41 -0400
Received: from [2607:f8b0:4864:20::534] (port=43649
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5g-0003Ps-D5
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:41 -0400
Received: by mail-pg1-x534.google.com with SMTP id c2so8730734pga.10
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/ctxNkdA4F57t1BuSuDblrpi1g8LEQZufq5SItlXL0=;
 b=FTL3iscay29zfTO59XP5jdSUPfXHxDQfZdKkj6nIakoCG6zEs5DElh8MOkziyJq+z+
 u3/XHQHMEbSpO/TZALlN7aNtXR/wev8yeUJh2MIKMlZCkgmMddDPWKIbSQ96vGD5ciSN
 jcFvzzbP8I5/goeybHnwWnvhvw5zqKF+vDRomZD7ptJy//NGXAk50VtvoiNesuCv06eb
 Xa8A2eUjyjcbmySFZOD89TGzcGMEfKNi0d7ApYeXPrYu4Vd4Bt6PETp0b0C5kRJcHqWU
 r/MFxBpBqZqDKno8nLWgWCRhLhlRs3FOt9bW14omwJunqYMwwNqhc3JBnyAuAo2ZxAoY
 OQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/ctxNkdA4F57t1BuSuDblrpi1g8LEQZufq5SItlXL0=;
 b=TsEenF28HVEsiXGB2gnJHWjqAyaSPSck0A4dXwWL4eMS6xu4juC3HcVTAHfAHma2dh
 NZtZGYQPFL1COlFcGTiPKdoWSsXtlob9LHeRwBeFjyGGN/gwS/mu5UrAtintTQuQC3Np
 vmveODr7bQsI7O0qNVS3cxK+oMWvGcFKbSx/t35tM63UV8LAbLkKkQDi22uAWCZIRIxZ
 LoC3HLQCvKhe9ccjxUWfMBKRvSrMT0oGv90KUYEaDzm1bM0hS3FCe4cRu3/aAS/ekNt8
 QuRalT0jyvwgjeaL9hykxYE7moPCwQ6M81MRaEY8qT3xEvql0VXI2dHfBb+Z19H7KNBT
 Cgdw==
X-Gm-Message-State: AOAM530XSphRyv3tEv0XvXwgTK+esC2SGlo046vf4p27fOpAeCduhBeN
 hfS9o87VK4pKka8jqGDywWXc9eZh91CBbA==
X-Google-Smtp-Source: ABdhPJysiu6cMrwmBO/wFmsFUFQJNjytov2KyNUs6pot+UlXK0fezKTEY2hQQdUR6mFzVPr0s2mAdw==
X-Received: by 2002:a05:6a00:1799:b0:4f7:37cd:d03e with SMTP id
 s25-20020a056a00179900b004f737cdd03emr19951563pfg.10.1647796298588; 
 Sun, 20 Mar 2022 10:11:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 02/36] target/hexagon: Remove qemu_set_log in
 hexagon_translate_init
Date: Sun, 20 Mar 2022 10:11:01 -0700
Message-Id: <20220320171135.2704502-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code appears to be trying to make sure there is a logfile.
But that's already true -- the logfile will either be set by -D,
or will be stderr.  In either case, not appropriate here.

Cc: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index b6f541ecb2..98f1452cad 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -874,12 +874,6 @@ void hexagon_translate_init(void)
 
     opcode_init();
 
-    if (HEX_DEBUG) {
-        if (!qemu_logfile) {
-            qemu_set_log(qemu_loglevel);
-        }
-    }
-
     for (i = 0; i < TOTAL_PER_THREAD_REGS; i++) {
         hex_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPUHexagonState, gpr[i]),
-- 
2.25.1


