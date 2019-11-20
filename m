Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15F1043B1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 19:52:35 +0100 (CET)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXV5d-0001Ov-Ng
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 13:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iXUyo-0004C2-T3
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iXUym-0005xS-Q2
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54313
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iXUym-0005wq-FA
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574275526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKw+3MQbNgyiIFkgmDggje2ln5kZwjeMM65Y9tywrg0=;
 b=Zm0ACfXSAftTIhN+rgsWMj8zYVWbjpFctaroyt6GESfZmpwUbleqlw1U9FA5gfGGSkONF/
 c3cKNZdUBFZKbPBGx7CFVed5KFTnHV21PihiTyiVfTtg/FLpOFO0bmUva7byfAfc+OZvMn
 KbGA+qVdvBTLSHkApmpo1+Y1ZCSNBeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-jqrCqNNtOYeoGpYmrCYpyA-1; Wed, 20 Nov 2019 13:45:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49F46107ACC4;
 Wed, 20 Nov 2019 18:45:22 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24621042B7D;
 Wed, 20 Nov 2019 18:45:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/6] iotests: Fix timeout in run_job()
Date: Wed, 20 Nov 2019 19:44:59 +0100
Message-Id: <20191120184501.28159-5-kwolf@redhat.com>
In-Reply-To: <20191120184501.28159-1-kwolf@redhat.com>
References: <20191120184501.28159-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: jqrCqNNtOYeoGpYmrCYpyA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

run_job() accepts a wait parameter for a timeout, but it doesn't
actually use it. The only thing that is missing is passing it to
events_wait(), so do that now.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 330681ad02..b409198e47 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -604,7 +604,7 @@ class VM(qtest.QEMUQtestMachine):
         ]
         error =3D None
         while True:
-            ev =3D filter_qmp_event(self.events_wait(events))
+            ev =3D filter_qmp_event(self.events_wait(events, timeout=3Dwai=
t))
             if ev['event'] !=3D 'JOB_STATUS_CHANGE':
                 if use_log:
                     log(ev)
--=20
2.20.1


