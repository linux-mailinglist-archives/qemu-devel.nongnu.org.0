Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D261347B4CC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:10:36 +0100 (CET)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPvX-0000TW-Ue
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqk-0000C1-2X
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:38 -0500
Received: from [2607:f8b0:4864:20::436] (port=45028
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqi-0005tL-JQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:37 -0500
Received: by mail-pf1-x436.google.com with SMTP id k64so9763559pfd.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GSy2kvUvNsh+WtyFYrRefI0IkOd8hdjsqXAQKDL2Tk=;
 b=LW/CMeQ3by9q6XNZGJoEKKHuuY729WN8kNkQiwpyZN0I+rbKoigaGX1TA5k5yCzsqc
 0TlfhJ11Z1y7QDul4rT5CnYqwAriWxp5A9gPSfkVITboEu8JcpuZxT4Xb/q+zCMs0sw/
 VW2uncAy72Q7SZm5AJOKr99yQ+HJdo4IdzXBX8XIlTefO943IJx0bM3tBpHLqVt8Hw+X
 n61IEAaIRchiLxmJN/j+O8VAuGrxDfe0ycH6QsSs3tiDo0mUk+fbKAT18VF73QQkSAim
 vbw5yRQIOzVzfHQVtgTX3E3mNyCCyp/CPaUOlj/Y03SNvj7K35jblHfq0olQKrxbHmjB
 d5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GSy2kvUvNsh+WtyFYrRefI0IkOd8hdjsqXAQKDL2Tk=;
 b=d5IP1kNnnTeG/638I82mmdt2s/lHU2gqrfBzZFAd3aCK7+8LxDk3gc70xGvS7nL3h0
 EPdGOyW7CWYzZO/0sTNk5CM0m8mBWby8eGHb0G6Wxs8+yYgD6UXXB8v7XdzUPyEOQaNg
 xO9E/s8Gjt+Zqsp+8NPqSC2/pcVq/x44/wpK6wE6yPPlMsWjVrbxJh+c0F9AwtpihqiU
 1dMQLRf/0ASP6LYamceePrFduSbxptBWtLdSiiHsc4jc9Tib++8b+QTeykyiZV6O1t5S
 heVgmiWiOtKIs95tB4ofj8/IkDSrJwf/Htk3h/9WmWphoMcIlz48nRxniX9uX5t/cCwz
 v5LA==
X-Gm-Message-State: AOAM531lieidIj1k/pTXfnKTY88xhG8wSkv3Q1oCDVD7m8+HCq68LCTC
 4oFJewtrH0T/9NbYq0Ubi+fl7YBC5GeqGg==
X-Google-Smtp-Source: ABdhPJwIOsY+VeIW+oq1BT794jChqaQSolhWxGUxNog6+HC2QVuv9C9nz8WHsb639Z6/aieXe1+gcQ==
X-Received: by 2002:aa7:950d:0:b0:4ba:787f:c5dc with SMTP id
 b13-20020aa7950d000000b004ba787fc5dcmr17695085pfp.46.1640034335420; 
 Mon, 20 Dec 2021 13:05:35 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/24] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Mon, 20 Dec 2021 13:05:10 -0800
Message-Id: <20211220210529.150423-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These si_codes have been properly set by the kernel since the beginning.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index b09caa1111..8e13f84a64 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,11 +144,17 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_b = env->gr[31] + 4;
             break;
         case EXCP_ILL:
-        case EXCP_PRIV_OPR:
-        case EXCP_PRIV_REG:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
+        case EXCP_PRIV_OPR:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            break;
+        case EXCP_PRIV_REG:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
+            break;
         case EXCP_OVERFLOW:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
+            break;
         case EXCP_COND:
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
-- 
2.25.1


