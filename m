Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9B43041E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:18:32 +0200 (CEST)
Received: from localhost ([::1]:54680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboGN-0002mJ-9P
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDK-0008IX-AF
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDH-0001oB-D7
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id np13so9464927pjb.4
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q7mA/5NMDye+T6oTs6PprYj8IGolC1UqhFN/enpkEuI=;
 b=CYRRM+1Zt4xdytFXUYebvXDMeo5Z2gTrx9RnIqxvQSzkc9shssiaNuX0zQBpXgnd4d
 LoeDoZRpf3NcRJuEK4PhhrIqnWTZ/5Gw50xP3L6W5N600bfiOiJLY5WxfSEZ2HgiFXcN
 X7elmjdkE83KTWXgw1bwg8RmL2UVHnUIn8qTtwDvUiGxkodBgNHRgsXdQzgy6AYJQdt6
 +fKTSK+yfDb3ZC8P3izgPDAQmuxW4INe5gmCLAs4d1rQM1VmD5tUTOa3K2ojXkLHDMRR
 N6ZwwPHEDX2Rus7NYLu32LbiwRw8RqVnpye99uZ5k9ZBwsd60xpnj09/bmuwzYu79QdD
 /UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7mA/5NMDye+T6oTs6PprYj8IGolC1UqhFN/enpkEuI=;
 b=36wOyTXOKjolR/t2jMKFQoebkuWhSGpi2W3kTsCPz46IxWtdwdmuKgLCPxJ8etEnrP
 9Fy0zXGJ12X6sjCthDNPEJMveaP8wnAonDDtJg7beU5RNI9Q4zU9gLF25SA50lZBSv0U
 Mq6x6OL1qqnOUxDc4EA18e241U2Ho33t/RuIMT4WRtYeUw5DZYAYAeVtuyImDYU6f9G+
 m5wPtsIBDLCeuIFyEDJ8I3F9qbizKl3HiMZzFMaEzycgVyEbdnKyYh+AaLpBY8Vq3YqP
 RfLrRzCNHjLxiPQ+DBADOpRVOaS22IGkaRZzsfRg5vqGypUrelSzfPpFsqyvCPM9gBKN
 8Luw==
X-Gm-Message-State: AOAM533bBfvu11PNOv4agnaUvsulTt0HyUTQtdwTFFfTz9qKNby+ENAg
 cP9rmh1AsZ/GrvHdDzAavgOEcAGsnpRmnA==
X-Google-Smtp-Source: ABdhPJxgIzm8HAVRP/A8eY/bPIeNWkvZjrUx66cBNrLUxb181K4qJw6tIlpEX4f/3MLhce8NyH6EOw==
X-Received: by 2002:a17:903:120e:b0:138:d732:3b01 with SMTP id
 l14-20020a170903120e00b00138d7323b01mr17695009plh.21.1634408117109; 
 Sat, 16 Oct 2021 11:15:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] accel/tcg: Handle gdb singlestep in cpu_tb_exec
Date: Sat, 16 Oct 2021 11:14:51 -0700
Message-Id: <20211016181514.3165661-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the change in cpu_tb_exec is masked by the debug exception
being raised by the translators.  But this allows us to remove that code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5fd1ed3422..c9764c1325 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -383,6 +383,17 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
             cc->set_pc(cpu, last_tb->pc);
         }
     }
+
+    /*
+     * If gdb single-step, and we haven't raised another exception,
+     * raise a debug exception.  Single-step with another exception
+     * is handled in cpu_handle_exception.
+     */
+    if (unlikely(cpu->singlestep_enabled) && cpu->exception_index == -1) {
+        cpu->exception_index = EXCP_DEBUG;
+        cpu_loop_exit(cpu);
+    }
+
     return last_tb;
 }
 
-- 
2.25.1


