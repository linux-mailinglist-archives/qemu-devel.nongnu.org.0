Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B182859CC6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 15:16:14 +0200 (CEST)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgqjd-0000n6-TY
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 09:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hgqGP-0008U4-Ln
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hgqGM-0001b9-2o
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:46:01 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36948)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hgqGL-0001RD-7U
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 08:45:57 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3A1BC96F54;
 Fri, 28 Jun 2019 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1561725939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjS6MgiRGaWDm6aO6owVkrbeZw4PYZfjBhtjtiuXYAo=;
 b=Qv6OJOL1ZmQuhg6sxOZ4Cs8tJ5FTvI9Ji/IptnJsj0wAfn6fbiE7pDIMcPXWTcA4nrSgA0
 WfjBG6S/xJw6gGv2gFc+UOzKl1shAFpaLWVmWIn/zznRSus5AglUw1TUKQN9T7+RQlYhKr
 QmQuSgYFuBCZ8o4ik95Ac5AEz+UoQL4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 14:45:31 +0200
Message-Id: <20190628124534.10679-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190628124534.10679-1-damien.hedde@greensocs.com>
References: <20190628124534.10679-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1561725939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjS6MgiRGaWDm6aO6owVkrbeZw4PYZfjBhtjtiuXYAo=;
 b=Zx5pyHhttz+CESwoTP2Lh/gJmkVr00bA25Tc568k4Ymcah3p+V3k9UAxkY997tXSPBke27
 uGSz9cHKdf0NeDn+FF/80dxv6DV5ogzVniPXsiM8lHli9/A/rqonqEZm+cyAYyQnTtj51l
 b4p9SMGoOUI5bxA58R+NfW8dW/OrO3Y=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1561725939; a=rsa-sha256; cv=none;
 b=3zlVFfDvjF+mdOoWoT9p1DdR/pgONbMiTE8aP+ROUV+TwEsG5w4gWdZNhtfYZTXJJhr1M5
 FEUq0FgmClIXPcpSoHxoB+PQ43F0OrvZRjERWlTbQ5g/H/naraURcA+5MRTcmZ53lGMIIm
 LK3x/VPGEkZHChXRxjx2Fj0q1dtuIuU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [RFC PATCH 2/5] introduce a qmp command to set gpios
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, ehabkost@redhat.com,
 mark.burton@greensocs.com, armbru@redhat.com, sakisp@xilinx.com,
 edgari@xilinx.com, crosa@redhat.com, pbonzini@redhat.com,
 luc.michel@greensocs.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds the "gpio-set" qmp command.

Taking the device path, the gpio name and number, the command set the
value (true or false) of the gpio.
It works only on gpio input line.

This is based on Frederic Konrad's work.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 cpus.c             |  4 ++--
 monitor/qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
 qapi/misc.json     | 29 +++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/cpus.c b/cpus.c
index 7aae35c098..3688550c55 100644
--- a/cpus.c
+++ b/cpus.c
@@ -2580,8 +2580,8 @@ static void memwrite(int64_t addr, uint8List *bytes=
, CPUState *cpu,
         MemTxResult r =3D address_space_write(&address_space_memory, add=
r,
                                             MEMTXATTRS_UNSPECIFIED, buf,=
 l);
         if (r !=3D MEMTX_OK) {
-            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId=
64
-                             " specified", addr, size);
+            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRIu=
32
+                             " specified", addr, l);
             return;
         }
     }
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 01ce77e129..6bf0204edd 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -726,3 +726,33 @@ MemoryInfo *qmp_query_memory_size_summary(Error **er=
rp)
=20
     return mem_info;
 }
+
+void qmp_gpio_set(const char *path, bool has_gpio, const char *gpio,
+                  bool has_number, int64_t number, bool value, Error **e=
rrp)
+{
+    DeviceState *dev;
+    qemu_irq irq;
+
+    dev =3D DEVICE(object_resolve_path(path, NULL));
+    if (!dev) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
+                  "Cannot find device '%s'", path);
+        return;
+    }
+
+    if (!has_gpio) {
+        gpio =3D NULL;
+    }
+    if (!has_number) {
+        number =3D 0;
+    }
+    irq =3D qdev_get_gpio_in_named(dev, gpio, number);
+    if (!irq) {
+        error_set(errp, ERROR_CLASS_GENERIC_ERROR,
+                  "GPIO input '%s[%"PRId64"]' does not exists",
+                  has_gpio ? gpio : "unnamed", number);
+        return;
+    }
+
+    qemu_set_irq(irq, value);
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 3aca91b4ac..255236b96f 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -3166,3 +3166,32 @@
 { 'command': 'pmemwrite',
   'data': {'addr': 'int', 'bytes': ['uint8']}
 }
+
+##
+# @gpio-set:
+#
+# @path: Path to the device.
+#
+# @gpio: Name of the GPIO will be unnamed-gpio if omitted.
+#
+# @number: Number of the GPIO line, 0 if omitted.
+#
+# @value: Value (boolean) to be set for the GPIO.
+#
+# Returns: nothing in case of success
+#
+# Since 4.1
+#
+# Example:
+#
+# -> { "execute": "gpio-set",
+#      "arguments": { "path": "/machine/unattached/device[5]",
+#                     "gpio": "ssi-gpio-cs",
+#                     "number": 0,
+#                     "value": true } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'gpio-set',
+  'data': { 'path': 'str', '*gpio': 'str', '*number': 'int', 'value': 'b=
ool' }
+}
--=20
2.22.0


