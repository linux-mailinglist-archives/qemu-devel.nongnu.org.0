Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CA6E6954
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5U-0006mL-Nn; Tue, 18 Apr 2023 12:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5S-0006ku-5v
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5Q-0001AG-Ku
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bi21-20020a05600c3d9500b003f17a8eaedbso147604wmb.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834903; x=1684426903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KH5LwiCrOTvBSCuNpYnxQcsypFz8wThrZQsAnqkj0KQ=;
 b=XyBsieux2yV2IhpLu6LipUTherdcEmwmOtkCXSVxv6547QiZd/H7LzT/Lsa08V0kNr
 DpeP09zRP5qEJwpmyoYKqjV+zaoikE48DCCYH5W/XC7GuQTKoj8l0ecOV7Y66A8vlGQJ
 ogPOIcz6atx6ZQqW0SCMGMzRdFZh+rIEnCiNAf5tPo80IDMIBMkSLwKKnBuhq3oK1/ER
 illWpRqxPTZjET+nssfUxDZVnRVO4wgcfbDDff1ZRDwdtiw20K2X78Z6bZ4OzVMZgllh
 hi6fClMr9hsqUFbgItsCKU4+kSFoVpQVJATOM0PHQb7FLEusH+GUkwMsZcoKHSot5bll
 z8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834903; x=1684426903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KH5LwiCrOTvBSCuNpYnxQcsypFz8wThrZQsAnqkj0KQ=;
 b=S6mde5NLa8W75eZs1C9nLzr1ZVBNdQUOapikcKY+ZKEMYNLWh+aMohyOsymV13+DeZ
 bTsE4den59sgLcGlRCrbT9EGu4qYEz1tAYNLjQTKCMa/e05yesK7hpDHVe6ttMWc7QmH
 8uP9IUJWAh3hmbo/Q+ovIW1zpKKxvaTKeszSkK2noGZv1QYKlOVm978DWAihmkpwkFp3
 qWEjaD/bcgcL3tTB9ErbNw59f17H7UvkMxd7yHDeBUh6kLltVscWuII6+bl//1eO+TKU
 WoX6X/2WOMobCWEeVQxgfQJXkkS6siu9tch/MmfuLubcICZgrm+wNmqaQ8eeReIghx0x
 tVaw==
X-Gm-Message-State: AAQBX9ddyrAxOUWLcieot8EtzC++7uwQBVwToLMJCp48KFacSs6TCh3E
 MERjWvSfODiTb26swKUtA9KBZA==
X-Google-Smtp-Source: AKy350anlnUhsgsP7QB17wMYoSFv17IlCyVd6QbuBZpQbXKZ01evzfLqXprPBkdH8alnAIa1WI5mgQ==
X-Received: by 2002:a7b:cd85:0:b0:3f0:9d1a:223b with SMTP id
 y5-20020a7bcd85000000b003f09d1a223bmr13183192wmj.16.1681834903464; 
 Tue, 18 Apr 2023 09:21:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c0ad600b003f16fc33fbesm9095950wmr.17.2023.04.18.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 956B61FFBC;
 Tue, 18 Apr 2023 17:21:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, virtio-fs@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 04/13] include/hw/virtio: document virtio_notify_config
Date: Tue, 18 Apr 2023 17:21:31 +0100
Message-Id: <20230418162140.373219-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/virtio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f236e94ca6..22ec098462 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -274,6 +274,13 @@ extern const VMStateInfo virtio_vmstate_info;
 
 int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id);
 
+/**
+ * virtio_notify_config() - signal a change to device config
+ * @vdev: the virtio device
+ *
+ * Assuming the virtio device is up (VIRTIO_CONFIG_S_DRIVER_OK) this
+ * will trigger a guest interrupt and update the config version.
+ */
 void virtio_notify_config(VirtIODevice *vdev);
 
 bool virtio_queue_get_notification(VirtQueue *vq);
-- 
2.39.2


