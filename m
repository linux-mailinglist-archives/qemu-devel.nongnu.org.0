Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0268B2C3B24
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:34:10 +0100 (CET)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khqFd-0005tm-3d
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khqEf-0005Tv-Gs
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khqEd-0001An-FL
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606293185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RiIczNIcLgju6IjIF+5/q04V+IDAgeIUY6yORTs6u3c=;
 b=H8p2pcRyWr7S8zapNgSNuXdHKqsMCLGwkpgHw0NlHqFHdiwYFHvhSzGrCrqqzsUsOY+2K1
 FPdvzSpbKoq6dvgXXOMA+lQqSAHgpvT9OvpCKd/h9ISaSM3HqZhP0rT3KBVfKo7lJP08CQ
 nKFNswDX9U4PBXWq7HA54CHH6Um0cv4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-dEz0ka-dMcO9zhJX7lzong-1; Wed, 25 Nov 2020 03:33:03 -0500
X-MC-Unique: dEz0ka-dMcO9zhJX7lzong-1
Received: by mail-wm1-f72.google.com with SMTP id o17so496148wmd.9
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 00:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiIczNIcLgju6IjIF+5/q04V+IDAgeIUY6yORTs6u3c=;
 b=OaDfSrQxxEPpkGnxJOcZtYaaZ3a473mZIDwgm0gix78bL1hniezDbQ5Il8eFFkBp7U
 GICYA9Pff0L1cwVojBmpGPOmBbZL6IBCr9QhMgiiJNv76McQumTjHHGpIohytsSzFGWp
 IV3R1+mMmPUJrU2l3mQpvwckGScyzNASgrtHraojRawFKJ91aOs3+64aObFTKFV5IUlv
 FX+9sP+m5kheiq3yhR91JJbQQGg6cULnvKGEFwglXojxWG2zCwn5/9BudOf15+kTRdwW
 KGvvajkqJN97Fmj8ilW3PxiRNtAVJKz7oF3gXbQD4IahFtD1gBupciCqU8LMCnhNOAjD
 /Hmg==
X-Gm-Message-State: AOAM532kX/1BVvWmowpHcbHhlSKHYvj3OMrhXt38jBZCMAEb1t/QZ/uT
 NMoyF8aKgstvKFmWpvg/uElDYuPbM+3LJWJb2gP4qFWuE9+qwzV8HPDrRK3HIR+yPlqj3hNqH7M
 pOfjBGvknAMSUGPcbHGGt019KQ+XiwH9W7Yo8/Fz1RUGpck3epy1BRrDs/pVRcNOE
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr2655610wmd.6.1606293182182; 
 Wed, 25 Nov 2020 00:33:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycQM9gud5zikUHZBnuhQDPW0MpQQ1kKAFpalo+CH5vZMPi9VbC1RGJSNIDYiND996l8DVVkQ==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr2655589wmd.6.1606293181936; 
 Wed, 25 Nov 2020 00:33:01 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id t11sm3324005wmf.35.2020.11.25.00.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 00:33:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
Date: Wed, 25 Nov 2020 09:33:00 +0100
Message-Id: <20201125083300.861206-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

set_pci_host_devaddr() is hard to follow, thus bug-prone.

For example, a bug was introduced in commit bccb20c49df, as
the same line might be used to parse a bus (up to 0xff) or
a slot (up to 0x1f).

Instead of making things worst, rewrite using g_strsplit().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Rebased
v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
---
 hw/core/qdev-properties-system.c | 62 ++++++++++++++------------------
 1 file changed, 27 insertions(+), 35 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 9d80a07d26f..79408e32289 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -857,11 +857,11 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
-    char *str, *p;
-    char *e;
+    g_autofree char *str = NULL;
+    g_auto(GStrv) col_s0 = NULL;
+    g_auto(GStrv) dot_s = NULL;
+    char **col_s;
     unsigned long val;
-    unsigned long dom = 0, bus = 0;
-    unsigned int slot = 0, func = 0;
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -872,58 +872,50 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    p = str;
-    val = strtoul(p, &e, 16);
-    if (e == p || *e != ':') {
+    col_s = col_s0 = g_strsplit(str, ":", 3);
+    if (!col_s || !col_s[0] || !col_s[1]) {
         goto inval;
     }
-    bus = val;
 
-    p = e + 1;
-    val = strtoul(p, &e, 16);
-    if (e == p) {
-        goto inval;
-    }
-    if (*e == ':') {
-        dom = bus;
-        bus = val;
-        p = e + 1;
-        val = strtoul(p, &e, 16);
-        if (e == p) {
+    /* domain */
+    if (col_s[2]) {
+        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
             goto inval;
         }
+        addr->domain = val;
+        col_s++;
+    } else {
+        addr->domain = 0;
     }
-    slot = val;
 
-    if (*e != '.') {
+    /* bus */
+    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
         goto inval;
     }
-    p = e + 1;
-    val = strtoul(p, &e, 10);
-    if (e == p) {
-        goto inval;
-    }
-    func = val;
+    addr->bus = val;
 
-    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
+    /* <slot>.<func> */
+    dot_s = g_strsplit(col_s[1], ".", 2);
+    if (!dot_s || !dot_s[0] || !dot_s[1]) {
         goto inval;
     }
 
-    if (*e) {
+    /* slot */
+    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
         goto inval;
     }
+    addr->slot = val;
 
-    addr->domain = dom;
-    addr->bus = bus;
-    addr->slot = slot;
-    addr->function = func;
+    /* func */
+    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
+        goto inval;
+    }
+    addr->function = val;
 
-    g_free(str);
     return;
 
 inval:
     error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
-    g_free(str);
 }
 
 const PropertyInfo qdev_prop_pci_host_devaddr = {
-- 
2.26.2


