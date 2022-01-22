Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520234968A9
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:24:33 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4Cm-0003jB-EJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yr-0000vO-DD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yn-0005Pq-QQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg9LZjkORuTr62yl0AayXxZT2OhZL8s4pf5wPYMaJQc=;
 b=fao4YGjMqRdjNeDj2ZtZsKnEZIVcxz1ls6M5x0MAu8GOvCK2EuFUB5TNFdWgcOJ/eET7gI
 VDkvyEooPdhpTNnK6KZ1GSDZpPEiINcbFQhx3F8sZE9qFsi9ldrOVzR2LcmOBxTjQnBhGv
 hIMfKkt/72JLdqQYFzXEk8VpCFUM/j0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-0GQ1Q5Q-PzGW2vtAxxD0cg-1; Fri, 21 Jan 2022 19:09:56 -0500
X-MC-Unique: 0GQ1Q5Q-PzGW2vtAxxD0cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9430814246;
 Sat, 22 Jan 2022 00:09:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 086A566E1B;
 Sat, 22 Jan 2022 00:09:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] python/qmp: switch qom tools to AQMP
Date: Fri, 21 Jan 2022 19:09:25 -0500
Message-Id: <20220122000931.536322-12-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/qmp/qom.py        |  5 +++--
 python/qemu/qmp/qom_common.py |  3 ++-
 python/qemu/qmp/qom_fuse.py   | 11 ++++++-----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
index 8ff28a8343..bb5d1a78f5 100644
--- a/python/qemu/qmp/qom.py
+++ b/python/qemu/qmp/qom.py
@@ -32,7 +32,8 @@
 
 import argparse
 
-from . import QMPResponseError
+from qemu.aqmp import ExecuteError
+
 from .qom_common import QOMCommand
 
 
@@ -233,7 +234,7 @@ def _list_node(self, path: str) -> None:
                 rsp = self.qmp.command('qom-get', path=path,
                                        property=item.name)
                 print(f"  {item.name}: {rsp} ({item.type})")
-            except QMPResponseError as err:
+            except ExecuteError as err:
                 print(f"  {item.name}: <EXCEPTION: {err!s}> ({item.type})")
         print('')
         for item in items:
diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
index 2e4c741f77..e034a6f247 100644
--- a/python/qemu/qmp/qom_common.py
+++ b/python/qemu/qmp/qom_common.py
@@ -27,7 +27,8 @@
     TypeVar,
 )
 
-from . import QEMUMonitorProtocol, QMPError
+from qemu.aqmp import QMPError
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 
 
 class ObjectPropertyInfo:
diff --git a/python/qemu/qmp/qom_fuse.py b/python/qemu/qmp/qom_fuse.py
index 43f4671fdb..653a76b93b 100644
--- a/python/qemu/qmp/qom_fuse.py
+++ b/python/qemu/qmp/qom_fuse.py
@@ -48,7 +48,8 @@
 import fuse
 from fuse import FUSE, FuseOSError, Operations
 
-from . import QMPResponseError
+from qemu.aqmp import ExecuteError
+
 from .qom_common import QOMCommand
 
 
@@ -99,7 +100,7 @@ def is_object(self, path: str) -> bool:
         try:
             self.qom_list(path)
             return True
-        except QMPResponseError:
+        except ExecuteError:
             return False
 
     def is_property(self, path: str) -> bool:
@@ -112,7 +113,7 @@ def is_property(self, path: str) -> bool:
                 if item.name == prop:
                     return True
             return False
-        except QMPResponseError:
+        except ExecuteError:
             return False
 
     def is_link(self, path: str) -> bool:
@@ -125,7 +126,7 @@ def is_link(self, path: str) -> bool:
                 if item.name == prop and item.link:
                     return True
             return False
-        except QMPResponseError:
+        except ExecuteError:
             return False
 
     def read(self, path: str, size: int, offset: int, fh: IO[bytes]) -> bytes:
@@ -138,7 +139,7 @@ def read(self, path: str, size: int, offset: int, fh: IO[bytes]) -> bytes:
         try:
             data = str(self.qmp.command('qom-get', path=path, property=prop))
             data += '\n'  # make values shell friendly
-        except QMPResponseError as err:
+        except ExecuteError as err:
             raise FuseOSError(EPERM) from err
 
         if offset > len(data):
-- 
2.31.1


