Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D56C392D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 19:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pegiM-0002uR-1d; Tue, 21 Mar 2023 14:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L_cZZAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1pegiJ-0002t7-OW
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:28:03 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L_cZZAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com>)
 id 1pegiH-0006Nl-L4
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:28:03 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 x15-20020a25accf000000b00b3b4535c48dso17047806ybd.7
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679423280;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3CoTfX7VBOzqqGvrBwbqNgL1pulI1GCVXMwtzgIXMpg=;
 b=UP9d4mTViuZ4Jlhv+SXQo9iUzwVuMYxpY14WgrfUPQFCfXA9Rjouy0xoU5LNKSahZV
 +MfgKo0ZFrpfQLVx0Jo97hU/cMjEGHBNlF8C8kfHcLYahNHA4eLQfH/GWD1AulSEFOgg
 TCsJ2/MzBJ+/i90JUcUiZHYy+B+GEp0RXkzEK+ot0qIcR9ZizITYw9sGlVfvsT3WI6wM
 yNfovYpA8GooI7F9JSRBTHH8o1e3jI0HOdmmKHFz6+RJeKEP77PwUk64dPCWDu8e6ZK2
 H/PuZSk41V1XQjwdh6O+INIgNOiZFDLbFKUCuNOCRlNkI62YO7uUOr4jRT8t6vRy+gXf
 f9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679423280;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CoTfX7VBOzqqGvrBwbqNgL1pulI1GCVXMwtzgIXMpg=;
 b=YoTx1Bmz/cGbG/x26vgGA0mh9FwvoMTC51tfI4XvgB/+XfCcgie78/SeOfhD5fzHbs
 Lh9GyZNHa/r2m2pweO6I+hOhSk5L4JshRGRKwEI93bTGktplJFglDux4ifmpZ6ssVIr4
 zPRZ839gi3kuD0EBRUuckQywv6Bwy1TFN1t6XxcAsmzrdeH3R1fhHci8S9OHBYbhkONP
 EgFofbnLKVFmeUgoGFIQhlR9vw/AQWrspM9ECgVDIK0XItnuapYdFl8OP1QnhOF4N+oa
 iu5Uj0eTm+rWNFywEfrnmaT6rW7Xz1xoz6Z9x6dwIP7audJuu1M8GdMWLoR+wahklWGc
 pFGA==
X-Gm-Message-State: AAQBX9de5VIBbCpsDxIZ/w6uKIZYml/4Zr2uJpqwu8/gbMTqYxCltOim
 XBebKL520JYMX0vYQRSUNRFVgTwF/6Rb
X-Google-Smtp-Source: AKy350YxHDlw9YGFVub8DF4zaa2db5YGTvHwTUtbZvDq0MG79VskLFeAl83/btjrZu16jLjZufqWjsjrOZTd
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:9e3c:55e4:5616:81])
 (user=venture job=sendgmr) by 2002:a81:a7c1:0:b0:545:5b2c:4bfb with SMTP id
 e184-20020a81a7c1000000b005455b2c4bfbmr917889ywh.8.1679423279953; Tue, 21 Mar
 2023 11:27:59 -0700 (PDT)
Date: Tue, 21 Mar 2023 11:27:44 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230321182744.2814034-1-venture@google.com>
Subject: [PATCH RESEND] hw/i2c: Enable an id for the pca954x devices
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3L_cZZAcKCqwhQZfgdQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This allows the devices to be more readily found and specified.
Without setting the id field, they can only be found by device type
name, which doesn't let you specify the second of the same device type
behind a bus.

Tested: Verified that by default the device was findable with the id
'pca954x[77]', for an instance attached at that address.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 hw/i2c/i2c_mux_pca954x.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index a9517b612a..4f8c2d6ae1 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -20,6 +20,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_slave.h"
 #include "hw/qdev-core.h"
+#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -43,6 +44,8 @@ typedef struct Pca954xState {
=20
     bool enabled[PCA9548_CHANNEL_COUNT];
     I2CBus *bus[PCA9548_CHANNEL_COUNT];
+
+    char *id;
 } Pca954xState;
=20
 /*
@@ -181,6 +184,17 @@ static void pca9548_class_init(ObjectClass *klass, voi=
d *data)
     s->nchans =3D PCA9548_CHANNEL_COUNT;
 }
=20
+static void pca954x_realize(DeviceState *dev, Error **errp)
+{
+    Pca954xState *s =3D PCA954X(dev);
+    DeviceState *d =3D DEVICE(s);
+    if (s->id) {
+        d->id =3D g_strdup(s->id);
+    } else {
+        d->id =3D g_strdup_printf("pca954x[%x]", s->parent.i2c.address);
+    }
+}
+
 static void pca954x_init(Object *obj)
 {
     Pca954xState *s =3D PCA954X(obj);
@@ -197,6 +211,11 @@ static void pca954x_init(Object *obj)
     }
 }
=20
+static Property pca954x_props[] =3D {
+    DEFINE_PROP_STRING("id", Pca954xState, id),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void pca954x_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *sc =3D I2C_SLAVE_CLASS(klass);
@@ -209,9 +228,12 @@ static void pca954x_class_init(ObjectClass *klass, voi=
d *data)
     rc->phases.enter =3D pca954x_enter_reset;
=20
     dc->desc =3D "Pca954x i2c-mux";
+    dc->realize =3D pca954x_realize;
=20
     k->write_data =3D pca954x_write_data;
     k->receive_byte =3D pca954x_read_byte;
+
+    device_class_set_props(dc, pca954x_props);
 }
=20
 static const TypeInfo pca954x_info[] =3D {
--=20
2.35.1.894.gb6a874cedc-goog


