Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461B1EA5ED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 16:32:01 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jflTs-000534-Ie
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 10:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRc-0002R0-J4; Mon, 01 Jun 2020 10:29:40 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRb-0002bA-Qv; Mon, 01 Jun 2020 10:29:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id g10so3263528wmh.4;
 Mon, 01 Jun 2020 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxI9GbbijxDixix+zf0tcfiMCEcCufTLAytrxKWhnaw=;
 b=McijkDfUDfkGD5lMdNQ+M+R1KyklnbVnSE2xHGQXgc1FoZJoCchot8LzXFDjcv6KOM
 NfDZQCYHBzFyP55Su7iZS69grQCQSVbwDOPJ+fB1HbziyodXwYIRjrKQJxgmPT4ArVpq
 rm9Pu0LT63ray48uF1rziqp7IZcfFUNMkYG9A+LsNcigRtirUvuwvV444Ky81hpelupC
 +5N9EyRxBaOoygPIaPo+byEWNWCAKP5TJYnc3C0AUoXQLnUV2+IO/kOm471D5FNX4dGS
 PXeofGbkbTz3KyYJzwzy8JhQSJZBOmbcV67oJceaEhbsL8Eabp6qKyVKz5B+XRC8hlPA
 RKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mxI9GbbijxDixix+zf0tcfiMCEcCufTLAytrxKWhnaw=;
 b=e/9XmhvpgjnjiQCe5Fa7xr99TVpJOJoq9acw705zHr+klrySd7q++ZqDnI8+Aigxxc
 Epxd2Cl/f2xlm2cSd17CYpD2kN+g/NoRL0K+xstuB8XjdgwPgB6FzQoK7hkqJYXzHHvn
 hGpUoXJwckLQr/QFMABf7YyEYEF5XmcUd3Z6Wzg0MCv3Ue14ON8ARZZ3CUlJrziuFO7f
 HCJXoPh46sC6YgGE4JoRwvgrEhGwRmhhx5lMDAxk/CJn+JwksHBOlClAVD2BuwGofUQe
 jcWVIKE2cl4LxCQb8si/UxkD1ETBL9+LHYP1NvzDgOAw1fZWGkMRPzLF0hichnLucB6r
 Oywg==
X-Gm-Message-State: AOAM531+XOGBPqGUzgrdzlR1UiWeNxtzalidXRoKc5/OwiZ8U0AZMb8O
 dez161Dha9QUn7ed+TblCEiaSmK9
X-Google-Smtp-Source: ABdhPJy45MyMB35sU56T7YLu7WldCE4HuCq6HN3F6gvzbGobgbl/tu9cwCNmdjlgEG1zdLyU9Mx++g==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr20855219wmj.2.1591021777436;
 Mon, 01 Jun 2020 07:29:37 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/pci/pci_bridge: Correct pci_bridge_io memory region
 size
Date: Mon,  1 Jun 2020 16:29:25 +0200
Message-Id: <20200601142930.29408-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the pci_bridge_io MemoryRegion
ends up missing 1 byte:

  (qemu) info mtree
  memory-region: pci_bridge_io
    0000000000000000-00000000fffffffe (prio 0, i/o): pci_bridge_io
      0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
      0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
      00000000000001ce-00000000000001d1 (prio 0, i/o): vbe
      0000000000000378-000000000000037f (prio 0, i/o): parallel
      00000000000003b4-00000000000003b5 (prio 0, i/o): vga
      ...

Fix by using the correct value. We now have:

  memory-region: pci_bridge_io
    0000000000000000-00000000ffffffff (prio 0, i/o): pci_bridge_io
      0000000000000060-0000000000000060 (prio 0, i/o): i8042-data
      0000000000000064-0000000000000064 (prio 0, i/o): i8042-cmd
      ...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci_bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 97967d12eb..3ba3203f72 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -30,6 +30,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
 #include "qemu/module.h"
@@ -381,7 +382,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
     memory_region_init(&br->address_space_mem, OBJECT(br), "pci_bridge_pci", UINT64_MAX);
     sec_bus->address_space_io = &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
-                       UINT32_MAX);
+                       4 * GiB);
     br->windows = pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
-- 
2.21.3


