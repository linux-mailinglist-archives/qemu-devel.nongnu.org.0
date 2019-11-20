Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F7103658
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 10:04:10 +0100 (CET)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXLuE-00065J-0Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 04:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iXLsq-0004oI-FX
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:02:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iXLsp-00088W-Dp
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:02:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28858
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iXLsp-00088G-A6
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 04:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574240562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=szCs7CHpwFXfeXzzTMSx7nFEjamilkWRjqiGRBdrq9w=;
 b=BJFKJjdjk8f07rKh9dlZwxM5EEf/IY/5EvW0+xh1CacvFrX2Rbcpg+CUqHDp0iP+tTO2h5
 efz57Dj/s1oVSw9asq19USTmTXZFUvQAJKqTQJPChSYqsANHzRviveHFd++EveLHBrKyRe
 p3SB6nEKsh4C/+fnIGxMXdg4X1Phjyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-JW2a_bJyO7a9gNrDg-eiPA-1; Wed, 20 Nov 2019 04:02:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3685118B9FC1
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 09:02:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E11F21FA;
 Wed, 20 Nov 2019 09:02:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: acpi: always retain dumped ACPI tables in case of error
Date: Wed, 20 Nov 2019 10:02:40 +0100
Message-Id: <1574240560-12538-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: JW2a_bJyO7a9gNrDg-eiPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If IASL wasn't able to parse expected file, test will just
print warning
  "Warning! iasl couldn't parse the expected aml\n"
and remove temporary table dumped from guest.

Typically expected tables are always valid, with an exception
when patchset introduces new tables.
Make sure dumped tables are retained even if expected files
are not valid, so one could have a chance to manualy check new
tables.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 96803c1..3ef927e 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -437,11 +437,11 @@ static void test_acpi_asl(test_data *data)
         g_assert(!err || exp_err);
=20
         if (g_strcmp0(asl->str, exp_asl->str)) {
+            sdt->tmp_files_retain =3D true;
             if (exp_err) {
                 fprintf(stderr,
                         "Warning! iasl couldn't parse the expected aml\n")=
;
             } else {
-                sdt->tmp_files_retain =3D true;
                 exp_sdt->tmp_files_retain =3D true;
                 fprintf(stderr,
                         "acpi-test: Warning! %.4s mismatch. "
--=20
2.7.4


