Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADC638F11
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXZ-0004UQ-1K; Fri, 25 Nov 2022 12:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXK-0004O7-OE
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXI-0004V9-11
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z4so7792481wrr.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhIII14ps0nVEVy/8MmJ4sK/j5eE6abuNMevIXJoNIs=;
 b=XT0Xq5UCZ0tEpEXE6rRkUKa1Kcdpy8U8n3vYOSqQtDSUwoQJcL71clEjVZe20od9zQ
 WUo0ZOCS/RFgrpq79REiwVbDmKMquuetW000BfCpvH+f93LcxcGAsVvsQy15TSz1zjKV
 NJaXZ7nieIeik0WU0neicZsfWnGVch/WcfbJ2ZmbS/jlOLulUWMcuylLL5yh+PpTiCwE
 +ZaZD7GP7sPaZ2LGcUGX8o+rDwWoKfCESbnUcxSlASby5WyngcLN1PRUCqcnUaYS/sE1
 DR+fI07aL/xid7gRsTgR9Ocw3jcfhB/PYVMJ3GwGwvHI7x3Z3hqAz4Vt14ANNU8yM/a7
 /BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhIII14ps0nVEVy/8MmJ4sK/j5eE6abuNMevIXJoNIs=;
 b=rx36Q935HiZ+Sk9lLhypWSsFCgIw9pz64TKYpkHursl/EFNPSPpYLS8zEYS1FA0L0b
 1U0UrIgsqZfyEAtjlzbUDUSw3ivPvf65X9V60gvF4HAOwWS3jYnMN0ksgkG6fJFXZSmF
 xhbjjIHnsEFPZ5NmeOi4dTUC2VyvG897QPjmiZQP4Uhtb7NTBNugG4aCoZgKRNjrpJY/
 SqxvxBg6t1tSv/RmML9M41OGJtznrsf+jvXbPbVdXHxI9+LfLCM00haZQG/lv13wIj82
 r/S5lcyDhb2bKBRexUxLD8Gw68rvbclVD01EZGewtnMJak35lonLCWpCLsUY/ocn3+pl
 OQmw==
X-Gm-Message-State: ANoB5pkX/HtM5g60EUjVxaZ162sRG6FZtpvoyXvxEKswKOXal7MZGEeJ
 6mgtqpiwvO0aiawTHi0eBh+bUg==
X-Google-Smtp-Source: AA0mqf4K1mefp74X+RNfETuqtIBoonM3Nt/j+jPzq8J+qHU84rdUJp969rj/hxPgnqkde7jaJUxQEQ==
X-Received: by 2002:a5d:5952:0:b0:241:a79b:3c41 with SMTP id
 e18-20020a5d5952000000b00241a79b3c41mr23705868wri.22.1669397446664; 
 Fri, 25 Nov 2022 09:30:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b003c6b874a0dfsm8014653wms.14.2022.11.25.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:44 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6772F1FFBB;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 3/5] tests/qtests: override "force-legacy" for gpio
 virtio-mmio tests
Date: Fri, 25 Nov 2022 17:30:41 +0000
Message-Id: <20221125173043.1998075-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125173043.1998075-1-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

The GPIO device is a VIRTIO_F_VERSION_1 devices but running with a
legacy MMIO interface we miss out that feature bit causing confusion.
For the GPIO test force the mmio bus to support non-legacy so we can
properly test it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1333
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
2.34.1


