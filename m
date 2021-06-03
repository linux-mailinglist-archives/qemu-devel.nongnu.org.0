Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C80399737
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:49:54 +0200 (CEST)
Received: from localhost ([::1]:60494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobYX-0005xB-Om
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMk-0004rY-9H
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMi-0004kb-Jx
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDPQCe++FalqX5m9SAlH1/jXiEHGE6fFSaTALiVqxn0=;
 b=TlGturccKrTbRyji0KwRcTUggoNfpPilbF49CU8tqmuMbQr7OS+L4UN9M879iHxWS74sNg
 w7u9CsOLhJ6qdAI/AYuHuPHeQEBXObEw1T+nUKrA30Fww8+5fib+oX9zI7ZsuuqAOM30E1
 SODSf88g162LJSklSfDVZsoo+0hqPTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-rCNxHgfIM4KJ9OICH3RI8A-1; Wed, 02 Jun 2021 20:37:38 -0400
X-MC-Unique: rCNxHgfIM4KJ9OICH3RI8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E96801817;
 Thu,  3 Jun 2021 00:37:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1CBA10013D6;
 Thu,  3 Jun 2021 00:37:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] scripts/qom-fuse: ensure QOMFuse.read always returns
 bytes
Date: Wed,  2 Jun 2021 20:37:14 -0400
Message-Id: <20210603003719.1321369-15-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Use FuseOSError to signal ENOENT instead of returning it
- Wrap qom-get in str(), as we don't always know its type
- The empty return should be b'', not ''.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/qmp/qom-fuse | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 703a97e75ff..0d11f731526 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -127,19 +127,19 @@ class QOMFuse(QOMCommand, Operations):
 
     def read(self, path, size, offset, fh):
         if not self.is_property(path):
-            return -ENOENT
+            raise FuseOSError(ENOENT)
 
         path, prop = path.rsplit('/', 1)
         if path == '':
             path = '/'
         try:
-            data = self.qmp.command('qom-get', path=path, property=prop)
+            data = str(self.qmp.command('qom-get', path=path, property=prop))
             data += '\n'  # make values shell friendly
         except QMPResponseError as err:
             raise FuseOSError(EPERM) from err
 
         if offset > len(data):
-            return ''
+            return b''
 
         return bytes(data[offset:][:size], encoding='utf-8')
 
-- 
2.31.1


