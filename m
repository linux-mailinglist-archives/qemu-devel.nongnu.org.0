Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C74E1C7B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 17:06:26 +0100 (CET)
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVy4X-0000Z9-Ai
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 12:06:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyi-0005L3-RQ
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:33 -0400
Received: from [2607:f8b0:4864:20::1031] (port=33794
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVxyf-00066F-VP
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 12:00:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so6004589pjo.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 09:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psn5p0gK6p7KHbN3cFd3zZ4fpGBd9MmHd4e6lUYOqhY=;
 b=yfF5jeyiGeNfNlAYAkPOMcSogvdBikfe2J6CDOXR40uYh453cNaDCE2F7p/mWbiIvi
 XxIIak/tfYCRq2MkF1z4zqTBDJADhOsWV4VnwU2lwld/4VogmIa85jb2Ji0JmAYHsxg5
 LbslFjEffyqhHcTQqhlDQ1hmUPVhHoQKA880s7vDCqc5r/ZOFYkU6LEFj8IOyi3stMUg
 vC21HUhe51BXxOmAbaRcFvRFVtJyZx/qqEUE+9dnVUv5saRydAGplptxOGYfDYujjT9s
 kQPCvf9d3Zt8S++PzAjeu+74eeo9xcqJYxpdZpl9sVKEP1hvILvlMeBQQ2lx4Xb1eY7+
 1E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psn5p0gK6p7KHbN3cFd3zZ4fpGBd9MmHd4e6lUYOqhY=;
 b=4bAmmntw9YfN7/9dHJ8wXYS6Xrcb6tQbGzr/IVwMhlUMGk8HZwTKQEwU5FHJYl6/TC
 59QPKkZ027Rj5b/OpbwqP5SPU4cyfSN8SSZYdAN4kERRWcz70n1U0SyjMiQzsbx8Ljf3
 7qV7YdnYpF/fO5S+KXDOkRV65TFXaCmIW5z58DlfMTXgbx05CTJtZbmXzQX/GlvqYzep
 hqoyMbhBOn0TeMtn5uzJ9BI+g7ICmwARPiO/Ir5L8iC4pcGoE9NDcccoCXuiLk4ZtPH/
 49SeOnwMJuw8k7VDSy8QV1uOkrPLDDnkDOAIL8tMFP4geB+z6lufKmoNkLqn4izAf32X
 jrrw==
X-Gm-Message-State: AOAM531V8VbVYok+SUNFBwbDROgIabHuQ6KRiVXmB67XZCkXziAUSmR+
 Y4yObd3fKVnMHiKD7MBkRlsFnijCNuwlxw==
X-Google-Smtp-Source: ABdhPJwfu1lIkSy4sTwxV7LpkOXhJgUFwxdVn58AJJsjMyvbWvtbswTYK5ELQvzgMCKUpFsa6GsOeg==
X-Received: by 2002:a17:902:cccc:b0:14e:e89c:c669 with SMTP id
 z12-20020a170902cccc00b0014ee89cc669mr9254784ple.58.1647792017023; 
 Sun, 20 Mar 2022 09:00:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 j23-20020a17090ae61700b001c6bb352763sm6590099pjy.52.2022.03.20.09.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 09:00:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] linux-user/nios2: Handle special qemu syscall return
 values
Date: Sun, 20 Mar 2022 09:00:06 -0700
Message-Id: <20220320160009.2665152-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320160009.2665152-1-richard.henderson@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor QEMU_ESIGRETURN and QEMU_ERESTARTSYS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2ae94f4a95..d12c3c2852 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -48,6 +48,14 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
+                if (ret == -QEMU_ESIGRETURN) {
+                    /* rt_sigreturn has set all state. */
+                    break;
+                }
+                if (ret == -QEMU_ERESTARTSYS) {
+                    env->regs[R_PC] -= 4;
+                    break;
+                }
                 /*
                  * See syscall_set_return_value.
                  * Use the QEMU traditional -515 error indication in
-- 
2.25.1


