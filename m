Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2712D914
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:37:12 +0100 (CET)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHhv-0004Cc-4V
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHCL-0005je-4N
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHCF-00043R-JA
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53375
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHCF-00040r-De
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unhl2yJWR3g42FM63L7ZF7mfGiwmbadt23TRRx75gVE=;
 b=B4MgzEdYyKecSPOLb4dLtjXgQxTpi1XQw29sV0A0peR2vqAg39ym1ySTb46i04xcU2pCOd
 p5WpR2c0e2AV42LaCZTgjbejAYWhPhi5HAy2VatLWvvJESpqxY7zgp5aq8IpoaY9nfk1jO
 yK5VrESAyI5s+Fpq6mRJVkcHzho57GM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-zJmU-9x9Ou-5Q3Baf8NYGA-1; Tue, 31 Dec 2019 08:04:25 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A81B8024D4
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2282F78E96
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/86] hppa: drop RAM size fixup
Date: Tue, 31 Dec 2019 14:03:27 +0100
Message-Id: <1577797450-88458-44-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: zJmU-9x9Ou-5Q3Baf8NYGA-1
X-Mimecast-Spam-Score: 0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If user provided non-sense RAM size, board will complain and
continue running with max RAM size supported.
Also RAM is going to be allocated by generic code, so it won't be
possible for board to fix things up for user.

Make it error message and exit to force user fix CLI,
instead of accepting non-sense CLI values.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/hppa/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5d0de26..25f5afc 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -92,7 +92,8 @@ static void machine_hppa_init(MachineState *machine)
=20
     /* Limit main memory. */
     if (ram_size > FIRMWARE_START) {
-        machine->ram_size =3D ram_size =3D FIRMWARE_START;
+        error_report("RAM size more than %d is not supported", FIRMWARE_ST=
ART);
+        exit(EXIT_FAILURE);
     }
=20
     /* Main memory region. */
--=20
2.7.4


