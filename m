Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DBA6017CD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:18 +0200 (CEST)
Received: from localhost ([::1]:41680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwG-0007r7-SN
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfh-0002Vo-BV; Mon, 17 Oct 2022 15:21:12 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVff-0002wJ-R5; Mon, 17 Oct 2022 15:21:09 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1321a1e94b3so14411716fac.1; 
 Mon, 17 Oct 2022 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDFT5ekw8vplTcauVsxQPPI+TJA6hK3fyosAuha13Mk=;
 b=Nxuhc93qCjEB3IJ6CHqoxcgF8xG5WCLnVUBISZ+Ch2onq4vZ3Oems1kzOIAkCrQO1N
 OFCy7fYu9rn3T6WoaBlZjTprPTCKns4/4GsgEP2pmnooF88BxJoh6HrXaDkV1sZsRALY
 XC/jhgC5PHwoF6R4at2/tHM1Goorgf4q8uBgv7bXLsXUqlkSH7qZVAdZbVuTsaHSvRPi
 qexsA7fqnEJy/+1ux5DLu6dLxhfjO0EbC86uhOzJQ9Qyi0btBT5aR6GDqRT3v5cSAVIE
 WwByGLowLVc1GEZU3CC/kPUGTgo8yA/mxyKQdjtujkulAaoX4OL25vLcF7IvgUnRaOvx
 wzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nDFT5ekw8vplTcauVsxQPPI+TJA6hK3fyosAuha13Mk=;
 b=FuYmYppDwoymiY+dmT+hZdDTXmvDaVFHcS/lVDz4PAb6YCvlPWVSGT4oagbGHdMx1/
 MMTjvq3YimNERYrTvQxlSWtWCZBKX4shxDjLB9vN3Mg+HFXb6hpxgeyF7k+7Z/LkI7JE
 E2oCZ2+ny+r1UMAOKMqoUildN9Evh557vlAyJSUfIzAFIm5zvsuJkWgBKFBu4xNBo3R4
 bVwgWDoHrz6hK0PES1SmyB9N947ds9xIjVPU7cKNEd4gOu/3qGNryW7PbcDEvwc8mZrf
 ov+1RTRDo1kFN+BqlEidnDP8GdVkrHOmBb5yO0LELAZvHgHzfpXigBazMH2Pro9uAMOE
 9SIw==
X-Gm-Message-State: ACrzQf0sdpu9E811aLiUvT92NuqW5ioijbsvJyRGon9d45wMGf5KSJDX
 rBDbjiGvRxKjVnRDc7+ichku4YiEe+Q=
X-Google-Smtp-Source: AMsMyM4kYisqlUK7FhiswLsnYC0lXFGPPCOdBM15e0HBJ1VQVj6Fn8wMWgvlMPeSPx6UwMkFLQf7kA==
X-Received: by 2002:a05:6870:5494:b0:133:14f:73e4 with SMTP id
 f20-20020a056870549400b00133014f73e4mr6428247oan.184.1666034466665; 
 Mon, 17 Oct 2022 12:21:06 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 19/38] ppc440_uc.c: Remove unneeded parenthesis
Date: Mon, 17 Oct 2022 16:19:50 -0300
Message-Id: <20221017192009.92404-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove unneeded parenthesis around case labels.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <19db326bea989c03e08f2853f789315bbe806fe9.1664021647.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 57274b56dd..5fbf44009e 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -499,34 +499,34 @@ static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
     uint32_t bcr;
 
     switch (ram_size) {
-    case (8 * MiB):
+    case 8 * MiB:
         bcr = 0xffc0;
         break;
-    case (16 * MiB):
+    case 16 * MiB:
         bcr = 0xff80;
         break;
-    case (32 * MiB):
+    case 32 * MiB:
         bcr = 0xff00;
         break;
-    case (64 * MiB):
+    case 64 * MiB:
         bcr = 0xfe00;
         break;
-    case (128 * MiB):
+    case 128 * MiB:
         bcr = 0xfc00;
         break;
-    case (256 * MiB):
+    case 256 * MiB:
         bcr = 0xf800;
         break;
-    case (512 * MiB):
+    case 512 * MiB:
         bcr = 0xf000;
         break;
-    case (1 * GiB):
+    case 1 * GiB:
         bcr = 0xe000;
         break;
-    case (2 * GiB):
+    case 2 * GiB:
         bcr = 0xc000;
         break;
-    case (4 * GiB):
+    case 4 * GiB:
         bcr = 0x8000;
         break;
     default:
-- 
2.37.3


