Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B1B6109EB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:54:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFG-0007JF-8J; Fri, 28 Oct 2022 01:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEq-00073K-B1
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEo-0007LY-NG
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rVv9D1CHccCIYnMskVo+qTgBNeSRSnMfEyAnX8wGE8=;
 b=gRIBOdwykV6EDMDsWOP5/m3wAXJITv477M04Idx75ETKR7iNQgLA22kCBy0av6qaXT3PaM
 ZdOHEVFzpkOnxnbxAQwUHaLmPJZVgXkHOwgxEMyRvqZE6ByZRbHyCu+CcJ+JdWYdZqL6zX
 4kPy9kb6aEVKnav/GJkiF+BtpBkbm2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-vl5NDE2zNgSJsMokt95_6g-1; Fri, 28 Oct 2022 01:49:00 -0400
X-MC-Unique: vl5NDE2zNgSJsMokt95_6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0DE13802B89
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:48:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AE5DC15BA8;
 Fri, 28 Oct 2022 05:48:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 06/26] net: improve error message for missing netdev backend
Date: Fri, 28 Oct 2022 13:48:15 +0800
Message-Id: <20221028054835.29674-7-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

The current message when using '-net user...' with SLIRP disabled at
compile time is:

  qemu-system-x86_64: -net user: Parameter 'type' expects a net backend type (maybe it is not compiled into this binary)

An observation is that we're using the 'netdev->type' field here which
is an enum value, produced after QAPI has converted from its string
form.

IOW, at this point in the code, we know that the user's specified
type name was a valid network backend. The only possible scenario that
can make the backend init function be NULL, is if support for that
backend was disabled at build time. Given this, we don't need to caveat
our error message with a 'maybe' hint, we can be totally explicit.

The use of QERR_INVALID_PARAMETER_VALUE doesn't really lend itself to
user friendly error message text. Since this is not used to set a
specific QAPI error class, we can simply stop using this pre-formatted
error text and provide something better.

Thus the new message is:

  qemu-system-x86_64: -net user: network backend 'user' is not compiled into this binary

The case of passing 'hubport' for -net is also given a message reminding
people they should have used -netdev/-nic instead, as this backend type
is only valid for the modern syntax.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/net/net.c b/net/net.c
index 2db160e..8ddafac 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1036,19 +1036,23 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     if (is_netdev) {
         if (netdev->type == NET_CLIENT_DRIVER_NIC ||
             !net_client_init_fun[netdev->type]) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
-                       "a netdev backend type");
+            error_setg(errp, "network backend '%s' is not compiled into this binary",
+                       NetClientDriver_str(netdev->type));
             return -1;
         }
     } else {
         if (netdev->type == NET_CLIENT_DRIVER_NONE) {
             return 0; /* nothing to do */
         }
-        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT ||
-            !net_client_init_fun[netdev->type]) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "type",
-                       "a net backend type (maybe it is not compiled "
-                       "into this binary)");
+        if (netdev->type == NET_CLIENT_DRIVER_HUBPORT) {
+            error_setg(errp, "network backend '%s' is only supported with -netdev/-nic",
+                       NetClientDriver_str(netdev->type));
+            return -1;
+        }
+
+        if (!net_client_init_fun[netdev->type]) {
+            error_setg(errp, "network backend '%s' is not compiled into this binary",
+                       NetClientDriver_str(netdev->type));
             return -1;
         }
 
-- 
2.7.4


