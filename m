Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB14128545C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:15:37 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvFA-00032N-Ml
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9X-0006dH-CD
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9V-0006Nw-6B
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQrJR/6dMGOXDTDBtU3yQvNtbCLkiFO0qMnbgwdKuNQ=;
 b=SVyrGzXb0L0hf4gIISAneLlzPb+gflk9NL8AkQVFsRYo5ELhOggSszqfxl7A9zSc4DtWJy
 c0hyCdveu8c3OTqqMHpZq7Z9LUJHJawuCJsHRDMTi9/U933tfBKdY0Ex26uOOXxPb0Ej0K
 Lg1xQTeGuC/m4GwaJBfDwqSo9PHrKjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-mpwyeuacO7OeOVp3ydzRXQ-1; Tue, 06 Oct 2020 18:09:40 -0400
X-MC-Unique: mpwyeuacO7OeOVp3ydzRXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D13B1007472;
 Tue,  6 Oct 2020 22:09:39 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0089B55770;
 Tue,  6 Oct 2020 22:09:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/21] hw/core/qdev-properties: Use qemu_strtoul() in
 set_pci_host_devaddr()
Date: Tue,  6 Oct 2020 18:09:11 -0400
Message-Id: <20201006220930.908275-3-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Replace strtoul() by qemu_strtoul() so checkpatch.pl won't complain
if we move this code later.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200930164949.1425294-4-philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 080ba319a1..a1190a5db9 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -951,7 +951,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
     char *str, *p;
-    char *e;
+    const char *e;
     unsigned long val;
     unsigned long dom = 0, bus = 0;
     unsigned int slot = 0, func = 0;
@@ -966,23 +966,23 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     }
 
     p = str;
-    val = strtoul(p, &e, 16);
-    if (e == p || *e != ':') {
+    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
+        goto inval;
+    }
+    if (*e != ':') {
         goto inval;
     }
     bus = val;
 
-    p = e + 1;
-    val = strtoul(p, &e, 16);
-    if (e == p) {
+    p = (char *)e + 1;
+    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
         goto inval;
     }
     if (*e == ':') {
         dom = bus;
         bus = val;
-        p = e + 1;
-        val = strtoul(p, &e, 16);
-        if (e == p) {
+        p = (char *)e + 1;
+        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
             goto inval;
         }
     }
@@ -991,14 +991,13 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     if (*e != '.') {
         goto inval;
     }
-    p = e + 1;
-    val = strtoul(p, &e, 10);
-    if (e == p) {
+    p = (char *)e + 1;
+    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
         goto inval;
     }
     func = val;
 
-    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
+    if (bus > 0xff) {
         goto inval;
     }
 
-- 
2.26.2


