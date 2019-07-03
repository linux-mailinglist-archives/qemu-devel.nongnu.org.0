Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C535D79F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 22:46:45 +0200 (CEST)
Received: from localhost ([::1]:57462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiPfo-0000I1-26
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 16:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <julio.montes@intel.com>) id 1hiO2f-0006gT-KA
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <julio.montes@intel.com>) id 1hiO2c-0006CG-ER
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:02:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:4377)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <julio.montes@intel.com>)
 id 1hiO2b-0005cm-Nl
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 15:02:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 12:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,444,1557212400"; d="scan'208";a="164115588"
Received: from juliomon-mobl1.zpn.intel.com (HELO fedora.zpn.intel.com.)
 ([10.219.4.39])
 by fmsmga008.fm.intel.com with ESMTP; 02 Jul 2019 12:01:37 -0700
From: Julio Montes <julio.montes@intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 19:01:31 +0000
Message-Id: <20190702190131.5780-1-julio.montes@intel.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
X-Mailman-Approved-At: Tue, 02 Jul 2019 16:29:23 -0400
Subject: [Qemu-devel] [PATCH] monitor: vnc: Fix compilation error if
 CONFIG_VNC is disable
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
Cc: Julio Montes <julio.montes@intel.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

How to reproduce it?
===

```
$ ./configure --disable-spice --disable-vte --disable-vnc \
    --disable-vnc-jpeg --disable-vnc-png --disable-vnc-sasl
$ make
...
monitor/hmp-cmds.c: In function ‘hmp_change’:
monitor/hmp-cmds.c:1985:17: error: unused variable ‘hmp_mon’
     [-Werror=unused-variable]
     MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
```

Fix
===

Move `hmp_mon` variable within the `CONFIG_VNC` block

Signed-off-by: Julio Montes <julio.montes@intel.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9de35387c3..5ed564683e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1982,7 +1982,6 @@ static void hmp_change_read_arg(void *opaque, const char *password,
 
 void hmp_change(Monitor *mon, const QDict *qdict)
 {
-    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
     const char *device = qdict_get_str(qdict, "device");
     const char *target = qdict_get_str(qdict, "target");
     const char *arg = qdict_get_try_str(qdict, "arg");
@@ -1991,6 +1990,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
 
 #ifdef CONFIG_VNC
+    MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
     if (strcmp(device, "vnc") == 0) {
         if (read_only) {
             monitor_printf(mon,
-- 
2.17.2


