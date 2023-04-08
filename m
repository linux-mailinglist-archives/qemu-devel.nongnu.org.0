Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988286DBBF5
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 17:45:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plAit-0001TM-P4; Sat, 08 Apr 2023 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plAiq-0001Rz-UI
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 11:43:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plAim-0003d4-KR
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 11:43:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id c3so1491026pjg.1
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680968597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=h1m1skUerP745G4hFY+E0hiRSYGVJiW6Qdqxzxq+yLk=;
 b=SS1N0VOtQBbPzJ7ayHwb8Jl67hj00803vCFeZ0F/b5EfoLK3gOzghbIxmhFgAHAeMo
 pzTV+R/L176kjfGaVMDVM3IBXVxk/QwE7BslAswHpLiPgA2OFPYn9iBWlgCToKL2z1lH
 /3SVc8z2N28Yvs7FJk6JoGb8mAplu1OuyJ+FXhr4OW7WnjwjzOA9c0t0IBreEGN0CwJH
 l0s9qSv3agh7hMvNdBcY+J7zTAILF9j99FLRev49HXvLdABMJkS4F9peO5DacRfNvN58
 nrpuqdrzpkxJBOG4Fr9knCSdrCJXOVuRllawErq5MiCtAhAm4ibFNUIgECbQSYZ338Sr
 /QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680968597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1m1skUerP745G4hFY+E0hiRSYGVJiW6Qdqxzxq+yLk=;
 b=aCAIOggsVw+aHSFHJGlsoqAb59z3iXgFY9gl7VWvJ24Wet9uZ76cJ8kEqbocO6VQKz
 h7wYzv3RZZgYdLf10lgiLnaCHV1hlL/em+LyG4sEHYbZqEwnGISakmSOdizYRFUW6wfR
 i5QXsYSwgnOIXUrdsU0qth1LOsBFjrCIkGnHOhAzf6oHhLCNRSIu1cjA7ppu1454JJwW
 AqS6doDeq04Pcx3mBwZZQ7pdUNAM5/AsYl4elf3KeN6oPfcTmMNuui2Wr55Nor+3qTD2
 5d/+HppGhMpzb7X/sJjWTyQDIs4QV9ew1HQ02K7uyfRWc6tVJ6/K3W8Ee/e0MmwFWfmC
 YLeA==
X-Gm-Message-State: AAQBX9dVnulWCeolESUXnc9DrwQQbo2WgxTRG4gIhT7CyHSMwWDOtKtb
 V7Rje+3oTr9AP23k8EI3Sob+Ln0WPiVg9AWp9yM=
X-Google-Smtp-Source: AKy350am7DYpC8pXZefRCGC4X1XSK4tHqamT0wFw0Ksriu04a1OuSC8sWKzlzF5Mhn6e5LPJApBw/w==
X-Received: by 2002:a17:902:ec8a:b0:1a1:ee8c:eef7 with SMTP id
 x10-20020a170902ec8a00b001a1ee8ceef7mr8619846plg.48.1680968597403; 
 Sat, 08 Apr 2023 08:43:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 je9-20020a170903264900b0019f3e339fb4sm4690345plb.187.2023.04.08.08.43.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 08:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0] tcg/ppc: Fix TCG_TARGET_CALL_{ARG, RET}_I128 for ppc32
Date: Sat,  8 Apr 2023 08:43:16 -0700
Message-Id: <20230408154316.3812709-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

For both _CALL_SYSV and _CALL_DARWIN, return is by reference,
not in 4 integer registers.  For _CALL_SYSV, argument is also
by reference.

This error resulted in

    $ ./qemu-system-i386 -nographic
    qemu-system-i386: tcg/ppc/tcg-target.c.inc:185: \
        tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.

Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index eb9e80ad37..8e6039576a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -44,17 +44,18 @@
 
 #if TCG_TARGET_REG_BITS == 64
 # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_EXTEND
+# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_NORMAL
 #else
 # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_BY_REF
 #endif
 #ifdef _CALL_SYSV
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
+# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_BY_REF
 #else
 # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
+# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_NORMAL
 #endif
-/* Note sysv arg alignment applies only to 2-word types, not more. */
-#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
-#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
 
 #include "../tcg-pool.c.inc"
 #include "../tcg-ldst.c.inc"
-- 
2.34.1


