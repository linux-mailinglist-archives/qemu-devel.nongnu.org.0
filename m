Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95C64F408
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU2-00060h-Ub; Fri, 16 Dec 2022 16:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0005vs-6X
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:00 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITi-0000ar-H4
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:52 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso4974247wme.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IHmzyE2rDA35kdIKQ9Wr9fAtvPOkZTN4VnNyKqozwiU=;
 b=zq1V6yKcG1RQwRej87Vri7480OhdoOMsyYXLfG7KoiwGLhS1Ney1DH0Kvf/xExDih3
 4P8GnDJlLZl+M3CW0dRNGwexF7kOEHtCR6joYOMbvr//zdJ/bgenQQkxNdQxeQHHdBRe
 +IMJqu/IznUjmqJhpVYNX6O6uNZPsXKE814BmguxfJSvj9HnGvoeI4CHb3fsUd42DWNa
 cyjICycuBkurfsPIRz9xYOk3f9xgDUyedIudGZAXnNeXIXy2YrkLdqUTXP9n31PlTtMh
 XcKHyQc/0pxnLDQyXxJE29XeeGO/mjUu+h12HcXoLAGJQ/2BwJW8M5AyVVOCRebhJM7l
 F6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHmzyE2rDA35kdIKQ9Wr9fAtvPOkZTN4VnNyKqozwiU=;
 b=b8/PikDHs7Qbfk3JZSD/0Z0kLz7mDbMfLhaAHiFmoSJKT5wsbVt3AIu18ZIlugVYtN
 Y8woLlMeooaE5No8ztNRZK7v6qwi+76ERT8EvLOwK/WDB0vrgvCAlCDswTFvb+JU518k
 nlahCwJVIMmIUhPtlzF5uqSHP4oyYH06Cm/MUFDwgF+BjAfM05Lo0iDG8VV9XtTBygYB
 IGFHZUAQ48OTZ037WHmsH1Vbq9vnHj+P8zfUMMeZbmh6MalkSZ6MC6o78rSrpzt9wgEZ
 PjxW9RHDEl1wqos2EOIt3AmZIJCNUk5C5gf0nNsMOysTQOCZzkw7+KVci37MxoopMR62
 WDWA==
X-Gm-Message-State: ANoB5plCXGoXoIDidPv2ZhpCv2sb3YeZ/m16LhxzDLsL3i6fWyTa3wJ3
 LEFR1JGnDO3R5dQkJrBICdvv6BfTn+fosmHJ
X-Google-Smtp-Source: AA0mqf5X508WqPg+seXk9TjWLO2VZlIvsAnHFutSSWWNDUmjiorMXf0PSteFVsAEURfwqmp6HsNFXA==
X-Received: by 2002:a7b:cd8f:0:b0:3d1:baf7:ceae with SMTP id
 y15-20020a7bcd8f000000b003d1baf7ceaemr26923967wmj.39.1671226969011; 
 Fri, 16 Dec 2022 13:42:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] hw/hyperv/vmbus: Use device_cold_reset() and
 bus_cold_reset()
Date: Fri, 16 Dec 2022 21:42:11 +0000
Message-Id: <20221216214244.1391647-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

In the vmbus code we currently use the legacy functions
qdev_reset_all() and qbus_reset_all().  These perform a recursive
reset, starting from either a qbus or a qdev.  However they do not
permit any of the devices in the tree to use three-phase reset,
because device reset goes through the device_legacy_reset() function
that only calls the single DeviceClass::reset method.

Switch to using the device_cold_reset() and bus_cold_reset()
functions.  These also perform a recursive reset, where first the
children are reset and then finally the parent, but they use the new
(...in 2020...) Resettable mechanism, which supports both the old
style single-reset method and also the new 3-phase reset handling.

This should be a no-behaviour-change commit which just reduces the
use of a deprecated API.

Commit created with:
  sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/hyperv/*.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/hyperv/vmbus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 8ee08aea46c..271289f902f 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1578,7 +1578,7 @@ static bool vmbus_initialized(VMBus *vmbus)
 
 static void vmbus_reset_all(VMBus *vmbus)
 {
-    qbus_reset_all(BUS(vmbus));
+    bus_cold_reset(BUS(vmbus));
 }
 
 static void post_msg(VMBus *vmbus, void *msgdata, uint32_t msglen)
@@ -2035,7 +2035,7 @@ static void vdev_reset_on_close(VMBusDevice *vdev)
     }
 
     /* all channels closed -- reset device */
-    qdev_reset_all(DEVICE(vdev));
+    device_cold_reset(DEVICE(vdev));
 }
 
 static void handle_close_channel(VMBus *vmbus, vmbus_message_close_channel *msg,
-- 
2.25.1


