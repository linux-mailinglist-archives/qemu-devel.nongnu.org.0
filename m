Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634E641F1C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKk-0001ik-D3; Sun, 04 Dec 2022 14:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKi-0001hq-6Y; Sun, 04 Dec 2022 14:07:24 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKg-0001Zw-J6; Sun, 04 Dec 2022 14:07:23 -0500
Received: by mail-ej1-x62f.google.com with SMTP id b2so23068594eja.7;
 Sun, 04 Dec 2022 11:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IvI0kZSB0AqN54NmbNdOj0oDgpcmCwCT7YBjcuwgLUY=;
 b=MAvldfdonJT7hoYwGOwOLATusYecMWNTvLVn8810DVddGxCEZgrcW6/lZD9pAUtWl9
 L+CePHjhLB7uw5jY3KzVQ7uV3RbLjlXwU7dZWZLcrf0e7cO1m9XG9GH+8IgGgy0f9Rbg
 BTEPfWMGo3f/iNFUqQH3nSRyVy8LpkTPg08qD6GHZYoy7ll5+vlgSCE36504kCWbAfLB
 kXGe8GjNjNW+9HRhxaGuvLSI51DG7yXuGWlIj08Z3NnfY1FgmBh4IcV2/iRsaYRUZscJ
 nwGpIRxzkqEV6mJkJe4wwkw1g6qu3ec81V8OcqmvTZ5JuyI1UOQH+sBkRq2QI5iHv/5W
 KSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvI0kZSB0AqN54NmbNdOj0oDgpcmCwCT7YBjcuwgLUY=;
 b=l0chYR48s48Lwkw9YWhkAjMK0+xuhj8r37MeIE0J4GFHE4n0LiurgSmiMOJK6WRoW7
 1WxN2CUHM14/PI+6YDiBWJfYxOFQ9YVAvI6CuGTTK3QMBFpAR7srQPYJF8CvzRxFJ08s
 dRBBZQD9Qsq/tFVBYsmUGSbmGCbxKih9hVraNtjZrjqAUlcafpvAeyehNAKjBlNU36XW
 PNUmo8IIq9zDpESsamOJZTazpnrG8h4LhvVXjwUlAbs8gy5wGzga2HfJUXf46v7lspQY
 NMrXH/394/hWXNPns4v3Gwhxg+mhze9axPmNo4gFvh2GwgbYjs6NKWgLmhWjwaB/THQD
 uILg==
X-Gm-Message-State: ANoB5pk45Wry4t7BBnuFQ3UYfRpe++oF4bDYAj7SLWxhu3asywsv6kow
 z5DLHkNYOad0LgUrHR9If39JY1Hk7bw=
X-Google-Smtp-Source: AA0mqf6PslXcCg8ipiLtHiSjdpldBAvZWx2iLkvVtCTiADV0r26NGZ45bAXZZDD30oEprZt7wYDWhw==
X-Received: by 2002:a17:906:f2c8:b0:7c0:eeae:242d with SMTP id
 gz8-20020a170906f2c800b007c0eeae242dmr2441988ejb.672.1670180840268; 
 Sun, 04 Dec 2022 11:07:20 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:19 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 01/32] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Sun,  4 Dec 2022 20:05:22 +0100
Message-Id: <20221204190553.3274-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-2-philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..9bffa1b128 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -71,6 +71,8 @@
 
 #define FLASH_SIZE          0x400000
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1401,7 +1403,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.38.1


