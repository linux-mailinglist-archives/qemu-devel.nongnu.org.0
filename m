Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB521F1D49
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:29:00 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKdv-00026s-Sb
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEw-0007Fz-IO
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54811
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEv-000850-08
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=ivqz1jTqv9IYrY1gIvp+b1sKDNB+kOzgs93N3bb1vrDkgfIVpGisduxtBL8csfDWmf81DB
 DBy2UIeGK45kCykB1TMREe2yH6246FCbWAYFOhvESbYWWeePCmy6/f2/MuXh0O8SABkRHE
 zt5ycnjB14ikafjtF+YFlPo9XVTs5Ig=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-zb57yCbWO2a-QijHm9dYRQ-1; Mon, 08 Jun 2020 12:03:06 -0400
X-MC-Unique: zb57yCbWO2a-QijHm9dYRQ-1
Received: by mail-wr1-f69.google.com with SMTP id c14so7303985wrw.11
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=mGDasqiErwki8nmFHCMbSQowpghvZGLN44lJrPMQm9vzgQMU3OKFzNw1aSNZ+5iL5A
 iwQ1obLq0TuqkXHYzv+LIx4dXoeRBt/4yjKCRXegS9ps91wndDDK/lSfdUVwN4XM+zmc
 +xKcycdf0RhLV58PyIy8Ze6h/VBpFoF9eyfq8bQ/awt2qAgaj6e2CBdY1YbzN86MVh0F
 oGhzFhwDJhPUDupgE+qVqWUdQBJmToy7EzDYRPAeuSZLH5WgPBMCpe6OLTTlAJ7wNTL+
 5PTQMRCjl8u/6EaYnTFZMLrb1pWRqAAwgX4SQckx1nRvG1NezZAX2q5uD26SvuzdC9aG
 mjjg==
X-Gm-Message-State: AOAM53184rCM70q2/Rmf/tEH+Sk9gImQIbSDtwJgrtvs1utGmPnFcQHZ
 ha7XRdE2KEPzS+3KO8VTQSb5pL3PpYzsLji9XcU9juMGesf3MtGcG7G8OOmH+v6yvyt8Py7zvns
 ZY8D9NZnVWWAfOpY=
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21517wme.171.1591632185577;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU3FFzPx8GJONXk2lb2PRS9hlQzh1ioPeLu4txPuU4I7Pa7KejCTY0NavLN6WE+tDOlF/rwQ==
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21489wme.171.1591632185399;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm30434wmh.18.2020.06.08.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/35] hw/misc/cbus: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:33 +0200
Message-Id: <20200608160044.15531-25-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 hw/misc/cbus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..24e197684f 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/misc/cbus.h"
 #include "sysemu/runstate.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG
 
@@ -135,6 +136,8 @@ CBus *cbus_init(qemu_irq dat)
 {
     CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
     s->cbus.dat = qemu_allocate_irq(cbus_dat, s, 0);
-- 
2.21.3


