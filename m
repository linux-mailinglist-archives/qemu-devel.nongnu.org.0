Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D44A4F9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 17:16:06 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdFq9-0007ZZ-Q7
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 11:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36813)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hdF7G-0003CG-0X
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hdF7F-0006am-33
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:29:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7398)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hdF7E-0006YK-Tw
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 10:29:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A990307FBCB
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 14:29:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B4B17C61C;
 Tue, 18 Jun 2019 14:29:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Jun 2019 10:29:31 -0400
Message-Id: <20190618142931.1694-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 18 Jun 2019 14:29:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] qmp: make qmp-shell work with python3
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
Cc: armbru@redhat.com, ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

python3 doesn't have raw_input(), so qmp-shell breaks.
Use input() instead and override it with raw_input()
if running on python2.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 scripts/qmp/qmp-shell | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 7776c7b141..8c49b39afa 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -308,7 +308,11 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         @return True if execution was ok, return False if disconnected.
         """
         try:
-            cmdline = raw_input(prompt)
+            try: # attempt to set Python2 override
+               import __builtin__;
+               getattr(__builtin__, 'raw_input', input)
+            except ModuleNotFoundError: pass
+            cmdline = input(prompt)
         except EOFError:
             print()
             return False
-- 
2.18.1


