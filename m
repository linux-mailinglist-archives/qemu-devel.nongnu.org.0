Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57044E1D0B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:16:26 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzAH-0002xh-Kj
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:16:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5s-0008Qv-Nx
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:53 -0400
Received: from [2607:f8b0:4864:20::632] (port=38695
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5r-0003SE-AV
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id n18so10885288plg.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=45VpLy6jFhpJxRzAu/NUCd+ixVE/bvEmVYHxJFdcwEI=;
 b=AqI/QYvs1iFbSj6GhvU6rcWDKefh9916SfT7qzjRMFTUTGqmxe+lcZX+B6W1+8Mtn5
 5IdZhMVGEcLTLG2SHg2SxIubRoJ+cE3/LJ1qG69zl9hy2YBVTpru9fEU9+L2Xqt2kOfk
 Ut0NiYTvjgZHILqj9QmB1vqwdg8g9X1/KnjQNEFNmABz9JhYJoiCsJQFHRFw5nWWNw64
 smcvfzZ9uT1k1WFEtyJLBXAMcJCj0nPL8OMjk5VITNRtVGCQC0y0gOYnoJcG192lhRQm
 VnDGfg0QhaaVlRUrDLVjRdX5L1KzrQbLVD8hnuBaFy6F+aXcon2x2zEKfOGLu1l5+0Ix
 HEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=45VpLy6jFhpJxRzAu/NUCd+ixVE/bvEmVYHxJFdcwEI=;
 b=nbOopZ5GUk773eUvoQJvBejEhw1Ymrqhj9frvV3A9BJ9ZRVoIyP0z8iddlz2oYX67C
 xchxDxnuLQBksk26uD04RNWwtPDH/ino00U5P/RWiC2D7KYyChX++IrjFlqKpsVwAjDo
 lMy0qjY0DfDVwkdz7V00arY7vSthKRE5itHqq+NFeq5itjphVzGikDanEuDJzMI0xo7T
 GxfCdzJYDb04wK2kY2VeXleGYiBcZxAvrH0UEWILL3aJwvQUNYi8GDci0Ud6T4Vlp1MB
 SxlD55+ZV2y4Cgt2BMcDJaFVAvaBieQQfgTxQP+Cy9nFiXpMaeSyw14XnnE+gXV2YT1m
 EBBg==
X-Gm-Message-State: AOAM531FHpka/AAAXqushbyWLmGqVa6/bJMztJ2/bf50+3duoD0LuDoK
 jiq1vOezIKQlJG3LzFh4f5KUEp1K7+UASA==
X-Google-Smtp-Source: ABdhPJy2VkBCGMRstskuQMdy8qhP+OttTjsj7mQ2QsWZPwpdf+l8IaLlRFdXV4CGlXsTJtlVUpVduQ==
X-Received: by 2002:a17:902:ab10:b0:153:b520:dbbe with SMTP id
 ik16-20020a170902ab1000b00153b520dbbemr9314935plb.55.1647796308606; 
 Sun, 20 Mar 2022 10:11:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 13/36] accel/tcg: Use cpu_dump_state between
 qemu_log_lock/unlock
Date: Sun, 20 Mar 2022 10:11:12 -0700
Message-Id: <20220320171135.2704502-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Inside log_cpu_state, we perform qemu_log_lock/unlock, which need
not be done if we have already performed the lock beforehand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7bc489101f..8b7d6ae9b9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -225,7 +225,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
-                log_cpu_state(cpu, flags);
+                cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
         }
-- 
2.25.1


