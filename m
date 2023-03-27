Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542D6CA561
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:17:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmha-0003MS-Ju; Mon, 27 Mar 2023 09:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgmhX-0003H6-VW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:15:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pgmhV-0002EG-TD
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:15:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id l12so8736503wrm.10
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679922952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=MIILrSg8ZQLQ07GY+TgJRUI8mbTVDgVxfrkQiytHeqInKIoDaVxMm7Hw7azJrMx35T
 efId33cCjQFfRjEKGU45g07BwPNF8trvj/BrZY6/5qO673fAe1sF6I/e/fusjBCeamIx
 EdtTKXd8WH3NjG/oYB3DNTF6e6XtEEglLHfkVkfW5tljtUT17vGwTtFfXaaJ3nB4lQZy
 1GNQ1G7ukHvk1UxhuiKycOvD0XXmrJYMTTtwcum0/JJa4KO6F3ty4gaD8z+RcoolBxbk
 /gd8Gx7G7sZCxBGjG7HshDL+g6FU03Q9WadnDKdtj8TVwc3jtMhBMOZ7Vmf7iPdf87Ow
 Xj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVPcgNqV4+yTyF7JyxZthOMz/9y/APO3HAlemN7QWn4=;
 b=JuNFhp00yJkKQoO/s1FDjvIyZdhSIxCoZuH45iC4U5W3GZKNQ4zVyaInUnoW3Z2hud
 Olm94Kt4Z55DvU8TC86Z7hEPcEjwEuiUA5EavAG0QwzCzEXm1mIQFBJGfCIQnzFuflee
 CxdLsStyOcpByXetRGnBG+FYEO0gid58zqRME3GZ/oHROj+IzjulJ70AZLXfw5JOFwQ2
 jWUmSkc+gziXNhX6ABrWpJ3RBOZm37ABfMaQPKdNNWao25FgwL1vLNfuHyGprxfB03Bj
 UuHWF1vqnNyubmiYj1HxWIpnTEjXnfoDSEvOY568gX9bc9/+MMyrX2rWBuF0V2beYlzF
 E8Qg==
X-Gm-Message-State: AAQBX9f/ZGqtzu6erqNWrsrsladJfcTmbVMV45qfl515b3qMUcWK6kzc
 V6E8A2gHeYitBKoSxWqNE29W0Q==
X-Google-Smtp-Source: AKy350ZJcxi5rMh/zgyyUt3cwi8K5JOFGX/9Gg7ZzTog0G0EFlmUVqFRRugOX65YGdZsRa+WbvaxRw==
X-Received: by 2002:a5d:4b42:0:b0:2c7:454:cee8 with SMTP id
 w2-20020a5d4b42000000b002c70454cee8mr9928980wrs.1.1679922952052; 
 Mon, 27 Mar 2023 06:15:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b002c794495f6fsm22054021wrt.117.2023.03.27.06.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:15:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 089A11FFB7;
 Mon, 27 Mar 2023 14:15:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [Socratic RFC PATCH] include: attempt to document
 device_class_set_props
Date: Mon, 27 Mar 2023 14:15:43 +0100
Message-Id: <20230327131543.2857052-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


