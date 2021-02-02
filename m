Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6030C906
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:09:17 +0100 (CET)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7072-0002CQ-2w
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zty-0005T2-KT
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:32998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztn-0002GK-1r
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:46 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so21454316wrz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZXS77U8T3S18yOyZJYkPwlC+sECSds1fbjAom9Al5KI=;
 b=pQ/knD9bG7Im/j0VmGXXmDf3cjDJCDDAyhPY+da91Y/OA5XXDMaIliS7GQ2sGxWObe
 /CLz0s8IWtQ5SBu4ZZFBJPjsU9pFue7jjA9kj8rFTvFoel7ePqlrPyINL7LCWL6rWziW
 e25oeGNtQsArqrF11k5PgVm6pp7Sm3veg8DE1Mt4PzUNCJnmgmNSiwQM1y+Y0ilOluZi
 50Orta+ABB01Aa/SjjaghgXbNY1/iCObP/WStBdG9Y/e3BHl14K7v/WPNGPmOt9KF+ls
 iUZjBG8PGkTPYaU+ufCHl9GYR9t0xRlroob1YDmOevJYrVZTiRUivrNbOWEjmTUMC0d9
 EywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXS77U8T3S18yOyZJYkPwlC+sECSds1fbjAom9Al5KI=;
 b=U76t0pJZ1XUBmNflt6lbfb2uSFY5ZOPxSYmy6Hw9i4GFRUcle5R2x//hNAQLl+WfVn
 828iMG6UwwblMSNBIIDDBBIGDRKCtIzTFS08K1sc5soL+W6xbRf2e+5ZQr0TxLN49fQh
 VuIKPqBQRGyEG+jkDG5qIuKOIdVkbVy+zSL5EDf07NfSXoa1YTnNKj1OWTpeke6dkqys
 NMMYq7HHRI22Wexqnjg16trCKNk9o3VxmFX8EFNh+uIjGA5pqqdtAxZ0xk5ICPhKtYXn
 CwBUp51jd1TagDs0eTjOYEJAkGkLA5NzCB4JWMBe5Qd3VvH6+NCFH+gSTKSeESNmFSft
 1q8g==
X-Gm-Message-State: AOAM532lBelCjP6Ba8hEc2/lGiD/ElCVIJpNRq12KpW6qQTW4LEToz31
 gGZ1bq5KGWWvoe+lUne8pCfaAO3Qtl40sA==
X-Google-Smtp-Source: ABdhPJwNpQSzcxs8vcGjaN524LqPQpBaVDkDo+aa3rwop9ZI8sc+1/Q/Va6JpKdI0xAnGaZKK61P4g==
X-Received: by 2002:adf:e511:: with SMTP id j17mr24972977wrm.17.1612288526857; 
 Tue, 02 Feb 2021 09:55:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] hw/ssi: imx_spi: Remove pointless variable initialization
Date: Tue,  2 Feb 2021 17:55:03 +0000
Message-Id: <20210202175517.28729-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20210129132323.30946-4-bmeng.cn@gmail.com
Message-Id: <20210115153049.3353008-3-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4d488b159af..8fb3c9b6d1b 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -434,8 +434,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.20.1


