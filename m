Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99922B153
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 16:29:11 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jycDe-00084s-NR
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 10:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jycCG-0006S9-Ij
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 10:27:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51963
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jycCF-0006wx-1s
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 10:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595514462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfTjsX6m7L9Arz4pLCqERJ9MtufA/zlYkLZGF36+QQg=;
 b=KtMt3Cz2yQvVP+8/Z8e7xVnW5HNCVxfpibiKf9IHfoauqNRxzCwDXy7V1VXYFQyn6lq88e
 7J2PydplwUWQX2I9ULKyNbTlCpwV9ZYWmi2Z5QOPogZ56TechulSOdjzWduH/XzsvDy50G
 2nwbiVcEb27BXmwA+a7RInu46r+VvbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-zRU38InFOTSa2b0GuqWeJg-1; Thu, 23 Jul 2020 10:27:40 -0400
X-MC-Unique: zRU38InFOTSa2b0GuqWeJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E53718014D4
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 14:27:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8A4D5D9D3;
 Thu, 23 Jul 2020 14:27:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 521C2111CA27; Thu, 23 Jul 2020 16:27:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] scripts/qmp/qom-fuse: Unbreak import of
 QEMUMonitorProtocol
Date: Thu, 23 Jul 2020 16:27:36 +0200
Message-Id: <20200723142738.1868568-2-armbru@redhat.com>
In-Reply-To: <20200723142738.1868568-1-armbru@redhat.com>
References: <20200723142738.1868568-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 06:04:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit c7b942d7f8 "scripts/qmp: Fix shebang and imports" messed with
it for reasons I don't quite understand.  I do understand how it fails
now: it neglects to import sys.  Fix that.

It now fails because it expects an old version of module fuse.  That's
next.

Fixes: c7b942d7f84ef54f266921bf7668d43f1f2c7c79
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qmp/qom-fuse | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 5fa6b3bf64..b7dabe8d65 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -13,7 +13,7 @@
 
 import fuse, stat
 from fuse import Fuse
-import os, posix
+import os, posix, sys
 from errno import *
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
@@ -134,7 +134,7 @@ class QOMFS(Fuse):
             yield fuse.Direntry(str(item['name']))
 
 if __name__ == '__main__':
-    import sys, os
+    import os
 
     fs = QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET']))
     fs.main(sys.argv)
-- 
2.26.2


