Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A674B66E64B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqv8-0001x2-Bg; Tue, 17 Jan 2023 13:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHqud-0001tc-Mw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:42:28 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHquc-0000iw-1N
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:42:23 -0500
Received: by mail-ej1-x634.google.com with SMTP id kt14so18612643ejc.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0tE4B310nUB0gFBo/wzLg+119jqLd4O6fykhWT0X0zM=;
 b=GRwQuj3FSMLOS9E9vz4DqUakntCuQ/r9l/lcm7Latb0IUlN7qgRlyr3a7HA99Z12cf
 IAgIz+eL8JtqMNZ/rWFHbjUtant2ZeAvuJD63BO6RtZqpl9n3n1mMNQasyEpW1IS/D2E
 Ufp8XXGRctpKIbKpTBf1ppKqBbSi4D/zha0Q8NR8F9ZuyYmheRaklPrSbc8mbqZY/jW4
 eA/BeQffsqa9E4EtGRd+O9ULFiyZ21TLfMplphWun37cV9D/k3AX8hxFyBgzTSJXYsRD
 lweYZkhJ1qSFMPAJuPC6/sU63Tawao5VHdgABYjVA0uaXffVL/cTeAc60C/+C66LBSlG
 MGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0tE4B310nUB0gFBo/wzLg+119jqLd4O6fykhWT0X0zM=;
 b=IC3oZeUeCVhgCfpyty5qsxoyCey+9Ox2ulMKjF43u6TPqp4yJA5eobCfpk+IYG/pri
 qfww8ZhiPCjUIoIIwos9N9GQKJoWS3izbp3j0rQ/Gdaham86vuJIatBTlk7eyJXI3e71
 4nA/wYU8spGtBVoK5PAIkVru0J6ndpB1Us9hHd0LBoV8snKlLy2idd1rD6sioXj0Cecp
 KSWNidhIx0+XUQ0Bn2S2ukNfgWCbpFcRAYWsRrRCsbv9605kpRuN6k58mhdvVXkcM/OA
 iRrebwh99xW8ZtbOpLxJulQh+kxGrVdm3w/+tylqqA/X0OzoKk/EggocSZxppKO4KDyR
 clAQ==
X-Gm-Message-State: AFqh2kqi+8NOlCeeQFLrz4ZS2ebfbAeHGSfjEGU70LilqTPCWNQm9On2
 BZrPBhvhl+3tSvfXSyPo1r4civMnF2NuE10q
X-Google-Smtp-Source: AMrXdXsjujbr8EWCfNKDN4D/DZiZa4lQs0U4OiaLv6QqK8kWZ3KRGRuGOqjY5D+UhttpidCwpzIfLg==
X-Received: by 2002:a17:906:474a:b0:7c0:d60b:2883 with SMTP id
 j10-20020a170906474a00b007c0d60b2883mr3822514ejs.50.1673980940101; 
 Tue, 17 Jan 2023 10:42:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906319500b0086faa5b06d4sm3524214ejy.181.2023.01.17.10.42.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 10:42:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] target/tricore: Remove unused fields from CPUTriCoreState
Date: Tue, 17 Jan 2023 19:42:17 +0100
Message-Id: <20230117184217.83305-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Remove dead code:
- unused fields in CPUTriCoreState
- (unexisting) tricore_def_t structure
- forward declaration of tricore_boot_info structure
  (declared in "hw/tricore/tricore.h", used once in
   hw/tricore/tricore_testboard.c).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 3b9c533a7c..47d0ffb745 100644
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
@@ -179,16 +175,9 @@ typedef struct CPUArchState {
     uint32_t M3CNT;
     /* Floating Point Registers */
     float_status fp_status;
-    /* QEMU */
-    int error_code;
-    uint32_t hflags;    /* CPU State */
 
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


