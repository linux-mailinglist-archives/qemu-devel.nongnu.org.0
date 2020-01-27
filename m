Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3314A3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 13:22:45 +0100 (CET)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw3Pg-0002Wy-6O
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 07:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iw3OG-0000m8-NA
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iw3OF-0006yR-Nw
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58608
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iw3OF-0006xi-Kx
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 07:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580127674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhuMbySQ17qf1TgYeTmFMPWbFOgHMrVY55n1lhLZ9QE=;
 b=MEPjphmkpLP0NxKlAlDyOcrtU1vzIWJCv1L2cKGRermksD7aUId2JtozoM98GJ10fTHxtu
 yudXz2YjyDEgsgJLDOuxGgWtheO6ms3vaJ1dcNZeoNjwfbf4SpI3GDTonQ9TphHAiEM/0r
 /8NXEKLn9MzOsmRxmGJtpmFScftaL5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-MVEYNbMsO_63QpGSn9PGqw-1; Mon, 27 Jan 2020 07:21:10 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30451800D41;
 Mon, 27 Jan 2020 12:21:09 +0000 (UTC)
Received: from localhost (ovpn-116-220.ams2.redhat.com [10.36.116.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7BD5863C0;
 Mon, 27 Jan 2020 12:21:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/15] s390x: sigp: Fix sense running reporting
Date: Mon, 27 Jan 2020 13:20:16 +0100
Message-Id: <20200127122016.18752-16-cohuck@redhat.com>
In-Reply-To: <20200127122016.18752-1-cohuck@redhat.com>
References: <20200127122016.18752-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MVEYNbMsO_63QpGSn9PGqw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

The logic was inverted and reported running if the cpu was stopped.
Let's fix that.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Fixes: d1b468bc8869 ("s390x/tcg: implement SIGP SENSE RUNNING STATUS")
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20200124134818.9981-1-frankja@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/sigp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 727875bb4ab9..c604f177100f 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -348,9 +348,9 @@ static void sigp_sense_running(S390CPU *dst_cpu, SigpIn=
fo *si)
=20
     /* If halted (which includes also STOPPED), it is not running */
     if (CPU(dst_cpu)->halted) {
-        si->cc =3D SIGP_CC_ORDER_CODE_ACCEPTED;
-    } else {
         set_sigp_status(si, SIGP_STAT_NOT_RUNNING);
+    } else {
+        si->cc =3D SIGP_CC_ORDER_CODE_ACCEPTED;
     }
 }
=20
--=20
2.21.1


