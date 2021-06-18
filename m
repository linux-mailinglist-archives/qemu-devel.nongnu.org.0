Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D723AD5BF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:19:11 +0200 (CEST)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNlW-0004oO-5f
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY9-0006tL-M3
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNY5-00069r-2S
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhUUYAeEP3cnDa2LBa764gf8j8bVouGwmaNtErBpEHg=;
 b=J5IbnofcNtrvXS7ZLf64JPpo1cs0q2HlsKmgc9DM9On+tsA0PJRv8WJ+9ijUss2z0T9a1p
 XmaYWLHVhf5naQt7S8qDSLXv0WK64pCOzUk4JHlpWiGHSf6Km3jbd3IO86UrtjTjksTo4R
 olCpT99XKe/ih7zVRGS/1RZoDDOZNbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-H-X8TPmCNXKdAgCVR6n5Hg-1; Fri, 18 Jun 2021 19:05:14 -0400
X-MC-Unique: H-X8TPmCNXKdAgCVR6n5Hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D890C5074F;
 Fri, 18 Jun 2021 23:05:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A7951017CE5;
 Fri, 18 Jun 2021 23:05:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/72] scripts/qom-fuse: use QOMCommand.qom_list()
Date: Fri, 18 Jun 2021 19:03:56 -0400
Message-Id: <20210618230455.2891199-14-jsnow@redhat.com>
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

the qom_list method provides a type-safe object that's easier to type
check, so switch to using it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-14-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 1676fb78d9..703a97e75f 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -94,7 +94,7 @@ class QOMFuse(QOMCommand, Operations):
     def is_object(self, path):
         """Is the given QOM path an object?"""
         try:
-            self.qmp.command('qom-list', path=path)
+            self.qom_list(path)
             return True
         except QMPResponseError:
             return False
@@ -105,8 +105,8 @@ class QOMFuse(QOMCommand, Operations):
         if path == '':
             path = '/'
         try:
-            for item in self.qmp.command('qom-list', path=path):
-                if item['name'] == prop:
+            for item in self.qom_list(path):
+                if item.name == prop:
                     return True
             return False
         except QMPResponseError:
@@ -118,11 +118,9 @@ class QOMFuse(QOMCommand, Operations):
         if path == '':
             path = '/'
         try:
-            for item in self.qmp.command('qom-list', path=path):
-                if item['name'] == prop:
-                    if item['type'].startswith('link<'):
-                        return True
-                    return False
+            for item in self.qom_list(path):
+                if item.name == prop and item.link:
+                    return True
             return False
         except QMPResponseError:
             return False
@@ -200,8 +198,8 @@ class QOMFuse(QOMCommand, Operations):
     def readdir(self, path, fh):
         yield '.'
         yield '..'
-        for item in self.qmp.command('qom-list', path=path):
-            yield str(item['name'])
+        for item in self.qom_list(path):
+            yield item.name
 
 
 if __name__ == '__main__':
-- 
2.31.1


