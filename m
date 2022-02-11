Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B54B1B58
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:36:48 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKrf-00078H-CP
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKn0-00043w-II
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:01 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41763
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKmy-0007Ly-Ml
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:31:58 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i30so13464304pfk.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/kq1VLDBUuq/DLan4O/EIkXf7LdPRXYo9qN4abpVU4=;
 b=fAvGcWmq1qJoeLvI9LiX/8ZXJOX8SDK9mtlbXZxLSkAA/17ESYGc0F2n6fa+scn5y9
 dXizSTnPRGl9GXYC0bH0Nv0adJiyRfPfU+rknaAWSdg9W1vvRrtfHFwoy8oFnA/oz2Rm
 f9O19Fai4pia96t1ydozfkNn2M+Q3yJhJ0o/ltqQmRd7Y/yiB2xYAJk7s2A/5wDu4poQ
 WeI7kaaagwp+i26ZTIcHrxTVSoyu8hREi0VsQd650vV2/BNEAhn/l75O9NJei3IhlTbq
 WgGskqBmhexm4oQGsDDYYmwJgpU3g6Fy4AcEmG8JArZcybbvaq6Nc+3cWrhSoCfPCy63
 6J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/kq1VLDBUuq/DLan4O/EIkXf7LdPRXYo9qN4abpVU4=;
 b=D+atSaIyfJx4LAjPHKuZcX7I+YuWq88dUYnarrSpw3xfzwZ1947KR/2ixO9qLygB6h
 /WWD3PgYFIjeCRBbH0Xuu9smCnf1+ihm/p1en2Wf4+vc6ojfmu5goZoF5XmcfAdeC81E
 2vOES/JBBf0CX/oxn/12qR+hMrm6LhlDVbCYpw54foKbZv2zqZYWYs9h6Rx3jtgpAyDi
 55V/gPqbo6Hkvw5WqsXytWM2rCBzYcYhTmomcvKzAAWtO2uSoJb7g/mU9JaL/jnl58uD
 MBI2+wtLuNBMolz+GacFjnO1WcJvuS7p7rudJ7I90p2AI1Sw8xVWO4moP5N2KFXUGY9m
 gzjA==
X-Gm-Message-State: AOAM532+tnWaBM7zUDoHH93ioM6qL2MpBD2Na0191jB91NaLUw5bbmgD
 FHwln6I5K3QN+ZEklX/ggRLZVOsxnNcchK7V
X-Google-Smtp-Source: ABdhPJw+xWfhChOjxvr03alMLM0T4GCKpAq9xWyYo95bDgUO+ogX7hVW5ogtLoocHkZ26dmb+4cyvA==
X-Received: by 2002:a63:6842:: with SMTP id d63mr8133234pgc.213.1644543115553; 
 Thu, 10 Feb 2022 17:31:55 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:31:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/34] replay: use CF_NOIRQ for special exception-replaying TB
Date: Fri, 11 Feb 2022 12:30:33 +1100
Message-Id: <20220211013059.17994-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Commit aff0e204cb1f1c036a496c94c15f5dfafcd9b4b4 introduced CF_NOIRQ usage,
but one case was forgotten. Record/replay uses one special TB which is not
really executed, but used to cause a correct exception in replay mode.
This patch adds CF_NOIRQ flag for such block.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <164362834054.1754532.7678416881159817273.stgit@pasha-ThinkPad-X280>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b4cd6c59d..8da6a55593 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -648,7 +648,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
         if (replay_has_exception()
             && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra == 0) {
             /* Execute just one insn to trigger exception pending in the log */
-            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT) | 1;
+            cpu->cflags_next_tb = (curr_cflags(cpu) & ~CF_USE_ICOUNT)
+                | CF_NOIRQ | 1;
         }
 #endif
         return false;
-- 
2.25.1


