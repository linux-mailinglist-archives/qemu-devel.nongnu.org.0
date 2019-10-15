Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263DD7C96
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 18:59:57 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKQAu-0007Kv-0Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 12:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iKPyM-0006ZI-1P
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:46:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iKPyJ-0006zb-N2
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 12:46:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35166)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iKPyJ-0006yy-HP; Tue, 15 Oct 2019 12:46:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66187C065113;
 Tue, 15 Oct 2019 16:46:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9AC460464;
 Tue, 15 Oct 2019 16:46:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/mem/Kconfig: NVDIMM device requires CONFIG_MEM_DEVICE
Date: Tue, 15 Oct 2019 18:46:42 +0200
Message-Id: <20191015164642.31069-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 15 Oct 2019 16:46:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When selecting only the NVDIMM device with "NVDIMM y", the
device is not compiled/linked because it does not select MEM_DEVICE
and hw/mem/Makefile.objs is not included:

  $ git grep mem/ hw/Makefile.objs
  hw/Makefile.objs:39:devices-dirs-$(CONFIG_MEM_DEVICE) +=3D mem/

Let NVDIMM config select MEM_DEVICE.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
I'm not sure this is the best fix, maybe we should simply include
mem/ regardless of CONFIG_MEM_DEVICE (all mem devices use it).
---
 hw/mem/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
index 620fd4cb59..5da724d7a2 100644
--- a/hw/mem/Kconfig
+++ b/hw/mem/Kconfig
@@ -7,5 +7,6 @@ config MEM_DEVICE
=20
 config NVDIMM
     bool
+    select MEM_DEVICE
     default y
     depends on PC
--=20
2.21.0


