Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFE207330
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:20:32 +0200 (CEST)
Received: from localhost ([::1]:42778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4OF-0002zx-Ax
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@xen.org>) id 1jo4Me-0001iw-0f
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:18:52 -0400
Received: from mail.xenproject.org ([104.130.215.37]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@xen.org>) id 1jo4Mb-0004Ub-8T
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N/I4v8ZDmbVyJ5v5uM4VjOF7rLFaxzrV35vC/IJzksA=; b=lLt2C+uuKQnj7hdrvVOUwqTmOc
 6mvivoKpj2mcC21dDbNQfw4TWLRKSULpTUGgzd25DC8kwHlqRizrzV3HUR9DbL5N4J3sjdFzS7+Rl
 cRCyHUZbwb3LjveMQRyODxZQ2B1ueU6ynTq2P9rKxbofMWbp9V8guYfzhYMH+HyZu39s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MX-0000gD-A9; Wed, 24 Jun 2020 12:18:45 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MX-0005fi-17; Wed, 24 Jun 2020 12:18:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] xen: fix legacy 'xen-sysdev' and 'xen-backend' bus types
Date: Wed, 24 Jun 2020 13:18:40 +0100
Message-Id: <20200624121841.17971-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624121841.17971-1-paul@xen.org>
References: <20200624121841.17971-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=paul@xen.org;
 helo=mail.xenproject.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 08:18:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Durrant <pdurrant@amazon.com>

'xen-sysdev' plugs into the 'System' bus type, not 'xen-sysbus. That bus type
is what 'xen-backend' plugs into.
'xen-sysdev' is drived form 'sys-bus-device' so the bus type need not be
overridden. 'xen-backend' is derived from 'device', which plugs into the
generic 'bus' type, so its bus type should be overridden to 'xen-sysbus'.

Without this patch, the following assertion will fail:

qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 2335ee2e65..c5c75c0064 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_XENSYSDEV,
+    .parent        = TYPE_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
@@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xensysdev_info = {
-- 
2.20.1


