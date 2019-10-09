Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BDD17C5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 20:51:38 +0200 (CEST)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIH3g-0004u7-Qy
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46311)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIBvq-0002nN-PE
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIBvp-0001LB-MZ
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45390)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iIBvp-0001L3-HU
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AFD789B299;
 Wed,  9 Oct 2019 13:23:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1503B5C1D6;
 Wed,  9 Oct 2019 13:23:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/3] acpi: cpuhp: add typical usecases into spec
Date: Wed,  9 Oct 2019 09:22:51 -0400
Message-Id: <20191009132252.17860-3-imammedo@redhat.com>
In-Reply-To: <20191009132252.17860-1-imammedo@redhat.com>
References: <20191009132252.17860-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 09 Oct 2019 13:23:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify values of "CPU selector' register and add workflows for
  * finding CPU with pending 'insert/remove' event
  * enumerating present/non present CPUs

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
index ac5903b2b1..43c5a193f0 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -54,6 +54,7 @@ write access:
     [0x0-0x3] CPU selector: (DWORD access)
               selects active CPU device. All following accesses to other
               registers will read/store data from/to selected CPU.
+              Valid values: [0 .. max_cpus)
     [0x4] CPU device control fields: (1 byte access)
         bits:
             0: reserved, OSPM must clear it before writing to register.
@@ -93,3 +94,24 @@ Selecting CPU device beyond possible range has no effect on platform:
      ignored
    - read accesses to CPU hot-plug registers not documented above return
      all bits set to 0.
+
+Typical usecases:
+   - Get a cpu with pending event
+     1. write 0x0 into 'Command field' register
+     2. read from 'Command data' register, CPU selector value (CPU's UID in ACPI
+        tables) and event for selected CPU from 'CPU device status fields'
+        register. If there aren't pending events, CPU selector value doesn't
+        change and 'insert' and 'remove' bits are not set.
+   - Enumerate CPUs present/non present CPUs.
+     1. set iterator to 0x0
+     2. write 0x0 into 'Command field' register and then iterator
+        into 'CPU selector' register.
+     3. read 'enabled' flag for selected CPU from 'CPU device status fields'
+        register
+     4. to continue to the next CPU, increment iterator and repeat step 2
+     5. read 'Command data' register
+     5.1 if 'Command data' register matches iterator continue to step 3.
+         (read presence bit for the next CPU)
+     5.2 if 'Command data' register has not changed, there is not CPU
+         corresponding to iterator value and the last valid iterator value
+         equals to 'max_cpus' + 1
-- 
2.18.1


