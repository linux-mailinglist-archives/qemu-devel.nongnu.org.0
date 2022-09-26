Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A07F5EA85F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:27:13 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp4i-0006wD-Gc
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-00021K-FE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKD-0005eM-3b
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so10239473wrp.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=V4i8lyUq3ft9QoTbl1zxUdvI+GWdEaQO+D0hzFqAlY0=;
 b=plSly8c5E/WG+nx6kAibnGo8ff7ST9cz2GuSc/wrfacIvaN2g1OKDcYHRZZB5OFtd2
 FX6jLnBJ9hlRzvWbXwJn9Db6En14ei6b+NRTIBDzX4wtMn0XXhG0fZaWLBVbn3aV9K3O
 kJGo0lmwdU6ytTglIaxczE0TofqpfGIFflgaDgckjGnuqgmb54GonbEhnSDMcKbKG702
 46H4Hs/HejcWCUy9bq82fA4JTBBe3rDV31GD/Usah70j8UHewBtVN08im1mhT50oS+LX
 ZkoOz8qjqNthFYmylQJlKI4KfJ/cs/yH6QDSggSOBa1ADM/HesTtfiwBR3eTkmrDCUBi
 1ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V4i8lyUq3ft9QoTbl1zxUdvI+GWdEaQO+D0hzFqAlY0=;
 b=bfe6u8ejnEr1Oub6zSxSpuSODHc35B6xGJoNqDqVMgLS95YBzzHxOvQCLfQt7Y9PxR
 5ykbfRy9/e7ACARNYe44KlQa+pAQ/mjN7f0LtC8vSExjOc7d1iSNF6RM35kD94fdkTVX
 EPqMAQE4vvuGcRznSdahKl3lqzvYvcbplOalNb60No5N5QhDMDwvlidy1Q/+V+D5Ro0K
 voExa5jY5rlkHCwEkRicgIGT1D7jb+fkfLho9uNRas/rprHIqIwnuigKvTd3Axsj370J
 HWkuSTsiE1El6WEhyk6W2JWA2gzCvw0cFobvC7q4liOqrahgpiJyy4v3eKdU6RQukBLC
 yKKg==
X-Gm-Message-State: ACrzQf3bEEKmQ/VQh3rC2wN+VxKJpruHcx5Wne7nZOSqCvtz/dx5fFrs
 7Y5YDawO2CIziWtR/RsTOaLbcA==
X-Google-Smtp-Source: AMsMyM4LDvSryjxA5MPKvAS+ILcO+hzL/rax283zrCvFkrn5tyNHsKXWnFlDNBBM3gzzRtDJhXFX2Q==
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr13550393wru.459.1664199547707; 
 Mon, 26 Sep 2022 06:39:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a5d534c000000b0022c906ffedasm6660951wrv.70.2022.09.26.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA00B1FFBA;
 Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/11] target/arm: enable tracking of CPU index in
 MemTxAttrs
Date: Mon, 26 Sep 2022 14:38:55 +0100
Message-Id: <20220926133904.3297263-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/ptw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3261039d93..644d450662 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
+    attrs->requester_type = MEMTXATTRS_CPU;
+    attrs->requester_id = env_cpu(env)->cpu_index;
+
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-- 
2.34.1


