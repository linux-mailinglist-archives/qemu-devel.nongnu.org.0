Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2A469303
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 10:54:01 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muAh6-0007N4-4L
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 04:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muAfX-0006gK-KG
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:52:23 -0500
Received: from [2a00:1450:4864:20::42e] (port=40626
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muAfV-0000tx-Jr
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:52:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t9so21136887wrx.7
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Af0vIXMcbgHjwVmo6bgFK26AFt/RzU7BJ49OoHDuCUE=;
 b=qEhVj6YZlt8R5L+BqcUGQtYQz4prWF+UEFf1j3+Ak+0QwmnHWlq0qCg6JivkFE7ZGp
 m9H8bJ/PASXpMmcjCcumP1v60aAFqEc4G+/JIda25VD8fH0lWtHoG06YBwm0IdJ/UqhU
 4b3ucqidRpHbToByamHGV3Zwx3hvLvkEmpig/0tqEWedz+DX+FTpgFT6zwae/4s9PjAv
 f1Ds+NpZnKp1R3gmDIwScQDjDyfrvwDF0/zmM0PWpSomzAv3wtYNaxWnFC5ykXiWbwq2
 80pNd/IPNHzos3NCnGPyFLEv6DQXdmZznyt9QQ2MFuGFXhoozER/GJGNuRo1cY/YVaI1
 d0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Af0vIXMcbgHjwVmo6bgFK26AFt/RzU7BJ49OoHDuCUE=;
 b=kn35PLh8kQX8Odc1pwFdxs1ymwhlnD10Dty2v0/k6kKJby59BvgzgJgISLwF0pZzpS
 BgCJwusXy8wOngcqRBVXj1PXqD8NYeuvNTwRpZJW00pqpljDhde0BMz7PSrKlatMuh00
 0g2Gy+stEIhPFOpRQBDteNpjZz9O/UPp9Z3b5TJ8/MvaARGNmKLH6AOXFpXDOQeQWJWC
 Ozb3hH8OjuiC242hmg8afXwRkko823pwA2lWZNVNu1Ni32i0tHVnVvEhwQpYryzJkj4+
 maUP8M3ZyUdsU+T6Z85U9zKXuHK88ho8S/pBKhrxwij5DBbm+ITGOk8PizvNNJRz8LDS
 0csA==
X-Gm-Message-State: AOAM5305lq+ixcg0Od3tHK1JwgPVRyHKDD3O9Qqdzvj+jmmlaKYdx7WW
 9vV6qJo8t3U8NhyyroEZbWXjvQ==
X-Google-Smtp-Source: ABdhPJwxnt5YxteCJeGarvtZYGORH35jhbxr9O094gRmiqxRSZTC6vrABVoAzylOujd/ZkaPcpSXRQ==
X-Received: by 2002:adf:f206:: with SMTP id p6mr42157596wro.509.1638784336969; 
 Mon, 06 Dec 2021 01:52:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm14434359wmq.5.2021.12.06.01.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 01:52:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CB531FF96;
 Mon,  6 Dec 2021 09:52:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2? v2] Revert "vga: don't abort when adding a duplicate
 isa-vga device"
Date: Mon,  6 Dec 2021 09:52:09 +0000
Message-Id: <20211206095209.2332376-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.

The check is bogus as it ends up finding itself and falling over.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/733
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20211202164929.1119036-1-alex.bennee@linaro.org>

---
v2
  - fixed bug link
---
 hw/display/vga-isa.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 8cea84f2be..90851e730b 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -33,7 +33,6 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
-#include "qapi/error.h"
 
 #define TYPE_ISA_VGA "isa-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
@@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
-    /*
-     * make sure this device is not being added twice, if so
-     * exit without crashing qemu
-     */
-    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
-        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
-        return;
-    }
-
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.30.2


