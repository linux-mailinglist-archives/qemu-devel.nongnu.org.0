Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372625BD1F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 10:25:10 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDkYP-0004vO-Bp
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 04:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkXC-00037O-Dt
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42605
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDkXA-0008Sh-IK
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 04:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599121431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y++QSgRJlH/gQE4gNXs2Alm/h9hnEyIdu1Oav+EA6RI=;
 b=C5pAmVo5D7FQUh1mfhwXzJUukxr1DiDrY+nnEc2VlrjqB+8siSbCu0HYEXtnX3Us+DQTOq
 1Hhx5Fpf0UoDNFDIoO+keM5tFWfuecA6YzgP3zYlGGtj+un7tn0XgsonMBTpbZoiKCZMw+
 P2y18M8lyxa3khXVRp1HX5g8V4PvzFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-_SdWwz8pPxqVapeyUOC78Q-1; Thu, 03 Sep 2020 04:23:47 -0400
X-MC-Unique: _SdWwz8pPxqVapeyUOC78Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC86080B702;
 Thu,  3 Sep 2020 08:23:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 564DA78B40;
 Thu,  3 Sep 2020 08:23:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BEAC4111CA2A; Thu,  3 Sep 2020 10:23:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] scripts/qmp/qom-fuse: Port to current Python module fuse
Date: Thu,  3 Sep 2020 10:23:40 +0200
Message-Id: <20200903082344.1877175-5-armbru@redhat.com>
In-Reply-To: <20200903082344.1877175-1-armbru@redhat.com>
References: <20200903082344.1877175-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200723142738.1868568-3-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse | 93 ++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index b7dabe8d65..405e6ebd67 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -3,16 +3,18 @@
 # QEMU Object Model test tools
 #
 # Copyright IBM, Corp. 2012
+# Copyright (C) 2020 Red Hat, Inc.
 #
 # Authors:
 #  Anthony Liguori   <aliguori@us.ibm.com>
+#  Markus Armbruster <armbru@redhat.com>
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or later.  See
 # the COPYING file in the top-level directory.
 ##
 
 import fuse, stat
-from fuse import Fuse
+from fuse import FUSE, FuseOSError, Operations
 import os, posix, sys
 from errno import *
 
@@ -21,9 +23,8 @@ from qemu.qmp import QEMUMonitorProtocol
 
 fuse.fuse_python_api = (0, 2)
 
-class QOMFS(Fuse):
-    def __init__(self, qmp, *args, **kwds):
-        Fuse.__init__(self, *args, **kwds)
+class QOMFS(Operations):
+    def __init__(self, qmp):
         self.qmp = qmp
         self.qmp.connect()
         self.ino_map = {}
@@ -65,21 +66,21 @@ class QOMFS(Fuse):
         except:
             return False
 
-    def read(self, path, length, offset):
+    def read(self, path, length, offset, fh):
         if not self.is_property(path):
             return -ENOENT
 
         path, prop = path.rsplit('/', 1)
         try:
-            data = str(self.qmp.command('qom-get', path=path, property=prop))
+            data = self.qmp.command('qom-get', path=path, property=prop)
             data += '\n' # make values shell friendly
         except:
-            return -EPERM
+            raise FuseOSError(EPERM)
 
         if offset > len(data):
             return ''
 
-        return str(data[offset:][:length])
+        return bytes(data[offset:][:length], encoding='utf-8')
 
     def readlink(self, path):
         if not self.is_link(path):
@@ -89,52 +90,52 @@ class QOMFS(Fuse):
         return prefix + str(self.qmp.command('qom-get', path=path,
                                              property=prop))
 
-    def getattr(self, path):
+    def getattr(self, path, fh=None):
         if self.is_link(path):
-            value = posix.stat_result((0o755 | stat.S_IFLNK,
-                                       self.get_ino(path),
-                                       0,
-                                       2,
-                                       1000,
-                                       1000,
-                                       4096,
-                                       0,
-                                       0,
-                                       0))
+            value = { 'st_mode': 0o755 | stat.S_IFLNK,
+                      'st_ino': self.get_ino(path),
+                      'st_dev': 0,
+                      'st_nlink': 2,
+                      'st_uid': 1000,
+                      'st_gid': 1000,
+                      'st_size': 4096,
+                      'st_atime': 0,
+                      'st_mtime': 0,
+                      'st_ctime': 0 }
         elif self.is_object(path):
-            value = posix.stat_result((0o755 | stat.S_IFDIR,
-                                       self.get_ino(path),
-                                       0,
-                                       2,
-                                       1000,
-                                       1000,
-                                       4096,
-                                       0,
-                                       0,
-                                       0))
+            value = { 'st_mode': 0o755 | stat.S_IFDIR,
+                      'st_ino': self.get_ino(path),
+                      'st_dev': 0,
+                      'st_nlink': 2,
+                      'st_uid': 1000,
+                      'st_gid': 1000,
+                      'st_size': 4096,
+                      'st_atime': 0,
+                      'st_mtime': 0,
+                      'st_ctime': 0 }
         elif self.is_property(path):
-            value = posix.stat_result((0o644 | stat.S_IFREG,
-                                       self.get_ino(path),
-                                       0,
-                                       1,
-                                       1000,
-                                       1000,
-                                       4096,
-                                       0,
-                                       0,
-                                       0))
+            value = { 'st_mode': 0o644 | stat.S_IFREG,
+                      'st_ino': self.get_ino(path),
+                      'st_dev': 0,
+                      'st_nlink': 1,
+                      'st_uid': 1000,
+                      'st_gid': 1000,
+                      'st_size': 4096,
+                      'st_atime': 0,
+                      'st_mtime': 0,
+                      'st_ctime': 0 }
         else:
-            value = -ENOENT
+            raise FuseOSError(ENOENT)
         return value
 
-    def readdir(self, path, offset):
-        yield fuse.Direntry('.')
-        yield fuse.Direntry('..')
+    def readdir(self, path, fh):
+        yield '.'
+        yield '..'
         for item in self.qmp.command('qom-list', path=path):
-            yield fuse.Direntry(str(item['name']))
+            yield str(item['name'])
 
 if __name__ == '__main__':
     import os
 
-    fs = QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET']))
-    fs.main(sys.argv)
+    fuse = FUSE(QOMFS(QEMUMonitorProtocol(os.environ['QMP_SOCKET'])),
+                sys.argv[1], foreground=True)
-- 
2.26.2


