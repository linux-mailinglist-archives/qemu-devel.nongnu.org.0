Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5215C13AAD0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 14:24:42 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irMBV-0006zg-0i
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 08:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLkl-0004og-7U
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:57:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLkk-0002RG-2Q
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:57:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48472
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLkj-0002R0-Uw
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/qRvnKikU/zZW4H4BQbW8b5TjzE8O1lK0e+sh7nSqVM=;
 b=OIdMvT6xYk5tbWo4o/BOAlaboDfZEQ3hXKJdaALZQ+i99dNSXwMDm2H98QdTu2xEZYSwnG
 84/0P2xk/u8l4uYL6+6naZnRNFapbKgDu+QmJiXwAJ2nQQHuztxkSKvUQReH/Ole0kxcsJ
 fzxckVGyTZ6eQ+y7HF2za7zcTWz7UnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-eu_y-ZhUOB6BQ1OrlV706Q-1; Tue, 14 Jan 2020 07:57:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 067A8801E72;
 Tue, 14 Jan 2020 12:56:58 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A4555DA70;
 Tue, 14 Jan 2020 12:56:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] apic: Use 32bit APIC ID for migration instance ID
Date: Tue, 14 Jan 2020 13:52:53 +0100
Message-Id: <20200114125254.4515-30-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: eu_y-ZhUOB6BQ1OrlV706Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Migration is silently broken now with x2apic config like this:

     -smp 200,maxcpus=3D288,sockets=3D2,cores=3D72,threads=3D2 \
     -device intel-iommu,intremap=3Don,eim=3Don

After migration, the guest kernel could hang at anything, due to
x2apic bit not migrated correctly in IA32_APIC_BASE on some vcpus, so
any operations related to x2apic could be broken then (e.g., RDMSR on
x2apic MSRs could fail because KVM would think that the vcpu hasn't
enabled x2apic at all).

The issue is that the x2apic bit was never applied correctly for vcpus
whose ID > 255 when migrate completes, and that's because when we
migrate APIC we use the APICCommonState.id as instance ID of the
migration stream, while that's too short for x2apic.

Let's use the newly introduced initial_apic_id for that.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/intc/apic_common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 54b8731fca..b5dbeb6206 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -268,7 +268,10 @@ static void apic_common_realize(DeviceState *dev, Erro=
r **errp)
     APICCommonState *s =3D APIC_COMMON(dev);
     APICCommonClass *info;
     static DeviceState *vapic;
-    uint32_t instance_id =3D s->id;
+    uint32_t instance_id =3D s->initial_apic_id;
+
+    /* Normally initial APIC ID should be no more than hundreds */
+    assert(instance_id !=3D VMSTATE_INSTANCE_ID_ANY);
=20
     info =3D APIC_COMMON_GET_CLASS(s);
     info->realize(dev, errp);
--=20
2.24.1


