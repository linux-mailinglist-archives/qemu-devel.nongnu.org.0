Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1A048ABBC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:54:43 +0100 (CET)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ena-00049E-0l
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7EjX-0002ed-Ji
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:50:31 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42813
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7EjR-0007gd-4b
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:50:27 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso5101359pjb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkMX91OT7kAIdB4d+25CCm5DaWyeKgf+llu62iHOKIc=;
 b=IAEEH3YKLeOTgidQ+fnzMhCgtog2ZQV/snlq8C6e63nOpokW5wGjKlM+j+KYx7Rijq
 y3thkcC9mxvDBnhiHC/Phd1v/NjVnPVSMDghaz48NlCCMPWug7Xq5QWsEhAppBTfZoA1
 pD4fBz81dcQaz7qevrdLrF3jrpSyzDOQNtSpZ2mmpkHKhNNI4fmPPaXui8IliAQxIgut
 yZnf7hSJPk8xvmYoF7+WV2hQmHAq+a4V+w/lULIy9FobhO783B4zBWRrxu9wuN+DZGW+
 QmWlYcpGydbX24Q2uRugdydYX1IjJBJtBahvzcodxchkRTjwCoK3lYQQumO1PgEmjd2T
 LIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkMX91OT7kAIdB4d+25CCm5DaWyeKgf+llu62iHOKIc=;
 b=E+ZLSZHeUtQZNVdBxc4t5NjeqPa3fmSid7GtrLHESQE/2JGat/NibnEKU7D6T4kZQS
 ZzI+RGksCYlUcONbRG4tILUHSjeqTFziy2i8y3cjNDAs2mSMPjDkSzWjOQtbhyplwGzD
 F17rxizmHW9cpjYPlRLRVPRCPe/jE7t3cLzeMuYoyrAuVWNxqfvVJ5jh7hbu+Y2KTlNt
 kjvluQCuaVVa1w1N+Cbd5pej4xAl9KS8a/DrIC4l7ombDQfLaWnPqgP5Xm/dPWAFR/ii
 9jDBGqCQF+JJ38Poc57jP8yCCuq+DMo5TSzq1IARkOdER16AWFNLQS2t7tqclTLypUzo
 fLFA==
X-Gm-Message-State: AOAM531J5uZARTiOpWLNx+XZdYbNk9QkszZDvVdCAd2FonMOoBunY2FC
 bWjIfO5ns0G/lCD2U0XlQW73qA==
X-Google-Smtp-Source: ABdhPJzTZ7ZqDg87Iu4+IheJX7lfHRm4p+c1RxjsH7qIh6gLHtZ95PWL+x0hQJnDUuI72DCuoxT4Bg==
X-Received: by 2002:a17:902:d508:b0:149:49e8:ee63 with SMTP id
 b8-20020a170902d50800b0014949e8ee63mr3752576plg.23.1641898221646; 
 Tue, 11 Jan 2022 02:50:21 -0800 (PST)
Received: from libai.bytedance.net ([153.254.110.96])
 by smtp.gmail.com with ESMTPSA id bo15sm1833880pjb.16.2022.01.11.02.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 02:50:21 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kraxel@redhat.com
Subject: [PATCH] usb: allow max 8192 bytes for desc
Date: Tue, 11 Jan 2022 18:49:18 +0800
Message-Id: <20220111104918.896841-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: f4bug@amsat.org, zhenwei pi <pizhenwei@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A device of USB video class usually uses larger desc structure, so
use larger buffer to avoid failure. (dev-video.c is ready)

Allocating memory dynamically by g_malloc of the orignal version of
this change, Philippe suggested just using the stack. Test the two
versions of qemu binary, the size of stack gets no change.

CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/usb/desc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 8b6eaea407..57d2aedba1 100644
--- a/hw/usb/desc.c
+++ b/hw/usb/desc.c
@@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
     bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
     const USBDesc *desc = usb_device_get_usb_desc(dev);
     const USBDescDevice *other_dev;
-    uint8_t buf[256];
+    uint8_t buf[8192];
     uint8_t type = value >> 8;
     uint8_t index = value & 0xff;
     int flags, ret = -1;
-- 
2.25.1


