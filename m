Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06227100302
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 11:55:35 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWegv-00038c-S5
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 05:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1iWef3-0001X0-Lb
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1iWef2-0004Qg-Ks
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39296
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1iWef2-0004QS-Gk
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 05:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574074416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=152F3VsBW27j1IFKoVLVwCYJGK5KIGmsJlQ2TDMp0a8=;
 b=dxIWL68QRqTdmH+cc9oQHXjwniL4a7MCLomyLAnstO35kRNXtDMJILui9eMKsTRqivdkDa
 1P+Wf1zxgqKWw+mxLWIdZ2QvqU0P7pWiya7nfB9NfVgL1qoSY+EaKc+6hxLbQ7TW/dHwFl
 EtBwmvKoD4lHRPaomQWh2mUQuu14+eE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-D9zpYNcJPm-cycoKrSRBNA-1; Mon, 18 Nov 2019 05:53:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84CC7802688;
 Mon, 18 Nov 2019 10:53:30 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-32.ams2.redhat.com [10.36.117.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6D5660856;
 Mon, 18 Nov 2019 10:53:28 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 3/6] ppc: Skip partially initialized vCPUs in 'info pic'
Date: Mon, 18 Nov 2019 11:53:16 +0100
Message-Id: <20191118105319.7658-4-lvivier@redhat.com>
In-Reply-To: <20191118105319.7658-1-lvivier@redhat.com>
References: <20191118105319.7658-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: D9zpYNcJPm-cycoKrSRBNA-1
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

CPU_FOREACH() can race with vCPU hotplug/unplug on sPAPR machines, ie.
we may try to print out info about a vCPU with a NULL presenter pointer.

Check that in order to prevent QEMU from crashing.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157192725327.3146912.12047076483178652551.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/intc/xics.c | 11 ++++++++++-
 hw/intc/xive.c | 11 ++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 5f746079be46..e7ac9ba618fa 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -44,7 +44,16 @@
=20
 void icp_pic_print_info(ICPState *icp, Monitor *mon)
 {
-    int cpu_index =3D icp->cs ? icp->cs->cpu_index : -1;
+    int cpu_index;
+
+    /* Skip partially initialized vCPUs. This can happen on sPAPR when vCP=
Us
+     * are hot plugged or unplugged.
+     */
+    if (!icp) {
+        return;
+    }
+
+    cpu_index =3D icp->cs ? icp->cs->cpu_index : -1;
=20
     if (!icp->output) {
         return;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index 952a461d5329..75dce82fb205 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -523,9 +523,18 @@ static const char * const xive_tctx_ring_names[] =3D {
=20
 void xive_tctx_pic_print_info(XiveTCTX *tctx, Monitor *mon)
 {
-    int cpu_index =3D tctx->cs ? tctx->cs->cpu_index : -1;
+    int cpu_index;
     int i;
=20
+    /* Skip partially initialized vCPUs. This can happen on sPAPR when vCP=
Us
+     * are hot plugged or unplugged.
+     */
+    if (!tctx) {
+        return;
+    }
+
+    cpu_index =3D tctx->cs ? tctx->cs->cpu_index : -1;
+
     if (kvm_irqchip_in_kernel()) {
         Error *local_err =3D NULL;
=20
--=20
2.23.0


