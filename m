Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B996B3AD5A4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:07:56 +0200 (CEST)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNad-0001ev-Ai
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY8-0006rK-Al
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY6-0006Ak-Kq
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1+qNx9M7q3o9a9mFv8d6hVCXCyKHldj24y6Awjf83M=;
 b=LDUhYPmc/i1h8DfnHjvJ84VOpMd2z9QhF04a70K5aoGnQz7csDZn3ZTbZmTj3SocCzdXVZ
 iv+KLO+bMqSu3lcw3SRd3LWMdM7b25k3vdE4MGw1PY0A5oWr1gy5w1akvNpbsWN/5qrfiG
 CrI2WC1ZwOzWONXmQVOk+TiNR621Riw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-izfQkSYOOv6B8sET9d9iGA-1; Fri, 18 Jun 2021 19:05:16 -0400
X-MC-Unique: izfQkSYOOv6B8sET9d9iGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673EF1084F54;
 Fri, 18 Jun 2021 23:05:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0877910246F1;
 Fri, 18 Jun 2021 23:05:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/72] scripts/qom-fuse: ensure QOMFuse.read always returns
 bytes
Date: Fri, 18 Jun 2021 19:03:57 -0400
Message-Id: <20210618230455.2891199-15-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

- Use FuseOSError to signal ENOENT instead of returning it
- Wrap qom-get in str(), as we don't always know its type
- The empty return should be b'', not ''.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-15-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 703a97e75f..0d11f73152 100755
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


