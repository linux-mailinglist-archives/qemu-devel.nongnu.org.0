Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82D2A4761
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 15:10:48 +0100 (CET)
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZx1L-00077D-CX
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 09:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwu5-00072E-4m
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZwu3-0003RF-67
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 09:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604412194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TexKsOB/m5ww6iBN9k0jVR9Z5fLzd2GGDypDU4iooE4=;
 b=EOUwzoTwYkYZ8gNsQfNH4R13kNVtAwbCIJjA/o58RHv283RAdj7W+okV3+Mu6Y0aJxtIwN
 n3SirGYJjnRr6J0pahexqST8a5015Bmhy2FhslQ97+v/xQ1MnR77dFDIB7MpJKoHZmf2v2
 GxSOjK/yKfsfhOsAIK3yxLsPqg7IsnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-IoKXVtzvNLqLMk9B4Uskkg-1; Tue, 03 Nov 2020 09:03:12 -0500
X-MC-Unique: IoKXVtzvNLqLMk9B4Uskkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEE7786ABD1
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 14:03:11 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E3865B4D8;
 Tue,  3 Nov 2020 14:03:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] sockets: Bypass "replace empty @path" for abstract unix
 sockets
Date: Tue,  3 Nov 2020 14:02:24 +0000
Message-Id: <20201103140225.496776-11-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

unix_listen_saddr() replaces empty @path by unique value.  It obtains
the value by creating and deleting a unique temporary file with
mkstemp().  This is racy, as the comment explains.  It's also entirely
undocumented as far as I can tell.  Goes back to commit d247d25f18
"sockets: helper functions for qemu (Gerd Hoffman)", v0.10.0.

Since abstract socket addresses have no connection with filesystem
pathnames, making them up with mkstemp() seems inappropriate.  Bypass
the replacement of empty @path.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/qemu-sockets.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a578c434c2..671717499f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -877,7 +877,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
         return -1;
     }
 
-    if (saddr->path && saddr->path[0]) {
+    if (saddr->path[0] || saddr->abstract) {
         path = saddr->path;
     } else {
         const char *tmpdir = getenv("TMPDIR");
-- 
2.28.0


