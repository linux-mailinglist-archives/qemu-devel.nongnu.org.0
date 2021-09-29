Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586841C20A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:51:59 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWFq-00088y-17
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtb-00021i-P7
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:59 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:50829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVta-0005qU-7N
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:59 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MhUQ7-1n1G0q1wqR-00ecIi; Wed, 29
 Sep 2021 11:28:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] nubus: implement BusClass get_dev_path()
Date: Wed, 29 Sep 2021 11:28:29 +0200
Message-Id: <20210929092843.2686234-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h+ftqzMgrGdRhau9XXPR4svOyg6eZ6RlH/jKJ1nDiE46xCmEnfb
 xN5FLmpBys0kVB6tSyE95ig0Ea1okzfzSkCkzkUs1XK79uCB7QEX5HtVOZYfYaDt3Rd4cer
 r36icbelC+YjhoF22Dy4x/w7VrUsWuBkA2OK9kvcH/HRXX5YVPP9kACH2o97BOGLy7b8IRW
 Py8/7aIbzy4EESO77ZpSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0mjs8Ofn8KA=:Dt7HH0les0I3oaVR4prhLY
 YgcEn+b1l6NsFuP3ng9yNKtj9smOUHiWmc/+dbsmDs3xSuTKMOfUu6ma87B9IiJpb2BkKU9Za
 OACDxtMbjWM5KsnfyD7M2tg9zU5s7ljat3CDgBqNO19Z9rnR7+EYEP7ejSUyLuTOFQpx+pOQZ
 6y4tgi8CCBlfayZ1U7Wq+/Obm9bYPEN9LhgxGovC1VhNruQ2Mt8G3GMvsPDt2BlO+CaA2fR3t
 hsMAzqjEy13WMYZVUO6EzgXSJoBKJlgYkjOzurnI9iQTElTxpSOEBMloJ1BdcjJ8FJEcRtucc
 UFv0vcAxghBxOktqqgMfCnFZ7lRPzQOQaa2bAF5s2DuW7OsbAn8s3P/2C8EvJucJEwL38SXJW
 Mqh6zYkvlg+BfYWZ4o8N4eYACKkhN2NeF1ReIYU/vZGsCOa2KdrCOz7F7YvEOVNEZ7l5n3YCQ
 0E/Z2EgiwLfALCwBxu3g1/DH+alCfYTgL10V76tJ+3INIiLKN2wvTblKJphw7PP/7YoH4rXj4
 TO9aGabLtG5IWEvb7H7EkxC4dCwIz/ycwHsmxPd4KK5k2bUp6I0qCx2Qhij14i5Rx9rjH8PAM
 roWAzhUqiewCjVm+H4hjITgfjJRTIW0tiyWJWvvTVP8BEciDd+Co09iVswNMVv6XcJZHkyv/q
 znu2jRR0Di5T3HoA2uqsbt/V5wlwpxpldwcPdJN0dXHQ4+d5Y/Q9//PEQ+DxGLU1iexmvEocR
 mFmj922QJu2VZSnoM9t+OnRAkjVYh079UpzIVw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bus.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 96ef027bad26..04f11edd2465 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -96,6 +96,21 @@ static void nubus_init(Object *obj)
                                                  NUBUS_SLOT_NB);
 }
 
+static char *nubus_get_dev_path(DeviceState *dev)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
+    char *p = qdev_get_dev_path(bus->parent);
+
+    if (p) {
+        char *ret = g_strdup_printf("%s/%s/%02x", p, bus->name, nd->slot);
+        g_free(p);
+        return ret;
+    } else {
+        return g_strdup_printf("%s/%02x", bus->name, nd->slot);
+    }
+}
+
 static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
 {
     NubusDevice *nd = NUBUS_DEVICE(dev);
@@ -130,6 +145,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
 
     bc->realize = nubus_realize;
     bc->check_address = nubus_check_address;
+    bc->get_dev_path = nubus_get_dev_path;
 }
 
 static const TypeInfo nubus_bus_info = {
-- 
2.31.1


