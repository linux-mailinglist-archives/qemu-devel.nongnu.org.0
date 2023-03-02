Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F16A824A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5R-0007eF-Iz; Thu, 02 Mar 2023 07:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5L-0007V0-Qb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5K-0002uH-CB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBmz67y5d+pj4TJTeDfNOkaourUgBzpjoKeqiUgJV2A=;
 b=i+OKvBtRunK/UR8QjrwcdHz47+I/jfqfSSwN8vUhIHXmi7TUeDB8V0RqowT1X9K/TMokEh
 ZAv9zoBa6Le1w7ccTu2uKebcYZFcVo56wp5bGOEE8JLtGgeOJL7L6vAKQHlljZnTfIfbk7
 hIRPRBUeCKEUBzf5k3b458xGH9EJBmQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-_GeS7MTiMZScBjifBn92tA-1; Thu, 02 Mar 2023 07:30:56 -0500
X-MC-Unique: _GeS7MTiMZScBjifBn92tA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so1033336wmr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBmz67y5d+pj4TJTeDfNOkaourUgBzpjoKeqiUgJV2A=;
 b=ZYi68gLJp0Wa3mgMxGlerSTLuGwCUo55QsN1EXNgmntciU/y8DeUARUu5mgeX5YO4/
 56p3Rlr+pxm/ExYGHbLEijLsNRNI2vGBK6hPjCK3j7jKtgGLF5S9+vBUHF29kXdYwfSN
 6w/wOECermi/uQWFr2nQSAb/ilDs9ZECPA9BPhTZcXxJJRoCxyjPjhqTgTlDafiwEmXS
 OpHT3sjnZnKqAgIzbb06HlMnzP/p1oetrKsWuf20PMctB/qIHCEiZHM4CvXoUT9u1AX2
 82RyuYwmE4ATtx1TKopx8JqGRkVAMqD4N77QiubYz5PMRMU++tNwQLnM5zGKtfYDW+gY
 +a5A==
X-Gm-Message-State: AO0yUKXhfv71f4tBJch0kQQSctC15erFrm60Vr8VWGgcty6iYmJDq7+0
 TDVzagrVXCE1zQzel3pcIZkhzWKl3nJJUumO3qX5TIirwN+pEDgkRX7qRxwnOWQkYJMc1pjklnL
 H5/cZk8aiWwXkJwrtgGvGzmg4AG43hU92DfjKpeoQU74qfOeW/ppX+HijIxhF1myXAyvJkODlOK
 w=
X-Received: by 2002:a05:600c:755:b0:3ea:e834:d0d1 with SMTP id
 j21-20020a05600c075500b003eae834d0d1mr7943459wmn.36.1677760255072; 
 Thu, 02 Mar 2023 04:30:55 -0800 (PST)
X-Google-Smtp-Source: AK7set98yDNgajNe1KKN0FG8vkSo646KClsZxZKOgl0cgwtScZXdwB5wl64MaA4NWiVjb1VlRZq0pw==
X-Received: by 2002:a05:600c:755:b0:3ea:e834:d0d1 with SMTP id
 j21-20020a05600c075500b003eae834d0d1mr7943444wmn.36.1677760254859; 
 Thu, 02 Mar 2023 04:30:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm15359904wrv.10.2023.03.02.04.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 07/62] xen-platform: exclude vfio-pci from the PCI platform
 unplug
Date: Thu,  2 Mar 2023 13:29:34 +0100
Message-Id: <20230302123029.153265-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Joao Martins <joao.m.martins@oracle.com>

Such that PCI passthrough devices work for Xen emulated guests.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen_platform.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 3795a203d4d3..8a616970539c 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -108,12 +108,25 @@ static void log_writeb(PCIXenPlatformState *s, char val)
 #define _UNPLUG_NVME_DISKS 3
 #define UNPLUG_NVME_DISKS (1u << _UNPLUG_NVME_DISKS)
 
+static bool pci_device_is_passthrough(PCIDevice *d)
+{
+    if (!strcmp(d->name, "xen-pci-passthrough")) {
+        return true;
+    }
+
+    if (xen_mode == XEN_EMULATE && !strcmp(d->name, "vfio-pci")) {
+        return true;
+    }
+
+    return false;
+}
+
 static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
 {
     /* We have to ignore passthrough devices */
     if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
             PCI_CLASS_NETWORK_ETHERNET
-            && strcmp(d->name, "xen-pci-passthrough") != 0) {
+            && !pci_device_is_passthrough(d)) {
         object_unparent(OBJECT(d));
     }
 }
@@ -186,9 +199,8 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
         !(flags & UNPLUG_IDE_SCSI_DISKS);
 
     /* We have to ignore passthrough devices */
-    if (!strcmp(d->name, "xen-pci-passthrough")) {
+    if (pci_device_is_passthrough(d))
         return;
-    }
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-- 
2.39.1


