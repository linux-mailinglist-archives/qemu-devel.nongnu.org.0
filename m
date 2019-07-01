Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B322219BA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 16:22:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRdkf-0006wn-Gy
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 10:22:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vkuznets@redhat.com>) id 1hRdiC-0005ij-K4
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vkuznets@redhat.com>) id 1hRdiB-00067A-N3
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:19:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vkuznets@redhat.com>) id 1hRdiB-00066V-Hi
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:19:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A968730C1211;
	Fri, 17 May 2019 14:19:49 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.43.2.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4AF27857B;
	Fri, 17 May 2019 14:19:47 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 16:19:22 +0200
Message-Id: <20190517141924.19024-8-vkuznets@redhat.com>
In-Reply-To: <20190517141924.19024-1-vkuznets@redhat.com>
References: <20190517141924.19024-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 17 May 2019 14:19:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 7/9] i386/kvm: hv-tlbflush/ipi require
 hv-vpindex
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

The corresponding hypercalls require using VP indexes.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index d8b83031a5..7fc97b749e 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -783,7 +783,8 @@ static struct {
             {.fw =3D FEAT_HV_RECOMM_EAX,
              .bits =3D HV_REMOTE_TLB_FLUSH_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
-        }
+        },
+        .dependencies =3D BIT(HYPERV_FEAT_VPINDEX)
     },
     [HYPERV_FEAT_EVMCS] =3D {
         .desc =3D "enlightened VMCS (hv-evmcs)",
@@ -798,7 +799,8 @@ static struct {
             {.fw =3D FEAT_HV_RECOMM_EAX,
              .bits =3D HV_CLUSTER_IPI_RECOMMENDED |
              HV_EX_PROCESSOR_MASKS_RECOMMENDED}
-        }
+        },
+        .dependencies =3D BIT(HYPERV_FEAT_VPINDEX)
     },
 };
=20
--=20
2.20.1


