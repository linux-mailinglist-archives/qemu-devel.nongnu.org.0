Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059402DAEBA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:18:11 +0100 (CET)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB9V-0006iP-Pj
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4j-0001d7-5H
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:14 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0007BI-CC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id x22so17002567wmc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=omEaEv7tsoVESKVfIPchee3NEbEA4EUcrD+MDCo3biM=;
 b=zurU6hqObufGMVUtwXwABxtEPbFnl0pO+rdSFdtPEmIw/h3JV49zfVAcl0+3FR+FAl
 3ac7hHloXWrrVA9axp0GWIQtifQrw5OB7D8yxgiQ2jkU9cprRr3UScCYttvnjbqT/SUk
 MfIYk6/PEsuu4pK21SqB70sF+XJuqyYWNQXGeKubwZ0hFLpqRdGVrhwJx5wkt77JXv6H
 OW6xrkwTG9dsfUuoJ3JQ06AStrvY2OP77jTTCZuwfKDx5rw+IEWcPrv3PGNMwyvls8hr
 c9QeAcVCv5FsQqopIpfMceBwZNobvoLZ0frM3q/6WowbvgcinfYsfG8cAA9k54W5lDOn
 Oqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omEaEv7tsoVESKVfIPchee3NEbEA4EUcrD+MDCo3biM=;
 b=CTqvCI3feYmcDgFzyH9uOt4+Lt6s54i4NIr1zcvoznzMWTNzcT+3Sl4t6H+lQ+9Wld
 qT76nVQiC9+ySNvmjTBDrPK+w77bIfH/bMhkwQyzaZLRj/g0YmGwatV9OrFGQfwCvgqJ
 e7VwSVLbvXNZGT88SNOcMHqULEoG1VLpUaT2fBt97i1/+z7C91iDY2uW/EfjpvcRXwGr
 yrMzZY9CTaRuhS4Y/3GXH//F3/9aQWC0cmMEVexUYLNfVAxNxJSPFR6myFRnrrZZhPr2
 /RGKR52vxT4lztsCIjpM7EbmeZbhHBIwHqrfeM5QMM4rJwZZePnJMJ9tDcbQynE7zVeG
 Wa8A==
X-Gm-Message-State: AOAM530s7oIbhHUM9SzIM7J70ctkmvy1+qoq2ZSzlH9PzUP9HJjYwH9K
 Uihm1f//ResyMBcW01qRUgcO1RxbTX/1aw==
X-Google-Smtp-Source: ABdhPJwagXwcr3ZqN7WvDP23txD7iQQlgRG0RIsm/QX8gNmPQH1aINTwtJgZumYc7xJ2S1f47OZP8g==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr33363123wmh.29.1608041578343; 
 Tue, 15 Dec 2020 06:12:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] hw/misc/zynq_slcr: Avoid #DIV/0! error
Date: Tue, 15 Dec 2020 14:12:33 +0000
Message-Id: <20201215141237.17868-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Malicious user can set the feedback divisor for the PLLs
to zero, triggering a floating-point exception (SIGFPE).

As the datasheet [*] is not clear how hardware behaves
when these bits are zeroes, use the maximum divisor
possible (128) to avoid the software FPE.

[*] Zynq-7000 TRM, UG585 (v1.12.2)
    B.28 System Level Control Registers (slcr)
    -> "Register (slcr) ARM_PLL_CTRL"
    25.10.4 PLLs
    -> "Software-Controlled PLL Update"

Fixes: 38867cb7ec9 ("hw/misc/zynq_slcr: add clock generation for uarts")
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-id: 20201210141610.884600-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/zynq_slcr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index a2b28019e3c..66504a9d3ab 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -217,6 +217,11 @@ static uint64_t zynq_slcr_compute_pll(uint64_t input, uint32_t ctrl_reg)
         return 0;
     }
 
+    /* Consider zero feedback as maximum divide ratio possible */
+    if (!mult) {
+        mult = 1 << R_xxx_PLL_CTRL_PLL_FPDIV_LENGTH;
+    }
+
     /* frequency multiplier -> period division */
     return input / mult;
 }
-- 
2.20.1


