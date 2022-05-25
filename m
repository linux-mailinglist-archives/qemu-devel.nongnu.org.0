Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F25342B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:12:19 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvUY-00060S-BR
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1nttjY-0006Rc-Ft
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:19:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@fungible.com>)
 id 1nttjT-0007G6-M6
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:19:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id c14so19668318pfn.2
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 09:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7LnHmxsMmJnXh8BLPdtxv5F7x/Z/fRUAXjbqXk7e4U=;
 b=UIsJ3jdKwW77X0WPD/ze/nj4AqebLnFzf46585O7FOAbSYWW3wACpHGRAcyte17JL3
 xp0Q0ExfdeMskO8PTQ1CBuBOA6qvRP3oE6YZkLaIP4KCaisXVXYT2RBQyIDshGSIJQ0V
 4eIDhZ/WfLVJv9ZbTy8A7KVKyRhTQV1bHlhN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u7LnHmxsMmJnXh8BLPdtxv5F7x/Z/fRUAXjbqXk7e4U=;
 b=1KwnFJtj06WHQ2ohAZUdUPjrDNhRkp6Vj2PPa/Iskv3gURPrlFg1bg0G2vZFRaIart
 Hk7PEqDgvDhQezLTe1P2ILniaigO9He4+tJVwT7t0WfUkkom8FWqCZhLechZdupr9FQ2
 5YDfOtL56nlJMMN7ArKkmjtqrS1vUzxJvuh6JRZ2CXVPanuLifxVtdpfa7/Eh0Ed3tdJ
 A9c85hDEDJKpQ1OF6VbiNajUwTFokN3XUZkTbG9Ch5sBmaRBrI3eM8G/P0zR1D5X5x2p
 0FKb8MZpOoHlp+nZX8SnccfNr8e1PeZP2ij22UK5JBFIoQPMYatAykq1mLCAbYWWyFkx
 NiEQ==
X-Gm-Message-State: AOAM531oGIYgEo+AwLB6YGBp8BZeJlbeUX2QrWP3h+V984STf+U3AFEv
 dItgQ9594nTUgIzVmM830LHEuUXY7TBAjQ==
X-Google-Smtp-Source: ABdhPJyq9gI4h29YDOcD6fjYy1qOiKlznEN2JawfCgAotf1xNWET6Fa31AKLm6ucK2pZHF+WbHVo6g==
X-Received: by 2002:a63:2b11:0:b0:3f6:5f7f:9e67 with SMTP id
 r17-20020a632b11000000b003f65f7f9e67mr25150029pgr.492.1653495573768; 
 Wed, 25 May 2022 09:19:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t28-20020a62d15c000000b0050dc762815csm11662293pfl.54.2022.05.25.09.19.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 25 May 2022 09:19:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Duncan Bayne <duncan@bayne.id.au>
Subject: [PATCH] target/arm/hvf: Include missing "cpregs.h"
Date: Wed, 25 May 2022 18:19:26 +0200
Message-Id: <20220525161926.34233-1-philmd@fungible.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philmd@fungible.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 May 2022 14:09:05 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix when building HVF on macOS Aarch64:

  target/arm/hvf/hvf.c:586:15: error: unknown type name 'ARMCPRegInfo'; did you mean 'ARMCPUInfo'?
          const ARMCPRegInfo *ri;
                ^~~~~~~~~~~~
                ARMCPUInfo
  target/arm/cpu-qom.h:38:3: note: 'ARMCPUInfo' declared here
  } ARMCPUInfo;
    ^
  target/arm/hvf/hvf.c:589:14: error: implicit declaration of function 'get_arm_cp_reginfo' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
               ^
  target/arm/hvf/hvf.c:589:12: warning: incompatible integer to pointer conversion assigning to 'const ARMCPUInfo *' (aka 'const struct ARMCPUInfo *') from 'int' [-Wint-conversion]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  target/arm/hvf/hvf.c:591:26: error: no member named 'type' in 'struct ARMCPUInfo'
              assert(!(ri->type & ARM_CP_NO_RAW));
                       ~~  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/assert.h:99:25: note: expanded from macro 'assert'
      (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __ASSERT_FILE_NAME, __LINE__, #e) : (void)0)
                          ^
  target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
              assert(!(ri->type & ARM_CP_NO_RAW));
                                  ^
  1 warning and 4 errors generated.

Fixes: cf7c6d1004 ("target/arm: Split out cpregs.h")
Reported-by: Duncan Bayne <duncan@bayne.id.au>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1029
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d2..1fdc5eef92 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
 #include "hvf_arm.h"
+#include "cpregs.h"
 
 #include <mach/mach_time.h>
 
-- 
2.36.1


