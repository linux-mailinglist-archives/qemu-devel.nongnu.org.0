Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F76E27FC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:05:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLvP-0007sG-QX; Fri, 14 Apr 2023 12:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuk-0006S0-79
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:47 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pnLuh-0007zC-In
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l18so17963535wrb.9
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=Km+2PWccfqrAl6iXS+0QxP9ByJ0556FYve9PXciZyQzU1CJJ8I8scFfQK8XXBmXy5v
 kxCP5k0lOtBtlyhcAQ6Ik/03qQ6RmDQ6uS/fJhi6djAoAwMq8iy9MjYzmVFdJPZwQIYs
 Bj+0/RjbcQyU3webm69fVm/HEFtLNKhM4/Tnrdw3QUNmsG/9SS6iGWE55Aa7SiqLAoqh
 90DyjEPjRGMgXevBbAaVDpLPWg2yNa9I2RZRk3nqI6VTAuqjMVHRZqx4TD0ZJXVph8Am
 Jq1XAUITDjnI/vmRKZJwwha5MCRh7FIWCZ9u/LW5ZdTsL27nmqk208OjB6hTVp15RfWV
 ZSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488277; x=1684080277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=F7nJUW9Q52nuaZjp2tL+/3heWuzYlmRnsm2hi435ExjlC9fTOXnV2FVbOpMtuEx5l6
 VD4ILVi7kvsGuBhAHN5XuLItNavQT4PGq0urN5bddtlP90uxhUdsR98c7Fv8tK29ni2e
 L9I+JgFoEf+n5d4rE0FlUJefI+j8hkAwCzuWRz3uXjB9wxH0A4pJW8IsvlDv5WXu4KVU
 +y0TMw5xwRdoaG0zIIrIGD570Rxbw+ikV1S3bHlDXsUlIbyOnGBlX9XPUfw8PBtzG4jf
 bG4gUUDsQ7yjYyN0JqP3FQRVqdXbKjGCIDV2t99u48xNX7C59zvokHSlQb990fa4uyM2
 XopA==
X-Gm-Message-State: AAQBX9epdK6Is+ZgaCF2Tw/rpjPOQzOd/wKG3zEaSEq245meOlBkESae
 z0oRt3jFbfFQd6AahxhC6Hd+yw==
X-Google-Smtp-Source: AKy350Y4JrxIzaH4hEXaTATTcEHOHoCPS/2+I5omQlxT1drifGUdW6/mcGhGj0Gu6/wKfm8NwYaBjQ==
X-Received: by 2002:adf:e407:0:b0:2f4:cf53:c961 with SMTP id
 g7-20020adfe407000000b002f4cf53c961mr4436312wrm.54.1681488277718; 
 Fri, 14 Apr 2023 09:04:37 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b002e51195a3e2sm3832381wrj.79.2023.04.14.09.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94B431FFBF;
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
Subject: [PATCH 07/12] include: attempt to document device_class_set_props
Date: Fri, 14 Apr 2023 17:04:28 +0100
Message-Id: <20230414160433.2096866-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I'm still not sure how I achieve by use case of the parent class
defining the following properties:

  static Property vud_properties[] = {
      DEFINE_PROP_CHR("chardev", VHostUserDevice, chardev),
      DEFINE_PROP_UINT16("id", VHostUserDevice, id, 0),
      DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
      DEFINE_PROP_END_OF_LIST(),
  };

But for the specialisation of the class I want the id to default to
the actual device id, e.g.:

  static Property vu_rng_properties[] = {
      DEFINE_PROP_UINT16("id", VHostUserDevice, id, VIRTIO_ID_RNG),
      DEFINE_PROP_UINT32("num_vqs", VHostUserDevice, num_vqs, 1),
      DEFINE_PROP_END_OF_LIST(),
  };

And so far the API for doing that isn't super clear.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/qdev-core.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..d4bbc30c92 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -776,6 +776,15 @@ BusState *sysbus_get_default(void);
 char *qdev_get_fw_dev_path(DeviceState *dev);
 char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
 
+/**
+ * device_class_set_props(): add a set of properties to an device
+ * @dc: the parent DeviceClass all devices inherit
+ * @props: an array of properties, terminate by DEFINE_PROP_END_OF_LIST()
+ *
+ * This will add a set of properties to the object. It will fault if
+ * you attempt to add an existing property defined by a parent class.
+ * To modify an inherited property you need to use????
+ */
 void device_class_set_props(DeviceClass *dc, Property *props);
 
 /**
-- 
2.39.2


