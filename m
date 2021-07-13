Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196C3C7158
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:40:43 +0200 (CEST)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IeQ-0003dV-KK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0008Fr-Mx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbL-0003aY-MO
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id i94so30500421wri.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5FuhIcPQ8dqLKfYvxbInQRrJHkLhIPar3p6mkfICIW0=;
 b=XJhNEyiucku7u8UM6V38+9h7Q5Hyad6ta8uLbCnbwn62ovCSz7KmKa7g095ws9Z8HP
 phq8j57Ms7ZEiSPy5i3GoP2UJwiYYizZywJxZ4iTt/ijI5edjMbpV5HUY5uGmzqCbDK9
 Xdf7rqAXaKpY4+Nvw8yWCmT1qhCxvneinW7Qe2W50JKcMLET3mJJELcfSq5aOAHA3jBr
 TtmZnoK7Qs+JgylXrPEKn90AUeLVAPfXCobXXoAP64C3wp2nyVnr1mFwsevyGjA/AA52
 3VzhodbApH7eC8WME7j+BD+jZShRai0UTaMlm1q0f4wU/eyjWfxhFqrbyF4jh6+8CpGc
 n2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FuhIcPQ8dqLKfYvxbInQRrJHkLhIPar3p6mkfICIW0=;
 b=goYv+jDqcE3g5dx1WKif3RZVbnkNMcMR5qZnrkdbtEBv6tsOSzPOViYbZLB+m2ZxGa
 FaOhbGV6lTMS661fipl5nT48pKiKjupKLmgonTGK5kjBAYXNFtYFWerB4FFvJd10MREm
 7pd3fQGllpXeljzN56QuU3qjoLhcS1gY9N2bj9C94C1/o2hHI1B8Oi31eeKoqPWOUdUh
 jdc97FQSEp+daggdSc+QaxTtC7QuDWGQm4l+933vdDwDWwvE5Iuoam2lKaPh4JlUs6xv
 /PkcAsFJ0AxiWXXPQ7pmvmlfl5k8wB/FDaoPWMO5J+Skj9BTNiqS478Qaa31bdxmpzVm
 4jBQ==
X-Gm-Message-State: AOAM5316zDQuN11BajxXPG0bzVmvip0zePDCpmiveEOMWV6B1Ujrw0Qu
 uVOOiI9qULAObNEniF5Y/nuG2A==
X-Google-Smtp-Source: ABdhPJz23L23OwC/MuDEhoRjIEa1gu6Svy1wz+oUeGWWV2GUnvfX1XdFEgrwHa9l5G1qOtfIUptvvQ==
X-Received: by 2002:adf:de84:: with SMTP id w4mr5876809wrl.104.1626183450436; 
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/34] target/arm: Print MVE VPR in CPU dumps
Date: Tue, 13 Jul 2021 14:36:54 +0100
Message-Id: <20210713133726.26842-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Include the MVE VPR register value in the CPU dumps produced by
arm_cpu_dump_state() if we are printing FPU information. This
makes it easier to interpret debug logs when predication is
active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9cddfd6a442..6d6b8888037 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1016,6 +1016,9 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, v);
         }
         qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+        }
     }
 }
 
-- 
2.20.1


