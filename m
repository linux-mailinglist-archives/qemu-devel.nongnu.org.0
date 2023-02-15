Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BC6980B8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTR-0007TO-9u; Wed, 15 Feb 2023 11:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTO-0007NI-S4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTN-0008H3-5v
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id o36so13740461wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFnjzOUK6OjqNgjA5FyAgu+o5jYnh8yg7SkXzfxTC58=;
 b=sNFT3I59hlFB8MN7afM7n/Y4v0SFYR8t2NfIDgIvgI/WR9IBS0pHH1tw9EQ2r91X9f
 SU9xj7BaTR0JJaYbK+ZVY/LJt9QT3s9zzwkAT8Zp64MpEACBbjEdIPyaDi1fFqMaxsmW
 hIu7CFTlvfQZphT7wCNOjmbaUN4/cVbfsLSBZisU6TJMoBdXXGuwUNVeW2m+hdnxgIqV
 D4EmOKAFu5oBR7LOKN+75nFr3iP9azIuRrYfXEsJeWOVjbzXRxqVxziqqXAYFK7gVTSu
 sIBUFl1TaVvyY2+i6EgBhyFvRO67MZWJMn11hJMLH72Tv4ctImWfCLZU/d2OnmO3Rmgk
 cLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uFnjzOUK6OjqNgjA5FyAgu+o5jYnh8yg7SkXzfxTC58=;
 b=FRrZkNgJjYCoR76HmQXHMRwGU8jh5qPQHk7Gf/y/o5N18ZJREaeYJZNJJ67ZEFI+Gf
 O8tURGO2TVy6kaJZaJquxprxIqlAZ0YBG2Z7nu+MG8Xfl88nwjvBJL/fQqSC85SJrcKM
 M8AF9ro/DlATqE/dRWcImHw0rMK9R00XZY2a9UYxyTIRRZw43eBgL28v6Kab/gaWgsBa
 k4AyPAxBD575qay+CCog2PXU0Td/iRg+hJHavrxCKSnAp0wSib9co4fKP7SqXtqQ4u2s
 FZjy0eHcC91kTZB86jmKi5DIRDULU6fxP9hiY72ourdydEAAyrzdR5Bx0AlygtCpMgXY
 weeA==
X-Gm-Message-State: AO0yUKUOp1NZNyt9cbBpKakIe0V+SAj63+meFOBFHZzyLD9Qb7nxGw2C
 J8j4j9+DFkm989g4H0YyRSwIoX5hUyKNDUR7
X-Google-Smtp-Source: AK7set/c8RJpujeU742VH/13U6NtXc1xMuNCLgdEOLgnGOKM8d7RtnCBRsEFgedJlrXq1f7lgUgsDw==
X-Received: by 2002:a05:600c:2ed2:b0:3df:eda1:43b9 with SMTP id
 q18-20020a05600c2ed200b003dfeda143b9mr2610069wmn.4.1676477852118; 
 Wed, 15 Feb 2023 08:17:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm2965094wmq.2.2023.02.15.08.17.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 09/18] hw/isa: Simplify isa_address_space[_io]()
Date: Wed, 15 Feb 2023 17:16:32 +0100
Message-Id: <20230215161641.32663-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't have any caller passing a NULL device argument,
so we can simplify, avoiding to access the global 'isabus'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index a9b94e6c8a..08c84704e9 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -247,20 +247,14 @@ static char *isabus_get_fw_dev_path(DeviceState *dev)
 
 MemoryRegion *isa_address_space(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space;
-    }
-
-    return isabus->address_space;
+    assert(dev);
+    return isa_bus_from_device(dev)->address_space;
 }
 
 MemoryRegion *isa_address_space_io(ISADevice *dev)
 {
-    if (dev) {
-        return isa_bus_from_device(dev)->address_space_io;
-    }
-
-    return isabus->address_space_io;
+    assert(dev);
+    return isa_bus_from_device(dev)->address_space_io;
 }
 
 type_init(isabus_register_types)
-- 
2.38.1


