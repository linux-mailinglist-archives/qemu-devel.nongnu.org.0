Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EDA1893AD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 02:26:50 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jENTt-0006ey-Ep
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 21:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jENLn-0004aI-Ij
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jENLl-0002no-Nc
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:18:27 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:33212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jENLl-0002ld-IW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584494305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xj0koGR1OOWTs/7O6WlMBbzTU6PRJEmOAi0wJCQpdTY=;
 b=a7MH6+ToTluuJ+tlCpCh1WTEiMylQXFHLvltSOooXEMyxHGyjjFEkDCho+pJnzMKVPlehS
 N6rYwBZ0lVTjZCHoEnUJ7BqEO3d6cS/G0QUmLNJwz/vxiBsQwh9Y9Yu3/YR3zrlba4ze9l
 yuBBfTsTf7IwKzz4Xdo1zeyU9L3XjSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-GUY6RpzSPbiFRrIvkTDnSw-1; Tue, 17 Mar 2020 21:18:23 -0400
X-MC-Unique: GUY6RpzSPbiFRrIvkTDnSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03BBF800D50;
 Wed, 18 Mar 2020 01:18:22 +0000 (UTC)
Received: from localhost (ovpn-118-148.rdu2.redhat.com [10.10.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A1E10016EB;
 Wed, 18 Mar 2020 01:18:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/13] hw/i386: Remove unnecessary initialization in x86_cpu_new
Date: Tue, 17 Mar 2020 21:17:46 -0400
Message-Id: <20200318011748.2104336-12-ehabkost@redhat.com>
In-Reply-To: <20200318011748.2104336-1-ehabkost@redhat.com>
References: <20200318011748.2104336-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Babu Moger <babu.moger@amd.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

The function pc_cpu_pre_plug takes care of initialization of CPUX86State.
So, remove the initialization here.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <158396719336.58170.11951852360759449871.stgit@naples-babu.amd.=
com>
---
 hw/i386/x86.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b7d94e8dfe..41b884605f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -103,13 +103,9 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_=
id, Error **errp)
 {
     Object *cpu =3D NULL;
     Error *local_err =3D NULL;
-    CPUX86State *env =3D NULL;
=20
     cpu =3D object_new(MACHINE(x86ms)->cpu_type);
=20
-    env =3D &X86_CPU(cpu)->env;
-    env->nr_dies =3D x86ms->smp_dies;
-
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
     object_property_set_bool(cpu, true, "realized", &local_err);
=20
--=20
2.24.1


