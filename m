Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A468B1156F2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 19:06:05 +0100 (CET)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idHzQ-0003Wt-Lg
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 13:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1idHOO-0001c6-UC
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:27:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1idHOM-00034f-MY
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:27:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58536
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1idHOM-000301-2k
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 12:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575653262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82q1ODmkZ7c1oPzZoGIi16jb3fC0s7ZgyAm8HyUNG/k=;
 b=GqWKDFaN1Wm9fSEJbCykqP9EPZCrn/NTMaKlhErAReFctSzaePjnd1kyiNftswvAukaybB
 kX0s8W6I391/vTmlXTeMx6Bb06EyfGP5X7c5b6PMNru1hGfiEoXWwEVnk50+nC/SATJx82
 iJLGUYnxO2W0RFEoaDbi2dQZdX92jGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-am3fbLFtNLK_jb0VJtV8MA-1; Fri, 06 Dec 2019 12:27:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CBB3800580;
 Fri,  6 Dec 2019 17:27:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E9436CE40;
 Fri,  6 Dec 2019 17:27:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests RFC 01/10] arm64: Provide read/write_sysreg_s
Date: Fri,  6 Dec 2019 18:27:15 +0100
Message-Id: <20191206172724.947-2-eric.auger@redhat.com>
In-Reply-To: <20191206172724.947-1-eric.auger@redhat.com>
References: <20191206172724.947-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: am3fbLFtNLK_jb0VJtV8MA-1
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
Cc: peter.maydell@linaro.org, andrew.murray@arm.com, drjones@redhat.com,
 andre.przywara@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Sometimes we need to test access to system registers which are
missing assembler mnemonics.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm64/asm/sysreg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index a03830b..a45eebd 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -38,6 +38,17 @@
 =09asm volatile("msr " xstr(r) ", %x0" : : "rZ" (__val));=09\
 } while (0)
=20
+#define read_sysreg_s(r) ({=09=09=09=09=09\
+=09u64 __val;=09=09=09=09=09=09\
+=09asm volatile("mrs_s %0, " xstr(r) : "=3Dr" (__val));=09\
+=09__val;=09=09=09=09=09=09=09\
+})
+
+#define write_sysreg_s(v, r) do {=09=09=09=09\
+=09u64 __val =3D (u64)v;=09=09=09=09=09\
+=09asm volatile("msr_s " xstr(r) ", %x0" : : "rZ" (__val));\
+} while (0)
+
 asm(
 "=09.irp=09num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,=
23,24,25,26,27,28,29,30\n"
 "=09.equ=09.L__reg_num_x\\num, \\num\n"
--=20
2.20.1


