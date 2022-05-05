Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0351C53F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeVt-0007yi-BW
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBM-0001vp-Aq; Thu, 05 May 2022 12:18:24 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBK-0005iO-NV; Thu, 05 May 2022 12:18:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gh6so9747462ejb.0;
 Thu, 05 May 2022 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7MxLriz5xbAd+BcL6eLZMlnBhbAdcemwHPwNNnHpCCY=;
 b=ELfhp9FMeL2dIP+E0VbWE89x9GN9igwhGwcnXx2LbUZfO+Z+ifshd4U3jeJW/fx/nq
 6UNC9TiHL0gmlui8TDz9MQB4Fe+Ck1FZTuVSg+kwO3i+WEVLmsuGnHNmZExFsXn+9a9h
 9s2zNEIKypvaFYRn0yRqVVQMmrPgpR+8p5BkmVEKovbzsUwcKBMmp4XWuw1dfn5Xttjq
 2w4bCsJ8cfwZGyTFgg50tMOl+3PDv4Xj1SQOsbROZZCqG0WgYBh4hWJuaQ41dXcZ3sS4
 8wLtBWtEJr2zADyZK3UrQMbrYQpGtKaCBCvYSsSq2mme6Y/K/V15/lG8+WrjizKD90dw
 Kw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7MxLriz5xbAd+BcL6eLZMlnBhbAdcemwHPwNNnHpCCY=;
 b=NaxmCfGqJeR10/6a8IGEFXj987swi2drxf712MY1oVdEJyQrRB0ly/ZG0q1KoA5ykp
 Aqs4RNR/HYu5d8LJWuHtBIPQrMHdAap3h0jdDGXF/XPUlEP4K5oYb5lmuVoLGZv8ZZR4
 EMjYq4kaV1QlxAsxXMLvXhpx/mrLo1R51mMhRx5z81O72l1uUmqbGQDMWe2NSPnJEPqI
 NFismsUZ+IUDz2hH0VUqkzpb3BkEUuCk05iHDWcJ532uyozh2zy2QKBVoemT4wjxcohD
 so2fANvKtK7p2yPM901tYeG5AkJIhAymm+eNOhyC3eXqUl1VRQ7upercEMY/nioJCucl
 TynQ==
X-Gm-Message-State: AOAM530xXXjOoKPtbCNcGyQ4IVAbo1+OdUzEJCpbu33/bTnr1DJDoe7f
 PcCxDclfUJb9EicT2UgZ19XoVUz5KgM=
X-Google-Smtp-Source: ABdhPJyYxd40FUn/Oz7tVpdQk3zDoHOsx4ZNDJeHl6H3UVLUBipYazoN2tiHR/du/qDDQ3uxQ0ymlQ==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id
 la17-20020a170907781100b006efa896b407mr26059056ejc.645.1651767500127; 
 Thu, 05 May 2022 09:18:20 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 02/11] hw: Reuse TYPE_I8042 define
Date: Thu,  5 May 2022 18:17:56 +0200
Message-Id: <20220505161805.11116-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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

TYPE_I8042 is exported, so reuse it for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc.c       | 4 ++--
 hw/sparc64/sun4u.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 23bba9d82c..649511a49b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1042,7 +1042,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         return;
     }
 
-    i8042 = isa_create_simple(isa_bus, "i8042");
+    i8042 = isa_create_simple(isa_bus, TYPE_I8042);
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
         vmmouse = isa_try_new("vmmouse");
@@ -1050,7 +1050,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
         vmmouse = NULL;
     }
     if (vmmouse) {
-        object_property_set_link(OBJECT(vmmouse), "i8042", OBJECT(i8042),
+        object_property_set_link(OBJECT(vmmouse), TYPE_I8042, OBJECT(i8042),
                                  &error_abort);
         isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 6fd08e2298..77687dc649 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -334,7 +334,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     parallel_hds_isa_init(s->isa_bus, MAX_PARALLEL_PORTS);
 
     /* Keyboard */
-    isa_create_simple(s->isa_bus, "i8042");
+    isa_create_simple(s->isa_bus, TYPE_I8042);
 
     /* Floppy */
     for (i = 0; i < MAX_FD; i++) {
-- 
2.36.0


