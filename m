Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2042318
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 12:55:56 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb0v5-0000tm-Mp
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 06:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58827)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hb0oD-0003YE-Kv
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hb0oA-0002th-Vh
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:48:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34296)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hb0oA-0002tQ-Lb
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:48:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F12F73082141;
 Wed, 12 Jun 2019 10:48:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-241.ams2.redhat.com
 [10.36.116.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B907B46;
 Wed, 12 Jun 2019 10:48:43 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Jun 2019 12:48:08 +0200
Message-Id: <20190612104808.6398-9-quintela@redhat.com>
In-Reply-To: <20190612104808.6398-1-quintela@redhat.com>
References: <20190612104808.6398-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 12 Jun 2019 10:48:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 8/8] migratioin/ram.c: reset complete_round when
 we gets a queued page
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
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

In case we gets a queued page, the order of block is interrupted. We may
not rely on the complete_round flag to say we have already searched the
whole blocks on the list.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20190605010828.6969-1-richardw.yang@linux.intel.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 96c84f770a..89eec7ee9d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2286,6 +2286,12 @@ static bool get_queued_page(RAMState *rs, PageSear=
chStatus *pss)
          */
         pss->block =3D block;
         pss->page =3D offset >> TARGET_PAGE_BITS;
+
+        /*
+         * This unqueued page would break the "one round" check, even is
+         * really rare.
+         */
+        pss->complete_round =3D false;
     }
=20
     return !!block;
--=20
2.21.0


