Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCA63AE0D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCH-0005hx-DB; Mon, 28 Nov 2022 11:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBz-0005ei-4O
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004or-3f
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so12133869wma.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ird9EWm5rUrfSLhU9FEPVhmmn/d7w0Px+XaTSgwxrQ=;
 b=nkCcPPFqBWaW61iBEMLREIEnf+2Aq1xU9clj8D+i10TPq8o+cYZqwvArEWmDyhIlde
 2Ks3IOtZvu3A2hlQBOK8EWd8QTIZqxQ+JEVfDeHEUC7t7/Ypus98rf+4GMRhIwBhoite
 SDQJ4bIgiWTPP/L52iu84fSh1KBHgpNToa9E6xPrKTPbu4b+TLZx5A9WOVMHJiBYr7s2
 eB9h69/Ia4FzKthrBGEFaetjnv2PbH69LK7ezitSBkxEG1Y8T8jI7xZ1c+OmymO5ZO8J
 M9aXTyfzhX+VjsUZKTD+A0BlbTeAhQSTkF+THHpK9F6o14aNuhYi/MRqEWdkc4TOG64P
 uJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ird9EWm5rUrfSLhU9FEPVhmmn/d7w0Px+XaTSgwxrQ=;
 b=rxSUenZ+gTovvCRdkGXs/sXU/eZLjrGjnFm2LWt5vYr9Ay1zoxYxYF/Z+tzuimFg3I
 EbWzuh63zyUC2JYTnhz0GaA1X+fkPkp+vGVrMPA8ow6fBbH8bgf/d8JiS33uId7GEi9J
 7002sfUQtzsK5VUPnoYERMF7ruGstD32V1SQovBO6MJdg4imoVuEap+Z6qUezcYvKrzC
 3v3gwrbi3v5V1x8n6CXDCeH4OBE+OBIseae+utzon7yvSHlexnTJ6ztJqWF9+aqnPIyg
 A6BUtLIq0HfVmBUCLa5wWgj+RhNmFHBNJYxgTcv6u7HUHme8YdRlyL4VfuIGLPrzqO/w
 zMuw==
X-Gm-Message-State: ANoB5plGC7Nk+dZZGphHPlp6PTjywB8Ks2u/5PSKABocG2cojJZpmpSa
 4ZdTiH5w10LmpcWxeQcGtUSIGQ==
X-Google-Smtp-Source: AA0mqf5Rq3b12hTfCZEJzvalkz5uEXHW0mvJuiLgqGSkl1HM1J66N6W84sXEo7h/foz3YSg19cbjfg==
X-Received: by 2002:a1c:f003:0:b0:3cf:e87a:806a with SMTP id
 a3-20020a1cf003000000b003cfe87a806amr41211226wmb.58.1669653670166; 
 Mon, 28 Nov 2022 08:41:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adffd49000000b002383fc96509sm11319225wrs.47.2022.11.28.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 294281FFBC;
 Mon, 28 Nov 2022 16:41:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
Date: Mon, 28 Nov 2022 16:41:02 +0000
Message-Id: <20221128164105.1191058-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128164105.1191058-1-alex.bennee@linaro.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

There was a disconnect here because vdev->host_features was set to
random rubbish. This caused a weird negotiation between the driver and
device that took no account of the features provided by the backend.
To fix this we must set vdev->host_features once we have initialised
the vhost backend.

[AJB: however this is confusing because AFAICT none of the other
vhost-user devices do this.]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/virtio/vhost-user-gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 5851cb3bc9..b2496c824c 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -228,6 +228,12 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
         return ret;
     }
 
+    /*
+     * Once we have initialised the vhost backend we can finally set
+     * the what host features are available for this device.
+     */
+    vdev->host_features = vhost_dev->features;
+
     /* restore vhost state */
     if (virtio_device_started(vdev, vdev->status)) {
         vu_gpio_start(vdev);
-- 
2.34.1


