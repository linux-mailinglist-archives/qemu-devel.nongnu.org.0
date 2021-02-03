Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F054C30E38F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:50:47 +0100 (CET)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OAo-00020z-UJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP3-0007jr-LY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOt-0001rx-Tx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id b145so429088pfb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JlH8qHKnc4iW1GCFnVD0mMaAs7tdU6wBK2pRgI3tiQ=;
 b=XD5R2S8qlgpO+BacRxZNnKWvWWIpOK8w1BzL7HVvu09Wq0PncV9D8y0++b2qoaji6+
 9kw4o8LVUMcOb94RVQA9THTapA/tynKV/2/2EFUDHsNeoCxmgOlJ2Vpt/FKWirJKXfnJ
 hdq3IndyEeuhwA6AB+j82ReXrnPxXbybmZ2duZU2knX//Ri24jyB3o2JoE1K5iy7FkkQ
 nGkhrf7PZTOluhlzZHxXF2kdHhSJl+tF06SGenUtcs0iIcFYtT4wL3T81RT9U08aeHMT
 wmJBbKRaCbAxzYAyO2wM/CKNv6Z8zUxnuVSJvg1evMjm0hDGf4njxdRH45YuMerZy8XY
 A0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JlH8qHKnc4iW1GCFnVD0mMaAs7tdU6wBK2pRgI3tiQ=;
 b=GUiHEe8wYIfg/vizjWRoWNW+T+NF9SYM9okYP6wgfAf2cjd4yvjvQs35/Gw0QEpn/H
 +yvnaZJexC51uypNoyarHgZLcHwJ5TPm7Zl/MXQrKtRQTd8M3EB9GeID3lxajEONV9E9
 lrLV4AEQZr3IAQ9pfYirscGHhWJyzg3ffsZ160SgVidsuuZLpjNm73kRgEgxtWjyvsCn
 4A0NqT6u+EgK0wrPqSaXLujPSQJgUN+VMGWI5QGnwu4/cT+KMyvWcAhTOhGStaiPP2H5
 FqB8xCM4zKDa87IJ8Jb4qVYkbZzxhsg2J+TWafuV9Pk8fzNT2OyFdbOesYfi2zYiw5x3
 MZjg==
X-Gm-Message-State: AOAM531F/4b0A7RwJ96+fXIqcjGqA1lDQ++Gm3uh+hI4Ox3HzUgqPNRS
 ciXODix3I3ln6EOyvyaMMHim8MZMX/fBBBbk
X-Google-Smtp-Source: ABdhPJy/XNbaqTDTS3LM9SmAS2gV+388UwIm9q4fiStHnEBM/uxAUdSS7jbcwhgwpVJtUUkhb5tVGA==
X-Received: by 2002:a63:9dc9:: with SMTP id i192mr5148527pgd.271.1612378874685; 
 Wed, 03 Feb 2021 11:01:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 30/31] target/arm: Enable MTE for user-only
Date: Wed,  3 Feb 2021 09:00:09 -1000
Message-Id: <20210203190010.759771-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db81a12418..43933550c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,6 +204,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1


