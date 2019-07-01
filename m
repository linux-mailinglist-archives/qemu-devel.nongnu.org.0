Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FE4D292
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:56:57 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdzQm-0007Kn-Qh
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hdzIo-0008Mo-Lz
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:48:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hdzB4-0007HS-9L
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:40:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55134)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hdzB4-0007Ge-3R
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 11:40:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EFD0307D922
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 15:40:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7543819C5B;
 Thu, 20 Jun 2019 15:40:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 11:40:35 -0400
Message-Id: <20190620154035.30989-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 15:40:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] qmp: make qmp-shell work with python3
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
Cc: crosa@redhat.com, armbru@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

python3 doesn't have raw_input(), so qmp-shell breaks.
Use input() instead and override it with raw_input()
if running on python2.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
 use sys.version_info[0] instead try/except 
    (Cleber Rosa <crosa@redhat.com>)

 scripts/qmp/qmp-shell | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 7776c7b141..f1cddeafbc 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -78,6 +78,9 @@ import re
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 
+if sys.version_info[0] == 2:
+    input = raw_input
+
 class QMPCompleter(list):
     def complete(self, text, state):
         for cmd in self:
@@ -308,7 +311,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         @return True if execution was ok, return False if disconnected.
         """
         try:
-            cmdline = raw_input(prompt)
+            cmdline = input(prompt)
         except EOFError:
             print()
             return False
-- 
2.18.1


