Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5EA09FB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 20:53:36 +0200 (CEST)
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i334Z-0005rt-E5
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 14:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i32sR-0002M9-9a
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i32sQ-0003er-60
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50196)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i32sQ-0003eG-0h
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:41:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D66CC308219F;
 Wed, 28 Aug 2019 18:41:00 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A8141001B00;
 Wed, 28 Aug 2019 18:40:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2019 15:40:22 -0300
Message-Id: <20190828184026.5840-9-ehabkost@redhat.com>
In-Reply-To: <20190828184026.5840-1-ehabkost@redhat.com>
References: <20190828184026.5840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 28 Aug 2019 18:41:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 08/12] pc: Improve error message when die-id
 is omitted
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
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error message when die-id is omitted doesn't make sense:

  $ qemu-system-x86_64 -smp 1,sockets=3D6,maxcpus=3D6 \
    -device qemu64-x86_64-cpu,socket-id=3D1,core-id=3D0,thread-id=3D0
  qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=3D1,core-id=3D0=
,thread-id=3D0: \
    Invalid CPU die-id: 4294967295 must be in range 0:0

Fix it, so it will now read:

  qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=3D1,core-id=3D0=
,thread-id=3D0: \
    CPU die-id is not set

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190815183803.13346-3-ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 584cd3ed0a..3494423d63 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2428,6 +2428,10 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplu=
g_dev,
             error_setg(errp, "Invalid CPU socket-id: %u must be in range=
 0:%u",
                        cpu->socket_id, max_socket);
             return;
+        }
+        if (cpu->die_id < 0) {
+            error_setg(errp, "CPU die-id is not set");
+            return;
         } else if (cpu->die_id > pcms->smp_dies - 1) {
             error_setg(errp, "Invalid CPU die-id: %u must be in range 0:=
%u",
                        cpu->die_id, pcms->smp_dies - 1);
--=20
2.21.0


