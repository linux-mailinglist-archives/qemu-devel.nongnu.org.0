Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EAA3D027A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:04:26 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vyb-000583-Ke
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpQ-0007Er-7b
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpO-00084S-Cd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso261465pjg.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5o3EFC0L+7Y5ve+aUtFOWA7OByelfTkc7/2t+/SWZ0s=;
 b=UzLF8E/ns0aR317t3hwcURMkOanbYuSfmGoiu90EWOCIbRvj6CnJc9lH6QtHJwP863
 isFv+sn18otKxpQwD51o9AAKUFzProvqe5BAX8xXXtPv6tgROvs3mAT4b9o5/hUu/Di6
 sHG1bytKucdM2kzuvgGPwytUVVRGrsLBDszB3S2Snbqw+GW9la0VzCbfXONCRTsOW0Ih
 cRBgUvHVKbMSusHZxXPIw0bY9HdRLDzULNFE7yP3LKlT0uZhyI3Ub8F6R9x5s8pdSi8O
 9LZMCyPU1Jb1C03LkP5CVxcUzUtmj9EfPfghZ2p+zXxCbT7EakfqhTNLrv2IhncrM97w
 M0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5o3EFC0L+7Y5ve+aUtFOWA7OByelfTkc7/2t+/SWZ0s=;
 b=bfHn5WK+LznNXlmNSJfYxgmupPuOHjqXrbMDHm6LSUuPq5GGt4BjeAe91BR/Xd178F
 izMQ9UE5zVKh93DVWrq68NHVUF3foHEsa3UTOvN1DXzox1RKifZ9fOJQR8xsVBT/g65h
 rBkU54j5HgaFGRCI4MMVoZrkkWm46brl6ng/uTFlzUdjP/Fzczt/7WU3iL3ciwJ8yZYv
 JQpTAguQHbE+o5fM7C8ah+2JrcvrXg1GrRWiDzmY5QOn7jjwH11QmcIq9afAkTABF+zG
 DzwHlx7sbKWYJvYrHS92IH0vznHFXRQ8wb8Jta9mxdwIQK+8cKiwiJejLX7WVRYMhsYq
 2u/g==
X-Gm-Message-State: AOAM531OUuLQ7R9xFqw14sRhPmdkuXIiolPdkoF4xvIfLS2N2L1fRykr
 bYa1NNjr3KuqwO48QGTxIo3GI6UkYy78Cg==
X-Google-Smtp-Source: ABdhPJxvKqHDiemHu0DuyK4Tyh+OndL7FLd434woHpYPEKl7yBrsmO+Be8GaEmvDVUs2OwLyZeM88g==
X-Received: by 2002:a17:902:bc82:b029:12b:a074:1fae with SMTP id
 bb2-20020a170902bc82b029012ba0741faemr2070744plb.29.1626810893183; 
 Tue, 20 Jul 2021 12:54:53 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 08/17] hw/core: Introduce
 TCGCPUOps.debug_check_breakpoint
Date: Tue, 20 Jul 2021 09:54:30 -1000
Message-Id: <20210720195439.626594-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New hook to return true when an architectural breakpoint is
to be recognized and false when it should be suppressed.

First use must wait until other pieces are in place.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 72d791438c..eab27d0c03 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,12 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @debug_check_breakpoint: return true if the architectural
+     * breakpoint whose PC has matched should really fire.
+     */
+    bool (*debug_check_breakpoint)(CPUState *cpu);
+
     /**
      * @io_recompile_replay_branch: Callback for cpu_io_recompile.
      *
-- 
2.25.1


