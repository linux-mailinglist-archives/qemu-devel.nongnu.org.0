Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83002D1755
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 20:09:33 +0200 (CEST)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIGOx-0003iW-Qi
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 14:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIBvp-0002nA-75
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIBvn-0001Kj-Ok
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39392)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iIBvn-0001KW-Jp
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 09:23:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4AB7806A79;
 Wed,  9 Oct 2019 13:23:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 256DA5C1D6;
 Wed,  9 Oct 2019 13:23:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/3] acpi: cpuhp: fix 'Command data' description is spec
Date: Wed,  9 Oct 2019 09:22:50 -0400
Message-Id: <20191009132252.17860-2-imammedo@redhat.com>
In-Reply-To: <20191009132252.17860-1-imammedo@redhat.com>
References: <20191009132252.17860-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 09 Oct 2019 13:23:06 +0000 (UTC)
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

QEMU returns 0, in case of erro or invalid value in 'Command field',
make spec match reality, i.e.

Also fix returned value description  in case 'Command field' == 0x0,
it's in not PXM but CPU selector value with pending event

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
index ee219c8358..ac5903b2b1 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -44,9 +44,10 @@ read access:
            3-7: reserved and should be ignored by OSPM
     [0x5-0x7] reserved
     [0x8] Command data: (DWORD access)
-          in case of error or unsupported command reads is 0xFFFFFFFF
+          in case of error or unsupported command reads is 0x0
           current 'Command field' value:
-              0: returns PXM value corresponding to device
+              0: returns CPU selector value corresponding to a CPU with
+                 pending event.
 
 write access:
     offset:
-- 
2.18.1


