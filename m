Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48E42B2DC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:48:39 +0200 (CEST)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUJq-00078M-Qb
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHY-00047O-H9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHU-0004iX-2f
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:16 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g184so885733pgc.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wpoZicnTiBlydK+sFdKdK9FSFNaqNFWg+Zx3DgtSaaA=;
 b=F3goKJDcYjAVrFgq4lCLdpqk2sIyOuqVnptOLqK62FClFhat4mwElRypmysBln4x7c
 m7F5LFV4H6eiW5AZ/D68jPj53GOBgmmlhwelhLtnyjWzo3ipLLw+4DvH0ZZrzTO8xq+g
 663BoRduFvve14z4JrBXJCNmhkkqm+9YtqGqbbChzPFbaArZnbNe/R9x6qBuXvqq/pts
 k4flv57mbNixCXfLwJQjZ8sgR1WACUA72QuwW3HTtjBpRoLXCfydAu+RCuVj91qbz9jq
 IUlYaY6eMNAQzt7TcG5c9yAQmK8qaeJcTmyyfLbjo909jXcAGeB4VHVajZfWVAZ7ZKb5
 qOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpoZicnTiBlydK+sFdKdK9FSFNaqNFWg+Zx3DgtSaaA=;
 b=LevlYXDZj8NbG7xEe0kdt1kVncdMrJBbRx9JnPTCVJy3PPPEMiNG3h4lg6uvGeUjRV
 OJ/eJm+Fh4NFUrib52yQHrzEcpw1iJLLhXqqeyKxANnd/05y7NxEV+KcXtLWjHDKXm0t
 foHCq1qKeul9fOJkyKx9JD0a73oWzoUy5MNd4oFIQNn1NwiLSwbjPcArUkEEU2Yx3ZwQ
 OEXRzZgqY+Awr+eDA4FitfUSfGcUMNS683xHoGODw51kZPw4de/sHkYp2Tya1IuXskar
 Ht8cAS+7JzDudLoYFg84k0RzwcbF1Jyh3t28v7f0w9N8F5Rmc7DDYX0Ht4h66P5wBk7V
 rs5g==
X-Gm-Message-State: AOAM532hn3eQB6W7zPwfVT+hdyqGCDvpBD7N1jSQLhrRe87c6Wfe7FD3
 vPepWAn4jTbraP1UpF/TTokP/UOdXM4=
X-Google-Smtp-Source: ABdhPJyT2GCvUNORGCw+3SY/0UWooAPDt+F3jbBBzMDzD4eBtpfQggrXGImb405ycXX+TFM8AjhXJg==
X-Received: by 2002:a63:7d42:: with SMTP id m2mr25763912pgn.349.1634093170740; 
 Tue, 12 Oct 2021 19:46:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/48] hw/core: Add TCGCPUOps.record_sigbus
Date: Tue, 12 Oct 2021 19:45:20 -0700
Message-Id: <20211013024607.731881-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new user-only interface for updating cpu state before
raising a signal.  This will take the place of do_unaligned_access
for user-only and should result in less boilerplate for each guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 8eadd404c8..e13898553a 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -135,6 +135,29 @@ struct TCGCPUOps {
     void (*record_sigsegv)(CPUState *cpu, vaddr addr,
                            MMUAccessType access_type,
                            bool maperr, uintptr_t ra);
+    /**
+     * record_sigbus:
+     * @cpu: cpu context
+     * @addr: misaligned guest address
+     * @access_type: access was read/write/execute
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGBUS with si_code BUS_ADRALN,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide the signal handler with
+     * anything besides the user context registers, and the siginfo_t,
+     * then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu do_unaligned_access code,
+     * @ra is provided so that a "normal" cpu exception can be raised.
+     * In this case, the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigbus)(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


