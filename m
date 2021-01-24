Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2430193F
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 03:56:36 +0100 (CET)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3VZq-00009F-0N
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 21:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWb-0006hj-AV
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l3VWY-00039K-6y
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 21:53:13 -0500
Received: by mail-wm1-x331.google.com with SMTP id y187so7734808wmd.3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 18:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3jk8M7uoiqLp/tnXbSwyohY/WHN9zW+icvpVea9Usg=;
 b=roFpZmyiSKl9huM8e2oNrGsfF5eSooqjrmSfVqkBIBZzL7m0SvS8FIjvzABndSBSjz
 KoU+jvVC1SXsURWjFCLaqvRfKEBKMDSEJpHn4ME0w1wIMcA1JqCdzOpJ034Ck2Uz7CuP
 IA5ItyYeVz2ATUjMBx6a7DWkpmgZZK4GhmUK6TXI9NvziwkMYVuiYSqWTBBixMGXjFHh
 Pv1S1UdpYV8z2csB3cU/qCvStcNrkk7VblVss9gszRegkT0LmvtMNJF397SF6HoRFKR0
 EhrsqUTEeQ7By+iRxXVrb9VMmJpVuCbwkPdURT1u37YFD2BRKgrpgnEcF8oX894735Mx
 3WBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3jk8M7uoiqLp/tnXbSwyohY/WHN9zW+icvpVea9Usg=;
 b=T3FnojfGKOdnHXtESi+h09ErtJWMG1aXZ0un8PGIy78g3M8Bca9gMUnqemy3ooIxqP
 iCbxtKI3NDkKEJBm52w2lsXe0RyP9zWYEgxdzjsdYWscjwiJY8/dYYjrEFM2vbSCD6Pq
 6y64aWwIWSyYgmevnMT1GTaWcy731sDan5cB6mi7BnWwjVi2A2Up0pz4Cn90jt5GWw9L
 fZBQ4D5k7TWt7v3pytRfuWTWjZ9GVpbiEd1KEfXHG0w3uqAjyVW84Q2WFPRhuxSVv3IP
 oWYY2q5UnGaormh4jM1RGBcfC+5KiE8+CpwIv4g/2YSw1lMCMlmqbrhy7jzYshRJbPC5
 W17Q==
X-Gm-Message-State: AOAM532LImLA7SiA5BMtG2DpVoQI+wPgMwYaeaYEd0jJA5kj1xUI+qVS
 gCELw0IKzXoi+nHAbABOlHM9fg==
X-Google-Smtp-Source: ABdhPJyJMVlYuJ3OBPpG0cZH4Bcrda00vx/uHGFsc18tNGT+KsxSB9jhgzROuwU/8PLHRH1oje86RQ==
X-Received: by 2002:a05:600c:618:: with SMTP id
 o24mr10294828wmm.82.1611456788844; 
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id u17sm16189542wmj.35.2021.01.23.18.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:53:08 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH 1/4] hw/intc: don't bail out gicv3 model init for revision
 4
Date: Sun, 24 Jan 2021 02:53:03 +0000
Message-Id: <20210124025306.3949-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
References: <20210124025306.3949-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a first step towards GICv4 compatibility, add support for gic revision 4
to GICv3 driver (i.e. don't bail out if revision 4 is encountered).

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/intc/arm_gicv3_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..7365d24873 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -315,7 +315,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
      * conditions. However, in future it could be used, for example, if we
      * implement GICv4.
      */
-    if (s->revision != 3) {
+    if (s->revision != 3 && s->revision != 4) {
         error_setg(errp, "unsupported GIC revision %d", s->revision);
         return;
     }
-- 
2.20.1


