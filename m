Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB17137595
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 18:57:59 +0100 (CET)
Received: from localhost ([::1]:50154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipyXm-0002yb-LP
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 12:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipyCL-0007BR-OB
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipyCK-0007ag-EQ
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:49 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipyCK-0007Yc-1H
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipUbyqSi2LbvtRe4A/gxQ9gfFY5LWhrpHClvIgUmIV4=;
 b=h5BGUg7Jw/HL6BSw7dfsowZkEmsk8C+ZGXdi0j+j/hGFhKkdcD6jtawAyK4D2vSncNViay
 vPqv1Af/EsF984bzYZjBB3Np99JSyHtkxcyVmFCDV4v57D7rZv6ER3bD/dxm7q6Ih7WTo1
 pNJSDOx1Sg+x1JBmuV24hG/ZsP2T0fM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-AGQADt99M-Kf04wakqCoTA-1; Fri, 10 Jan 2020 12:35:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8684F1005502;
 Fri, 10 Jan 2020 17:35:43 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D5AA19C4F;
 Fri, 10 Jan 2020 17:35:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] migration/multifd: not use multifd during postcopy
Date: Fri, 10 Jan 2020 18:32:09 +0100
Message-Id: <20200110173215.3865-23-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: AGQADt99M-Kf04wakqCoTA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>
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
index 57e22cac4c..4ba9037e78 100644
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


