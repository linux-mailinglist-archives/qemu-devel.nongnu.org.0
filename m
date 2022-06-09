Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886554476E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 11:29:44 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzEU3-00010R-7W
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 05:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6w-0001P2-17
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE6u-0005y0-1E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:05:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id a15so22952820wrh.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v6Qr9bE25ltpawAcQgSfkzrSpXI1MycLCG8XufyC2js=;
 b=bKA17z9ZQuuNoWzip2SlJ844IpZsf7Gb7WyDu2G8duXJxRa39m9YZpaDdkXr88xfpq
 atdfYK9AUTa1HRrK2IUb8jHK5yb/9+lu2XL9rNsRJshwdvyjiC/CzQzjwiKpqFR2nPFa
 bo/ngXemLA17moqfZ4GaJTcRK1aXA6qzE0IdHbJmfHKb/iB71sbeLjPLuPPiAyW9Gt8i
 OSgVRZxkTWCKSzqrh7qOrLWDjoh46Qn2Jdvopi5k38ceNrdNt81b3b56p2G5PGy5QUKl
 QxPTM72k1phA8vw+seTTC5AV772uMQZjeWDXlK6f+yehzOEuETcMT0vDH9FoQEF7DHQH
 ZpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6Qr9bE25ltpawAcQgSfkzrSpXI1MycLCG8XufyC2js=;
 b=DTc0/uVEiZQRyaVmMk4diVgpo5cdmXUFLhWJrMf5AEXdTOSKqLoTUnzal+rViSSpxK
 GuTQu20UfoJ40a6qDRmbppRXSxR9buLN81A7Gw2Yln5KTXdngLVFAgjzymRbhiB5AlXh
 /rfDtpka3L01kWA3J7xfbJlzcknsoWNxescNk1+Y8UEEjULxmhZQNzXf5NJON4jNE066
 p+TYgO0lbzaRfec5Wov5oFIS7Xf5am9zpVUHNTvty9PIreWCwFYZiRGtYNG+g/YBAAq5
 uqqE98Tqy6i8KrT6INARLRJgaVpHaFMylNAulBWizZDZ1cbsRuw1TM6z5Yyv8/GPtAbT
 PTHg==
X-Gm-Message-State: AOAM531NuW3LmLFnP11IYLInNVHwvC3XLyfssjJuTpeVSzSxKcnhhjMF
 N5/HB9gel2kO6GebHf3R/29CASQ6wtQDBg==
X-Google-Smtp-Source: ABdhPJwWv0/Eg6nc53WFZoCrjYWlqjsd46B7PRybMAs0DyG+q9pkeuwrrpxOCGXzL2PySxNzQoUaIg==
X-Received: by 2002:a05:6000:152:b0:216:160:2e60 with SMTP id
 r18-20020a056000015200b0021601602e60mr27313060wrx.663.1654765546692; 
 Thu, 09 Jun 2022 02:05:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.05.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:05:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/55] xlnx_dp: Fix the interrupt disable logic
Date: Thu,  9 Jun 2022 10:04:48 +0100
Message-Id: <20220609090537.1971756-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fix interrupt disable logic. Mask value 1 indicates that interrupts are
disabled.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220601172353.3220232-4-fkonrad@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/xlnx_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index ed856b596da..a071c818833 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -889,7 +889,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         xlnx_dp_update_irq(s);
         break;
     case DP_INT_DS:
-        s->core_registers[DP_INT_MASK] |= ~value;
+        s->core_registers[DP_INT_MASK] |= value;
         xlnx_dp_update_irq(s);
         break;
     default:
-- 
2.25.1


