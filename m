Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732D18D37A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 17:04:12 +0100 (CET)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFK83-0006RF-4K
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 12:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFK1y-0008JH-7X
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFK1x-0003qp-1x
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:57:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFK1w-0003ov-VH
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 11:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584719872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jY9hFXsRQKShgR6fFRHDQkteEgkZAWGBxIuQEuqC1Q8=;
 b=LwA+gXJ7m9egg/faw/0oCQF1iDGAWXyyCRnDuX8oTATAVUCY3iqS5S2yC9q9cStaLq++U0
 rWyjLbMqOOi1OID4ahMfDlz/fpAGEbgWmtKsFPDBrv+eE6nFQHhAEE2HgalziWlDrH37c5
 hMRz/V68POgKsynZWH59J7FoNc9wRW4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-8QhzVx4aMmiVMOLyt-OV3Q-1; Fri, 20 Mar 2020 11:57:50 -0400
X-MC-Unique: 8QhzVx4aMmiVMOLyt-OV3Q-1
Received: by mail-wm1-f72.google.com with SMTP id f207so1955606wme.6
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yo0Dd1h/opLMkm38keM/qX9N7f08guLSjUkx4P9OCWI=;
 b=M1PE+bIOM+EGAQWWsvHjFpMT1fnoYzsBgMrIAOv0GsvyIN1oR0kzxKFCVPOBpCn+Yf
 gZntwGHLU1edOp+NAvrMqX9nh7dgr02DuN6s/eN/g8q0miL0wLKr7UEZR/aC8ZqawqhV
 CUf/7TRpz4/dMaxInTlsQGAfqc8QfwaO7HzI2v9pWun+FlKdyQQ64Di/B2XbmANYrDpV
 JyLMot0OLS0MFXsNuRc2LvRH3Q0iauoKxfjOlGCkcf74563nL6KL52RfKAglzW5UbYXH
 DrPtMv6t9nCrBusdFM9pDZh33DiGI1m82yMDuf9lE1VWa7jU9LPWAIQgwFWAGCI1K/zc
 Ae6w==
X-Gm-Message-State: ANhLgQ1SuUtKTSdY5IaePhDaLWGR/eaDgXL7WYoJk5qOPowsT+W83M3P
 EprXFTLv5LCLWFUun6f+wYIsIEyrJZBYtD3hm8RmWIZv5YWYiGDbajfOQALyF6WYKiST+KDwFiP
 Ay8USW1u65zKU4NM=
X-Received: by 2002:adf:9ccd:: with SMTP id h13mr5342140wre.427.1584719868734; 
 Fri, 20 Mar 2020 08:57:48 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtKNIySo+0h9nKi1gF8SVhvWINxKpB6fvuZ/k49TAlOK+68wRu67Dh8yorrIbw24AcvMbgFaQ==
X-Received: by 2002:adf:9ccd:: with SMTP id h13mr5342111wre.427.1584719868467; 
 Fri, 20 Mar 2020 08:57:48 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id x5sm9117419wrv.67.2020.03.20.08.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 08:57:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc/ppc405_boards: Remove unnecessary NULL check
Date: Fri, 20 Mar 2020 16:57:40 +0100
Message-Id: <20200320155740.5342-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is inside the "if (dinfo)" condition, so testing
again here whether it is NULL is unnecessary.

Fixes: dd59bcae7 (Don't size flash memory to match backing image)
Reported-by: Coverity (CID 1421917)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/ppc405_boards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index e6bffb9e1a..6198ec1035 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -191,7 +191,7 @@ static void ref405ep_init(MachineState *machine)
         bios_size =3D 8 * MiB;
         pflash_cfi02_register((uint32_t)(-bios_size),
                               "ef405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               2, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
@@ -459,7 +459,7 @@ static void taihu_405ep_init(MachineState *machine)
         bios_size =3D 2 * MiB;
         pflash_cfi02_register(0xFFE00000,
                               "taihu_405ep.bios", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
@@ -494,7 +494,7 @@ static void taihu_405ep_init(MachineState *machine)
     if (dinfo) {
         bios_size =3D 32 * MiB;
         pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
-                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              blk_by_legacy_dinfo(dinfo),
                               64 * KiB, 1,
                               4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x=
2AA,
                               1);
--=20
2.21.1


