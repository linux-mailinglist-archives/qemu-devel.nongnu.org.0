Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6912D8E9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:17:28 +0100 (CET)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHOp-0004X0-0u
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHC2-0005NY-I4
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHC1-0002zC-95
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHC1-0002wE-0l
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jcVwbEhgrgHbK4aM2dypXWYco2qHNNsu717m0k/0vU=;
 b=CkUsMYeHXT77vTTNogHHwLDIeTMhrkMtAcei5WrGMilORcf3UiXt2FKua7a1nP2cNK6BMt
 BMku5635Pc50jdISK3WZG6MG/4L1Nol55EczdF/AnV+Ye5vSALDEYEbijHAisFHZx2lwTm
 rwjOh2gy9q3yUuLNX9vU2L5YYwGIMd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-oTREZMhMOlOIAk58ONX1aA-1; Tue, 31 Dec 2019 08:04:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51693800EBF
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9177620A6
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/86] arm:kzm: drop RAM size fixup
Date: Tue, 31 Dec 2019 14:03:04 +0100
Message-Id: <1577797450-88458-21-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: oTREZMhMOlOIAk58ONX1aA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
 hw/arm/kzm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 1d5ef28..27800c5 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -78,10 +78,10 @@ static void kzm_init(MachineState *machine)
=20
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE=
)) {
-        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
+        error_report("RAM size " RAM_ADDR_FMT " above max supported, "
                     "reduced to %x", machine->ram_size,
                     FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
-        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZ=
E;
+        exit(EXIT_FAILURE);
     }
=20
     memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
--=20
2.7.4


