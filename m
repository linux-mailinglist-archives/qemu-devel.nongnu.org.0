Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640242D642
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsyN-0003tH-Gf
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:26:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ1-0008FF-SZ
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ0-0002ZZ-Gn
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:37 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52713 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsQ0-0002WZ-3f; Wed, 29 May 2019 02:50:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv22kJJz9sND; Wed, 29 May 2019 16:50:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112622;
	bh=4StR73JNWFQ1/thi09NsdrDUvCBxTXO3YWUSa+PeIXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2LjsQCLgdOXCkgcvuyxyQehkf/CJJ/gfvPGgl20eLeK+3j95QLRjDtpi0hnjwtre
	bvXfNt3LV2gVHlRoYoWjy7cuLlhJJedzKurPWyHyvGCTTzLT1G6aqM3RsHSLFHJ6h0
	K4ZPmeDrcAltw+3C72YgPgstGnrLi6fWQHjkx0BM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:38 +1000
Message-Id: <20190529065017.15149-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 05/44] hw/ppc/prep: use TYPE_MC146818_RTC
 instead of a hardcoded string
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190505152839.18650-2-philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/prep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index b7f459d475..ebee321148 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -601,7 +601,7 @@ static int prep_set_cmos_checksum(DeviceState *dev, v=
oid *opaque)
     uint16_t checksum =3D *(uint16_t *)opaque;
     ISADevice *rtc;
=20
-    if (object_dynamic_cast(OBJECT(dev), "mc146818rtc")) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_MC146818_RTC)) {
         rtc =3D ISA_DEVICE(dev);
         rtc_set_memory(rtc, 0x2e, checksum & 0xff);
         rtc_set_memory(rtc, 0x3e, checksum & 0xff);
--=20
2.21.0


