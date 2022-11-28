Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A458563AE09
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCE-0005gp-DO; Mon, 28 Nov 2022 11:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBz-0005ek-7X
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:16 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004oY-35
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id v1so17774859wrt.11
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KhIII14ps0nVEVy/8MmJ4sK/j5eE6abuNMevIXJoNIs=;
 b=F+GdSezCZ2NzoGKt88dnbT1O33cHzKPhUKDNBv3kM7FUe8eOWCGhyFcqnDkCjMBpxS
 Kt7UcGNnVuf7NC7PRDX3l1f7IA0FgBgWX3R3KDqVwDV9LQrxtXwbsWG7sqAVm4RUUMmY
 0Fdyqcs7RMmcAuHOqqlMOLXX52bcMDBWdGY8VL+x4nYvX+FO19lxYzpI/fLW2VswDeQx
 dzanrYtazIq4tsp3W95Q2eVl/yEqwQN6ytD18+uqU2NLYHilzUDdzLBX5aCsjUoobk+L
 BKUBYxe04rEhhFZ2jppd4KG2xsbQ54E4LUHGccFS89gse/quaHCw/OsFsJ4pj4HOlZ5u
 /GiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KhIII14ps0nVEVy/8MmJ4sK/j5eE6abuNMevIXJoNIs=;
 b=2y7rRvwhUm0KqCeRZyqoUdjKL+OVTe5T2B2ZuXaTO2wirJ9nvAwiB+9ZcrEWwV84mX
 Xn58U9nVyMeFBFvlXMh106MMfZ2sANGBgr6PN/yWP+ucU+BjRupkXTDQRVds3TUGBBl5
 6bSrC1oFQuYDTDoeNAE3FAUZ/hmoEDYKL4Ff7gMwRFJ6XYLsOfWZ9w3YO/KWl3nX1dcZ
 mbfdJ13opJ2Ii8q+5dNyTzWf5FudimrCCgeZiWmepFhaDcEynz1BrBr2CkIHI17KpFcF
 Gf3QNWWd6yjEiAV/hiMrUMsvnM0R2eW+pcoMF4oCnLVbRRizAjGBoul/25REvobIAtfs
 h45A==
X-Gm-Message-State: ANoB5pnQIDSVfDKFbcG0f94QH3Emj7MfQ5503/atqrJL8tULw65cELkx
 J6D5QABaiGKKh9+PPm0QBIfmkg==
X-Google-Smtp-Source: AA0mqf44Q6rRgTbu6jPvJikT4Cys58c9Pl3OzUbb3vn90Q5tB/A7qEjlR3JaCTa5sSuG2xddcKbbHg==
X-Received: by 2002:a5d:6646:0:b0:242:164b:c58a with SMTP id
 f6-20020a5d6646000000b00242164bc58amr4176182wrw.45.1669653668634; 
 Mon, 28 Nov 2022 08:41:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adff349000000b0023657e1b980sm11360381wrp.53.2022.11.28.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12C031FFBB;
 Mon, 28 Nov 2022 16:41:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/7] tests/qtests: override "force-legacy" for gpio
 virtio-mmio tests
Date: Mon, 28 Nov 2022 16:41:01 +0000
Message-Id: <20221128164105.1191058-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


