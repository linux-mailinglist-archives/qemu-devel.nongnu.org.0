Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B584E1D1F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:27:20 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzKp-0003WE-Fg
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:27:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0008U8-Dp
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:55 -0400
Received: from [2607:f8b0:4864:20::62d] (port=42803
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5r-0003SI-Ay
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id p17so10876541plo.9
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gN673K8AiC7tUSgFbelgmQvdK3DgFVdFgWV8e2JASA4=;
 b=vyd/vnm5J3FNcVJHa610l2KBke3GWQFNJd18+GQ3c66b9V5FOW7qkRjP+YTOHmx6F8
 NRPRhxrQDGPw6l7NOXRPvFK7tj5YOW+H7AH4Nkxucm0wSL+VvahhzLw90mdeToT2Lwkn
 ZnjacEb3PjPW/xvQZA+WdEtsGl+QguL8NUvb9gvwqmaUhDhqMGO+sY1ZL3YHdZlreC9d
 i4fXuOdFZk5N23cJO8Zm4Mhd490d0ey/QY9t7MW5MbS6CezvsDSed5NHKOnKxYexkt+5
 0TUeVufhPm/zz4VCI+8RFtKjvnOBoLTqGNBiIYjoRCVQWCchCX7j3weZp0rZYBZe1hbA
 bpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gN673K8AiC7tUSgFbelgmQvdK3DgFVdFgWV8e2JASA4=;
 b=smTwemENyfsSpoEhoHmOVyrp2wi/8C/Mlrm3TBoTYTQ2KJI77kaNaxRFGMJaXE9cda
 Nb8EXBsQ362OI4U/pSYBfRxIFbHif/zW+/4/xTLGWBCxVZg3kMUfAbCD2I1Gla7OMFVS
 d5tLGrA2IL2unhpAfw/y7EzH5SU2VEW/F9ZV0319vwerMDRWhQFi9CUlQPF5es9wR2lb
 aRSyrfq9Arwouee+pXk99gbtFocMccGto/lj9pT2+yDrc6iEDhV/uQsDnrE4rWfn1DiW
 3e6N+bskEANDcUAwQMLMd4O/DkYiq8t047S00ha3kBnNmvB9VRbDRmziP1OLgfps3anK
 Q/Dg==
X-Gm-Message-State: AOAM5326rjLh3XpkyzbVgitJyY4AvfwJf3hl6K3q5nMKh8AExVk/pzqh
 WkIHOxVazB3yKm/dZ3GZvzoz2Hw9EVgFAw==
X-Google-Smtp-Source: ABdhPJwloAWDmSYgQ2YqRGBNEwV16KyAfzOCIt0sZEcq9zbK8+SINGBIHlMrpq4tcywTPxwWL7fluA==
X-Received: by 2002:a17:902:a38a:b0:153:c6e:4dea with SMTP id
 x10-20020a170902a38a00b001530c6e4deamr9162477pla.110.1647796309426; 
 Sun, 20 Mar 2022 10:11:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 14/36] target/nios2: Remove log_cpu_state from reset
Date: Sun, 20 Mar 2022 10:11:13 -0700
Message-Id: <20220320171135.2704502-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is redundant with the logging done in cpu_common_reset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..b0877cb39e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -46,11 +46,6 @@ static void nios2_cpu_reset(DeviceState *dev)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    if (qemu_loglevel_mask(CPU_LOG_RESET)) {
-        qemu_log("CPU Reset (CPU %d)\n", cs->cpu_index);
-        log_cpu_state(cs, 0);
-    }
-
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-- 
2.25.1


