Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059654757AB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:20:30 +0100 (CET)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSKj-0008N9-2k
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:20:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRih-0007Fq-68
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: from [2a00:1450:4864:20::331] (port=36633
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRib-0008VB-8u
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:10 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso18183939wml.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qng/i8R7/XsaL+VWydrhabs7NyFdgykqoNa9afu5vIU=;
 b=GLEOJA/cckRNkwmFEFfnFqQNjlymAJ7Atngcs3YQtlbDec0Q+3rv6Ink8geZPsD9N4
 0ACYgXP1SEDz1TQ95jXmuuV7tX5VAaPu1g92S1fDC/NlV+TkuTcIc9OE1TxB+FaK/nD9
 Kb0RjhwyocOAIJsU7JtVMVnfRJxv/0lSv8N3eVsJOgC1qsarY/gNVul5EMryK+ZxbCDN
 6BzSrk0ydpYHTqLqcmWEoBRf8U+AP+xnAUT+5ljYxb6sILWYmFczWQF96DmJ8n8pdLla
 Sb3pJog8YKj5+ZHJPyo4g7Z/rvtw9QqJDjrrl2SA6tAfX4V72IhZILBGrqBCW3hQvYpm
 /U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qng/i8R7/XsaL+VWydrhabs7NyFdgykqoNa9afu5vIU=;
 b=lJi87QsKrqhGx0bcdLqG020zWXYAtlTy2UmbV/dXF5ZpickfSbr7RydpoeImJTssoQ
 CpGeJ7MEX7IF/QeYEYr3wIyZhn723X5pKocOg1fuB2JDK/hHdNcHeECG2Mndpq7U1yxB
 z1Pd1B3GKjhUGTWKZVB/4UVtCTK2a3R+j9/7X4XK2UOscTVbJ/7TeHeOV/FjhVfRCHdl
 18+dlebXF9QSeXQA9a223qg9PSDBqNrmM3SFC+vX5Q6vm4m29Ys9OE3w7i3Gq7hUuwQX
 9AvWqPMYu7JMjByOKlY1M4WoISfDY4tux0d+4qjpUqyUhTuW9DRSykzcp31rq/KnYS7e
 iDMg==
X-Gm-Message-State: AOAM5307T0o9lTQdBZA2GbSkx2f8ynWrTKFrzTDZFuN9xv8zzq1ECi67
 xEsOFNcnsmEI4UuQk9u4lWqyd/2VE1hWqA==
X-Google-Smtp-Source: ABdhPJwk8D6wghUnhD7BYfYniMFeewKaicsxauKkgkqytLjpWXR4kh44+7DOTlJPKNObIUnu3J3WIQ==
X-Received: by 2002:a7b:c2a1:: with SMTP id c1mr4006162wmk.112.1639564863796; 
 Wed, 15 Dec 2021 02:41:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] hw/arm: Don't include qemu-common.h unnecessarily
Date: Wed, 15 Dec 2021 10:40:39 +0000
Message-Id: <20211215104049.2030475-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

A lot of C files in hw/arm include qemu-common.h when they don't
need anything from it. Drop the include lines.

omap1.c, pxa2xx.c and strongarm.c retain the include because they
use it for the prototype of qemu_get_timedate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-id: 20211129200510.1233037-5-peter.maydell@linaro.org
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


