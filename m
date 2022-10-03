Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A35F2EAB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:14:52 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofITL-0005XY-O2
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofILA-0001c7-Pu
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIL8-0006Gy-LR
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664791578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KWwKgKlKpH5Hn2RcL5dXsySDjIPrRUhScjm/XTFBiVQ=;
 b=Ijl5/sHjJLAtqkR+ojUXumXtGFu18yuH3NrzTeu9z2R9IKjVG2sIYoJVkseX4cm5zKUsLR
 w2eZkJluutUk+FpL4yroynPHuBz8F/7y10mVZVRK1VWaxN4cW+0grNSxB49HMyw7+QT+W+
 Dbf8+Y6nQFT0vhDfgifrSrXJx4DpOMU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-mr2T03h9PmG8e354NvoUZA-1; Mon, 03 Oct 2022 06:06:15 -0400
X-MC-Unique: mr2T03h9PmG8e354NvoUZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13EFA1C1A940;
 Mon,  3 Oct 2022 10:06:15 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06C67492B04;
 Mon,  3 Oct 2022 10:06:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] net: improve error message for missing netdev backend
Date: Mon,  3 Oct 2022 11:06:12 +0100
Message-Id: <20221003100612.596845-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---

NB, this does not make any difference to people who were relying on the
QEMU built-in default hub that was created if you don't list any -net /
-netdev / -nic argument, only those using explicit args.

 net/net.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/net/net.c b/net/net.c
index 2db160e063..8ddafacf13 100644
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
2.37.3


