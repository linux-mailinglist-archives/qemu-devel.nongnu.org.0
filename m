Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D814A974
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 19:09:54 +0100 (CET)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw8pd-0001Q2-4N
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 13:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iw8ce-0002Ty-W0
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iw8cd-00031Y-8N
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:28 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52767
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iw8cd-00030u-30
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 12:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580147786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUz5RWsEGqxHVI5aeGTjm6JjUoqyUOJxn3a+tb1QVSw=;
 b=fRTc28xFV2aCoQCPe1HJwVT50w0xli3HTgQEsY29cmQLj5kf0xHTV8ekvxrk1In1wgGRVm
 p6QD42WQNU50BBkcpiiuU8g68F2YIyj2yn7JHFAL7Rd5tq9w+tHvZGUtD90QD09T+vN1q1
 5ms59jBi3A4fm78Mq1LFZ7e0H+lD+VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-_jCNf9zHOtqIzkxJRBECfg-1; Mon, 27 Jan 2020 12:56:23 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED8110054E3;
 Mon, 27 Jan 2020 17:56:22 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-108.ams2.redhat.com
 [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18363811FA;
 Mon, 27 Jan 2020 17:56:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/13] iscsi: Don't access non-existent
 scsi_lba_status_descriptor
Date: Mon, 27 Jan 2020 18:55:59 +0100
Message-Id: <20200127175559.18173-14-kwolf@redhat.com>
In-Reply-To: <20200127175559.18173-1-kwolf@redhat.com>
References: <20200127175559.18173-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _jCNf9zHOtqIzkxJRBECfg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In iscsi_co_block_status(), we may have received num_descriptors =3D=3D 0
from the iscsi server. Therefore, we can't unconditionally access
lbas->descriptors[0]. Add the missing check.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Felipe Franciosi <felipe@nutanix.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Peter Lieven <pl@kamp.de>
---
 block/iscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index cbd57294ab..c8feaa2f0e 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -753,7 +753,7 @@ retry:
     }
=20
     lbas =3D scsi_datain_unmarshall(iTask.task);
-    if (lbas =3D=3D NULL) {
+    if (lbas =3D=3D NULL || lbas->num_descriptors =3D=3D 0) {
         ret =3D -EIO;
         goto out_unlock;
     }
--=20
2.20.1


