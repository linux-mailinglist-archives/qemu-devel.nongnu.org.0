Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844C699ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnS-0000I7-2U; Thu, 16 Feb 2023 12:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnO-0008U9-El
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:46 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnM-0007p5-Sq
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id y1so2553980wru.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MLAn5GKevaRJXltRfdrt51PNhBydmEzcr/VkvxtQ/eA=;
 b=RbrEQ+AmR7SOWcjt3q6cGXU5Z7Pq4+bSFkyVALOFsgqEMT899oug0Zvt4l4N4m8enI
 QEN+ZbqZTjzfyNB5/EKR13xXa5ZrhxtcBj92/SfLkCkN2Ebr4jtp4XWW0s+KRNZQrCPS
 u/izTODjm/9LlXqRApI5OPjsCoIS8po6DtxQwq2Ttb5kWx9LfQ44tzbeyddDfUz1z8lQ
 whE4Wvlz7TwlowZfwZaMa1FQwpISzCrVwuPvgRob9hOSlkyM7g962jbcQWPm1t4DwqHp
 r1XvU+FUTuufqaQVN2epBpy8m2aiiWSnhBd5A4b6I3sbGP6i1rMcx7Iua/0BJLLZNU9/
 JBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MLAn5GKevaRJXltRfdrt51PNhBydmEzcr/VkvxtQ/eA=;
 b=4c96x1x121hrcerMUSl/LlDlUvf/1EQBNB9P+JUATR4ksvx5sNHkryy4juPbn+rWZu
 W5Hu20CEqoXtmKVvOsPyQ3jJgM1hftwwA/oGNVrlyWQ7t3lWnIZyRPXBsImJzigLvZaO
 nBeeFJwJq+V+pJHyq76bLwXoKQMcri3rESIlvjgXipzlCpZq22LRiDkGH8qS8xNAdb/m
 bTqZDn1Dla6alpgsFxqjGcnjexihJUtZy8PPV+558EUrUjVFBwrPGhPKkvo12CbhPl4O
 J7bGS4wiHIhtFDhamPXybymemVi7E0m+D6vZUcaK20cayXpT+TupM7ohVeRppGdeJR2l
 ek9A==
X-Gm-Message-State: AO0yUKWmr1yinFIPjc+Rak3x6Ny/B1/mov/yHdjhtBgrOEh2To18Z50k
 WGdb+UJTgRKSFntdD+nUcQUTBZypZeE+SqlC
X-Google-Smtp-Source: AK7set879RsEdwAxHPzRMczFRiLHgbSJt7hwXEAeO2A1Cz9Sz5H+3PlQJvrp3rYrMeafQWBJrw/eEQ==
X-Received: by 2002:a5d:6a47:0:b0:2bd:d34e:5355 with SMTP id
 t7-20020a5d6a47000000b002bdd34e5355mr4936544wrw.20.1676567504211; 
 Thu, 16 Feb 2023 09:11:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] target/arm: wrap psci call with tcg_enabled
Date: Thu, 16 Feb 2023 17:11:15 +0000
Message-Id: <20230216171123.2518285-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci check if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 509e674b0f0..2d38c3ed7aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -11063,7 +11064,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
+    if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
         return;
-- 
2.34.1


