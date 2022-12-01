Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F6A63EA67
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:40:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0e9h-0007fV-UB; Thu, 01 Dec 2022 02:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e97-0007bc-Ty
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0e96-0007lb-5E
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669880291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTf7rY4Lx8QooP0oUcumMYDzHQCYIG+RvvZZ42alNCI=;
 b=YsiKXJ90A7X103Qxgg8aChacJDpidsV4XXCSqV2oDztC/Qr4p8rU3xhs7FV6qfqFLzsqSV
 3KTUhijEBrm0YLHVOoB8yFc/9Xejs3cfmp1SOiqNrY6YN5ohf88atS0a89jBdk3cPi1x4Y
 potORB6DvOcenUVj+D9rKVjGcCBz8lQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-IxtQUOFNOiKIhDwr5jOzDQ-1; Thu, 01 Dec 2022 02:38:08 -0500
X-MC-Unique: IxtQUOFNOiKIhDwr5jOzDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so2152293wme.7
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dTf7rY4Lx8QooP0oUcumMYDzHQCYIG+RvvZZ42alNCI=;
 b=DiVlcyMC0rpFrjNHzWT7MztvAZMZ6//KmFyMkWece7+h5nvj6qhe3QOa0/46dytJ4P
 UH4qYbp8c495ZD2AiwX2aQpFvT14EomGG2JvCX/adEnh6sXdh4Lp8VThJytZqqvsw2Ki
 06YtTLHZBP3MC5uHU69Yhpy8nBVQnMoELs8pEWDs74/ZAq9GwouuR5AMZCiyvyPJ0ZJB
 u9hdscMGuypXsqJutKrKh+x7RjQkk7MCyooN1WP2Eeg52DZMVUCHDROOuy0XTqx04LBL
 RPsY6I7tpkOzUkti6v05XOaeWT9GODiSaK+oWkA7zIt2zsfPZ+3BUgrfz8VPkTnE6Ael
 C6Kw==
X-Gm-Message-State: ANoB5pkdrcq2piVm1bPt8ngJgPWP2Yvf9zDb/Fshn+uh3Xh0wy1c5K2o
 FH13C+iMaK8q0ekwBqgC4cNFU6wXUbpCnC2ZNmFy6JeUSV8t4Ha4puN9caRnjJHuAkxX6kyYsv6
 MhMV9wAQnLap8+wzWmXPkWuTNG7MpmURO8rQgtpbGGKGEWiPO4O3p07KlovSa
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr49937806wmi.203.1669880286735; 
 Wed, 30 Nov 2022 23:38:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6RQRVRBwQ0Huug7WtoBiH1/9NdvlwamzgZzF3vtVo5bNsnLCiEjpWKoRsO+xOQCmrUrLcKgA==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr49937777wmi.203.1669880286462; 
 Wed, 30 Nov 2022 23:38:06 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c42cb00b003cf37c5ddc0sm4076191wme.22.2022.11.30.23.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 23:38:06 -0800 (PST)
Date: Thu, 1 Dec 2022 02:38:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 1/5] tests/qtests: override "force-legacy" for gpio
 virtio-mmio tests
Message-ID: <20221201073725.44585-2-mst@redhat.com>
References: <20221201073725.44585-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201073725.44585-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

The GPIO device is a VIRTIO_F_VERSION_1 devices but running with a
legacy MMIO interface we miss out that feature bit causing confusion.
For the GPIO test force the mmio bus to support non-legacy so we can
properly test it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1333
Message-Id: <20221130112439.2527228-2-alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/virtio-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
index 762aa6695b..f22d7b5eb5 100644
--- a/tests/qtest/libqos/virtio-gpio.c
+++ b/tests/qtest/libqos/virtio-gpio.c
@@ -154,7 +154,8 @@ static void virtio_gpio_register_nodes(void)
     QOSGraphEdgeOptions edge_opts = { };
 
     /* vhost-user-gpio-device */
-    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
+    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test "
+        "-global virtio-mmio.force-legacy=false";
     qos_node_create_driver("vhost-user-gpio-device",
                             virtio_gpio_device_create);
     qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
-- 
MST


