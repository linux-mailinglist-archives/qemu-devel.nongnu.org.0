Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A86E6956
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo5R-0006kE-R7; Tue, 18 Apr 2023 12:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5P-0006jd-TS
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:43 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poo5O-00019i-EB
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:21:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q5so15808824wmo.4
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834901; x=1684426901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=lh3DoEscXnSGZYVJilsLz7CrDv9jETtkrvXu+/jcvnYRChkSlFa0gMBrojRPrqfezm
 zcULKjJGS8RaT8aZhvGHhlkLwhnBEgfqiccMtVwvOrVhOM8VUDce9BEqe817a3fV++AF
 b8Fzoasw4jnYQEpCZZQA9Whf7zjpTx8k1hoMSuYQLXpB5O6aW94aX+BsxZcaWgcCtWFj
 GwHTSAjzwlWw0WxXnQ3Epi7KoMVB7gmS06TJ8BAcwtRpChb0T6/HFiPc7icqh5IbhDwx
 7PWEGuQupe02XWKsNW52Us+WswQre3G1SkNN+/T+GlTiENr8BfRHfqOR7a+nTr1QLoOg
 vyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834901; x=1684426901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=FsWOXap0Z83qNrAiaKBL3jHS9tTYli2qP5pmS7ecG5FSKZXFAqM6wDHDWqMuTGdNVV
 YalLdpRi++uD/32+PCZmPd0syKmXyxfACuVh4f+m3JIVuQ7s3FF9ZKOo2r+1RcdGNcnO
 jqkry/n0K2/g+Z8h1YbLPpkuRJezvkwx3pzcI2gIn0vIssFOBy0EyYgxSRcIMWUoNIt+
 YCy9FBNe/Uk+tXk4Plg+Cq3ml7TDJqR7W95TUCllP3UQ3Ej2FR4HBP+KHNSMnuq92eTS
 jspaJL4DWI4jRbJnzvgzp8D/IGwuJiu6tHWlYUr1SK9Lidzf39jeE1rLmEgtKkJE9acB
 6rKQ==
X-Gm-Message-State: AAQBX9fBuG34QdinNWrjmhrY8YpZbyzfEBGS/THtO6pQmnxdYccQmWem
 M+h/YIyGx9g1kGmTXJ9P5Nky9A==
X-Google-Smtp-Source: AKy350ZcQ56yJ0x/zonSWGEhuBget+lCP6JrVToqoYGc/8XdNZEzwdisSW77ddxh0cMQaxaSl5wJIg==
X-Received: by 2002:a7b:cd8c:0:b0:3f1:7440:f21d with SMTP id
 y12-20020a7bcd8c000000b003f17440f21dmr5088103wmj.33.1681834900875; 
 Tue, 18 Apr 2023 09:21:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b002fe065da369sm1371456wrm.69.2023.04.18.09.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:21:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FA401FFB8;
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
Subject: [PATCH v2 01/13] include: attempt to document device_class_set_props
Date: Tue, 18 Apr 2023 17:21:28 +0100
Message-Id: <20230418162140.373219-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418162140.373219-1-alex.bennee@linaro.org>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


