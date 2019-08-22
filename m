Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19B99C61
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 19:33:58 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0qyD-0007pD-A1
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qp2-0006CE-0V
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qp0-0003EU-Kq
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:24:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qoy-0003Cb-Jo; Thu, 22 Aug 2019 13:24:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D73CE3083392;
 Thu, 22 Aug 2019 17:24:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5053960610;
 Thu, 22 Aug 2019 17:24:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:49 +0200
Message-Id: <20190822172350.12008-5-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 22 Aug 2019 17:24:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 4/5] hw/arm/smmuv3: Log a guest error when
 decoding an invalid STE
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log a guest error when encountering an invalid STE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a37e3da240..c353e4c27b 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -320,6 +320,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
fg,
     uint32_t config;
=20
     if (!STE_VALID(ste)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
         goto bad_ste;
     }
=20
--=20
2.20.1


