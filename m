Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030FE1624D9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:45:48 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40Nv-0004RB-2Q
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j40E3-0001qn-1J
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j40E1-0007Ui-Ey
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60088
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j40E0-0007UV-UI
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582022132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAXK4A1gwm6JGoSTkcy70CJDNhiVlAh1hgkdPBAzHyg=;
 b=DyB6BovZ7Zn3dfeO8Kv6XtQqu8cYsm8l7mSVBQ/IEDVuPXFbBGniptfvHNQ1xpYG6XJc9K
 0l0USVPjDHcA2iUfWS2WqPK0uU4JraanCeOfDfbproRoTWS4+GGaCagYddJToSGG8oWEzR
 Jqsj9BiDlI7j82LGAx1J0Fc9UQlAwmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-s6GvOgoVNs63w4D90gI1jg-1; Tue, 18 Feb 2020 05:35:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3005107ACC4;
 Tue, 18 Feb 2020 10:35:29 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BDC719756;
 Tue, 18 Feb 2020 10:35:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11/19] mirror: Double-check immediately before replacing
Date: Tue, 18 Feb 2020 11:34:46 +0100
Message-Id: <20200218103454.296704-12-mreitz@redhat.com>
In-Reply-To: <20200218103454.296704-1-mreitz@redhat.com>
References: <20200218103454.296704-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: s6GvOgoVNs63w4D90gI1jg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no guarantee that we can still replace the node we want to
replace at the end of the mirror job.  Double-check by calling
bdrv_recurse_can_replace().

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index cacbc70014..447051dbc6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -700,7 +700,19 @@ static int mirror_exit_common(Job *job)
          * drain potential other users of the BDS before changing the grap=
h. */
         assert(s->in_drain);
         bdrv_drained_begin(target_bs);
-        bdrv_replace_node(to_replace, target_bs, &local_err);
+        /*
+         * Cannot use check_to_replace_node() here, because that would
+         * check for an op blocker on @to_replace, and we have our own
+         * there.
+         */
+        if (bdrv_recurse_can_replace(src, to_replace)) {
+            bdrv_replace_node(to_replace, target_bs, &local_err);
+        } else {
+            error_setg(&local_err, "Can no longer replace '%s' by '%s', "
+                       "because it can no longer be guaranteed that doing =
so "
+                       "would not lead to an abrupt change of visible data=
",
+                       to_replace->node_name, target_bs->node_name);
+        }
         bdrv_drained_end(target_bs);
         if (local_err) {
             error_report_err(local_err);
--=20
2.24.1


