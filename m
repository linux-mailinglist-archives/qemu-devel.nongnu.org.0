Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F301F1D02
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:14:09 +0200 (CEST)
Received: from localhost ([::1]:53082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKPY-0005Aq-A6
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEG-0006qN-UJ
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60343
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEF-0007sF-Py
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWjAvYJiR2Vce0nRqDWV8FQMXBd2aTRIKVfGqqqeffM=;
 b=Fp3ELPStTjOuCI2wh3Qr1TxUN+zTA1lS6oawlpuxmNGFJPlQRZwuKuXedi5PKnlf/ijE01
 RwYWOHNOOW4vESN2GPUueV8V7Ox8+YRINfCOpDu1PedOV7M9UCIC2Zkm/vclokoeIzlOIb
 JzgEh7DdVApaLHtoL1g1lgUtvtaPjY8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-7YMS5u3GPR68kosnBnmnFg-1; Mon, 08 Jun 2020 12:02:25 -0400
X-MC-Unique: 7YMS5u3GPR68kosnBnmnFg-1
Received: by mail-wr1-f71.google.com with SMTP id p10so7360352wrn.19
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rWjAvYJiR2Vce0nRqDWV8FQMXBd2aTRIKVfGqqqeffM=;
 b=oRidfGDiCPBPEVGvEyDS1LdLh3PUdeQm+7G8Y5TWBqoo1EMyaGLH9HzHDGn5fdAlfl
 NZLFBhyTz/WqiWDfYvksq7m+TjV8IuJ/nMGEJodT63xOFul0rcysObzteqyj7s4RTKpr
 Lq9CHFJHQSma8GSlFb5RSOeD3i9dm2MbHMPliFAMUoC/N8/+PzzHyHUZ/1Gtft+10mly
 r8VUiQ2a+D0Lyde92YXRz1LpoUNNC+mAIqX1cXIJYSHVKU8CoBdXA8IhuSeSwgp65EkX
 NHkNhA1VRNKP8PPkARCSwlU4oG00SpnSn1qA1vjgpwqYn44Al2O2OkcwM7I9V60qYCjs
 vWyg==
X-Gm-Message-State: AOAM530msVJeZ8TcAywrMDkZi/PUUx1ClCCnB3rUkrLBqn26fDNgYj5a
 phZO1I0/eTG4HLN9W0qQLrA0RUR2rcYc0EsGOoRFl1jXyc1L0WjZR53NcAKCcNnDU35ZUsFNcip
 2CxvXZXIQ+YL88b8=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr23761279wrq.316.1591632143874; 
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8yfQfybue0LoXzyzfK8+trtOuK8e4qLitwG3WzemMauiha6gB9njX0C0ZNjvkq/B156qsJg==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr23761254wrq.316.1591632143730; 
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id s8sm142543wrm.96.2020.06.08.09.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/35] hw/input/pckbd: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:26 +0200
Message-Id: <20200608160044.15531-18-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 hw/input/pckbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 60a4130320..c7f42be63b 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -31,7 +31,7 @@
 #include "hw/input/i8042.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
-
+#include "hw/qdev-deprecated.h"
 #include "trace.h"
 
 /*	Keyboard Controller Commands */
@@ -467,6 +467,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 {
     KBDState *s = g_malloc0(sizeof(KBDState));
 
+    qdev_warn_deprecated_function_used();
+
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
     s->mask = mask;
-- 
2.21.3


