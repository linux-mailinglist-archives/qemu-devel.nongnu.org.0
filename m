Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A224E1F1D44
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 18:27:43 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKcg-00089F-Lr
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 12:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFi-0007sh-4y
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:38935
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFg-0008Ep-Tp
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 12:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=i0gWMupYQnQaFUEqTKaVJBfEe2HNXu7+J/baMmXCmjt4r32d3aYvlLPLRjroSb/5hxImAc
 uC3PbyJL9Znc/AfU8nlK8C59RGAgTKM1qMcX+L4K9FxhXkQhXrh66avYo1etStY+pgnPup
 Oq+k1H8cr0en46mXrLNzlbEfZfcry30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-omOvy007O2mnpedbBdcMAg-1; Mon, 08 Jun 2020 12:03:54 -0400
X-MC-Unique: omOvy007O2mnpedbBdcMAg-1
Received: by mail-wr1-f70.google.com with SMTP id z10so7393026wrs.2
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 09:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfeQjgHHg6Ez9waCGJmOrJzAr/zUBGXbuFUiyuF/Rfo=;
 b=mBq3gTe1K0Hz6TRMBWU4RVNbzjGzThk7CgjG/ugivCiXFXNMUmkXYY+M8URh625rJS
 gin6nx5I5hw4TEbxTX02AGTry4OzOCsffqkyKPQePB5CoCEY/iFaExR8hBINTlFNhp9g
 MlMpMkkkcB5Hihp76EjH0KKXFvG71o4QNtghPfFARWZsrBwC/ev55VmCNcnBgfLj5MXc
 q/HsSBAwKV0uIZubagf1Q5dfwTfhDfgTL7wmZerlXZXIkfoa7CYfJHParbOPUO6aiDK0
 m5rvYCY0E5oZnFLXNsfkFvenXVOy+PVeS9hFZb6h/AfHmISx627tDcfmgg1H85rEe6Ir
 7hng==
X-Gm-Message-State: AOAM533AlRsIlmbYjd51KTN85WdSEm5C4PEFx6PRWHGPdknzFLTGO4sW
 INw0JNoEij/zfFVFzX06LSmWy55gvumxP05uu80kiJfCn0RZ7xL9JXJv3z4MZV1PvJuNWsB7zF+
 FRfqf/8A7PX57JyM=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54318wmj.3.1591632232864;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLcq9fw++IqBSfctMa2VnenePzSclzDPUX9srn5OE/PiQtrx427TCsmbU35rGSbrlanE52/A==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr54282wmj.3.1591632232663;
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q4sm4466wma.47.2020.06.08.09.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 32/35] hw/riscv: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:41 +0200
Message-Id: <20200608160044.15531-33-philmd@redhat.com>
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
 hw/riscv/riscv_htif.c  | 4 ++++
 hw/riscv/sifive_uart.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/riscv/riscv_htif.c b/hw/riscv/riscv_htif.c
index ca87a5cf9f..bd080dbefb 100644
--- a/hw/riscv/riscv_htif.c
+++ b/hw/riscv/riscv_htif.c
@@ -30,6 +30,7 @@
 #include "hw/riscv/riscv_htif.h"
 #include "qemu/timer.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-deprecated.h"
 
 #define RISCV_DEBUG_HTIF 0
 #define HTIF_DEBUG(fmt, ...)                                                   \
@@ -238,6 +239,9 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
     uint64_t fromhost_offset = fromhost_addr - base;
 
     HTIFState *s = g_malloc0(sizeof(HTIFState));
+
+    qdev_warn_deprecated_function_used();
+
     s->address_space = address_space;
     s->main_mem = main_mem;
     s->main_mem_ram_ptr = memory_region_get_ram_ptr(main_mem);
diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
index 9350482662..1a5890d5f7 100644
--- a/hw/riscv/sifive_uart.c
+++ b/hw/riscv/sifive_uart.c
@@ -25,6 +25,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/riscv/sifive_uart.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Not yet implemented:
@@ -183,6 +184,9 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
     Chardev *chr, qemu_irq irq)
 {
     SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
+
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
-- 
2.21.3


