Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2826717DA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:35:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4p2-0005Qm-FR; Wed, 18 Jan 2023 04:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4oy-0005P0-AR
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:33:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4ow-00027t-Jb
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:33:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so949775wml.3
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H/razzPsUsorwhmjUmtJZoXvlXx8u4fd+lsUzclwjxM=;
 b=P759FQeq7o8lRdaky0h7R6JkgjHxUXaGx+g/6vKo5IYgMgCEroXirXvqTZT5QVeQSS
 6m29eSC58YwquV0IY2mmES9orA6sS6QV4g7cTf9Jnv7lMT4zpH8AdGK2q5Y6V05p2Rnu
 Z/pLRUNPI/mTaIzapVBSpZzSszhs+Q/DDhVQQItJ5b4UxAC9ECnJCOZL7E4FQYKDeTUQ
 ssZe8EYd25eiTvBjIjpPCFVlJ4cQ1tt01w/7vWzUEgMDk/i02LqslyzXrkzALywc5H3o
 12KfMa+HLigoDSGiP94VgwINfpaidLRnU4K6AnzSlNiZmDBkm2z1LCfWYIj+TjjErgjU
 zACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/razzPsUsorwhmjUmtJZoXvlXx8u4fd+lsUzclwjxM=;
 b=FIUaWlw+G7v036wjDE9jshhwCjLO/FnB4p3XjqAPjJkGVeqwg2bLpPftHFODWmPtrU
 Cu8QE2vFJ21W6FYi1rZ2S7PKqd2zbHL6Ry8pvtGYS2A2g5Lyr/9MkmEBlFQRh2yrhDCr
 fJJPN+09312jGnme6eXnwVBSLkRa5HN8RL9qBAlc0hcU4r1mARaAtX9cykal7mbQ18Ay
 yYpgVm83Xbn0CvjnJr4o/wA/mt1Gyf00Nhft7iFgsY0bWq+HHBit3loEohI2DXmOeLXR
 ftuV+B4sQb+054nyMXdHj2zn1dyp46SFtbHAd0P/l+wmbw+EYQ8e51rq5GQA5ONjetpf
 bYSg==
X-Gm-Message-State: AFqh2kpK4YL7fD1X2fNcwdgo0vtAcmJ7eEIbGbrkipg963Y4fwCUXrQB
 /6QNslKPQXWI2uq27UFUBz9h8eVvc3rF0Nj8
X-Google-Smtp-Source: AMrXdXukImYkpDjcD8XMQd8YgNy8KuZZpdJlWkM9mjrEfSyqQEzO6R3y3Bb3aD9J920Aq+9uAEcbVg==
X-Received: by 2002:a05:600c:3acc:b0:3d9:efe8:a424 with SMTP id
 d12-20020a05600c3acc00b003d9efe8a424mr6246353wms.34.1674034404128; 
 Wed, 18 Jan 2023 01:33:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003d9e74dd9b2sm1394901wmp.9.2023.01.18.01.33.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:33:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] target/tricore: Remove unused fields from CPUTriCoreState
Date: Wed, 18 Jan 2023 10:33:22 +0100
Message-Id: <20230118093322.49307-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Remove dead code:
- unused fields in CPUTriCoreState
- (unexisting) tricore_def_t structure
- forward declaration of tricore_boot_info structure
  (declared in "hw/tricore/tricore.h", used once in
   hw/tricore/tricore_testboard.c).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2: Do not remove 'hflags' in case it used:
    https://lore.kernel.org/qemu-devel/20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause/
---
 target/tricore/cpu.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 3b9c533a7c..4f6d936824 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -25,10 +25,6 @@
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
-struct tricore_boot_info;
-
-typedef struct tricore_def_t tricore_def_t;
-
 typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
@@ -180,15 +176,10 @@ typedef struct CPUArchState {
     /* Floating Point Registers */
     float_status fp_status;
     /* QEMU */
-    int error_code;
     uint32_t hflags;    /* CPU State */
 
     /* Internal CPU feature flags.  */
     uint64_t features;
-
-    const tricore_def_t *cpu_model;
-    void *irq[8];
-    struct QEMUTimer *timer; /* Internal timer */
 } CPUTriCoreState;
 
 /**
-- 
2.38.1


