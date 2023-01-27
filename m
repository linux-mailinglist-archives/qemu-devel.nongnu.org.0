Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFD567ECD1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx0-0000ug-Br; Fri, 27 Jan 2023 12:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-0000oS-HX
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:35 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0005yy-IV
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id bk16so5657557wrb.11
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K/IiIn05Y7NVih+vNmhOpGqwd4O7/fuGddovCa0QrYg=;
 b=NTG/j6Kjyhv0dXrNtM1cnjbBKfrVQSFTg8xjFDbycBpi5tFRBTezZHJ1nq8V0vkb39
 +HuO94N7o4Auy6COEvZyiC87gqrxcxGSQzSpGR8PybL5CDsIsNjn1EWFXDyKEwT9+l5w
 vbxUbfNhYIt63KAZ848UiWqKOg7Vb36udzg8BOsZXOaL2pqO2abTWcnr/P51FyxF1Vba
 aYRNoyy7UiQ7RiPF57gcO5PKqodxfgUxThc/wkznFIiYls/BffMn7qj8EyLS6Y7/VFFv
 U1j/5f+NYh29YvjVdUZbN7aRcWhDHajb8oV7MccJw184H7Ik+CbQjyISiXJ0XGGnThI1
 7FdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/IiIn05Y7NVih+vNmhOpGqwd4O7/fuGddovCa0QrYg=;
 b=c128Qu271+542dHU/CBvgTKJBex259yCMZDolOOmBnSBKVeU5ngoq1Nd/nFMvpUIqz
 ILLQW+PBLhO7t3fmDJO9fvRdFEgFeumJV2uqV43EoW8vMMCB80hx01nNV3KDqCjXLoOv
 QWZRnFHEZErEGrc+kutX24PBFBrq2crLLxizgvEYOTn9iwVmFd+l2Ogjj3kzdGJLYXY6
 0bwqZgOSXbtChN7nGJ6ZNMPVXjkj4A2fG3fVOdbJiFEFCgzegOCxFawjkWcLyUsEx48v
 996KC95l9ZTW80d2te0zSn/lXFzXeCA5znoe/DqAzTp6L23YWeEyrcfbyh/+JfJa0Ybh
 UrCA==
X-Gm-Message-State: AO0yUKUgmifB/Uz6mGHocq25c9G6sreyiAmt3wJllO7brv2O2TylJTgv
 xKjYRP7aDHo7DzFEfnxav6/9Ig==
X-Google-Smtp-Source: AK7set/uhQx737VMW2MA+fV4wyR5K09yVAS9zMJRtclLyH9LVOwLuhFmpTtokhyew0e2AhMQxqgPvQ==
X-Received: by 2002:adf:ea01:0:b0:2bf:b35d:2797 with SMTP id
 q1-20020adfea01000000b002bfb35d2797mr12536093wrm.11.1674842112823; 
 Fri, 27 Jan 2023 09:55:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/23] target/arm: Correct syndrome for ATS12NSO* at Secure EL1
Date: Fri, 27 Jan 2023 17:54:46 +0000
Message-Id: <20230127175507.2895013-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The AArch32 ATS12NSO* address translation operations are supposed to
trap to either EL2 or EL3 if they're executed at Secure EL1 (which
can only happen if EL3 is AArch64).  We implement this, but we got
the syndrome value wrong: like other traps to EL2 or EL3 on an
AArch32 cpreg access, they should report the 0x3 syndrome, not the
0x0 'uncategorized' syndrome.  This is clear in the access pseudocode
for these instructions.

Fix the syndrome value for these operations by correcting the
returned value from the ats_access() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ccb7d1e1712..6f6772d8e04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3284,9 +3284,9 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
                 if (env->cp15.scr_el3 & SCR_EEL2) {
-                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                    return CP_ACCESS_TRAP_EL2;
                 }
-                return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
+                return CP_ACCESS_TRAP_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
         }
-- 
2.34.1


