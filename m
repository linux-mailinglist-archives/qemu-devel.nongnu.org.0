Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985466C3298
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuw-000061-Iw; Tue, 21 Mar 2023 09:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebut-00004v-SJ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebur-0006b9-NY
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id w11so8492091wmo.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dI61HmBS8dvo6fODWjrvfFsUUviRSWQ6NsX3TJ+/KQg=;
 b=BnEu2D6qCAmwC+r5DI2G+2rr84OymAC3mH6NXy3bKH6T41tOM3cLfjBBbrNiBLLgvv
 FECFy3dslAwRkV4IDkBPjb1+FMKP7RJa6NEDUXguuxLEz2nz0aZygSsgZrbXxa03Ucpt
 Xy3FuPSJtu7Jz7p/comjW80pG++ZtR5VccW6rdQBsmci1buyYa2+mR/SXW5yYaaFN2ZR
 YZCIUhgqi5hIsxN+ne6ChpiYsU6zfJV0f5+2Lz4r1p1TDq+1nqDd0Rl/5Ct+lbrlFReE
 7ETKt/nf3UX3EUHmMDlAiPczGfkrD73itoVkxg9eVTiXi35+UYM0exv2cKJ91SzLILQ8
 KyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dI61HmBS8dvo6fODWjrvfFsUUviRSWQ6NsX3TJ+/KQg=;
 b=D/DqrhN9Ti9qltsat2xfMei3lUlI5ddYrG1AQoIajYeUGFA8vhagc6YdiIMve2cFn2
 Su/eaHsWQhNlQIahS0w/HKvvkEhRZwzoxnxV/g3c7tzpod9+oPin2ZCM84fjJmy1LbE0
 g5pKW9FtUjYvEHzCnfEMqHPdPEKdSRSK6n48FejZasUxwc6h/V4STT2WW9ImOKz5F7p+
 oVimIPMKAsuxJtC2Ny0MhbVB1XF5DnJP0pe8p6YzP/87Epu8xVvTsgFYIGd32nDGxnyJ
 lEwK5m6jetybh085z48Z9Bn2txtoCmLb/QVArhbmk/S0srIsaoE+BzAlbDYkeq3OJhlB
 g1yw==
X-Gm-Message-State: AO0yUKVSToSgJEn1Eevc+yJtJ/49kvCY+UAkE2s25tSxHKc3hPwMpXx/
 bVv3dSvM91V2MWmcdgqH0WKEHG2nEzNAH1rvp8A=
X-Google-Smtp-Source: AK7set/L8atKi/+a9oEkAKEXxgZDAAYLNnerHUai4yAI1XOWbnVXAqkSS1FcvjeTktyTBpnWAo/xtQ==
X-Received: by 2002:a05:600c:3793:b0:3ed:2702:feea with SMTP id
 o19-20020a05600c379300b003ed2702feeamr2023951wmr.41.1679404840164; 
 Tue, 21 Mar 2023 06:20:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV
 settings
Date: Tue, 21 Mar 2023 13:20:30 +0000
Message-Id: <20230321132036.1836617-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

The cadence UART attempts to avoid allowing the guest to set invalid
baud rate register values in the uart_write() function.  However it
does the "mask to the size of the register field" and "check for
invalid values" in the wrong order, which means that a malicious
guest can get a bogus value into the register by setting also some
high bits in the value, and cause QEMU to crash by division-by-zero.

Do the mask before the bounds check instead of afterwards.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Message-id: 20230314170804.1196232-1-peter.maydell@linaro.org
---
 hw/char/cadence_uart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c069a30842e..807e3985419 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
         }
         break;
     case R_BRGR: /* Baud rate generator */
+        value &= 0xffff;
         if (value >= 0x01) {
-            s->r[offset] = value & 0xFFFF;
+            s->r[offset] = value;
         }
         break;
     case R_BDIV:    /* Baud rate divider */
+        value &= 0xff;
         if (value >= 0x04) {
-            s->r[offset] = value & 0xFF;
+            s->r[offset] = value;
         }
         break;
     default:
-- 
2.34.1


