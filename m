Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2580C6A4393
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe4F-0000SJ-O2; Mon, 27 Feb 2023 09:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3x-0000Mt-K2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3w-0007WH-13
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so3173664wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DxEn9POx9LLw52m4ZF8v0HOcC8aENtYC1Crsbx0vnOw=;
 b=t1l9ZcGomuXQMrxZBrzcdoLvh+wloIYApVU3Ywr0/vLda2jUd9Bk2L8uAKFQgYDQbS
 SpFg58IMC+5VfzxxxtOBls+7K4uSeD3dSs/WUBi42dZ+ZWAFEmaWMQfVNTuZinGfCYtl
 6ndX1vyy5ftixjEhpVMfOtGVFO5fs4LaTJstpaS51cVK8H0n1ZkI/Q1gKpt74+G5lp1X
 t+mIf8j6TvGkETVT4hLhmnFepCBYMLOKcLF67YttnggP9XaixnxSj127+tKZ/v9mMG+C
 /pTMHiblYdCUJrLUimXx/h9Cpm9jiNNc2vEew9/MaYb2+N/G+YFRRwAnE7cSL+VEmwVV
 T8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DxEn9POx9LLw52m4ZF8v0HOcC8aENtYC1Crsbx0vnOw=;
 b=mjQgddyZVq0HIWTDiQR2nRPzOowafHTJ9ETL9DpNvNNW1M/cdr/7nRc6r2K14buca5
 zY5K4pTfa2wArOCZ6dhWic0oVNtg+sqbTXFY7iY0HBq3WCm88xjdptGYln69z5HDvaPn
 F0IGTT9S/BtPf1rFaffpZj3e+bf5QDk2vagd6UFN6YenWSzuwMw3b2ccrkL3Nekbwoj+
 Jp+Y73wVnggpZ1fJr1LcNxeND6owQ4zQy6bfmtVc4upS3j8WOJ0pkCG3uVVp7C3APESa
 nflS5+jxZXTniYqX55BiNeLGt5HtbWOnael7FH0AcOjqejTkJsOXFjBKrZCtw8Qyaryu
 neFw==
X-Gm-Message-State: AO0yUKWpJeKPoNuK2GrC5IgpJZzD1XSEYiEWHA5GEuBHeKMZ8PNnsvAw
 8puTNoJ7C/J0Gbqu7GPFp48TViVZCvR6+Kyt
X-Google-Smtp-Source: AK7set/yBiuMN2dt9wierGG3nEBXTr6nOCiKh23x7u004VSHHJUXRgh6y5uQaqYh6sL4NMVPH1afRg==
X-Received: by 2002:adf:dc0c:0:b0:2cb:f4:e59a with SMTP id
 t12-20020adfdc0c000000b002cb00f4e59amr3548924wri.71.1677506466356; 
 Mon, 27 Feb 2023 06:01:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/25] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
Date: Mon, 27 Feb 2023 14:00:38 +0000
Message-Id: <20230227140102.3712344-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Thomas Huth <thuth@redhat.com>

pci_device.h is not needed at all in allwinner-a10.h, and serial.h
is only needed by the corresponding .c file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230215152233.210024-1-thuth@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/allwinner-a10.h | 2 --
 hw/arm/allwinner-a10.c         | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 79e0c80568e..095afb225d6 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,9 +1,7 @@
 #ifndef HW_ARM_ALLWINNER_A10_H
 #define HW_ARM_ALLWINNER_A10_H
 
-#include "hw/char/serial.h"
 #include "hw/arm/boot.h"
-#include "hw/pci/pci_device.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index dc1966ff7a2..b7ca795c712 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "hw/char/serial.h"
 #include "hw/sysbus.h"
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
-- 
2.34.1


