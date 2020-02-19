Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15093164AAD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 17:38:36 +0100 (CET)
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4SMt-000773-3X
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 11:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4RwH-0004Dz-0j
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4RwF-00016J-Vi
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23874
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4RwF-000162-S9
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJaIgY+bKaOvZlfmkqpwWek60f+o8HnE5o0Knnu1RzA=;
 b=TdDsZnHDRgY7VCa/OEY9LVfzy2h04IzGjFkAwYgiLBT3dfllNajkKwOB4vqJYggNp0vmpm
 AM5qYnpS9UqyZrwaz7n7WTSz33D2qGOGaPi1htXHnVlP+g0vpG2MCdPhD6UbpfFbiOj+KX
 amxiyF/fcnSabj7pi1ZUVCncxpIwirk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105--5D3yy4CNQqlc4onmEwlug-1; Wed, 19 Feb 2020 11:11:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A0B6A0CCA
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 16:11:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9836848;
 Wed, 19 Feb 2020 16:10:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 54/79] mips/mips_jazz: add max ram size check
Date: Wed, 19 Feb 2020 11:09:28 -0500
Message-Id: <20200219160953.13771-55-imammedo@redhat.com>
In-Reply-To: <20200219160953.13771-1-imammedo@redhat.com>
References: <20200219160953.13771-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -5D3yy4CNQqlc4onmEwlug-1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

error out in case user asked for more RAM than board
supports.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
---
 hw/mips/mips_jazz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 85d49cf155..32fbd10b4e 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -164,6 +164,11 @@ static void mips_jazz_init(MachineState *machine,
     SysBusESPState *sysbus_esp;
     ESPState *esp;
=20
+    if (machine->ram_size > 256 * MiB) {
+        error_report("RAM size more than 256Mb is not supported");
+        exit(EXIT_FAILURE);
+    }
+
     /* init CPUs */
     cpu =3D MIPS_CPU(cpu_create(machine->cpu_type));
     env =3D &cpu->env;
--=20
2.18.1


