Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2922A47A9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:14:23 +0100 (CET)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZx4o-0002KK-0G
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwu7-000743-Lg
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwty-0003Qq-OW
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604412189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rs/Uo9N55lGEE7ywOt25Sg5igC9cyPAcgUcPqC/heTw=;
 b=gEiFN35DzggIMzzTFV4mO8OocVV8bCFgSthrGDxGKPH9yfrH0Ar1+SZdr+cXknIoK1JHfa
 HA4V2PZOqy30TkBmPo1pvMIu9cmWEhZEPDU8PALc64zYgvm84h7yeAgf1GnWRX48MOIpId
 esKvfEtDVO4BXovNnjRq+iobCltfZYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-vPz4vy18PrCoI2C207uWtA-1; Tue, 03 Nov 2020 09:03:07 -0500
X-MC-Unique: vPz4vy18PrCoI2C207uWtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A2AB186DD25
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 14:03:06 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 565006F142;
 Tue,  3 Nov 2020 14:03:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] char-socket: Fix qemu_chr_socket_address() for abstract
 sockets
Date: Tue,  3 Nov 2020 14:02:23 +0000
Message-Id: <20201103140225.496776-10-berrange@redhat.com>
In-Reply-To: <20201103140225.496776-1-berrange@redhat.com>
References: <20201103140225.496776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Commit 776b97d360 "qemu-sockets: add abstract UNIX domain socket
support" neglected to update qemu_chr_socket_address().  It shows
shows neither @abstract nor @tight.  Fix that.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-socket.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 1ee5a8c295..27a2954f47 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -443,10 +443,22 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
                                s->is_listen ? ",server" : "");
         break;
     case SOCKET_ADDRESS_TYPE_UNIX:
-        return g_strdup_printf("%sunix:%s%s", prefix,
-                               s->addr->u.q_unix.path,
+    {
+        const char *tight = "", *abstract = "";
+        UnixSocketAddress *sa = &s->addr->u.q_unix;
+
+        if (sa->has_abstract && sa->abstract) {
+            abstract = ",abstract";
+            if (sa->has_tight && sa->tight) {
+                tight = ",tight";
+            }
+        }
+
+        return g_strdup_printf("%sunix:%s%s%s%s", prefix, sa->path,
+                               abstract, tight,
                                s->is_listen ? ",server" : "");
         break;
+    }
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("%sfd:%s%s", prefix, s->addr->u.fd.str,
                                s->is_listen ? ",server" : "");
-- 
2.28.0


