Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396ED828E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 23:48:40 +0200 (CEST)
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKUgJ-0000qh-9V
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 17:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWo-0006Oh-Pl
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWn-0006to-Ax
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49900)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iKUWn-0006tL-5R
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 298D982DA;
 Tue, 15 Oct 2019 21:38:47 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3797F5C231;
 Tue, 15 Oct 2019 21:38:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org
Subject: [PULL 13/18] memory-device: break the loop if tmp exceed the hinted
 range
Date: Tue, 15 Oct 2019 18:37:40 -0300
Message-Id: <20191015213745.22174-14-ehabkost@redhat.com>
In-Reply-To: <20191015213745.22174-1-ehabkost@redhat.com>
References: <20191015213745.22174-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 15 Oct 2019 21:38:47 +0000 (UTC)
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
Cc: Wei Yang <richardw.yang@linux.intel.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

The memory-device list built by memory_device_build_list is ordered by
its address, this means if the tmp range exceed the hinted range, all
the following range will not overlap with it.

And this won't change default pc-dimm mapping and address assignment stay
the same as before this change.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190730003740.20694-3-richardw.yang@linux.intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 5029890e06..aef148c1d7 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -179,6 +179,8 @@ static uint64_t memory_device_get_free_addr(MachineSt=
ate *ms,
                 range_make_empty(&new);
                 break;
             }
+        } else if (range_lob(&tmp) > range_upb(&new)) {
+            break;
         }
     }
=20
--=20
2.21.0


