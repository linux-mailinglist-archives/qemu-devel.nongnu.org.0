Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B21F1D11
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:17:00 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKSJ-0000iT-2a
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEV-000708-T9
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48065
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEL-0007tD-Vw
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=hzKfVv8802+d5ihiWxX0TcKbdwdGJWNKRG/d5UzXI1UO6KhHbMGj//ggydyuyLKzkGGRxz
 ycLl22qUD3YerfT6gYdiM0xV8R+00YGQ2qiPD0U5lTxwQHjELhSIjnF24q26OHoZVCyYrk
 OCnBq4a5wQSHMwNYqqR6kjuM+ffTZCg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-zv5fBC5mPFm-oHkn89eeKg-1; Mon, 08 Jun 2020 12:02:31 -0400
X-MC-Unique: zv5fBC5mPFm-oHkn89eeKg-1
Received: by mail-wr1-f69.google.com with SMTP id z10so7391608wrs.2
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCNM8bx54yBBH5o9OGeaVnQ5KO/kQFXlsHgIbovX6w0=;
 b=s8AvofPJWyhS9zRB/dEvIRd53Btdt19sjdKxBYjdaCBbvMAjOU+ux0kulrS2PilObe
 aX8srXf2tMh/mkOqJXpsEc6gKfp0lHLs5gF+8TQQofkuBeuxv4QIq3oxZEBF4DvKoVvc
 UnoEdxOnpqJJ9GTTCzTyPwCUSsvYG2q+27LFZM3T9OjO0MacHgFe6sPnu2gkVOBluwe9
 z9iN9NfvvdeUGvZl8fgGEDpih8MwsAep7coGnAppCF1yHPJhEXRYIUey/+swHDiMMM/o
 egOTYq2cBv/8mSjRE+qNiMOVwp1Owh8yjtrKLmdqs2d4DAcS4LWOZyOn31v0RSKixHn1
 gjMA==
X-Gm-Message-State: AOAM532UHAGIOQUL/HS8eXqAQjbe+lvFr5x0PwqoAmQj86dc+vUR7PHn
 l/rgaEZ9GwgF/j9qXm7Mw/AImn8//faryuMxpQw4kej4pIv0/uNYNPEHPIMm9VnoyRCR/y3i9Dd
 pGFsDGlpjaT1I8mk=
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927558wrm.175.1591632150058; 
 Mon, 08 Jun 2020 09:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbdh31UUEH4xek22DEL2omJfknmcGPt3J3CvVWH4WiiSsovdS3jiUsnUw+9yn+Qkjdrssug==
X-Received: by 2002:adf:e592:: with SMTP id l18mr25927507wrm.175.1591632149848; 
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm144638wro.92.2020.06.08.09.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/35] hw/input/ps2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:27 +0200
Message-Id: <20200608160044.15531-19-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/ps2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index f8746d2f52..0d84061cae 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -30,7 +30,7 @@
 #include "ui/input.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 /* debug PC keyboard */
@@ -1136,6 +1136,8 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2KbdState *s = (PS2KbdState *)g_malloc0(sizeof(PS2KbdState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_kbd_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
@@ -1158,6 +1160,8 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
 {
     PS2MouseState *s = (PS2MouseState *)g_malloc0(sizeof(PS2MouseState));
 
+    qdev_warn_deprecated_function_used();
+
     trace_ps2_mouse_init(s);
     s->common.update_irq = update_irq;
     s->common.update_arg = update_arg;
-- 
2.21.3


