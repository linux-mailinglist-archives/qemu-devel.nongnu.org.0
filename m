Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E81E6FC9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 00:57:43 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeRT4-0001Ts-Pj
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 18:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1jeRR8-0007dH-Al; Thu, 28 May 2020 18:55:42 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1jeRR5-0008CJ-1e; Thu, 28 May 2020 18:55:42 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id CF9FC2E129E;
 Fri, 29 May 2020 01:55:36 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lmRN7zNptv-tXI868jM; Fri, 29 May 2020 01:55:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590706536; bh=UKiDYu0qh9wG7LQok5L+3Mp+XQ/Lqrhu664LIgCAPR0=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=LX5XN0aP+VS3Aw5Y5wqV8WwuYfOQJBFYgSOXYggziF7GclUNWheOGQ3ZWF1VlRuBY
 mY91qfWoXcbd4HGEVs4oYywEJg5NKSH3/aka/xOZELxPtso6Jwwv19+bPGulOIOfXd
 rQQCy5R1XrMQdSCYQKQzWgWMH4W6DO0Ew4ZeiHQ4=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tdfEhvD3Vg-tXWSPpmr; Fri, 29 May 2020 01:55:33 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/8] qdev-properties: blocksize: use same limits in code
 and description
Date: Fri, 29 May 2020 01:55:11 +0300
Message-Id: <20200528225516.1676602-4-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
References: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:55:33
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it easier (more visible) to maintain the limits on the blocksize
properties in sync with the respective description, by using macros both
in the code and in the description.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/qdev-properties.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index cc924815da..249dc69bd8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -729,6 +729,13 @@ const PropertyInfo qdev_prop_pci_devfn = {
 
 /* --- blocksize --- */
 
+/* lower limit is sector size */
+#define MIN_BLOCK_SIZE          512
+#define MIN_BLOCK_SIZE_STR      stringify(MIN_BLOCK_SIZE)
+/* upper limit is the max power of 2 that fits in uint16_t */
+#define MAX_BLOCK_SIZE          32768
+#define MAX_BLOCK_SIZE_STR      stringify(MAX_BLOCK_SIZE)
+
 static void set_blocksize(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
@@ -736,8 +743,6 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     uint16_t value, *ptr = qdev_get_prop_ptr(dev, prop);
     Error *local_err = NULL;
-    const int64_t min = 512;
-    const int64_t max = 32768;
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -750,9 +755,12 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
         return;
     }
     /* value of 0 means "unset" */
-    if (value && (value < min || value > max)) {
-        error_setg(errp, QERR_PROPERTY_VALUE_OUT_OF_RANGE,
-                   dev->id ? : "", name, (int64_t)value, min, max);
+    if (value && (value < MIN_BLOCK_SIZE || value > MAX_BLOCK_SIZE)) {
+        error_setg(errp,
+                   "Property %s.%s doesn't take value %" PRIu16
+                   " (minimum: " MIN_BLOCK_SIZE_STR
+                   ", maximum: " MAX_BLOCK_SIZE_STR ")",
+                   dev->id ? : "", name, value);
         return;
     }
 
@@ -769,7 +777,8 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 
 const PropertyInfo qdev_prop_blocksize = {
     .name  = "uint16",
-    .description = "A power of two between 512 and 32768",
+    .description = "A power of two between " MIN_BLOCK_SIZE_STR
+                   " and " MAX_BLOCK_SIZE_STR,
     .get   = get_uint16,
     .set   = set_blocksize,
     .set_default_value = set_default_value_uint,
-- 
2.26.2


