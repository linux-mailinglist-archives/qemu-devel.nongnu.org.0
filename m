Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9A3B3574
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:15:05 +0200 (CEST)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTsW-00012h-67
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiS-00081Y-65; Thu, 24 Jun 2021 14:04:41 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiN-0001US-Vl; Thu, 24 Jun 2021 14:04:38 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bg14so10853600ejb.9;
 Thu, 24 Jun 2021 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRN9g/NoEZLbkWiwwJHbOcIt/+zi5y6rwgfm406D0pw=;
 b=ZoSazrxxj5EGv6bI5oEcIla9sFSg5UaqLCIGhdW8F9JH8FksklOFOSKBhFPf1pGXpb
 gLVpWHi6P97aXY5t0o8LbYDpnQppMmik4KSbM/bdySHEZhX+09boI3zgZ1SoUnucIp3/
 pnbXfM0JJ1vaMCixOYklKqURXR0tSi00dAL/YQVB/nAapgmGmymG77d7eVJ0ZKVitVVs
 mKcoTwghuYT/2HNuwufRAcyjf1weCO1hHfxLZQLlMIXWS3J+FAGhuP/BL9kj8dU/dggh
 kB6E8ysSBnYkTgjhPt8olVHJkCAf4wjd5oZJM4/Sef0jEgEPzwlCuMsYvZ94oMs+5HcJ
 Jrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WRN9g/NoEZLbkWiwwJHbOcIt/+zi5y6rwgfm406D0pw=;
 b=sOTp8Hz0L+MFeCwpw1tdy2fi8ZO4+xfnULRSYUKSoaXtXtMhdTle8PV5Et28ArCgFK
 rp+eBgo3HDWBvfnqLT2hk7D1rHQUfwiHvNq0/YAN2y+M9PGg1lcTjwvka5J5VyoihJSc
 EAWiQ4EaUsTt4NA2TibdkfQW6Hh59eQatfyKRA5CaQXlD5MQF1Azwn47EONganXTqh2m
 bcjJ5TM+e9V9tKd85tOZRiT+ugGgLCRxCJ+GSqrWNyKGcWyQi1JYAq1oa34CC415DZn0
 8vy/pIMp+3APCgxXPnz6vMEq75FWHJWx+4H+wEFBrrHyEEI+rAbkSIXkyIkS83l2C8gM
 ITyA==
X-Gm-Message-State: AOAM531OvFcfV3Zi9ENjQMxMY8UVndq8NVd52yjXrHkLgmB9QG9y+v7I
 x1ii0Me090WPpwAajajxD1j5mhVRjSM=
X-Google-Smtp-Source: ABdhPJzWfX7zImDFRRqxt95f0+mrHH3+BmRJe14OqTQkKPrjq/BmXlNlutkmpxCUDB85GI7kufO82w==
X-Received: by 2002:a17:906:edc7:: with SMTP id
 sb7mr6565991ejb.29.1624557872561; 
 Thu, 24 Jun 2021 11:04:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] block: check for sys/disk.h
Date: Thu, 24 Jun 2021 20:04:20 +0200
Message-Id: <20210624180423.1322165-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 mreitz@redhat.com, Joelle van Dyne <j@getutm.app>, mlevitsk@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Some BSD platforms do not have this header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-3-j@getutm.app>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c     | 2 +-
 meson.build | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3f456892d0..1d37f133a8 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/meson.build b/meson.build
index bb3a5be796..a95a9fbcbf 100644
--- a/meson.build
+++ b/meson.build
@@ -1250,6 +1250,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



