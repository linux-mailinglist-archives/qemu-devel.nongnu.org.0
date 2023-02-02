Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A968728D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNq3-0006Cb-Sb; Wed, 01 Feb 2023 19:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq2-0006Bx-BQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:30 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNq0-0000RF-Nm
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so322140pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFLcl0DGfL7ktN784kj4RpjY2aQN3i68UXxSw9t0+sU=;
 b=LTHPaJToAbmJ9qdCP0Z43xztt4mj7zGNbTB1iCGdIq1O6me0v0VATYBvHuwHhSa2S5
 vpPhr/4K1t2vwmC1Pp4BtoFtyLzsppxSoLTicAETvLdodIzXllZxRS8/+zw9B31ykV8Y
 zdSCAvnDDK662tj/Fi7QJoIXWCMtWeHHLief98Gz1JuVtrgb/HMB21ruwibRixsh0Iz/
 ERtO06aAGZFL4KcbGLZSrHo8728++a+/gPOZIve5iveHEUuivtne+IFm7y5S8qKqtOJH
 y/STMkAHOpO9kOG0T5s6vXuw4CqNVZhPkBswDVMWpYW27k9zOYG1xObFkmOAdI+P5u4r
 QnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFLcl0DGfL7ktN784kj4RpjY2aQN3i68UXxSw9t0+sU=;
 b=c5MDi5WuiamBp9U/T+tdIq5lmWJvMlvrX6/yDBDemT/i5zA9CrmjcqF6RZWpdVT+Mo
 9q6pwkMQBMC78an2oYPIFSe0hrBWPLfFG6ebctPnJwslfn/X04Q1zLTBQXjW1EI5FjQu
 OWtkLtrVtravYh5yfZXrCIOX8zYZQJKqmjCwbwovzy+0O/OjajntH7JQKZevwyueGffo
 G0f3qrC4yVggSMnz1wBmpuF3YBt5K/N0Ym4586+tRM+7jLYnADPbIhXLNzy1ESTtwXPP
 K/R1zKADYJwTX++qApM+DzdAWOU2Hj/BpR4hd8HKWs1fY6hAF5w76JRcioiB7SUvlryB
 ri6Q==
X-Gm-Message-State: AO0yUKV8khNhKACtjjZySUbrf3lGNiG4TTHemJxlKFSedFSkCKzWwUY2
 PyRglETWaAWLA+hAahYi2zOcZP+ll0buywsS
X-Google-Smtp-Source: AK7set+Mxfwun5e+JPr9x6do4wvyluVkInmlvRx2Tq0sInCb+bTyFAKEOODGTbFCYOe5GLyIrx0Yew==
X-Received: by 2002:a17:902:c7d2:b0:196:7669:2585 with SMTP id
 r18-20020a170902c7d200b0019676692585mr3031232pla.57.1675299147519; 
 Wed, 01 Feb 2023 16:52:27 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 11/14] linux-user/sparc: Handle coprocessor disabled trap
Date: Wed,  1 Feb 2023 14:52:01 -1000
Message-Id: <20230202005204.2055899-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since qemu does not implement a sparc coprocessor, all such
instructions raise this trap.  Because of that, we never raise
the coprocessor exception trap, which would be vector 0x28.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 42e92ef859..8985d10ba1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -315,6 +315,10 @@ void cpu_loop (CPUSPARCState *env)
             /* Note do_privact defers to do_privop. */
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#else
+        case TT_NCP_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.34.1


