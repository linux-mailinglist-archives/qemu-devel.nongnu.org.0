Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70103D6579
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 16:45:07 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK1as-0003m3-9r
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 10:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1NH-00055X-KV
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1NG-0002U8-Hw
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:31:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1NB-0002RB-QH; Mon, 14 Oct 2019 10:30:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C908C80166C;
 Mon, 14 Oct 2019 14:30:56 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A245600CD;
 Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 16/20] hw/pci-host/piix: Include "qemu/range.h"
Date: Mon, 14 Oct 2019 16:22:42 +0200
Message-Id: <20191014142246.4538-17-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/pci-host/piix.c calls various functions from the Range API.
Include "qemu/range.h" which declares them.

This fixes (when modifying unrelated headers):

  hw/pci-host/i440fx.c:54:11: error: field has incomplete type 'Range' (a=
ka 'struct Range')
      Range pci_hole;
           ^
  include/qemu/typedefs.h:116:16: note: forward declaration of 'struct Ra=
nge'
  typedef struct Range Range;
                 ^
  hw/pci-host/i440fx.c:126:9: error: implicit declaration of function 'ra=
nges_overlap' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      if (ranges_overlap(address, len, I440FX_PAM, I440FX_PAM_SIZE) ||
          ^
  hw/pci-host/i440fx.c:126:9: error: this function declaration is not a p=
rototype [-Werror,-Wstrict-prototypes]
  hw/pci-host/i440fx.c:127:9: error: implicit declaration of function 'ra=
nge_covers_byte' is invalid in C99 [-Werror,-Wimplicit-function-declarati=
on]
          range_covers_byte(address, len, I440FX_SMRAM)) {
          ^
  hw/pci-host/i440fx.c:127:9: error: this function declaration is not a p=
rototype [-Werror,-Wstrict-prototypes]
  hw/pci-host/i440fx.c:189:13: error: implicit declaration of function 'r=
ange_is_empty' is invalid in C99 [-Werror,-Wimplicit-function-declaration=
]
      val64 =3D range_is_empty(&s->pci_hole) ? 0 : range_lob(&s->pci_hole=
);
              ^

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/piix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index 135c645535..76ed252a60 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
--=20
2.21.0


