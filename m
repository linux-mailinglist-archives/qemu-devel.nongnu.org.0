Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7736717E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:34:44 +0200 (CEST)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwdG-0003Po-VV
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hlwb6-0004Ph-Rj
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hlwb5-0001fi-Kf
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hlwb5-0001e6-EV
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:32:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B44558E33;
 Fri, 12 Jul 2019 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AEF560920;
 Fri, 12 Jul 2019 14:32:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 16:31:53 +0200
Message-Id: <20190712143207.4214-6-quintela@redhat.com>
In-Reply-To: <20190712143207.4214-1-quintela@redhat.com>
References: <20190712143207.4214-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 12 Jul 2019 14:32:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/19] migration/xbzrle: update cache and
 current_data in one place
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

When we are not in the last_stage, we need to update the cache if page
is not the same.

Currently this procedure is scattered in two places and mixed with
encoding status check.

This patch extract this general step out to make the code a little bit
easy to read.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190610004159.20966-1-richardw.yang@linux.intel.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 74c9306c78..d3d72b6f4f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1585,25 +1585,30 @@ static int save_xbzrle_page(RAMState *rs, uint8_t=
 **current_data,
     encoded_len =3D xbzrle_encode_buffer(prev_cached_page, XBZRLE.curren=
t_buf,
                                        TARGET_PAGE_SIZE, XBZRLE.encoded_=
buf,
                                        TARGET_PAGE_SIZE);
+
+    /*
+     * Update the cache contents, so that it corresponds to the data
+     * sent, in all cases except where we skip the page.
+     */
+    if (!last_stage && encoded_len !=3D 0) {
+        memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
+        /*
+         * In the case where we couldn't compress, ensure that the calle=
r
+         * sends the data from the cache, since the guest might have
+         * changed the RAM since we copied it.
+         */
+        *current_data =3D prev_cached_page;
+    }
+
     if (encoded_len =3D=3D 0) {
         trace_save_xbzrle_page_skipping();
         return 0;
     } else if (encoded_len =3D=3D -1) {
         trace_save_xbzrle_page_overflow();
         xbzrle_counters.overflow++;
-        /* update data in the cache */
-        if (!last_stage) {
-            memcpy(prev_cached_page, *current_data, TARGET_PAGE_SIZE);
-            *current_data =3D prev_cached_page;
-        }
         return -1;
     }
=20
-    /* we need to update the data in the cache, in order to get the same=
 data */
-    if (!last_stage) {
-        memcpy(prev_cached_page, XBZRLE.current_buf, TARGET_PAGE_SIZE);
-    }
-
     /* Send XBZRLE based compressed page */
     bytes_xbzrle =3D save_page_header(rs, rs->f, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
--=20
2.21.0


