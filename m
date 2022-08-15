Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B205593A97
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 22:20:08 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNgZD-0003NU-GR
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 16:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNe5x-0006Iq-VW
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 13:41:45 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coder@frtk.ru>) id 1oNe5v-0001zU-LR
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 13:41:45 -0400
Received: by mail-lf1-x129.google.com with SMTP id d14so11542690lfl.13
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 10:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=frtk-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=OJp+pBaCDhyCNFNAXZA6J//96yLLLnkyU7rqtdR1lXk=;
 b=peqUwBDnXymttG1y7K7cE/MyloXOFb1/lZDOd92R0mMBFmTTGc13iFlZo0HAcF0jlk
 g9zc6WOf09tiLkBD5KIhs3l3XImnwiwVRJP/U+AI3nuyVTn3wRT9KujNVjCg6sbLCm00
 bP9FEVS5H0RHPKSnWMycgl8yZri6eb7Nqy++qV2nfqD9vqzC5w9pUB3YpsnIUZ44L2j2
 03SNCwYh+lYrf6MFxIgXIyMu2DLFEj9eiFrzRhRN//f7bAXQdB5jfg6Xu3OqRTvNj9m5
 zHN/34wNWuGYzCM/DmijMCh0yinu1DzABp2UP4hnPPi2sHhszIye4/mdBxtoP90HhbPW
 /F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OJp+pBaCDhyCNFNAXZA6J//96yLLLnkyU7rqtdR1lXk=;
 b=Segs/TUa7i20ZLp/lgWLRkbMxusuyaanadJ/2FcnwL9MNHp91C+nGTMdnL6gLHbaqg
 fb7PA66wL7Y5J/eItXvn83xXHfb/hBgmzG6K4hzPT31zwZ+RKvBD9lADj/xoZVu8Peqr
 QKCYTMyJT43rOOOoCf4W+aPIhRqGnt3Kqd1Qnr0383SnM3+K+YCThVIzwTbBCCrlMJ4e
 bzlJsmib1SWG+OdWZ4gP+zyt+uKhXkDiai/+RLl80Xzhk1W+c4sqpGCuPPqJSWkqki8w
 QnZoVq4SQ9UOp9OVtwJLtv2sc0brw1kTRwreTdd0uysLURZ3SToTP6usDQsHmPcrk4AO
 XtbA==
X-Gm-Message-State: ACgBeo3S+nSlXiBeJNDmqyFOUutDJf4EIfRU5KZmgEikCm3bfUvZhP1/
 JyUlGiRKnIBHfBkjKorEcczfTQ==
X-Google-Smtp-Source: AA6agR7R4qfT3mWfS4SYGmRVVmWBhFEtcvs/TzA5hoVZIdvvrhQ8MvYGzBQB06Me0Xs7PLqQAsNCCw==
X-Received: by 2002:a05:6512:10c8:b0:492:41f9:2adc with SMTP id
 k8-20020a05651210c800b0049241f92adcmr2773068lfg.388.1660585301128; 
 Mon, 15 Aug 2022 10:41:41 -0700 (PDT)
Received: from coder-comp.dolgopa ([93.175.20.83])
 by smtp.gmail.com with ESMTPSA id
 bi33-20020a05651c232100b0025e8492e918sm1493073ljb.41.2022.08.15.10.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 10:41:40 -0700 (PDT)
From: Maksim Perov <coder@frtk.ru>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Maksim Perov <coder@frtk.ru>
Subject: [PATCH] hw/riscv: Setting address of vector reset is improved
Date: Mon, 15 Aug 2022 20:41:38 +0300
Message-Id: <20220815174138.19766-1-coder@frtk.ru>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=coder@frtk.ru; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Aug 2022 16:14:48 -0400
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

Previously address is set by default value 0x1000 which is hardcoded in target/riscv/cpu_bits.h
If add to new RISC-V Machine in which ROM area is not based on 0x1000 address than there is problem of running simulation

Signed-off-by: Maksim Perov <coder@frtk.ru>
---
 hw/riscv/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 06b4fc5ac3..5e2438d39a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -327,6 +327,10 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
 
+    /* change reset vector address */
+    for (i = 0; i < harts->num_harts; i++) {
+        harts->harts[i].env.resetvec = rom_base;
+    }
     return;
 }
 
-- 
2.17.1


