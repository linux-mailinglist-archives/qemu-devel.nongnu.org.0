Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2B48A3DD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:46:20 +0100 (CET)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Ml-0000xX-9P
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:46:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748v-0004dP-TU
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748t-0000JS-0a
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zg9LZjkORuTr62yl0AayXxZT2OhZL8s4pf5wPYMaJQc=;
 b=Lwb2K5A8tI7JaDWALZBdDpjuASi/vkLgEgjYlHhPhIdZNDpPSUiaxAGGHOdpSnPvqHXunS
 kZWVgZetnVr4KxnjCyszNdK4paI1pkx9o1tLMcxeIylPcaFz7shCMkEpNI0vUjQOAFApzB
 r3INIPFRxg1LzEd7jc+WiwT0sYD3tvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-qaZU-6DwPx6NL83PAtMfPg-1; Mon, 10 Jan 2022 18:31:46 -0500
X-MC-Unique: qaZU-6DwPx6NL83PAtMfPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583C010247A8;
 Mon, 10 Jan 2022 23:31:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF687B028;
 Mon, 10 Jan 2022 23:31:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/31] python/qmp: switch qom tools to AQMP
Date: Mon, 10 Jan 2022 18:28:52 -0500
Message-Id: <20220110232910.1923864-14-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
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


