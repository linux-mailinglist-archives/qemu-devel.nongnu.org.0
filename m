Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDAF3DE5AC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:46:45 +0200 (CEST)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmKC-0006El-3H
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltA-0005wh-Me
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt9-0005KW-3E
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id d1so22190715pll.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hlGCWa0qcgLrvcDvhZ/cxV3hMg29OCBmykjODrlctgY=;
 b=dLro22+lW30tYSQBdAUdCgSqgRSF1C0Wz1Nv1jDGYiqDzASPXg1LbHge0pPXtWgLKN
 2hEXrkv2EHIah0rnRZ4AhAq/HAt8SbfbEtGhdmmlIH1ZiRW9/W1np5h+urD/ybs+FvPe
 0AEYo5L2JzDSkFu2tg5fZyKcE6iuFR5MR02g5TNv5j+GInN/tfmrRvxszJKEpl3M6/eW
 +F4LuO5iZyRwm8mRPvRFyokQaT4ux+Bhwr+QVJAqisG4mKneVyQFFtn3wprf7G7/wjqb
 GC699L4lCP0LvZWhkfe5Vajv3MGmZDB72PZWkm8eZtH5hMCe52t/lFtNbwmzv1IKRUqJ
 qOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlGCWa0qcgLrvcDvhZ/cxV3hMg29OCBmykjODrlctgY=;
 b=uMpuX+O2IwHTgVyiHXpwIQ+Q1uRGuzJszL2F2T5DrdMZ+mk30prXDBYS9m5PY4r8nI
 w+KwP0Kg4tTmcN+KO/1/KhpE+Mrs9mui4bmDBKB+XoOMkWG0OaLGLM5SoQPCSTkPxXxz
 ki43HI213L8TqPEAr+7EO6RiFxgiDznCaCb6OQXJci1Qyc+M+BYKFpCb3qrIIg8DQNmI
 nrVoX/lD/lgpa7Rfl7xEKFDjFO0LcicMxyiesuv1onKgwBHNXaHM2nxXASV6zoI9PfeD
 HvLcKxgz9oU8+4jnTXegrR2Ehz0lP1p4HblsqZHQ+VtHIORa4jkcYcdTkBgzgbdj7GM1
 xIzw==
X-Gm-Message-State: AOAM532E9zn+tN3qIFjP2snKsSykvg67aTsaIsf5BbgN59xOJPVyiow1
 6tlTUjps2HS6tmXQD3dYeFrDpDWP2erVbg==
X-Google-Smtp-Source: ABdhPJwiJta6S7qQxHjmvWibwbO5y9R8rx7AeCAiPSOy9PwuCedbGk8sd7+OpOy/PZng2ItCc0bqBA==
X-Received: by 2002:a17:902:d50d:b029:12c:80c1:3f29 with SMTP id
 b13-20020a170902d50db029012c80c13f29mr37792plg.70.1627964325896; 
 Mon, 02 Aug 2021 21:18:45 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 50/55] hw/core/cpu: Add prctl-unalign-sigbus property for
 user-only
Date: Mon,  2 Aug 2021 18:14:38 -1000
Message-Id: <20210803041443.55452-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually disabled for now.  Will enable for each cpu that
supports the feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-user.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index 62037e8669..23786865cb 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -11,12 +11,27 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
+#include "hw/qdev-properties.h"
 #include "cpu-common.h"
 
 /*
  * This can't go in hw/core/cpu-common.c because that file is compiled only
  * once for both user-mode and system builds.
  */
+static Property cpu_useronly_props[] = {
+    /*
+     * Create a memory property for softmmu CPU object, so users can wire
+     * up its memory. The default if no link is set up is to use the
+     * system address space.
+     */
+#if 0
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+#endif
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 void cpu_class_init_props(DeviceClass *dc)
 {
+    device_class_set_props(dc, cpu_useronly_props);
 }
-- 
2.25.1


