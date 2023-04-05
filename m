Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB16D82EF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:05:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dW-00060h-FM; Wed, 05 Apr 2023 12:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dU-000604-NN
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dS-0007pj-NA
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id m8so10284870wmq.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CSHrPIDjf1IWIN1nnp6I0uB6O25vizWYPyXq8gYKvo=;
 b=G6pPxv8mxmBXT/A7Fms6p48gVBPAVhCbwwptPPupZJfFBxICRxzF5EfjLYHeeUdIOM
 KuTVNoN2hg8Z3US/l5DXZyRgclnPh2Svov5K5NTEkQxYcjBSczhbLwslailyhLzmv6Hx
 91gp8FcyA1tMzQYLGb0/U7BSEeLNYMUXaL3U64SUPUMVKewIvfK4P2ZczU3Eu+z/zV/O
 nTNCHqofXowPBxAA4rcW8XP7R0rJ7wuGTOYWFborUVJW0xF27yen/vXwymcuMP8cWAbJ
 k89Nl96lVK8m1OUz0Xtgy2IppNpCw1q/fBG9RE/e5WdoX3T9mSBBSUEfBaVAMGEYLdkN
 N91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CSHrPIDjf1IWIN1nnp6I0uB6O25vizWYPyXq8gYKvo=;
 b=hawy89PYY5y+EwVd4v6fLIsqGY3IL/+k2EhBYCyKWPtRhUekaQCXzJ86/mWRLUuK4l
 8ciYwc/Ubycw4mcvRO+G+FRvUjohxBMS1TXef/qGSq9UX2XvtzULX0LItXTIh3Y2LfS3
 Iscl918/ojhjPjZzKJwyYHApfJt3Z227QytpuARICUJkw1z7ygTHVd4BTqafmTjU/r8/
 xLdF+T8INAP7Rpe8yaGq15RPqqvODcKDyaprWV572+r/L7OA6I3ZDGeDbtr2a3C30yMX
 MZkf5HhFwgfH597T65LKwwXAtYgzZpEn8vo7QVq6FfCr5bp73fizd/3ZMHlLkRbsWZv4
 zyaw==
X-Gm-Message-State: AAQBX9fIReBxnhWGs0WK9svZHmr2llAwzGR3q0HMsq3r4mYeUtHjrmum
 bwqoTHAaFx6ia+feIzve9acKHScqVaXpqZq+SYA=
X-Google-Smtp-Source: AKy350b2wk0eAixgIQgLvmWawSUCyvt3DQf5sn09y8olDFh7GE1/OjoIxJal0B3a+G4fHcJYO+q/Sg==
X-Received: by 2002:a7b:c4ca:0:b0:3ed:e5db:52e1 with SMTP id
 g10-20020a7bc4ca000000b003ede5db52e1mr5471510wmk.15.1680710721116; 
 Wed, 05 Apr 2023 09:05:21 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c458f00b003f03d483966sm2662576wmo.44.2023.04.05.09.05.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Date: Wed,  5 Apr 2023 18:04:48 +0200
Message-Id: <20230405160454.97436-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

"hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).

arm_gic_common_reset_irq_state() calls its second argument
'first_cpu', producing a build failure when "hw/core/cpu.h"
is included:

  hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
                                                                       ^
  include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
    #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
                             ^

KISS, rename the function argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/arm_gic_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 9702197856..889327a8cf 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -235,12 +235,13 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
+static inline void arm_gic_common_reset_irq_state(GICState *s,
+                                                  int first_cpu_index,
                                                   int resetprio)
 {
     int i, j;
 
-    for (i = first_cpu; i < first_cpu + s->num_cpu; i++) {
+    for (i = first_cpu_index; i < first_cpu_index + s->num_cpu; i++) {
         if (s->revision == REV_11MPCORE) {
             s->priority_mask[i] = 0xf0;
         } else {
-- 
2.38.1


