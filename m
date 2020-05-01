Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FB1C1DB7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 21:17:22 +0200 (CEST)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUbA1-0008KZ-JZ
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 15:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUb88-0006fS-94
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jUb86-00008D-NI
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48871
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jUb86-00006s-7s
 for qemu-devel@nongnu.org; Fri, 01 May 2020 15:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588360521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsgnZnnZTeW/j8EemRxHfSaBhcpBiLBvUyYJvSada90=;
 b=JKKyeUojtc1HzXHP0KRKpC1oGxJ2yPUbB+0DQFT9F+mNiKaUBPXH50fVKgPnFGAmIcoeoX
 gKWOuu4LSVvzpy7LKCAnkENKgD2fGE19Jj50gMy0rf5s78PL4YWwdHkLQ40Zy9oCwMoaSA
 +WCVblZi07lLbc605QQJtnqLOMsvtfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-TXZwOopCOoO7Yen85PxxwA-1; Fri, 01 May 2020 15:15:19 -0400
X-MC-Unique: TXZwOopCOoO7Yen85PxxwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07AFE46B;
 Fri,  1 May 2020 19:15:18 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-191.ams2.redhat.com
 [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7DAD1002396;
 Fri,  1 May 2020 19:15:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, yavrahami@paloaltonetworks.com,
 mszeredi@redhat.com, mreitz@redhat.com
Subject: [PULL 4/6] virtiofsd: Show submounts
Date: Fri,  1 May 2020 20:14:58 +0100
Message-Id: <20200501191500.126432-5-dgilbert@redhat.com>
In-Reply-To: <20200501191500.126432-1-dgilbert@redhat.com>
References: <20200501191500.126432-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 13:42:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Currently, setup_mounts() bind-mounts the shared directory without
MS_REC.  This makes all submounts disappear.

Pass MS_REC so that the guest can see submounts again.

Fixes: 5baa3b8e95064c2434bd9e2f312edd5e9ae275dc
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200424133516.73077-1-mreitz@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Changed Fixes to point to the commit with the problem rather than
          the commit that turned it on
---
 tools/virtiofsd/passthrough_ll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index d7a6474b6e..7873692168 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2666,7 +2666,7 @@ static void setup_mounts(const char *source)
     int oldroot;
     int newroot;
=20
-    if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
+    if (mount(source, source, NULL, MS_BIND | MS_REC, NULL) < 0) {
         fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, sou=
rce);
         exit(1);
     }
--=20
2.26.2


