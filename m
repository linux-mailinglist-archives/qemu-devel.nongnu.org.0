Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476CC582A30
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:03:10 +0200 (CEST)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjV1-0000gx-VS
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPE-0002Bw-BK
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjPC-0001rq-RS
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:57:04 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q18so14644483wrx.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=ut+JAknea4rQt9AKGfQscWuPNlJ6r1xiDhvUbLU1irq2wMhyqw0J6JTlsIm8sCwYNZ
 xVnsEePP1haEDvHRCDen/zl/IUYGZYnfyO6BZQbhFU0sJ/8CJx7lugHh6+u2m9GxwlO7
 Oq311eBRM2KHU2Kn4UfCfdzrZkkaRdMNwYqf+ztGiC+C25BYvg7eIeAj79/WH+DF15Yd
 OPwgmElW9+SEJSzeg7UdRA8Rrfz5wR25EAhgrDOk79Q4siMpzit60v2Uxuhf8hd54KtO
 ha4+geR57RIr6GATMS6hjtitUZpZTuyFPhLHIrpQUsoxomHgQt1iwEwd/20D/+vax/vY
 gPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qn9sIffAzV9IF+yjjzIzifr78tit+1ZOBIt0UyqO2Rk=;
 b=1AODFBYCMqMwqVkbQBpnsTIxEErO00bp/G+wHI0gtXQnotOKqyKmO5bImpvNaeB4bg
 I+my12GErKPH9gijvKpH1BMJcK3F6IbjzLk2fmhewkUzss0W7EuDa8Q2Zx0AltFFf1xh
 lGE5SnGNAGmqOxawSxdNV6zkKQBsJVNnc5AUolLz7UkH2J2xmsEgdVlYgL00jni0fwH3
 TyuHwB0BDSLNIFd5IU6YzUSh94yDK8bs4SSUzV7n7whlJe2Y4LH9Kk7i2SRHpRJPhhp3
 yx7o1WPLlGbBQ+qngvJvTfpoe1k17wvjHNxTeTi6iGnA623zzBtp5wvcZSy6Ze613Xda
 pLYA==
X-Gm-Message-State: AJIora9AS9fdGqJwANw5UlHPAYwBwpmUEviZKjS18z9igt/lhGoqNvFf
 dq6NI9+lwJjFif/N60iDuxPjMQ==
X-Google-Smtp-Source: AGRyM1uqX+yN5pThZf/4NHdNj940Px3JypPsXfOEnq7L3z5179bBFpB7i0FMdUc05PuRRhm5pIvFQg==
X-Received: by 2002:a05:600c:4110:b0:3a3:33cd:3984 with SMTP id
 j16-20020a05600c411000b003a333cd3984mr3560159wmi.128.1658937422182; 
 Wed, 27 Jul 2022 08:57:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm17337016wrl.44.2022.07.27.08.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:56:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF42E1FFBC;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 4/5] hw/virtio: handle un-configured shutdown in virtio-pci
Date: Wed, 27 Jul 2022 16:56:52 +0100
Message-Id: <20220727155653.3974426-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220727155653.3974426-1-alex.bennee@linaro.org>
References: <20220727155653.3974426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The assert() protecting against leakage is a little aggressive and
causes needless crashes if a device is shutdown without having been
configured. In this case no descriptors are lost because none have
been assigned.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220726192150.2435175-9-alex.bennee@linaro.org>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..5ce61f9b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -996,9 +996,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
 
     nvqs = MIN(nvqs, VIRTIO_QUEUE_MAX);
 
-    /* When deassigning, pass a consistent nvqs value
-     * to avoid leaking notifiers.
+    /*
+     * When deassigning, pass a consistent nvqs value to avoid leaking
+     * notifiers. But first check we've actually been configured, exit
+     * early if we haven't.
      */
+    if (!assign && !proxy->nvqs_with_notifiers) {
+        return 0;
+    }
     assert(assign || nvqs == proxy->nvqs_with_notifiers);
 
     proxy->nvqs_with_notifiers = nvqs;
-- 
2.30.2


