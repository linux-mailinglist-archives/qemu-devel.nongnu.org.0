Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069514E528
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 22:55:21 +0100 (CET)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixHmS-0003Vh-0h
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 16:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ixHce-00057T-44
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ixHcc-0004ai-LC
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39013
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ixHcc-0004XT-Fp
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 16:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580420709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zAXK4A1gwm6JGoSTkcy70CJDNhiVlAh1hgkdPBAzHyg=;
 b=O7a+u0wSJNsYF2fTe03UZTvSmRnVsYmSf7HmdPADShCa+lQ7qghLb1o4ci11m2Cm0NPHED
 VOEluVzKQ39YnTXT42PiCioNXMmt56iwhRsYGn5hWujNQs51u1iORpZY5oW7FRv+pYZ26a
 Ov33IunOGXH9D6pYiQscmUejpWXTBFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-8LkCqwhtMwO0pXSfMtgB_w-1; Thu, 30 Jan 2020 16:45:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B14573426;
 Thu, 30 Jan 2020 21:45:06 +0000 (UTC)
Received: from localhost (ovpn-204-145.brq.redhat.com [10.40.204.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04F5810018FF;
 Thu, 30 Jan 2020 21:45:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 13/21] mirror: Double-check immediately before replacing
Date: Thu, 30 Jan 2020 22:44:23 +0100
Message-Id: <20200130214431.333510-14-mreitz@redhat.com>
In-Reply-To: <20200130214431.333510-1-mreitz@redhat.com>
References: <20200130214431.333510-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8LkCqwhtMwO0pXSfMtgB_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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


