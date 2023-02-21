Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3DD69D862
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGB-0001aI-EJ; Mon, 20 Feb 2023 21:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG9-0001Yb-B8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:01 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG7-000810-N8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:01 -0500
Received: by mail-pl1-x630.google.com with SMTP id q11so3779873plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djjsEwG4h18wUlaauxZhuGg1KAW+4WF9EJYa6EDlD74=;
 b=a7R1as1gcFimzMR/jTl7L58JiPdtSiinpl6AjcYYxQyeo0XPOf7KCNcyV3WbIB97os
 vx9QaYX4lxhIvmWGlWe8jALAH2prmgrI/ekPjqtr/GwRXpTYkgwBaguY46I3rPBfvYf1
 XQfPBOp3YnwJXA/8IAJQNGFLBZaDTHmbXeZ6S0BTye9pFuK/gEttwj+dHryNNTuLGliH
 jWNb0cdnABHy6IKf9Fi3QdhJ3JE6pvIRBxebG2nJpz81WsQ+NArzHkN4eKFta/XvTjzy
 2ny0X3ycWvmJyqWQkMnRLsMmwfSt1hjyrcqB08g6HvDTDzaXXYqofs2cey2k40z+ukLG
 20ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djjsEwG4h18wUlaauxZhuGg1KAW+4WF9EJYa6EDlD74=;
 b=bhvcCO6R/DtLWcQ9CQrmXQqaX2+NP4C7/BJ2oHQBWcjhLzmea5GEQtzAgaV9S7Jhh/
 NWy1aZEgQ3GXlZiF2nBh/muicHGmw5ox+mFWiM/7qOQnEC/xBOnfYGrJt+4V9VTV4k/S
 Khj356/mr3sK+IvX0Tzdq37YgyN9AqyFW9rlk1a3VEUHwR+kdVNt/rU0DxXfqokoXp1x
 vBvd33MsVnH63QNG2b7TUcGntdH2+3NQcTPn2ICYxVJIhlOLzuyT2/bjWwUIO3ZtIDLY
 F5ZsaxDxv9X4RsmNRy6mqZpbLMWG4wT08etukp0HT0CbCPH837AVkGO/HcMuJtb29UzX
 um4g==
X-Gm-Message-State: AO0yUKWAKQoVEWEzQwsJip8qIJn2ZGmCgwKVnRwPMvvdeHXaimnIaTJl
 Vonyiin8m2iFeu/fOzl41WMFB+Dwqy+yrScEDR0=
X-Google-Smtp-Source: AK7set+JwuC+B/XzPXR5M1RHcrRDCVZDxL58eCA2CSAElnZnbTyvX2/14uVJt27ylzdfdEeWfZ0nxg==
X-Received: by 2002:a17:902:ce89:b0:19a:7548:da25 with SMTP id
 f9-20020a170902ce8900b0019a7548da25mr5526167plg.17.1676945998336; 
 Mon, 20 Feb 2023 18:19:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:19:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Mon, 20 Feb 2023 16:19:39 -1000
Message-Id: <20230221021951.453601-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function is not used outside gdbstub.c.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..32ca6c9a0d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,7 +1116,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf..52581e9784 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1


