Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC2E149A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:46:58 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNCID-0004F1-2X
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iNC0g-0003VA-Aw
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iNC0f-0006pz-8t
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:28:50 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53276
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iNC0f-0006pd-4r
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571819328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYq1a2cQnwSoFC7ZG9jOkK0ifFOYr2LBMa3wLluDZwY=;
 b=bLVA35PNIrc6jy6NfgJktB9nHiRvA2iUIyRsMArVV9Z2zQEQ3CaaE1Wn3jVu2LUqgT+ePL
 cbm90JMoJoDqGDMviv0PJ+AGBvff1U5AAd5+wIFmiiCelR6pmisdVXdfDRg402TfqSUBhh
 DK3gP7suIgShrFGQ6kO4X0TquiDHUGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-PoitEdo6N0ywMGGDRQBNsg-1; Wed, 23 Oct 2019 04:28:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A988D1800D6B;
 Wed, 23 Oct 2019 08:28:42 +0000 (UTC)
Received: from localhost (dhcp-192-217.str.redhat.com [10.33.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 834BB5C72D;
 Wed, 23 Oct 2019 08:28:32 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/11] libqos: tolerate wait-unplug migration state
Date: Wed, 23 Oct 2019 10:27:09 +0200
Message-Id: <20191023082711.16694-10-jfreimann@redhat.com>
In-Reply-To: <20191023082711.16694-1-jfreimann@redhat.com>
References: <20191023082711.16694-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: PoitEdo6N0ywMGGDRQBNsg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 tests/libqos/libqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index d71557c5cb..f229eb2cb8 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -125,7 +125,8 @@ void migrate(QOSState *from, QOSState *to, const char *=
uri)
             break;
         }
=20
-        if ((strcmp(st, "setup") =3D=3D 0) || (strcmp(st, "active") =3D=3D=
 0)) {
+        if ((strcmp(st, "setup") =3D=3D 0) || (strcmp(st, "active") =3D=3D=
 0)
+            || (strcmp(st, "wait-unplug") =3D=3D 0)) {
             qobject_unref(rsp);
             g_usleep(5000);
             continue;
--=20
2.21.0


