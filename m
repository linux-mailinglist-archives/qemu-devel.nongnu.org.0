Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8994103CF0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 15:05:53 +0100 (CET)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXQcC-0008FI-Jb
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 09:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iXQaL-0006Uc-Ck
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iXQaK-0000uy-AF
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34136
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iXQaK-0000un-73
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574258635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0V6vvCOmv2t4ZLGO+bnOMW0UAq6PLYbO2CTEzjwL2NM=;
 b=apHhuotXNgd80JUcSGaCQTjoYlR5zajTexy7Q7I/ClBMEf/LKcjZRvieoC1HL37vYg7UM/
 B+iPhJq4QkMzPF/EiGDMOZiow4BCmJD7zhdRmqnP0Ih8+zt+Nn8qkTjuiv/jzXx7l2Llsx
 FPdwm7H3akpOKcbHVsgejWdnNzAWPfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-3NtVv02hMA-yuG4-UpvUqg-1; Wed, 20 Nov 2019 09:03:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43E47804912;
 Wed, 20 Nov 2019 14:03:51 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABCA660BB5;
 Wed, 20 Nov 2019 14:03:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/6] iotests: Fix timeout in run_job()
Date: Wed, 20 Nov 2019 15:03:17 +0100
Message-Id: <20191120140319.1505-5-kwolf@redhat.com>
In-Reply-To: <20191120140319.1505-1-kwolf@redhat.com>
References: <20191120140319.1505-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 3NtVv02hMA-yuG4-UpvUqg-1
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


