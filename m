Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1C442C3D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:10:49 +0100 (CET)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrgm-0007C9-LI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreB-0003nW-QK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:09 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:38521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0000ul-IX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: by mail-qt1-x833.google.com with SMTP id h4so17862350qth.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=ndx+nxGalQGcx8gHIpf2cIhBhNdI6xfbGIUmrVsQcDzUHYzmvh/tkR72RWjIzni/Z6
 GVElS6F93n9qABUq7aeF6B25hAgM2paxRbdDEHuz8YfhJuHF+f/5ulBsMmXnMMUuzwXt
 IoiV02rTxend6uO0+8NUmsMj9xkDR03EsSz1lUhXAjkR31Q0hWqRckLey3uyOZ9el+9H
 wZ0zFL+tXi86iGXYtLIO4dZ92xTKk1HUGJH74rgXlwdR6LoKanXxuv3Gd5pCxbFtN1FY
 HD1JChHVRsMOHO6F8t9Kydt06VJxbpu336/oykXBUos9bc1Toa4mK1ugzXTECpATjq9B
 fKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p8GaNWW3vnRejpH0QBiQY2hh87QfB4bhIFphc+bCE2U=;
 b=LfEaVHjbzd3N7HAREdO3VuTW/y6IbEadh8ekfPtTVhQfFk7CCgMllxSerpSp+d2HWu
 aI2HTfNW4mLkezo8TKiQPzUpVuFHMSfFA+SwOPfHLJbktcBEBxyciKuEDT8c3fhGWU7u
 D8ltprh1BDfzxCmzxkvI52Iu7A+0ML5o75C/b/IUdx6F6CcdA0fH99gAJvg5X6oXcknQ
 7Xo+AT4Xsp17Wp9MdBzC3VSoMoJGEQUHSd3jwoMaaHrRMZ4uUks6DjUdzbCJbGiMcRtp
 44qm1H1gBCETmhPs8xuaP/Nbb3qxIjzOfqHRTO9E8JIxaA01B4L0N9B+6rPXPKqvHlF1
 VDAQ==
X-Gm-Message-State: AOAM531ujBYT3FYz060rOQCjMyw2eqpgLluloRTlKW/rsUlvHsVNeNe3
 FATajBitFvS2d2LsqQvoZEzXbjsTw/3pUg==
X-Google-Smtp-Source: ABdhPJyErmMcWZfB8WqoUtjtTWWgZMS9JiTWZqZCq6r4lcZEay1JosDD9m0d6LVqrWgV0Ofd+bThrg==
X-Received: by 2002:ac8:5dc6:: with SMTP id e6mr37116541qtx.174.1635851272809; 
 Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/60] hw/core: Add TCGCPUOps.record_sigsegv
Date: Tue,  2 Nov 2021 07:06:59 -0400
Message-Id: <20211102110740.215699-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
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

Add a new user-only interface for updating cpu state before
raising a signal.  This will replace tlb_fill for user-only
and should result in less boilerplate for each guest.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6..41718b695b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -111,6 +111,32 @@ struct TCGCPUOps {
      */
     bool (*io_recompile_replay_branch)(CPUState *cpu,
                                        const TranslationBlock *tb);
+#else
+    /**
+     * record_sigsegv:
+     * @cpu: cpu context
+     * @addr: faulting guest address
+     * @access_type: access was read/write/execute
+     * @maperr: true for invalid page, false for permission fault
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGSEGV with si_code set for @maperr,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide anything to the signal
+     * handler with anything besides the user context registers, and
+     * the siginfo_t, then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
+     * so that a "normal" cpu exception can be raised.  In this case,
+     * the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
+                           MMUAccessType access_type,
+                           bool maperr, uintptr_t ra);
 #endif /* CONFIG_SOFTMMU */
 #endif /* NEED_CPU_H */
 
-- 
2.25.1


