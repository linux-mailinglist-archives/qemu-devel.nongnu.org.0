Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114813C71D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 16:12:38 +0100 (CET)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irkLU-0008HV-Ew
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 10:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkJB-0006Hd-O7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkJA-0007g5-GW
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22079
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkJA-0007fe-Cu
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ovc+HZmVPdY95CZ0I/ixhojJcS53UiurhqkTv1g7AbE=;
 b=gUUf2Z2xPF/kRm2+v79kb0V10xq6DU+ds9pWQ7W0UrP93Uu0flDvYmx4YZt2MWryLQf4op
 dWW2wXyrfWw2UUiRF6hfsx4YZkty/zcO4tEY9Tat5JYdnhAZJ2l8OA25i7pH2mEGYI7cVm
 9k/jetzVnQIb2qe3mGzsG3Fmd0oYC5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-t1-3YAcxPD-3B7LIm4Kypg-1; Wed, 15 Jan 2020 10:10:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59C068B5D73
 for <qemu-devel@nongnu.org>; Wed, 15 Jan 2020 15:10:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 982D92899E;
 Wed, 15 Jan 2020 15:10:05 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/86] numa: remove deprecated -mem-path fallback to
 anonymous RAM
Date: Wed, 15 Jan 2020 16:06:16 +0100
Message-Id: <1579100861-73692-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: t1-3YAcxPD-3B7LIm4Kypg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it was deprecated since 4.0 by commit
 cb79224b7 (deprecate -mem-path fallback to anonymous RAM)
Deprecation period ran ont and it's time to remove it
so it won't get in a way of switching to using hostmem
backend for RAM.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC:libvir-list@redhat.com
CC: ehabkost@redhat.com
---
 hw/core/numa.c       | 18 +-----------------
 qemu-deprecated.texi |  9 ---------
 2 files changed, 1 insertion(+), 26 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 0d1b4be..840e685 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -784,24 +784,8 @@ static void allocate_system_memory_nonnuma(MemoryRegio=
n *mr, Object *owner,
 {
     if (mem_path) {
 #ifdef __linux__
-        Error *err =3D NULL;
         memory_region_init_ram_from_file(mr, owner, name, ram_size, 0, 0,
-                                         mem_path, &err);
-        if (err) {
-            error_report_err(err);
-            if (mem_prealloc) {
-                exit(1);
-            }
-            warn_report("falling back to regular RAM allocation");
-            error_printf("This is deprecated. Make sure that -mem-path "
-                         " specified path has sufficient resources to allo=
cate"
-                         " -m specified RAM amount\n");
-            /* Legacy behavior: if allocation failed, fall back to
-             * regular RAM allocation.
-             */
-            mem_path =3D NULL;
-            memory_region_init_ram_nomigrate(mr, owner, name, ram_size, &e=
rror_fatal);
-        }
+                                         mem_path, &error_fatal);
 #else
         fprintf(stderr, "-mem-path not supported on this host\n");
         exit(1);
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 0968d37..982af95 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -113,15 +113,6 @@ QEMU using implicit generic or board specific splittin=
g rule.
 Use @option{memdev} with @var{memory-backend-ram} backend or @option{mem} =
(if
 it's supported by used machine type) to define mapping explictly instead.
=20
-@subsection -mem-path fallback to RAM (since 4.1)
-Currently if guest RAM allocation from file pointed by @option{mem-path}
-fails, QEMU falls back to allocating from RAM, which might result
-in unpredictable behavior since the backing file specified by the user
-is ignored. In the future, users will be responsible for making sure
-the backing storage specified with @option{-mem-path} can actually provide
-the guest RAM configured with @option{-m} and QEMU will fail to start up i=
f
-RAM allocation is unsuccessful.
-
 @subsection RISC-V -bios (since 4.1)
=20
 QEMU 4.1 introduced support for the -bios option in QEMU for RISC-V for th=
e
--=20
2.7.4


