Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B120BA86
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 22:48:18 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jovGj-00072B-D1
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 16:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAX-0006sz-EF
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:41:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49342
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jovAV-0005po-Jo
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 16:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593204111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqk7ovbcZenmmjkGeGLVpvHvzhizoBYcL+O5A5dVKHI=;
 b=jG5uf58XoX8arOzwk/gVEOWfNOrrT62LWQk8tVVhsJFWiqcgn4caoHX5lLCd5MTkknPIXd
 YOSGnNBxyedEUQGkGgRCcRB9vmFaEn3wYgwipCV/FF7bCs/tw+9LdZtg2IIMnutRGz2v3Y
 +NbNAuoVgSFpFEveo3D8TzV2DFa3Oqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-tUvaUqc-OSm0OFb4iS3uag-1; Fri, 26 Jun 2020 16:41:49 -0400
X-MC-Unique: tUvaUqc-OSm0OFb4iS3uag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BA6918585BA;
 Fri, 26 Jun 2020 20:41:48 +0000 (UTC)
Received: from probe.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1C8319C58;
 Fri, 26 Jun 2020 20:41:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/16] python/qmp.py: add casts to JSON deserialization
Date: Fri, 26 Jun 2020 16:41:22 -0400
Message-Id: <20200626204133.14500-6-jsnow@redhat.com>
In-Reply-To: <20200626204133.14500-1-jsnow@redhat.com>
References: <20200626204133.14500-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy and python type hints are not powerful enough to properly describe
JSON messages in Python 3.6. The best we can do, generally, is describe
them as Dict[str, Any].

Add casts to coerce this type for static analysis; but do NOT enforce
this type at runtime in any way.

Note: Python 3.8 adds a TypedDict construct which allows for the
description of more arbitrary Dictionary shapes. There is a third-party
module, "Pydantic", which is compatible with 3.6 that can be used
instead of the JSON library that parses JSON messages to fully-typed
Python objects, and may be preferable in some cases.

(That is well beyond the scope of this commit or series.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/qmp.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index ef3c919b76..1ae36050a4 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -13,6 +13,7 @@
 import logging
 from typing import (
     Any,
+    cast,
     Dict,
     Optional,
     TextIO,
@@ -130,7 +131,10 @@ def __json_read(self, only_event=False):
             data = self.__sockfile.readline()
             if not data:
                 return None
-            resp = json.loads(data)
+            # By definition, any JSON received from QMP is a QMPMessage,
+            # and we are asserting only at static analysis time that it
+            # has a particular shape.
+            resp: QMPMessage = json.loads(data)
             if 'event' in resp:
                 self.logger.debug("<<< %s", resp)
                 self.__events.append(resp)
@@ -262,7 +266,7 @@ def command(self, cmd, **kwds):
         ret = self.cmd(cmd, kwds)
         if 'error' in ret:
             raise QMPResponseError(ret)
-        return ret['return']
+        return cast(QMPReturnValue, ret['return'])
 
     def pull_event(self, wait=False):
         """
-- 
2.21.3


