Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8A05EC815
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:36:55 +0200 (CEST)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCdi-000861-Cf
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMe-00053z-OS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMc-0005zB-44
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id o5so6648626wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kwIb/itvs3rKbwTJEqXho8uP1946GYiAG+/duWCVn30=;
 b=W9SC7/+Tf5OCooTlzhP4Sis/4s2IihlstIcDh0P59xQeUidh5CSTHMWMDbH8stIAw1
 yeHHLR5Ha4Mi1aBjzZRFlA0vV+MkztOchTrhVfvL+NjG2muHVbno3etCyyvETewjIRet
 c2+IQOl/hGHtn7aXE/dfxOjM2WvDBwW+Khmp24YNup5gwrstuW4Hbw08IPS1pBxEWEHW
 FxkvJxgzPemAcIV0szrbH7+JSsKcpaIzNY0p5y8/DiTg95sN9zW0IIJibb/xsHvbmB19
 DWy3EQB3tMOE74BcDzebTxkG1wnV1vqCZhoqjs/KdLRpXmQT+ngtqWoCo5Iq6oxE24Gh
 4ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kwIb/itvs3rKbwTJEqXho8uP1946GYiAG+/duWCVn30=;
 b=VkQqegUoGlp7U0JBQwJ+fImRXSW8yPXl8Dxch4r0OWXFNqYvRl44xfqngZw4hMUKiW
 dZ84AQRlYuhAACvVkJvBAu1D5rWzXBMy/SfmtHYPcNl2c6YDA3UIJqVGh2YAyhJ4uaBo
 UYnn1wx2BbUOQvoGCZQ8XzsWUYCLPyCLPPD44oldPZ22bLljTNztfYBiUvwXxv5b/Q/m
 rlVp2POIpdvTAMkUz7bJ3Ie9JzZzBQIcADpWjBuWgcDRveBQ/hsYHsnqzwsZ2QPTzNoc
 Hl83JtJrDduii+Lq5RQHFPqVKbJ/NSbBRvcsbJoBD+jOGYxXP58SwftR0MWoqX3or4oe
 UIjw==
X-Gm-Message-State: ACrzQf3IXSWnQShWQPhQyJDW//wAIhmPJTP7tmx7ooUY4eOTROwFx2Yk
 y8u352VkRm15sYR7aGo83QXDXmX9VMSBTw==
X-Google-Smtp-Source: AMsMyM7DYiLQ+7glLilZarpUd+3QCck5pzjzpEcXHejIfZJdndjTFd6Ymc1ZvPjRVjH7vCQ9Eor6Bw==
X-Received: by 2002:a05:600c:1ca0:b0:3a8:41cf:a31f with SMTP id
 k32-20020a05600c1ca000b003a841cfa31fmr2960353wms.161.1664288108496; 
 Tue, 27 Sep 2022 07:15:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b0022ae59d472esm1853489wrq.112.2022.09.27.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 775281FFBA;
 Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 02/15] target/arm: ensure TCG IO accesses set appropriate
 MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:51 +0100
Message-Id: <20220927141504.3886314-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - reword commit summary
---
 target/arm/ptw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028ab..4b0dc9bd14 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2289,6 +2289,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = regime_is_secure(env, mmu_idx);
 
+    attrs->requester_type = MEMTXATTRS_CPU;
+    attrs->requester_id = env_cpu(env)->cpu_index;
+
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-- 
2.34.1


