Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52746442D3F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:52:33 +0100 (CET)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsLA-0003ZE-Fk
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh9-0001JO-C7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh7-0001x6-PL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: by mail-qk1-x732.google.com with SMTP id bj20so7959062qkb.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdBbkxzZXl4V2J/0UdfvZmZe+nM+srroKJ9DSgm4Qw8=;
 b=R2nAmu+2sfXJth/YQdIWrQKcoAIz3txBAwnM4XJp0PAAGyASC+ocffR2dKOUdbqsN2
 tdAerzBC4yQSIgXhF25CP7Cuk8HnhViPwFr3IVfN+vxYnks3nFAOK2thH8GiaqxQQutB
 6urHjz7xqeIuJGzzmM0CG7bNDAXPSrojjJfmogqQc8oDhta9sis8dyb9g730iY/O4zHM
 AXHaJdOe9l6W3ZdA+D/upGRZdQbirt0g6SIZQNzZx+bFLBsr5S0D/fCBkmtPkDy7oQKY
 lujcoDPtcRVyDsRl1sdz75eXsLdwm3E1mrBBBKkwlCJLoKYZSbaEsIsHvVtaPgm3qdA6
 Nfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdBbkxzZXl4V2J/0UdfvZmZe+nM+srroKJ9DSgm4Qw8=;
 b=xqmA6m1iN4tPQTd5XZFFppJ0yICJt9C6PVDkepkEscYWY9EdCqK6RX+I7u0x20mDio
 qDp84z8Hl4r7QJec7VlMt8q5I7yl5DZfgFJ7xo6cjimZJUyWL/fXPjQpdw8EGHRZ2/TO
 Q9TjE1V7L4u6o9AeQV6kDjCbhV8/SN2Z+02JwSe2cTAFPG+Q8GP71jL5016fpCgH48Bo
 BHR99Kv+7pb1ZyPjTjG2hDGcdktWBZpOec7kOWLyNbfjPpJNw/nflCS70QvZcPsM3UYj
 dauklL3bx2pxKZCc/yVXNqPS0TEsczoEwt3rdKPua9vuTBkimKul1dbQtSBSVaKqJtNq
 cFWQ==
X-Gm-Message-State: AOAM531jdk0KQHoyyKCTjmwFJyMyV1j/scsex8aVTQzXPS9uweE+9nhL
 xtJK/SpJbYIUtRU76sQiXXZ6LFwtzxMnyQ==
X-Google-Smtp-Source: ABdhPJxfOYKzR6qn7RPwd9uzLkTR2APlQIW1TNZMkGamxGagKtgL1uvqRsphq6tqsJBYYS20kQRscQ==
X-Received: by 2002:a37:9404:: with SMTP id w4mr28877752qkd.469.1635851468984; 
 Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/60] linux-user/hppa: Remove EXCP_UNALIGN handling
Date: Tue,  2 Nov 2021 07:07:26 -0400
Message-Id: <20211102110740.215699-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index e0a62deeb9..375576c8f0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,13 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-- 
2.25.1


