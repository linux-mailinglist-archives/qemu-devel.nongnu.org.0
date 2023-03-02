Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1A6A8B23
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNm-0000rB-P6; Thu, 02 Mar 2023 16:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNk-0000qb-J4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:32 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNi-0002Op-UD
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:32 -0500
Received: by mail-ed1-x531.google.com with SMTP id i34so2451061eda.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUnc9UP62zjLRuhYByUP2+UPOyRSwBRtfaQiBc6V0dM=;
 b=kM4hHDMkVQcyVHkc+GVVyZLc6wBIPqsQ+i5SObscl8D5UKgEP3MDhMJQv52gYj3yiO
 f4qLpnpXfXIcilWXeauUdM4xQwoQjrXPmeUHkvxJ8RC0r6d7tkUv3+jhDQrjC7aIITkJ
 vQ8JJ1D+UPL3jJY+mC0g8AFg7w7lsDHS+4chNNh2jwU6jNCxOU+oAx9E4rz/TMsIM4U3
 EylvRXN8LcEtc1zUL0NsZkzZakRODy6APjkv7Me+EW6HZitmmkY2ydW5i+e9RcSJZF1n
 4SQ8qav4kNGM/VFw/h93vBhFvr5phqs6CVKjk9LTve8knUtKyJj5IH/K6LWdav8KzRNa
 HwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUnc9UP62zjLRuhYByUP2+UPOyRSwBRtfaQiBc6V0dM=;
 b=hu2eA2hv7GI9Cd5DlE0XJzghsK70/85gLeVF6BlaYoX1B7ZCwUV8WF1xfcUTo91Kba
 k2LI/hrJHUabLrpBat7/FgHfmDxCLFY4JmUwpTojjCaW+oS+6px4iSJB1bRADJoaLwZv
 s56iXdRFd5OQWbBnuS1LlOfGf2SGfLBnUnEXVTbb1loAZQ+YwXHjLAT21FhRUzu7Ozbh
 QMz7d3db4vCVAY7rjv8z72URVjUiShnQOYflO1a96P8uDnl1IUUvh9RrrZKk6CrLp5vi
 gJilu64Ya6B0w/eAZYnHnBqnfbEKDSJppCy/agJK0d9l32zPW9lPW515EHWtnkkZxDzU
 /U5A==
X-Gm-Message-State: AO0yUKV9naKd0jT6wfE0bKBvJmQNFaFkBD0MXSZ5c4bgdc3lTIrvpPab
 r/VF/xpLQSAumfYZPaKPUsgk77Yawfw=
X-Google-Smtp-Source: AK7set+dGAvtUKgh6pujTG3Br9UN/DT/Nz4JE1pkF8mwJ6FiMRi7iwuOcaB95eQotLwFrHlkclosKw==
X-Received: by 2002:a17:907:628a:b0:889:794d:f412 with SMTP id
 nd10-20020a170907628a00b00889794df412mr13776983ejc.10.1677792149886; 
 Thu, 02 Mar 2023 13:22:29 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 19/23] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Thu,  2 Mar 2023 22:21:57 +0100
Message-Id: <20230302212201.224360-20-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is no need for having different names here. Having the same name
further allows code to be shared between PIIX3 and PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-38-shentey@gmail.com>
---
 hw/isa/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 09d411a6b7..8206cbebf3 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -345,7 +345,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -545,7 +545,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.39.2


