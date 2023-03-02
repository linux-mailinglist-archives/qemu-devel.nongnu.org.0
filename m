Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060B6A8B2C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNW-0000iZ-SN; Thu, 02 Mar 2023 16:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNU-0000hV-87
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:16 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNS-0002P1-RY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:16 -0500
Received: by mail-ed1-x531.google.com with SMTP id o15so2317842edr.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZKE4IeiKPhxE8KiHJptAv9lG6Ju17uZqyfpslDw1kA=;
 b=RDIVeclIV83csgj4LlbKso4CZvkh9CSr+WDxvHJm0TxbXQaJI2L9IzRUYagfrXLKZv
 XcMlu4RK+HNPcHQUfPEFNI+qEV4gKCX8Ng6JOe8og2B4ALeuqLkzIqopFSuHCdNK8Cxa
 1MR200LDo2euKRG69J61KFFPV8j1b3LUA9cQgGX6gNt5fpwhL1Ud+wLwa4hpGBvEZT8Q
 85dFY9VYGnNNhYIFhrOfa1to7FKTl7N1FaRFV177ZIJ449HNIKQW+9GfjlAWoDy5S969
 xhD50moZSDVj2Nt6yqgO0NiR5/I9XBUl3IpAYSADtH3qxFhFnuP91eKjLHM2GQ1LPT/3
 DxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ZKE4IeiKPhxE8KiHJptAv9lG6Ju17uZqyfpslDw1kA=;
 b=nvTsHmAjekWDW9gcV6OywUfjuvztRRntqzQivfrAvZd+8SzbX2A8nav+8LQsb8xTs9
 OBhjFTAmkvlrghXDeqruN/kiVN8aLqOqSAgIPXMN+SDcj4C/Qypca7SGY2nICe5sYnP5
 Xh5lg9QxDsoxBKozNbSYRrWuOsYbPBQ7Jda/g0LMfAz/JQzJPXJKVCx5whPizzi1yGv+
 PWA8qvUgtoEkmwzPYAQ7E5bErDrlyFqqFi42+sCw0HO9ZbmX5Cx6/n/sacbivbM1yH+R
 7+Qd+YJgZEIPEzNp47c4i0PeVnz95e3980EWBmUZgC2WAyie6ZRThse/+4woRyhvhS/n
 kxkg==
X-Gm-Message-State: AO0yUKVB5F8zyHFzCMAxLKFbsmXIX8MZWUJFnSPJ8JyQGLL1tXpj/q/X
 XdFKsNjOYp1P/YSSZa1TJpaiZzTkINc=
X-Google-Smtp-Source: AK7set9WWORdeahkYIlyERQoVsDAOSOmwh2uuCK2F71GPN0C56l+nSjI20rb23fMCyFBOU5NDiFh4w==
X-Received: by 2002:a17:907:628c:b0:8b1:4051:6d2c with SMTP id
 nd12-20020a170907628c00b008b140516d2cmr14618071ejc.19.1677792133267; 
 Thu, 02 Mar 2023 13:22:13 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 03/23] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Thu,  2 Mar 2023 22:21:41 +0100
Message-Id: <20230302212201.224360-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2b5884d3d2..b9d475a226 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -236,7 +236,8 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.39.2


