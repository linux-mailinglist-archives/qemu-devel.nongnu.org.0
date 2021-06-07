Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8039E82C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:15:26 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLef-0006kA-0N
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXE-0004Sx-Hv
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWz-0006YJ-6x
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXlhesmPbzCIA8W9+kfAympNOmyEcxU3C855rPM9wUw=;
 b=cdNIKs8A+/zHDp6FIKeZFF/qPswkuK6ztBozfQmT7IQ5b6+dybRbyenHe0JHqgPzYrQmg3
 JQsPZinod9OCZOniWK6Fj2j3QJ/pqGpowako5ElLqQlD+Ko8+ehPnnmLOloux5atyTZii+
 x++Te62aYkeyU25BGpuPu3iH8pTm+E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-nWMOvKY3Mdi4Ppro0pkavg-1; Mon, 07 Jun 2021 16:07:27 -0400
X-MC-Unique: nWMOvKY3Mdi4Ppro0pkavg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D5D3CC642;
 Mon,  7 Jun 2021 20:07:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BAB55C1C2;
 Mon,  7 Jun 2021 20:07:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/42] scripts/qmp-shell: Accept SocketAddrT instead of string
Date: Mon,  7 Jun 2021 16:06:35 -0400
Message-Id: <20210607200649.1840382-29-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't "extend" QEMUMonitorProtocol by changing the argument types. Move
the string parsing just outside of the class instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 2d0e85b5f7..b465c7f9e2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -130,9 +130,9 @@ class FuzzyJSON(ast.NodeTransformer):
 # TODO: QMPShell's interface is a bit ugly (eg. _fill_completion() and
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
-    def __init__(self, address: str, pretty: bool = False,
-                 verbose: bool = False):
-        super().__init__(self.parse_address(address))
+    def __init__(self, address: qmp.SocketAddrT,
+                 pretty: bool = False, verbose: bool = False):
+        super().__init__(address)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
         self._pretty = pretty
@@ -347,7 +347,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 
 class HMPShell(QMPShell):
-    def __init__(self, address: str,
+    def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address, pretty, verbose)
         self.__cpu_index = 0
@@ -450,11 +450,13 @@ def main() -> None:
 
     shell_class = HMPShell if args.hmp else QMPShell
     try:
-        qemu = shell_class(args.qmp_server, args.pretty, args.verbose)
+        address = shell_class.parse_address(args.qmp_server)
     except qmp.QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
+    qemu = shell_class(address, args.pretty, args.verbose)
+
     try:
         qemu.connect(negotiate=not args.skip_negotiation)
     except qmp.QMPConnectError:
-- 
2.31.1


