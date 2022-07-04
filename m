Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134D564F55
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:10:02 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8H9d-0001ul-3f
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzx-0002Jg-LA
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzu-0007fj-UB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpDwCl9xxE5Kfss1+7TIoNRzQ8MIqBjyxIFaC9olDrU=;
 b=BBZXPW33trZi2nmBDyAP4e1hsUHpNfx4wFClL31j9liScqwq0p87uWmdK71iVR82E36YKE
 ZrAnwjiViV9QzueDkn4ja17uAEVhVEQ0z3QeeWirtEm4As0b8XCOThkBVEHexZ94qRuoB9
 m+yHlCORKGfVKK+B9iCRfPjn+OFxo3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-rUVac3FSOfeLWc0XoVdgbg-1; Mon, 04 Jul 2022 03:59:50 -0400
X-MC-Unique: rUVac3FSOfeLWc0XoVdgbg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC6AC84ACA8;
 Mon,  4 Jul 2022 07:59:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F352492CA6;
 Mon,  4 Jul 2022 07:59:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B51D8180062F; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 Lu Gao <lu.gao@verisilicon.com>
Subject: [PULL 3/8] ui/console: allow display device to be labeled with given
 id
Date: Mon,  4 Jul 2022 09:59:41 +0200
Message-Id: <20220704075946.921883-4-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>

The update makes it easier to find and specify devices.
They can only be found by device type name without the id field,
for example, devices of the same type have the same label.
The update also adds a head field,
which is useful for devices that support multiple heads,
such as virtio-gpu.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
Message-Id: <4C23C17B8E87E74E906A25A3254A03F4018FC045B0@SHASXM06.verisilicon.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |  1 +
 ui/console.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index b64d82436097..c0520c694c23 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -463,6 +463,7 @@ bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
 bool qemu_console_is_gl_blocked(QemuConsole *con);
+bool qemu_console_is_multihead(DeviceState *dev);
 char *qemu_console_get_label(QemuConsole *con);
 int qemu_console_get_index(QemuConsole *con);
 uint32_t qemu_console_get_head(QemuConsole *con);
diff --git a/ui/console.c b/ui/console.c
index 9331b85203a0..e139f7115e1f 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2313,11 +2313,50 @@ bool qemu_console_is_gl_blocked(QemuConsole *con)
     return con->gl_block;
 }
 
+bool qemu_console_is_multihead(DeviceState *dev)
+{
+    QemuConsole *con;
+    Object *obj;
+    uint32_t f = 0xffffffff;
+    uint32_t h;
+
+    QTAILQ_FOREACH(con, &consoles, next) {
+        obj = object_property_get_link(OBJECT(con),
+                                       "device", &error_abort);
+        if (DEVICE(obj) != dev) {
+            continue;
+        }
+
+        h = object_property_get_uint(OBJECT(con),
+                                     "head", &error_abort);
+        if (f == 0xffffffff) {
+            f = h;
+        } else if (h != f) {
+            return true;
+        }
+    }
+    return false;
+}
+
 char *qemu_console_get_label(QemuConsole *con)
 {
     if (con->console_type == GRAPHIC_CONSOLE) {
         if (con->device) {
-            return g_strdup(object_get_typename(con->device));
+            DeviceState *dev;
+            bool multihead;
+
+            dev = DEVICE(con->device);
+            multihead = qemu_console_is_multihead(dev);
+            if (multihead) {
+                return g_strdup_printf("%s.%d", dev->id ?
+                                       dev->id :
+                                       object_get_typename(con->device),
+                                       con->head);
+            } else {
+                return g_strdup_printf("%s", dev->id ?
+                                       dev->id :
+                                       object_get_typename(con->device));
+            }
         }
         return g_strdup("VGA");
     } else {
-- 
2.36.1


