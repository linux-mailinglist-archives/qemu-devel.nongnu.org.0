Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A062E14E03F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 18:51:47 +0100 (CET)
Received: from localhost ([::1]:37186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixDyk-0004Fe-Mh
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 12:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ixDxy-0003l9-Eu
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:50:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ixDxw-00069Q-KP
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:50:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44290
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ixDxw-00069D-H6
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 12:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580406655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WI4+JM/uuh1ZBu0K9HeEEa+M4efRHgf+TWM8H30d3KA=;
 b=ZE1g1DWX/iAdvSWEEGTNVEuItBj/SRr7KqTDr8zwl8MIINJ8th/gM3UhTI9YJhDCazzQUe
 ey2ITFkC4Bhh7KbwB23lnShdEfYnLntpz99IpO0kIXsgXyYq8MmPnBQSdK8zz3AeDByUoo
 8v6K1Gxk72kFgVdSbKQK7KdW/Egy3cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-HHmVPpo8NR2FOa6bRr9BMQ-1; Thu, 30 Jan 2020 12:50:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D7E107ACC4;
 Thu, 30 Jan 2020 17:50:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113F519756;
 Thu, 30 Jan 2020 17:50:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 brijesh.singh@amd.com
Subject: [PATCH] machine/memory encryption: Disable mem merge
Date: Thu, 30 Jan 2020 17:50:46 +0000
Message-Id: <20200130175046.85850-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: HHmVPpo8NR2FOa6bRr9BMQ-1
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
Cc: aarcange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When a host is running with memory encryption, the memory isn't visible
to the host kernel; attempts to merge that memory are futile because
what it's really comparing is encrypted memory, usually encrypted
with different keys.

Automatically turn mem-merge off when memory encryption is specified.

https://bugzilla.redhat.com/show_bug.cgi?id=3D1796356

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/machine.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3e288bfceb..029e1f85b8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -419,6 +419,14 @@ static void machine_set_memory_encryption(Object *obj,=
 const char *value,
=20
     g_free(ms->memory_encryption);
     ms->memory_encryption =3D g_strdup(value);
+
+    /*
+     * With memory encryption, the host can't see the real contents of RAM=
,
+     * so there's no point in it trying to merge areas.
+     */
+    if (value) {
+        machine_set_mem_merge(obj, false, errp);
+    }
 }
=20
 static bool machine_get_nvdimm(Object *obj, Error **errp)
--=20
2.24.1


