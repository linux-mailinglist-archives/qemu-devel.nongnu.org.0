Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4525A9D96
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:57:23 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnVL-00041i-0H
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-00022l-KR
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1z-0001Vo-ET
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id c59so17069584edf.10
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Tq7c8yKqxSyAFEmOm4dcRmVPkGIjGIdrC1sBrJkCEEI=;
 b=CVSiw0JQLzw3T+OHlUhrC7lQuIuFEw4lwAspkjitxVs0qdqE6GgQ2CMqR3tA4tUx5y
 SaSJYiI3CA9dNMX2cgvSQIHWi4bcsvxTCJcIgZw8AFyGpGxQ7smwgHSNMw0o07aUOI3v
 M7obzpTPWVv7hBy5jNHIrFO3RVMlSJoS5YEvNOhQtX6I7q3JZ+1UhCdtIuOkImF5gf9Z
 O5kjwVc+qtjvTClaeGVqnzPWDLa63O+Cu4nTmSoZSsqkSZEShvdZhPjQndBvQZaZ1dlB
 8nTWSKvLH2RTo/ETDPfMjQ4lz4En9soVXsfqTkBG5H9/3xD1MGxDSF+6BvNr4qwkXLtE
 /tDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Tq7c8yKqxSyAFEmOm4dcRmVPkGIjGIdrC1sBrJkCEEI=;
 b=JvYfJDHHKL6gIWxXq7fy7GF7pyzrB6BYseqBJSI/KCuNeloGqyDi3IY+5pDrhp83CI
 6ECLy+X0Vt2+td9tGNS4o3/B4og4nX0QGBV2BHxpRu0ysv9JXikxJItGcsepiQ/BHGrb
 SKeg/Qpy6xY0Vv6g/rA2Rjsyr+18tZl/EGQusYSDtcI3GN/NaslJyE6eEiZYzgBGBbea
 rhkGXbvOWLnBNvq0WN88dEUmpjBNUzdoKsSIF/pMEg8QhRhhhgMawKy3sCpYL4hqxbkg
 t1mTViHGa2YwD9oKCqpAeqhZGny4HzsyafATjo8VHIelriREXsXkmRTG6tYvpqm9aB9k
 hA1w==
X-Gm-Message-State: ACgBeo34kSepj83He67XiCMZEQoKAg6I5vK+Dv98x1gydRJTQ9CTYrPC
 gaM16NzxpMg5bVhU/j71lBm//6lDde4=
X-Google-Smtp-Source: AA6agR5uFc3bocwDDeQN3R4b2nQ0kA42NWZsWwLrhO6AlKR/6l1zD6DdLmak9RhiZrXpyASczdLeZw==
X-Received: by 2002:a05:6402:e96:b0:443:a086:e3e8 with SMTP id
 h22-20020a0564020e9600b00443a086e3e8mr30216722eda.330.1662049621964; 
 Thu, 01 Sep 2022 09:27:01 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 15/42] hw/isa/piix3: Prefer pci_address_space() over
 get_system_memory()
Date: Thu,  1 Sep 2022 18:25:46 +0200
Message-Id: <20220901162613.6939-16-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

get_system_memory() accesses global state while pci_address_space() uses
whatever has been passed to the device instance, so avoid the global.
Moreover, PIIX4 uses pci_address_space() here as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 0350f70706..f8fcd47e24 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -302,7 +302,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+    isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
     if (!isa_bus) {
         return;
-- 
2.37.3


