Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A095482408
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:52:57 +0100 (CET)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HOx-0000JP-Qi
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKK-0005ot-MR
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKH-0000h7-V9
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NcCg5xKWT+cJ/GsSaNTEefS39uXSXMUdwSN24u99dU=;
 b=MGnkjNGOJtEeFL5CbBtUa8htMQQ+NnLZPcj6Q0A8tJcJ2j87uYfCEwSoFixYzkYm3L8jRl
 8qdcE4RmnKjLITy5+ipZFEcgeE4K2ggK+swu+XAS3+t8aSDWjj9KvsFhIhauajPKKwl5r6
 o9+u1Q3ON0PiSGdLSsLVSgFES2+dqbA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-0gUfkaZPOwKxZ4c_YOOosw-1; Fri, 31 Dec 2021 07:48:02 -0500
X-MC-Unique: 0gUfkaZPOwKxZ4c_YOOosw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b001a2aa837f8dso7537156wrc.3
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NcCg5xKWT+cJ/GsSaNTEefS39uXSXMUdwSN24u99dU=;
 b=PFjdBFowGe1Vyc5grsnNMBIwH6rTriv04bcPMfbV1GJk+Ds+ItyJ9O9IqeR27XgU3o
 BbEUR6joHqOwQiCwlvTGQ6peaepbsPTI2GGUHGizZ8WZbay6cHENyeLmtDy0h6vOm//W
 mbmVHrlt1Q/tbeG+HQXIDF8ztkGy6OeLn//WBlL1kumb1IvCZzH1K7ib+XN65TVszF6i
 m+wFSom6sEho09xqm+Ui6QKOnewB53aJMYzM9enHKX2qIvhXWXiE04fe8FP/0TZ3cotm
 etSdKTD/4kaJlZLaZR1uYD17VAuXTnsmK/2/lJCXUjApDyhZa2ro/R3ClU7+dJMLGNzU
 b9Eg==
X-Gm-Message-State: AOAM5317ekfGpEbejY/BjRtYnUkVMrBCSwjtlfknhJzY4aTW+XexIk8I
 dqnDlEWaoSzeke90ixnJZXGPOUFqz0fOJhzJWfSHl1reyE5o1wNEcmSUIMxdxG3akQiHztLbqOx
 sowV4hmtCAqHty29724AuDme6sZLXcnerlSPM6sDv4S6jVe/NDBUWn0G9r6lNLWiz
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr30161360wrp.500.1640954880492; 
 Fri, 31 Dec 2021 04:48:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpE7zljcX2Zs1AtVs6KxXh79ZF4AojGyjRG+XuQUYtpzNrdxvva9O53mzoMdkLXVEVNKIALA==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr30161345wrp.500.1640954880292; 
 Fri, 31 Dec 2021 04:48:00 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id z22sm27087048wmp.40.2021.12.31.04.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:47:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] hw/qdev: Cosmetic around documentation
Date: Fri, 31 Dec 2021 13:47:35 +0100
Message-Id: <20211231124754.1005747-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add empty lines to have a clearer distinction between different
functions declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211218130437.1516929-2-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595e..59a822ffceb 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -321,6 +321,7 @@ compat_props_add(GPtrArray *arr,
  * The returned object has a reference count of 1.
  */
 DeviceState *qdev_new(const char *name);
+
 /**
  * qdev_try_new: Try to create a device on the heap
  * @name: device type to create
@@ -329,6 +330,7 @@ DeviceState *qdev_new(const char *name);
  * does not exist, rather than asserting.
  */
 DeviceState *qdev_try_new(const char *name);
+
 /**
  * qdev_realize: Realize @dev.
  * @dev: device to realize
@@ -347,6 +349,7 @@ DeviceState *qdev_try_new(const char *name);
  * qdev_realize_and_unref() instead.
  */
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
+
 /**
  * qdev_realize_and_unref: Realize @dev and drop a reference
  * @dev: device to realize
@@ -372,6 +375,7 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
  * would be incorrect. For that use case you want qdev_realize().
  */
 bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
+
 /**
  * qdev_unrealize: Unrealize a device
  * @dev: device to unrealize
@@ -450,6 +454,7 @@ typedef enum {
  * For named input GPIO lines, use qdev_get_gpio_in_named().
  */
 qemu_irq qdev_get_gpio_in(DeviceState *dev, int n);
+
 /**
  * qdev_get_gpio_in_named: Get one of a device's named input GPIO lines
  * @dev: Device whose GPIO we want
@@ -497,6 +502,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
  * For named output GPIO lines, use qdev_connect_gpio_out_named().
  */
 void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
+
 /**
  * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
  * @dev: Device whose GPIO to connect
@@ -524,6 +530,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq pin);
+
 /**
  * qdev_get_gpio_out_connector: Get the qemu_irq connected to an output GPIO
  * @dev: Device whose output GPIO we are interested in
@@ -541,6 +548,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
  * by the platform-bus subsystem.
  */
 qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
+
 /**
  * qdev_intercept_gpio_out: Intercept an existing GPIO connection
  * @dev: Device to intercept the outbound GPIO line from
@@ -582,6 +590,7 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
  * hold of an input GPIO line to manipulate it.
  */
 void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
+
 /**
  * qdev_init_gpio_out: create an array of anonymous output GPIO lines
  * @dev: Device to create output GPIOs for
@@ -610,6 +619,7 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
  * handler.
  */
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
+
 /**
  * qdev_init_gpio_out: create an array of named output GPIO lines
  * @dev: Device to create output GPIOs for
@@ -623,6 +633,7 @@ void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
  */
 void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
                               const char *name, int n);
+
 /**
  * qdev_init_gpio_in_named_with_opaque: create an array of input GPIO lines
  *   for the specified device
-- 
2.33.1


