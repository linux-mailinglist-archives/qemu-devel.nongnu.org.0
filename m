Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98B3C68D5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 05:16:20 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m38uA-0005k5-W2
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 23:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m38sr-0004gn-9D; Mon, 12 Jul 2021 23:14:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m38sp-00052j-II; Mon, 12 Jul 2021 23:14:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id f17so28434019wrt.6;
 Mon, 12 Jul 2021 20:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xOo8X9eGtDGtE4fN+bJhxWrOuktKzY54MAxp7iyHlZw=;
 b=ix/oKmMFdqsguxXtU+GHtM2B/zbH1S//SS13Itj1NFlGK/tMsG+Z/1/bGxdzZihVAI
 wZ/tkwpEFDKk3CP+GD/30tkekF7tIVtIKbyMPd+UfBqy019SoljGvrQ29lDUHiH0X3CX
 21cFVhLAis9kz/RUNRXeFbU8YElIhtKRj2MX+bLzGYKw/MA9x38C31Bc1Dp2rdkmZDBT
 ve45IUletnuJVK2pliYa59ndJcbwCdB+leioaJlj6EMaevJuG+7NDToTKPYch1ik6qm7
 DRwtrQPw5VKIwe46oZAa65BipZdGX7SVFHdxdRj7vOXVZk/MFEBLyDC4CY5ooAQYDZpn
 4zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xOo8X9eGtDGtE4fN+bJhxWrOuktKzY54MAxp7iyHlZw=;
 b=nOQGYiDsLqV8U/hgqwEzvkULKDMkz1P1wrBh2szNYfLaHqvP1WNj9Imi1jALwFyPtz
 MDOH/XTlVj2UUinBa6n5CUEnsVoutS/FH52P6BcJbX8jj2UXOzmVnVuqJ9B0QcThCpex
 XfgNoHVuZ8llQgLdMPneJPjctKND4bycljobtFAfkpitzo27h4yCSl00s/yn3Fc5CbwI
 8pXDGv7riHRD93u0yJaOU9xlwtRBd/sIZS6NyC/gvn83QCZEErGSGDZSYl+VagIPOB1f
 J0qM7qeroDTvlPt0K5pKm7xX9VeSh6Q/cPIyT6iFubew+Nyk7zqeVwY/wsCSJNPkdkTh
 9erA==
X-Gm-Message-State: AOAM530IQ/yX9H2c6YyyiJTiYuNEjeYJ/cz9d251jJpeFBlBqt+LmLcN
 Ce6kX4Uo1+qXt1iI5PS+fE8=
X-Google-Smtp-Source: ABdhPJyUkGsEon/MnKkVR2gI0RjV8g4Ed9DjpZJhrAr0C6M8gfB+zB3kBKuAzvp9jTevJQOOxiQL1w==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr2629308wrv.155.1626146092983; 
 Mon, 12 Jul 2021 20:14:52 -0700 (PDT)
Received: from localhost ([147.78.177.108])
 by smtp.gmail.com with ESMTPSA id o3sm15293671wrm.5.2021.07.12.20.14.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Jul 2021 20:14:52 -0700 (PDT)
From: Qiang Liu <cyruscyliu@gmail.com>
To: 
Subject: [PATCH] hw/display/xlnx_dp: fix an out-of-bounds read in xlnx_dp_read
Date: Tue, 13 Jul 2021 11:14:43 +0800
Message-Id: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=cyruscyliu@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xlnx_dp_read allows an out-of-bounds read at its default branch because
of an improper index.

According to
https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
(DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.

DP_INT_MASK	0x000003A4	32	mixed	0xFFFFF03F	Interrupt Mask Register for intrN.
DP_INT_EN	0x000003A8	32	mixed	0x00000000	Interrupt Enable Register.
DP_INT_DS	0x000003AC	32	mixed	0x00000000	Interrupt Disable Register.

In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
will write s->core_registers[0x3A4
>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
rather than 0x3A4.

This patch adjusts the size of s->core_registers and enforces the read
access to offset 0x3A* and 0x3AC to 0x3A4. BTW, because the size of this
MMIO region is 0x3AF, this patch also removes the assertion in
xlnx_dp_write.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c         | 7 ++++---
 include/hw/display/xlnx_dp.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 7bcbb13..8903181 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
         ret = 0;
         break;
     default:
-        assert(offset <= (0x3AC >> 2));
-        ret = s->core_registers[offset];
+        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2))
+            ret = s->core_registers[DP_INT_MASK];
+        else 
+            ret = s->core_registers[offset];
         break;
     }
 
@@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         xlnx_dp_update_irq(s);
         break;
     default:
-        assert(offset <= (0x504C >> 2));
         s->core_registers[offset] = value;
         break;
     }
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index e85e428..99a6d47 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -39,7 +39,7 @@
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
 
-#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
+#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)
 #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
 #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
 #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
-- 
2.7.4


