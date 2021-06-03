Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0539972F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:46:42 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobVR-0008Ob-Rk
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMn-00057D-Om
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMl-0004pD-S6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZIuZoRnfL3Jw3X8K/dU+kKaJLnkMfALKLUdcwhO9ZVg=;
 b=Rpk22Fq6wxqk7KW7TOG48YJgTfampfzfqfeYcZMMwhe+ikFJxJlh0D06E3aDV66mU3CFmu
 /DuSeH28zvEI06sSwl1YYP5SsUI+1kl3y8gpLKOeMnpOfGSvEN4Na89HK9PPJaeJVeFsru
 TS/QJ5iaoIIDJot9lrQd8qDvTktqtkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-f9E_RjpbOG2rlfiCZYADFQ-1; Wed, 02 Jun 2021 20:37:41 -0400
X-MC-Unique: f9E_RjpbOG2rlfiCZYADFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2490107ACC7;
 Thu,  3 Jun 2021 00:37:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E48C10013D6;
 Thu,  3 Jun 2021 00:37:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/19] scripts/qom-fuse: move to python/qemu/qmp/qom_fuse.py
Date: Wed,  2 Jun 2021 20:37:17 -0400
Message-Id: <20210603003719.1321369-18-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qom-fuse over to the python package now that it passes the
linter. Update the import paradigms so that it continues to pass in the
context of the Python package.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qom-fuse => python/qemu/qmp/qom_fuse.py | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename scripts/qmp/qom-fuse => python/qemu/qmp/qom_fuse.py (95%)
 mode change 100755 => 100644

diff --git a/scripts/qmp/qom-fuse b/python/qemu/qmp/qom_fuse.py
old mode 100755
new mode 100644
similarity index 95%
rename from scripts/qmp/qom-fuse
rename to python/qemu/qmp/qom_fuse.py
index a5a7a304a3e..43f4671fdb1
--- a/scripts/qmp/qom-fuse
+++ b/python/qemu/qmp/qom_fuse.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python3
 """
 QEMU Object Model FUSE filesystem tool
 
@@ -35,7 +34,6 @@
 
 import argparse
 from errno import ENOENT, EPERM
-import os
 import stat
 import sys
 from typing import (
@@ -50,10 +48,8 @@
 import fuse
 from fuse import FUSE, FuseOSError, Operations
 
-
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import QMPResponseError
-from qemu.qmp.qom_common import QOMCommand
+from . import QMPResponseError
+from .qom_common import QOMCommand
 
 
 fuse.fuse_python_api = (0, 2)
@@ -208,7 +204,3 @@ def readdir(self, path: str, fh: IO[bytes]) -> Iterator[str]:
         yield '..'
         for item in self.qom_list(path):
             yield item.name
-
-
-if __name__ == '__main__':
-    sys.exit(QOMFuse.entry_point())
-- 
2.31.1


