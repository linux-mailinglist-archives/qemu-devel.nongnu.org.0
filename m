Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BCB25D60
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:11:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJXD-0007ow-00
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:11:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ99-0003aP-Ix
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ97-0006q7-KX
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:46:35 -0400
Received: from ozlabs.org ([203.11.71.1]:52537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ96-0006p8-1J; Wed, 22 May 2019 00:46:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580Sz5DyDz9sQp; Wed, 22 May 2019 14:46:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500371;
	bh=4StR73JNWFQ1/thi09NsdrDUvCBxTXO3YWUSa+PeIXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jB8vnbCRkQ38btgEA4el6Hd3XiY09rYbhTtW9zyireFl8cUHJtVDD8KWBSl361+qO
	RG4vwaav/adQR21nG/NiC8m+Qat5Fxxt37MNYDD/rLMB7kqsOb46ff7sLy+OrYp/bQ
	jgaYQYlyc9SRbVn5/2Lccd9ZjFq74Kbv1K80tuJ8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:26 +1000
Message-Id: <20190522044600.16534-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 04/38] hw/ppc/prep: use TYPE_MC146818_RTC
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
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


