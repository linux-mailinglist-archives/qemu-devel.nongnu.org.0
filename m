Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98E1B7EDB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 21:28:29 +0200 (CEST)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS3zw-0004SH-Mc
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 15:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jS3sM-0003SO-Te
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jS3sM-000459-E8
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53813
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jS3sL-00044v-U3
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587756037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDUiKxCdN8lQeoLqT7wRkl74k2K9BI/Rksj2jl+zr0c=;
 b=R5bvyxsCC5W2X239XYrOSmcGJ0qYD+7bGQ3EULG2Go4s2jS06A6Ect4O9Oa8PPzeAnSTbv
 MjbOw7MWuEApLlMxW/nTRqiFjhZNrNP4pLuAmVq6Bm4U3VG6xuTJv2OObFMaMkd/opguMr
 eDKR21kVHbfzAmDvaAmrLy4eUwIOwxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-CL6UVSlANBCdUlQpOWxpJw-1; Fri, 24 Apr 2020 15:20:33 -0400
X-MC-Unique: CL6UVSlANBCdUlQpOWxpJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 482E7107ACF2;
 Fri, 24 Apr 2020 19:20:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA43510002AA;
 Fri, 24 Apr 2020 19:20:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48E5011358C6; Fri, 24 Apr 2020 21:20:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] arm/sabrelite: Consistently use &error_fatal in
 sabrelite_init()
Date: Fri, 24 Apr 2020 21:20:26 +0200
Message-Id: <20200424192027.11404-11-armbru@redhat.com>
In-Reply-To: <20200424192027.11404-1-armbru@redhat.com>
References: <20200424192027.11404-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 15:11:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/sabrelite.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index e31694bb92..04f4b96591 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -41,7 +41,6 @@ static void sabrelite_reset_secondary(ARMCPU *cpu,
 static void sabrelite_init(MachineState *machine)
 {
     FslIMX6State *s;
-    Error *err =3D NULL;
=20
     /* Check the amount of memory is compatible with the SOC */
     if (machine->ram_size > FSL_IMX6_MMDC_SIZE) {
@@ -52,11 +51,7 @@ static void sabrelite_init(MachineState *machine)
=20
     s =3D FSL_IMX6(object_new(TYPE_FSL_IMX6));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s), &error_fa=
tal);
-    object_property_set_bool(OBJECT(s), true, "realized", &err);
-    if (err !=3D NULL) {
-        error_report("%s", error_get_pretty(err));
-        exit(1);
-    }
+    object_property_set_bool(OBJECT(s), true, "realized", &error_fatal);
=20
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
                                 machine->ram);
--=20
2.21.1


