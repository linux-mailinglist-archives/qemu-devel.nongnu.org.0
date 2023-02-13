Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80353693EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStE-0000id-RA; Mon, 13 Feb 2023 02:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSt7-0000hu-Vz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSt6-0000i0-DJ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10557321wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKF2b7pEm6HyiNp404lQ+Vuu44DHRtt9tfJtec4bL+4=;
 b=QtIn3LAs9qg4ypYJ1rswg7/7TrbQIUwUIoZy92VfzbZU+nUWQYJ+1X09W+jxPN9Q4d
 sqzxS9ih5wldi7jUXfzUTtg3jy2DY2YPatiSxMqstf3vnUIaK9i2/K3p8I1c7UGP4I8u
 wvQXXGyVTbYqzg7xdJ6xMLh74CCR7QcnKfGv88BuDpwZiAQHxjyCp7bATg8HsYxTV06d
 dQK150taaucoZ0cIn5gkOFjbmiXiA4+U7KTr5sc1PRVQFTgeOPtKk/ZiCBOacC+7eG7g
 MetyHak9deDaT8Z+3+OqJhlQr6EVfokCUKOItmXE2PsAZQnS62QQwQEwQo7BSorlAzvb
 4xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKF2b7pEm6HyiNp404lQ+Vuu44DHRtt9tfJtec4bL+4=;
 b=FNDEICh0+FsUnYxuiHyqj4uwInXUKDnAte5v1/o4VkLMeRIO6d8xRRGzFEsXFCXzhd
 o99RD3gtt2o6VgJ33msN6iFW57fgnm8nl05rFex82wzu+pSIxmhFu0iumg5oesHnB5P7
 bmbh/gHyxT8PLW6Y2wQ+QA99zF53kx4T2L9/dsWNGneB0ql7KOCxOh/8aMmrNopxKn/8
 AFLfR2OFZQcgRd8uaMtb4b70jq8t9EDOGnJjlrCn981+OANCIRu47VJpIG74r8I0Z40Z
 Kby4Wl6zJoru6vIhelbHjZhha6AJ7VE5EnphTvE4euvHM9Lcw/IMuMA/vxi8yLWg/Z3B
 Lo8g==
X-Gm-Message-State: AO0yUKXswQ3DTLI9r3lxFT2FT+HTdKdY84OiWxD1p+XVLMU8qRdREK7p
 X/ELGHxrzO8Cayg5vglVvXGORx4f6Lo+YCXd
X-Google-Smtp-Source: AK7set93mECK5kqoT00VcbS+uhINN6hsaP8kzGHUHdQNGO+wGwZZp3xdtj4Zavda1UB0LigbWWhmcQ==
X-Received: by 2002:a05:600c:3087:b0:3df:ea09:fcc9 with SMTP id
 g7-20020a05600c308700b003dfea09fcc9mr3516386wmn.7.1676271870992; 
 Sun, 12 Feb 2023 23:04:30 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003dc59d6f2f8sm13304314wmq.17.2023.02.12.23.04.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/9] hw/qdev: Constify DeviceState* argument of
 qdev_get_parent_bus()
Date: Mon, 13 Feb 2023 08:04:15 +0100
Message-Id: <20230213070423.76428-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The structure is accessed read-only by qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c         | 2 +-
 include/hw/qdev-core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..43d863b0c5 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -330,7 +330,7 @@ bool qdev_machine_modified(void)
     return qdev_hot_added || qdev_hot_removed;
 }
 
-BusState *qdev_get_parent_bus(DeviceState *dev)
+BusState *qdev_get_parent_bus(const DeviceState *dev)
 {
     return dev->parent_bus;
 }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..f5b3b2f89a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -715,7 +715,7 @@ static inline void qdev_init_gpio_in_named(DeviceState *dev,
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
                      const char *name);
 
-BusState *qdev_get_parent_bus(DeviceState *dev);
+BusState *qdev_get_parent_bus(const DeviceState *dev);
 
 /*** BUS API. ***/
 
-- 
2.38.1


