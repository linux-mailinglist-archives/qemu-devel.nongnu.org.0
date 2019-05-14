Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221FF1CF5B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQcTZ-0001LM-Ic
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:48:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHq-0007tj-Gf
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHp-0002A0-MR
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:36:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQcHp-00029b-HB
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:36:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDBAA3001809;
	Tue, 14 May 2019 18:36:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
	[10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE6F3608BA;
	Tue, 14 May 2019 18:36:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
	ehabkost@redhat.com, richardw.yang@linux.intel.com,
	yury-kotov@yandex-team.ru, chen.zhang@intel.com
Date: Tue, 14 May 2019 19:34:54 +0100
Message-Id: <20190514183454.12758-17-dgilbert@redhat.com>
In-Reply-To: <20190514183454.12758-1-dgilbert@redhat.com>
References: <20190514183454.12758-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 14 May 2019 18:36:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/16] monitor: Call mon_get_cpu() only once at
 hmp_gva2gpa()
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

hmp_gva2gpa() calls mon_get_cpu() twice, which is unnecessary.
Not an actual bug, but this is reported as a defect by Coverity
Scan (CID 1401346).

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190510185620.15757-1-ehabkost@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/monitor.c b/monitor.c
index bb48997913..6428eb3b7e 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1685,8 +1685,7 @@ static void hmp_gva2gpa(Monitor *mon, const QDict *=
qdict)
         return;
     }
=20
-    gpa  =3D cpu_get_phys_page_attrs_debug(mon_get_cpu(),
-                                         addr & TARGET_PAGE_MASK, &attrs=
);
+    gpa  =3D cpu_get_phys_page_attrs_debug(cs, addr & TARGET_PAGE_MASK, =
&attrs);
     if (gpa =3D=3D -1) {
         monitor_printf(mon, "Unmapped\n");
     } else {
--=20
2.21.0


