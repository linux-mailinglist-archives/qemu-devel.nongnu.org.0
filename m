Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E44219BE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 16:25:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRdnO-0000pd-9w
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 10:25:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vkuznets@redhat.com>) id 1hRdiJ-0005m0-7y
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vkuznets@redhat.com>) id 1hRdiI-0006Fv-FZ
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:19:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43048)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vkuznets@redhat.com>) id 1hRdiI-0006Dn-AN
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:19:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0F068F919;
	Fri, 17 May 2019 14:19:52 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.43.2.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC62D78576;
	Fri, 17 May 2019 14:19:49 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 16:19:23 +0200
Message-Id: <20190517141924.19024-9-vkuznets@redhat.com>
In-Reply-To: <20190517141924.19024-1-vkuznets@redhat.com>
References: <20190517141924.19024-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 17 May 2019 14:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 8/9] i386/kvm: hv-evmcs requires hv-vapic
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enlightened VMCS is enabled by writing to a field in VP assist page and
these require virtual APIC.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 7fc97b749e..7ae2f63f72 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -791,7 +791,8 @@ static struct {
         .flags =3D {
             {.fw =3D FEAT_HV_RECOMM_EAX,
              .bits =3D HV_ENLIGHTENED_VMCS_RECOMMENDED}
-        }
+        },
+        .dependencies =3D BIT(HYPERV_FEAT_VAPIC)
     },
     [HYPERV_FEAT_IPI] =3D {
         .desc =3D "paravirtualized IPI (hv-ipi)",
--=20
2.20.1


