Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6311682BF2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:55:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpDE-0006mU-Bx; Tue, 31 Jan 2023 06:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpDB-0006eY-8i; Tue, 31 Jan 2023 06:54:05 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD9-0002Kb-0k; Tue, 31 Jan 2023 06:54:04 -0500
Received: by mail-ed1-x533.google.com with SMTP id u21so14135398edv.3;
 Tue, 31 Jan 2023 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKzuVQAa7neEdkz9/LLBUDYgSgZ4PlYBRiFkTU0L45g=;
 b=FccqFdOm8DOzycoH4VSNakOnua4XfI7D1d05WeDjjlhiba4EUbrEQaCQnyvwAx+6Jr
 sWf4gT1oGMTk+ql0kOTKitSGtSs8gNE5BMC3m3KUMgvPT44b/V/L2DPRS/6/p1aFOr3W
 +I8ZD+CkZpkGx0U0bt+PXyKYBvzFwfw4X9ISrJjSGgSMFVX44Nait3Xop/G/CvtTCTLd
 qcNoV7wb8mXRVLR54eOVFzMw4puhiVpo3VMB7qrAN3fhxrISsTO/xplZ55qHt8uiqzzZ
 8vyK/ChwevvGLtOUcjHGVwaLacwfCcm4HcmzepXdzvr1tTFeSOcQ/iQzbTEgNSxr5zTV
 +jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lKzuVQAa7neEdkz9/LLBUDYgSgZ4PlYBRiFkTU0L45g=;
 b=niyht+LBbtixZD79bqbIp3Aylxl6AZ8L0BLaTH5elHLhwVS4MUf5oQ/AcNu2i1JeMs
 KZEf1CwJdgxWt14/o+ASz4xZQqDZIikesXMx80Kiy9csLcu2S0IYm8da83MWeUeeYBcW
 9BAjr9cIzDwKw2Kp9c9R4aoSTqVEJVEtMrybiA63OwOREBcoHHrUH7OQP4cgmYFbrUTH
 L5+0fKTyHNXL1awEYqgrRkgdu7LJSLG6Bax1RJfJKrnlN85M+UdeIYcpSH5WJG31rK9c
 6erpL4ZMEFksoz3WxX1JjosOKoQ+VrpLqNCqxfSnv67/nv7MnzSeOcqxzLcA5c7kRPGl
 ztgA==
X-Gm-Message-State: AO0yUKU/UYG9P14nUqH0inK6s7tXIjBCrQE4FixX77hMGLPxf78wDzJX
 SVw5ESNej108zMwV//cTK5ExDxd67qQ=
X-Google-Smtp-Source: AK7set8QQqdq174NbhI2cyxwBOsShtJXXsvMlh1BjZ+Hoh6lzape4N8/LwB87CtIy4WsP+CZ3ugKbw==
X-Received: by 2002:a05:6402:14d4:b0:4a2:1d40:3cb7 with SMTP id
 f20-20020a05640214d400b004a21d403cb7mr14868057edx.16.1675166041635; 
 Tue, 31 Jan 2023 03:54:01 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:54:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 11/20] hw/isa/lpc_ich9: Reuse memory and io address space
 of PCI bus
Date: Tue, 31 Jan 2023 12:53:17 +0100
Message-Id: <20230131115326.12454-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In pc_q35.c the PCI host bridge's io and memory space is initialized
with get_system_memory() and get_system_io() respectively. Therefore,
using pci_address_space() and pci_address_space_io() is equivalent. All
in all this makes the LPC function respect whatever memory spaces the
PCI bus was set up with.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/lpc_ich9.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 9ab966ef88..1b7e5585b3 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -506,10 +506,10 @@ static void ich9_lpc_rcba_update(ICH9LPCState *lpc, uint32_t rcba_old)
     uint32_t rcba = pci_get_long(lpc->d.config + ICH9_LPC_RCBA);
 
     if (rcba_old & ICH9_LPC_RCBA_EN) {
-        memory_region_del_subregion(get_system_memory(), &lpc->rcrb_mem);
+        memory_region_del_subregion(pci_address_space(&lpc->d), &lpc->rcrb_mem);
     }
     if (rcba & ICH9_LPC_RCBA_EN) {
-        memory_region_add_subregion_overlap(get_system_memory(),
+        memory_region_add_subregion_overlap(pci_address_space(&lpc->d),
                                             rcba & ICH9_LPC_RCBA_BA_MASK,
                                             &lpc->rcrb_mem, 1);
     }
@@ -695,7 +695,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
         return;
     }
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(), get_system_io(),
+    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           errp);
     if (!isa_bus) {
         return;
-- 
2.39.1


