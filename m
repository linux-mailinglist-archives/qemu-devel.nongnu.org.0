Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526383D3D8B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:26:38 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6y0T-00014c-D1
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0008Rq-PG
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvs-0000lf-52
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w12so2896113wro.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9nvGoOgx6h6XmbBua01EVVw7UXwgA9qVC9DjO1im9I8=;
 b=mU5feMaCGu8BBRFIKhPl/v5gTzExIgjISaZWcEaPKwyDQc27xBkXLZeR9ndAsAnjkY
 eblmDUyFFhZTq/lu2EZjXYfdrMQj39T7jsJIBXe3ZPtM7hWLuajBXfqfe00skItUaYiw
 z7eRLDKTCnTNwDmW2tTanUE3eMWsww4gpc+5eUxe/ksVQMzGPPEY7AuJJ8ioa1V2Onkz
 1FkT0/omccDIYwsRWB/76VtdLNlPoNgGgt882L2PduHLJ0ADZrQOgVS6cG420w+9Wqan
 NwJCFtCWNXaMI17R+kfa3c/Qt8y32MaQ5jhNCXikNL0lGil0fljDMDXFjpieNER0ua+g
 W/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9nvGoOgx6h6XmbBua01EVVw7UXwgA9qVC9DjO1im9I8=;
 b=a4HiAo83Z+kWXkhySVTeO2WqAGS+KWuW3m8xYBfPcNaymUahRg9H4Hv7YVqPEkAI0L
 GakVROwrhXIS1gaal1W8KxODAD24YN9COftGBpjKBHETkSEpQomsO6vbgAvw1RwVt8fe
 sGGCFRazHkh4Q0oFgnDbEkSMCWEjVYc4SMG4fdG7LJZlcnMsRMSg5ecAm2+gGad7p10E
 ou/RvbocGSpghGKP45Kxdor92zz5dlRSF8V/RczHSZNp8PqnbDQkR8oR+DS9Xu8WCeeU
 Mhzb/CMnII1bXeXYDrcM7WGnk9YpKPTuAYgnRescUTtD1FFIF+M61wbmwz3QEifLg+iN
 LBFQ==
X-Gm-Message-State: AOAM530AcQ8H0kNsstwpIi/NHqaHTVXSI9V2V0ubhAneu96ZsqFr7ZvY
 DVYTwXC4mmQ2FKAuLc7tVT5rBg==
X-Google-Smtp-Source: ABdhPJwEMFWBa0a4mcEhtikINci74e5qMkm6phEo7Ez7s3TTPuvF2rOr9mMGzcvnKCDuUemUxqHl3A==
X-Received: by 2002:adf:e610:: with SMTP id p16mr6456978wrm.98.1627057310805; 
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 3/6] target/arm: Report M-profile alignment faults
 correctly to the guest
Date: Fri, 23 Jul 2021 17:21:43 +0100
Message-Id: <20210723162146.5167-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For M-profile, we weren't reporting alignment faults triggered by the
generic TCG code correctly to the guest.  These get passed into
arm_v7m_cpu_do_interrupt() as an EXCP_DATA_ABORT with an A-profile
style exception.fsr value of 1.  We didn't check for this, and so
they fell through into the default of "assume this is an MPU fault"
and were reported to the guest as a data access violation MPU fault.

Report these alignment faults as UsageFaults which set the UNALIGNED
bit in the UFSR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other approach would be to have arm_cpu_do_unaligned_access()
raise the EXCP_UNALIGNED which we already use for Unaligned
UsageFaults which are raised by m-profile specific helper code,
but I think this way is in line with the current design that
generally prefers to report exception information in an A-profile
format and then re-arrange that into the M-profile information
in arm_v7m_cpu_do_interrupt().
---
 target/arm/m_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f352346a964..20761c94877 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2248,6 +2248,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         env->v7m.sfsr |= R_V7M_SFSR_LSERR_MASK;
         break;
     case EXCP_UNALIGNED:
+        /* Unaligned faults reported by M-profile aware code */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
         break;
@@ -2320,6 +2321,13 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             }
             armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
             break;
+        case 0x1: /* Alignment fault reported by generic code */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...really UsageFault with UFSR.UNALIGNED\n");
+            env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            break;
         default:
             /*
              * All other FSR values are either MPU faults or "can't happen
-- 
2.20.1


