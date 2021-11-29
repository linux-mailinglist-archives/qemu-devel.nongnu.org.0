Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F534621F3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:13:30 +0100 (CET)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrn1l-0003vJ-O7
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmty-0003Oo-VL
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::333] (port=35536
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008D1-C4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so17832960wme.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKPrq0WiNhFQC4eMSOOuu5+qd4ajSFj6dKcca8DNV3s=;
 b=mP3wWHLlNPW5o+JxKlMf0nd0DI4W5wCSPd8Jjble7DHmCXOdcqLeXRrOJJ8KLxIiPj
 WTP9fxwcVRnVUhU3ctdpJXeLPCE30D+qeStaK/TrZZNhoNl86KhDDm4nPdSbbLS2lVnn
 PeSq5gbWSebm82p0anPmJ87jF1PkCAQ2AR8pn42MA0TzRkllj4vQeLK7kIiEXovyjhRz
 Jbmc7jXf4hMxL6fMAemZB6Hd0aDlVOGmisVt37X0+Kc75J7vjhJjAsGv9Kx8LB6LeQ8o
 wvj7y2yfbdOl21yxHVgS7LhBK1SYi+qgUoo4uHIbKRe8hgN+o7PEm0DTbypPk+o4fUgf
 phzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKPrq0WiNhFQC4eMSOOuu5+qd4ajSFj6dKcca8DNV3s=;
 b=M8MCcFmPmoBF1D/rz8hitmAK5QEwt8u2tODEXcXzgnGx5+fqBJUyx2/2A9+xnTxSbN
 vmLciQhsmgoJJuPNfCpkBIiHluIM6S48YE/n9DGQqvSmQFBfize14GzyKDuBO+UwG9nB
 Xq5rw8TaudIi/OojhKMI0zK5ymAuLjpnMekn0wEq1HH3VqSN9P1Q2xcAGxCvWJpbS9Hx
 BmyozFBcKQis0n8KXM+w1uPV5mySoGX2bTrV9fE35PtqjsA/4drrazdw/+9HKYOzTm4f
 +ON7RfwciN+Q95zL/D3sMSx80uI1fbJ3h/n7xkQShJ33/B540+u2xBrtXbosF3GYGVzc
 nmvQ==
X-Gm-Message-State: AOAM531jBDxhhzP/fAgcETwVbT8BDfffcbN6PAeCjk/mP5vTpOVO9pxG
 o0u1JYIK45dJmrhmG+LN00jY/w==
X-Google-Smtp-Source: ABdhPJx0KWK2V7O54TVwIcwi/31CZylbkq2vs46/fPSLneyCG0PYf1W25ea0XuXAfPX5RvLd4l9Ndg==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr177431wmq.111.1638216316640; 
 Mon, 29 Nov 2021 12:05:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 4/4] hw/arm: Don't include qemu-common.h unnecessarily
Date: Mon, 29 Nov 2021 20:05:10 +0000
Message-Id: <20211129200510.1233037-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A lot of C files in hw/arm include qemu-common.h when they don't
need anything from it. Drop the include lines.

omap1.c, pxa2xx.c and strongarm.c retain the include because they
use it for the prototype of qemu_get_timedate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c           | 1 -
 hw/arm/digic_boards.c   | 1 -
 hw/arm/highbank.c       | 1 -
 hw/arm/npcm7xx_boards.c | 1 -
 hw/arm/sbsa-ref.c       | 1 -
 hw/arm/stm32f405_soc.c  | 1 -
 hw/arm/vexpress.c       | 1 -
 hw/arm/virt.c           | 1 -
 8 files changed, 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 74ad397b1ff..399f8e837ce 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index b771a3d8b74..4093af09cb2 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/boards.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c3cb315dbc6..4210894d814 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae51..aff8c870420 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -24,7 +24,6 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "sysemu/blockdev.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 358714bd3e8..dd944553f78 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 0019b7f4785..c07947d9f8b 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/stm32f405_soc.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58481c07629..3e6d63c7f96 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -23,7 +23,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe04..3e2144e31af 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
-- 
2.25.1


