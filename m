Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33513A8EF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 13:03:48 +0100 (CET)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKvD-0007wF-Ap
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 07:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKaX-0007vN-5W
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKaT-0003fi-DR
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40602
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKaT-0003fP-93
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iprvAOa2cyTKcfIq8nOi5Ry3fqn5kNfZVkcEZq0n1vM=;
 b=FyeLFEonRqP3WnhWoLqw4/PTTWciLlM14RDh0mo9lZfHDAEWUV+mUGgqHKV3DoUvlFi4nM
 vr4WfJLycGV6rg8zHK4YPfxHTfv8aIPOOddeqED6glhQ2vx/KgqnQ8mHMo/0rEqzBGD+tt
 izqsUMuoKbIpGwd0+T8e3bYem0aIICQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211--LqWf3sYMiq1Di-ceF2-zA-1; Tue, 14 Jan 2020 06:42:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9689F800D48;
 Tue, 14 Jan 2020 11:42:17 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A155D5DA70;
 Tue, 14 Jan 2020 11:42:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] migration/multifd: not use multifd during postcopy
Date: Tue, 14 Jan 2020 12:39:18 +0100
Message-Id: <20200114113926.3556-23-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -LqWf3sYMiq1Di-ceF2-zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

We don't support multifd during postcopy, but user still could enable
both multifd and postcopy. This leads to migration failure.

Skip multifd during postcopy.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index a05448c0c9..d4f33a4f2f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2587,10 +2587,13 @@ static int ram_save_target_page(RAMState *rs, PageS=
earchStatus *pss,
     }
=20
     /*
-     * do not use multifd for compression as the first page in the new
-     * block should be posted out before sending the compressed page
+     * Do not use multifd for:
+     * 1. Compression as the first page in the new block should be posted =
out
+     *    before sending the compressed page
+     * 2. In postcopy as one whole host page should be placed
      */
-    if (!save_page_use_compression(rs) && migrate_use_multifd()) {
+    if (!save_page_use_compression(rs) && migrate_use_multifd()
+        && !migration_in_postcopy()) {
         return ram_save_multifd_page(rs, block, offset);
     }
=20
--=20
2.24.1


