Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23C3ADB13
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:28:17 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luelU-00067f-Fe
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejp-0003OZ-Kj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejn-0003ZJ-Nr
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:33 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso7736682pjp.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/d4WERHBZB1vBQRePyPgUTFoCpYKSS+UavNcGjWg7/4=;
 b=aKZCaHqTKzZWzZoN3gUoSovLnHzauNBofeB60yx4yr9a793bOlpkIMSLwkFXjarNKv
 6FF4QTipbuPNTfCM159HCtnrx7gN4MrxTsPj2W4g2UDWKeIYRLuJrorV1wotu9R7+v4P
 kWu0ktpcQsQVOKLduAIyNDwjrGd+UaXFpPIo/KmGHZUo6Hw7GgK1wLX4NnzB5koPgZB3
 0LGz/izyLSFK9ahAkVNptA3t/eKjWS0CPRZpucYakpfv+zdi/nEBqrgnenirIBSMDzAe
 ptpvUt6xQsOAp5YJ+CWtq+SBfgd+Ya+V10IL2SSFseXlGVU8vSTX7D3/oOc4mmAxt97f
 tzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/d4WERHBZB1vBQRePyPgUTFoCpYKSS+UavNcGjWg7/4=;
 b=eMyWR8KloSJOH3+mLPKSdVTZm2x1gDSXTdwAj3DpmcU7/sZ/gsxpMykvptiqHufS3U
 0ZiBRoeawfgU2LauKlb95mf6JylNWUo8e2u7vOLT/Y0TMPmjg+flyUqv2/gnKAnFvsKj
 MBgVNomIkZ/biM9DnirlNR1bmFH688f2YhkStEK+ai+nSnO5HX6USNVqlt2BqCKCYT7Q
 Lo6ZwtvIFufs3Y+0p1n2ihSP/fe8EhBiLAQjkf4gagZ8EADRgjyUSwxT4l+NmJJERmtZ
 vYp16YkcUVKjbiGBU5qAfNFiDLEcGkYZh0uXULrxbhHh3Qod5o1r8VAheSDkLhT2GIVF
 Z6wA==
X-Gm-Message-State: AOAM530SPMXLcpR6uvNLouRAe8DEYpMb/X5FSc1pr4g7ybSPSGUyH8yC
 gxVFqqsLanb3N84JarGMngKX08sD+fgrSA==
X-Google-Smtp-Source: ABdhPJxoJWsIox/1Ayy/toZQdJWu2ACMnhNcnu7MfHdxmBByXEmHNgHkiDRsFAK5Rk3nag4w0o1Rpw==
X-Received: by 2002:a17:90b:3b8a:: with SMTP id
 pc10mr17512741pjb.84.1624123590564; 
 Sat, 19 Jun 2021 10:26:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] accel/tcg: Don't test for watchpoints for code read
Date: Sat, 19 Jun 2021 10:26:15 -0700
Message-Id: <20210619172626.875885-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Data read watchpoints do not apply to code reads.
Watchpoints for code are called breakpoints, and
are handled by the translator.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ba21487138..23a97849be 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1930,7 +1930,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
 
         /* Handle watchpoints.  */
-        if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        if (!code_read && unlikely(tlb_addr & TLB_WATCHPOINT)) {
             /* On watchpoint hit, this will longjmp out.  */
             cpu_check_watchpoint(env_cpu(env), addr, size,
                                  iotlbentry->attrs, BP_MEM_READ, retaddr);
-- 
2.25.1


