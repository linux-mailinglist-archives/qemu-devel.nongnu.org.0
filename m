Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EEAD8310
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 23:51:39 +0200 (CEST)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKUjC-0004TC-Bq
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 17:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWi-0006Jt-NR
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iKUWh-0006sV-P3
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iKUWh-0006s6-JX
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 17:38:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66090811D8;
 Tue, 15 Oct 2019 21:38:42 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59565D9E2;
 Tue, 15 Oct 2019 21:38:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org
Subject: [PULL 12/18] memory-device: not necessary to use goto for the last
 check
Date: Tue, 15 Oct 2019 18:37:39 -0300
Message-Id: <20191015213745.22174-13-ehabkost@redhat.com>
In-Reply-To: <20191015213745.22174-1-ehabkost@redhat.com>
References: <20191015213745.22174-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 15 Oct 2019 21:38:42 +0000 (UTC)
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

We are already at the last condition check.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20190730003740.20694-2-richardw.yang@linux.intel.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mem/memory-device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 53953fdc3a..5029890e06 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -185,7 +185,6 @@ static uint64_t memory_device_get_free_addr(MachineSt=
ate *ms,
     if (!range_contains_range(&as, &new)) {
         error_setg(errp, "could not find position in guest address space=
 for "
                    "memory device - memory fragmented due to alignments"=
);
-        goto out;
     }
 out:
     g_slist_free(list);
--=20
2.21.0


