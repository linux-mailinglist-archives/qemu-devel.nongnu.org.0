Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212391467C4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 13:18:17 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iubR9-0006dn-Ht
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 07:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuasW-0006Qf-DK
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuasV-0004aO-5Y
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30890
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuasV-0004Zo-21
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ld594RNSU9tNCy7tXud1+L/+Y2NAqw7B+ndTpuJVPA=;
 b=PotBQXtYfcXSLLfyf636gV9ZFnvCrannUpxow1n/iAKXLgQddrx4GLuGm5xrKWIYKp+aFU
 ARLmk3kWVwDV6wCZpI1X8ExF0qzkTBvY2+aI8ngfMwODLALKuKxKr8OgtZKzc2m8wNHt4E
 Blxy5soyRXgFL2+KoOrlyC9bQN7CzzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-tu8PRdTrNzabArxw2bRt6A-1; Thu, 23 Jan 2020 06:42:22 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6206107ACC7
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68CDD10016EB
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:42:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 39/80] hw/hppa/machine: Correctly check the firmware
 is in PDC range
Date: Thu, 23 Jan 2020 12:38:04 +0100
Message-Id: <1579779525-20065-40-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: tu8PRdTrNzabArxw2bRt6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The firmware has to reside in the PDC range. If the Elf file
expects to load it below FIRMWARE_START, it is incorrect,
regardless the RAM size.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/hppa/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5d0de26..6775d87 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -155,7 +155,7 @@ static void machine_hppa_init(MachineState *machine)
     qemu_log_mask(CPU_LOG_PAGE, "Firmware loaded at 0x%08" PRIx64
                   "-0x%08" PRIx64 ", entry at 0x%08" PRIx64 ".\n",
                   firmware_low, firmware_high, firmware_entry);
-    if (firmware_low < ram_size || firmware_high >=3D FIRMWARE_END) {
+    if (firmware_low < FIRMWARE_START || firmware_high >=3D FIRMWARE_END) =
{
         error_report("Firmware overlaps with memory or IO space");
         exit(1);
     }
--=20
2.7.4


