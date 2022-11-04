Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA17619CD6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMQ-00076s-Oo; Fri, 04 Nov 2022 12:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLx-0006Ua-11
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLq-0000h9-9U
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso3469809wmp.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uG5SydxIxnzXe0zp1rVqhMwUuqy9ImGn1CKFVjwW+XQ=;
 b=f6AiWZfGjfV7sC62uy+i3tQqAbE4yiuhdFonGVNorS5TVGNgIIjrjdeqPGgHBir6CB
 Bcgq+RmD7nxhEsel5mayWoLui9skUdvI7bjhr841x2U0v/JH7gPcjb1CxoM/e7gT3DPc
 7Sxw68q9KUIHJW4jFKEzAM6dY8+/e+ZsVX7vXDCQxz9xeCitA6FJS+SvG/K+UfwHw+yw
 nWGNyFk+Gnn3WudySZLvh72YXeZm0k/xcZnKrbIEN6spFwZEEHwXLH2sNUUkwTzj0nGk
 OXDM5+KnpBcRpjmNW73tFhAwMrUWBPIjFro1fHorsUIOkkUBzR/HSjp/laLcGZRk3sSN
 LnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uG5SydxIxnzXe0zp1rVqhMwUuqy9ImGn1CKFVjwW+XQ=;
 b=sOMS0/4Pb6sQ+4Mb/steNFhFt9I9qcijmTWUUEoEEetnCVDcWi0QZyFZcl/VvAl+V6
 yaApZmvGqyWLsN5Y46+CnRvQrpYxIJ4MJlvar60IjyIC8a6jnVKjlJC7LsIl783fMD4S
 cZZn7NaY1VPlpPcxcUoJa1jq96mr+KpMRbl0kwlbSioebXs0FH6n3NVPs9baC2pW7OMc
 70jinehyskBRvhxwDO3y4+72mm4zEioXN3NYPrxN8cr2sJ20Em4z6ZzaD3HiXLNqb8Uy
 f4aohLlj2rae8/WdfYtjvt0b27ME+15PKUWuXv/6y4qV2sLcpPR/3j921jWPvwZNm9hq
 o3Bg==
X-Gm-Message-State: ACrzQf1kqcQ7QJQH10/h8txU4jdkGluS3E3wEI1sxQIidK4Ysk9nxnUd
 ZQFH8kssHWpSTOqVDlqGYOQYk6qMVChUwQ==
X-Google-Smtp-Source: AMsMyM6nd8sd7u+q0wMgJzgBB7tYOTFcc+rEBh56Eg4FvZD/GosAwj85UsWLEe2vYTqTObUFVjYTOg==
X-Received: by 2002:a7b:c009:0:b0:3cf:6b95:73c8 with SMTP id
 c9-20020a7bc009000000b003cf6b9573c8mr21109806wmb.121.1667578524612; 
 Fri, 04 Nov 2022 09:15:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 6/9] hw/hyperv/vmbus: Use device_cold_reset() and
 bus_cold_reset()
Date: Fri,  4 Nov 2022 16:15:10 +0000
Message-Id: <20221104161513.2455862-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
index 30bc04e1c4c..f345f310b0f 100644
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


