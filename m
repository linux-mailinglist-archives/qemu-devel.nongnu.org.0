Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5295584079
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:00:46 +0200 (CEST)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH44D-0000yr-Fb
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH3fX-0002CF-N6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oH3fS-0003hI-B0
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y9jTGz6yycUqlvdaKmP8LetyYM6boIaRuNVp7IEHQfM=;
 b=iEHYZqYjr/ILkSGGtSqnqzdf+Pb8RO1bdt5wGYx43KGNX3Tm1l0wkc2Wo/ARZY1zVLeujW
 Hb5nawr+FRB9j1VZYxSC0/X0D/la7WdeN8lvF0/cVvWC7mvvdsreCU4CddruR9FKD8xI7j
 Pkd3wgq68M0VwcASk8l3VPWXrYyDbMs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-I05jmU6LP1SIEgjOsPN5vg-1; Thu, 28 Jul 2022 09:35:04 -0400
X-MC-Unique: I05jmU6LP1SIEgjOsPN5vg-1
Received: by mail-ed1-f72.google.com with SMTP id
 q16-20020a056402519000b0043bd73ad1baso1125030edd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y9jTGz6yycUqlvdaKmP8LetyYM6boIaRuNVp7IEHQfM=;
 b=gSNgO+3bLXT3AEhBq+sE+HHAxZUe8ESkTmpPquVUcz8uIVZTvhhdUBqhANu/XeQMaP
 3gJg8pWucHOavAlyw9jVmj29NFs9/oZZj8K6eq2V4Vhg1y/uHE3ArXRKmNj0Y7EAm8dr
 ksV48xbNr3Bm4sXYLFT1jyk04sX5qz2nQ8ZSu8w+/qOvHJhi2J/GBF0kLP+xJy7Kb604
 efrWRr33ob8Liv4N69vrXqa+BODszF2T+FIcaVTJ+lzesI3NUawxVuEK90gicQxfiHFQ
 M6SVHMdLecd2CiXYmblosyBe2Dcy9sGEIJsCNjxMguIUbrhw/q0z/y5jxrxpt4QlqKYX
 LF9w==
X-Gm-Message-State: AJIora9g4kR4pQPOovf6TTGRwugWY8aKoO6etbndDqtAtLNrIZe4jKhi
 UNKWjCeCVSUcMhZed17VQjOPNCGbUUxHKffSUTuN9UdAvsSWbHqVps7OMAJdHg8cURkZmC1yXZU
 w7bMQ750e1hAL/icT/EngkuVbXZGTQDgw3vJtpw/gHw/5oBdEGdIMNM1x+/BG1n7dgdQ=
X-Received: by 2002:a05:6402:42cb:b0:43b:e8eb:cbc1 with SMTP id
 i11-20020a05640242cb00b0043be8ebcbc1mr22361751edc.414.1659015302731; 
 Thu, 28 Jul 2022 06:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sR1tsEcMNxuE5uIyRvZqLItsft3/7Pd90E3Sy4OqlxEpFCIKd/DRrFTpLqM9/5xLp80Tmv5w==
X-Received: by 2002:a05:6402:42cb:b0:43b:e8eb:cbc1 with SMTP id
 i11-20020a05640242cb00b0043be8ebcbc1mr22361707edc.414.1659015302220; 
 Thu, 28 Jul 2022 06:35:02 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a50cb8b000000b0043baadb2279sm713613edi.59.2022.07.28.06.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:35:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Korneliusz Osmenda <korneliuszo@gmail.com>
Subject: [PATCH] vga: fix incorrect line height in 640x200x2 mode
Date: Thu, 28 Jul 2022 15:34:59 +0200
Message-Id: <20220728133459.268610-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When in CGA modes, QEMU wants to ignore the maximum scan field (bits 0..4) of
the maximum scan length register in the CRTC.  It is not clear why this is
needed---for example, Bochs ignores bit 7 instead.  The issue is that the
CGA modes are not detected correctly, and in particular mode 6 results in
multi_scan==3 according to how SeaBIOS programs it.  The right way to check
for CGA graphics modes is to check whether bit 13 of the address is special
cased by the CRT controller to achieve line interleaving, i.e. whether bit 0
of the CRTC mode control register is clear.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1020
Reported-by: Korneliusz Osmenda <korneliuszo@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 5dca2d1528..50ecb1ad02 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1514,9 +1514,10 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         force_shadow = true;
     }
 
+    /* bits 5-6: 0 = 16-color mode, 1 = 4-color mode, 2 = 256-color mode.  */
     shift_control = (s->gr[VGA_GFX_MODE] >> 5) & 3;
     double_scan = (s->cr[VGA_CRTC_MAX_SCAN] >> 7);
-    if (shift_control != 1) {
+    if (s->cr[VGA_CRTC_MODE] & 1) {
         multi_scan = (((s->cr[VGA_CRTC_MAX_SCAN] & 0x1f) + 1) << double_scan)
             - 1;
     } else {
-- 
2.36.1


