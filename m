Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C7163C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 14:29:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNzDp-0002KT-39
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 08:29:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNzCa-0001vF-QV
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNzCa-0006kx-07
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:28:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNzCZ-0006kW-Re
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:28:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F3DE2D7EF;
	Tue,  7 May 2019 12:28:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 704985D9E1;
	Tue,  7 May 2019 12:27:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Tue,  7 May 2019 14:27:48 +0200
Message-Id: <20190507122748.18506-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 May 2019 12:28:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/i386/Kconfig: The Q35 machine requires the
 ICH9_AHCI device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Q35 machine uses the ICH9 chipset which is composed of various
sub-devices. There is currently no generic Kconfig selector that
selects all the required devices. Meanwhile, force the Q35 machine
to select the 'ich9-ahci' device.

This fixes:

  $ ./configure --without-default-devices && \
    ./i386-softmmu/qemu-system-i386 -nodefaults -M q35
  qemu-system-i386: Unknown device 'ich9-ahci' for bus 'PCIE'
  Aborted (core dumped)

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index a6aed7c1313..98178882169 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -80,7 +80,7 @@ config Q35
     select PC_ACPI
     select PCI_EXPRESS_Q35
     select LPC_ICH9
-    select AHCI
+    select AHCI_ICH9
     select DIMM
     select SMBIOS
     select VMPORT
--=20
2.20.1


