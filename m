Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961263D46B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LCo-0004KS-Gi; Wed, 30 Nov 2022 06:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCm-0004K3-AQ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:44 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCj-0004ec-UC
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w15so13375019wrl.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLViAVmTXWmym6+HoOtpECN9I84KF70sSJE6RSB6swQ=;
 b=TMssN8SOZZbbPyCWKTbTjINvOms8RBYIV1DULI2ALB/bF/HK8t112Xwwa0SIVwgqvW
 NdCO+buymEhNIg11pDoqKwj2F8bFKAPxwaUTLB/dYQv+avWLmGjMeKp3kIIYRPlkgTbu
 oE4jEzkL6VlMaErhwfqrKSitwsmAgNKzVQlkQwjSFd8IbFhRPNClGcPipNVDx7Pw5bhs
 BLA8un72GZaeewmzZvih6lh5USLs1rYFcEJf2ri6gepbSUWWEtUNhDmLDdeJGg2zAlQY
 fsfkfWC/zTf31ASkL9ij90Zkpo8FbAX4bOCojylInu88mQYjo21rLZaSVTcRBAhjKf6l
 Yu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLViAVmTXWmym6+HoOtpECN9I84KF70sSJE6RSB6swQ=;
 b=LgFdFE7SfMwmxtdj6fURDN2biV8O0od+BN5ariUpbPPCDeODnc+8JKMA7+y7xsMgEn
 ZHlyfYG1Wm7xFrX3zVl/Ubz6sPlaIA/rS4K/7wc+ymRHfOH4sgt/i7DcW7HWlQ02vGJR
 tBz1ApYAJrr4FzmjyDf2KwRAkzQSDozib3x1kl6G4JGG7u0qHomYKerZDGdzid4A+lpL
 CEiHgRC+CCdf6r805oQ3qN0ku4ITl9Se3WRFbrHWM5G4mTfXszdx0wjwCNybfSdLZ2s+
 WdFKuhQzicHvyJJuOP45qpGmqHbPqF6l1lJydn0I/tG4rH31suTp658GXd2IYE+FiQ4E
 NY1w==
X-Gm-Message-State: ANoB5pkpSIUpb0Du/yiL0pMA3rXTwv+BuLtO+5+rk+Z8lrQpdM3VqjVw
 HElDon6wLNY+B/zhTwnA8OnOjg==
X-Google-Smtp-Source: AA0mqf6fQNVEmCIKtTMpxPbP0CVA80fihSNDSezY7ZMnFE5Mi8quykLO8boo5kGeYzw76A30K9qTHQ==
X-Received: by 2002:adf:ecc6:0:b0:236:791e:cedb with SMTP id
 s6-20020adfecc6000000b00236791ecedbmr37162591wro.64.1669807480490; 
 Wed, 30 Nov 2022 03:24:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d49c1000000b00241e4bff85asm1198989wrs.100.2022.11.30.03.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:24:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6DB681FFB8;
 Wed, 30 Nov 2022 11:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 1/5] tests/qtests: override "force-legacy" for gpio
 virtio-mmio tests
Date: Wed, 30 Nov 2022 11:24:35 +0000
Message-Id: <20221130112439.2527228-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112439.2527228-1-alex.bennee@linaro.org>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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


