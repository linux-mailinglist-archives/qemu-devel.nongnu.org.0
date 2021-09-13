Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF3409F81
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:12:26 +0200 (CEST)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuBd-0003bu-Px
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5U-0001tS-7G
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5Q-0007Pj-Qa
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:04 -0400
Received: by mail-pg1-x536.google.com with SMTP id k24so10739769pgh.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRxXO90HL6E2HYzdEuSi6drNP5S5IBktkL6st8qE9/A=;
 b=yZm2vNgcuDw2jZeuQW/ETNZm1dnH1tu2tq/k0OCqNuodirzbpNlnV7aiA1tiAFOp7P
 5pby0WnCN4izscOerys2fRplceAYZjl/OKwSasgcvqr7TtfY0Vofp9ZhzLzob85KYyOl
 v4lYPMnueniczLLxSqfT80QLXxVzM5xq94Fc7T0Gfe6N4WZK4IQrbxHEp9S3hynE3Fud
 jek9oGifY1+DVVHlAjmWTYv6Kd6qehEgwLSQgsa6WWTvm7D1UhAInlzU/ITdoupzair/
 u26DNFLBIPc5GKbbxUJT3WNBoSCr13CnBz0DoBkqn4K5Ake8shYD45XQEEQuPwPl08BV
 cTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRxXO90HL6E2HYzdEuSi6drNP5S5IBktkL6st8qE9/A=;
 b=iCWn05HX+0kZZ0dWBq3lEkmzSolQtA5atp492HVQa1mpJhtMhlPafJckZKbWZdnHVJ
 Ee31ciuDI9jl4hHILx0gff2H9zjKwE56yF6TQxpk4KdGZ4mOxtJ1V1tntmiZserZtiPG
 UFJKKvrxB0/BSTsqCl6qhg9XZHvy9F68ghKT2talWOP+RsciNsNCQfSu1z/ZTeNBtTvF
 aYkbA0MEFNuaoVtlY46JyL1sGccYvIMkZO0+XHfmuO1s1JJHPRQEBKr/i49v4e7yQVGX
 dmYITrTBGJDojlHv+GTwQSxoQWN4M/WD3vQH54dTChqb242P6C2zll+emDIFbPiri8+O
 ga+g==
X-Gm-Message-State: AOAM533rfCdsXI2Q5v/SiBtx6E5u2eb98UITMg/wMOmmwHDlDdfeY69C
 MdgGebD5VZ0AsymTiO/GgZAiiPj2AO3x5A==
X-Google-Smtp-Source: ABdhPJx6RFl4TOyxf/JqDBrmmf1qVmgXFa2ncEV+yxcBmkhEFBMbI3g6Ku9UqppbTsro0cBWeiyzDQ==
X-Received: by 2002:a62:684:0:b0:40e:6fea:5188 with SMTP id
 126-20020a620684000000b0040e6fea5188mr1484516pfg.58.1631570759535; 
 Mon, 13 Sep 2021 15:05:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/7] linux-user: Handle SIGSEGV/SIGBUS in
 host_to_target_siginfo_noswap
Date: Mon, 13 Sep 2021 15:05:51 -0700
Message-Id: <20210913220552.604064-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913220552.604064-1-richard.henderson@linaro.org>
References: <20210913220552.604064-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remap the faulting address from the host address space into
the guest address space.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f09..73c0f9066b 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -405,6 +405,15 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
             tinfo->_sifields._sigpoll._fd = info->si_fd;
             si_type = QEMU_SI_POLL;
             break;
+        case TARGET_SIGSEGV:
+        case TARGET_SIGBUS:
+            /*
+             * Remap the host address into the target space.
+             * Even an invalid guest address is still valid for a fault.
+             */
+            tinfo->_sifields._sigfault._addr = h2g_nocheck(info->si_addr);
+            si_type = QEMU_SI_FAULT;
+            break;
         default:
             /* Assume a sigqueue()/mq_notify()/rt_sigqueueinfo() source. */
             tinfo->_sifields._rt._pid = info->si_pid;
-- 
2.25.1


