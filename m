Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1356E27FA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:05:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvF-00072H-Vo; Fri, 14 Apr 2023 12:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLui-0006Ri-LF
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLue-0007yT-Ka
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o6-20020a05600c4fc600b003ef6e6754c5so8378903wmq.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488275; x=1684080275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tB5/chm/xr33XCg/P0FBnvaCeSkgyIRzyFrSzsSo0k=;
 b=nfBBBpcykoTEqquKkMJXT0yVy3hlK6944jFPb+9q/eLqYGwR6OqL1NKSzrzDZu4z5V
 aDTXWqxVpV6+PU1xcb26oAR56WQCQBD8X9IHbnAGfTGAvflVAZffs+BqKjdkaU8W0PCZ
 SOLzokotez54WLEyTiP8xIshpQDcPfgfVPWnEDoqCU/xZae902SRbgKJPNabP9k4sle9
 d9MpjhkbOO5OchlXX/gtLJx0/DenVWuyB4C+olBQd9dKiLUB6kim93kCQlEQAoWlJtT3
 g0k43sMM4yK4Od+sWIGf4FsN/Bz85625AhyE+dnsQsZPzIei7PpsvwgfRdUo5PS7kiFA
 pkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488275; x=1684080275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tB5/chm/xr33XCg/P0FBnvaCeSkgyIRzyFrSzsSo0k=;
 b=Hv8gIOqsBxoIxIeVt+SFo24y0HXqUXwXd+VJ1Q2NMIPCxYYeoW+jGf12l4P/J9djN4
 oPQOe82UeL2X1w2bBS3KOeGP1edtd7qgQpc/bNxoInWfUthc45LSRnHdnV0sOAEghebX
 Gazf/GsE7GNn6bIkPuvzeSP18IKn1i07+v+zZzXM/VYrcP4tNgQIeIdFPZ8TPeDTsfL5
 3lFY2+bprmmdB65/p9VCc6z9Q5USWMaoU9RgwmqoIDyYapuoLyJtClVGON938iWZqbRO
 f1mozvewWfWjHoMr1PASoD65WW9sJ2xfGKIs9PT9pTBMJAe8VxqBUlJ/jeBobDUnLhTG
 aFCA==
X-Gm-Message-State: AAQBX9fZYpW5To9pm7bUussjW+K44EfOlU4RCFlhSmVJuTRsmp1k1qCD
 knQwXexLD/doISJ1YCt4heTlWQ==
X-Google-Smtp-Source: AKy350YvjS/ZelnXfDEnB1bijmeYjpxKjPa5EsWPnLPx2fEs5vQ70XFc25Gh/PocxYHFNKg1xG+koQ==
X-Received: by 2002:a7b:ca4d:0:b0:3f0:6ada:f445 with SMTP id
 m13-20020a7bca4d000000b003f06adaf445mr4631903wml.33.1681488275019; 
 Fri, 14 Apr 2023 09:04:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b003dd1bd0b915sm8349256wms.22.2023.04.14.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C5471FFBB;
 Fri, 14 Apr 2023 17:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 03/12] include/hw/virtio: add kerneldoc for virtio_init
Date: Fri, 14 Apr 2023 17:04:24 +0100
Message-Id: <20230414160433.2096866-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 include/hw/virtio/virtio.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 22ec098462..1ba7a9dd74 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -217,6 +217,12 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
+/**
+ * virtio_init() - initialise the common VirtIODevice structure
+ * @vdev: pointer to VirtIODevice
+ * @device_id: the VirtIO device ID (see virtio_ids.h)
+ * @config_size: size of the config space
+ */
 void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
 
 void virtio_cleanup(VirtIODevice *vdev);
-- 
2.39.2


