Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE47334536
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:33:44 +0100 (CET)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2iM-0006GY-VB
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2I7-0006HM-NS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2I4-0000Q3-Tj
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiFt/bunDuWc+GWqxvzEWiyWpy7maT5GLWM3/1nEM9A=;
 b=B8CJwNcUqxjmRpsMnS894wdve3LFPzHiuvlpjaP9LduhV08cBYszb7L4CQQDP2lXRXf0bn
 4qBeBSoRxMmH/Q4yPTY2EO1WFau7+9SWabSEfvRAxVM1rhstOOBkbCb6HzK+3QD/hId28L
 8YwXhds88UhFdMx5G9y88yqwFZqWTUY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-IpquYVrYMSSqvHD1ZhN4Zg-1; Wed, 10 Mar 2021 12:06:30 -0500
X-MC-Unique: IpquYVrYMSSqvHD1ZhN4Zg-1
Received: by mail-ej1-f72.google.com with SMTP id v27so2745159ejq.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DiFt/bunDuWc+GWqxvzEWiyWpy7maT5GLWM3/1nEM9A=;
 b=MSnPCVR0VpivyZ8REvQpk35ja6RuKtmq9rzuBwJSjx5+JnrYxKf2+Lc7fjgylBhHhZ
 mYrELtzw2QfGwaDHSbGOsGWDysNyRh8B/NlOh1s3a/Spd4J7Bvz0sfdyr/u4hF0oNXKn
 hroHPfPBZm5flhBZZTajon94zo5cCWL3q43XvVTV63kfT0/ztNeEtOYY88pn/zszzyDX
 WXpYqWpyLp9tSBAR6ST/oaXtd4ka68tHx0x2NJAJdYcLIRYGNQdW/fTuSUys3CMiaiNF
 90uHNT/HorPgddkhUWVUUFfNpiWlw4rHA3F6UAdbR6IEkqDw5qTkTsdltvgxrfyuTKo9
 of5A==
X-Gm-Message-State: AOAM5324wmwvSlADKZQMc0001CiXTEzWgjFcKHgteWQTFOfQmk7KGaHb
 EJj0c6IcoaN8THEYQ0PMHvh1UNSS1gMK4FoaJVxIcDZaI+1/LEu4Amyai3jVoOgeoVMzkNnUTHh
 Fu8JLEYAAYVkFt8y7gLJ3GT3tX4rs29ox0oOzd5z4BIIJp/aq92BaFgDrVLC9a8Av
X-Received: by 2002:a05:6402:12d5:: with SMTP id
 k21mr4523057edx.318.1615395989473; 
 Wed, 10 Mar 2021 09:06:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5jsZvbUpg2B3B0dIO7abvtqnLN0IyGttpA5dAmgARREaemkdlpx0hegUUjxJRg385QyiQRg==
X-Received: by 2002:a05:6402:12d5:: with SMTP id
 k21mr4523022edx.318.1615395989289; 
 Wed, 10 Mar 2021 09:06:29 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v1sm42743ejd.3.2021.03.10.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] hw/block/pflash_cfi01: Correct the type of
 PFlashCFI01.ro
Date: Wed, 10 Mar 2021 18:05:27 +0100
Message-Id: <20210310170528.1184868-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

PFlashCFI01.ro is a bool, declare it as such.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210216142721.1985543-3-david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 32c9b289715..787466b249f 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -82,7 +82,7 @@ struct PFlashCFI01 {
     uint8_t max_device_width;  /* max device width in bytes */
     uint32_t features;
     uint8_t wcycle; /* if 0, the flash is read normally */
-    int ro;
+    bool ro;
     uint8_t cmd;
     uint8_t status;
     uint16_t ident0;
@@ -858,7 +858,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        pfl->ro = 0;
+        pfl->ro = false;
     }
 
     if (pfl->blk) {
-- 
2.26.2


