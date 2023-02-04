Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E2C68AAE2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:13:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKCA-0002WE-FM; Sat, 04 Feb 2023 10:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC8-0002Vc-4p; Sat, 04 Feb 2023 10:11:12 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC6-0006bk-3v; Sat, 04 Feb 2023 10:11:11 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ud5so22931017ejc.4;
 Sat, 04 Feb 2023 07:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPYELRlFV8w4s2mD+NwhDzTDZ9N/FFBC8a9zFFIEtf8=;
 b=CYWk3AJBu3SFq9tGsGcY97tj6hgZtcGnwfiAyl2g6Q9xvAOLCv55Ddh/dQ8558DKet
 x8TjUcod1Sa3ZrnIoABp3duTYpLIbRMoljH416SCXaev3Cbjz/iK0HZu+cpa6WLeFIl9
 msCwNih12aq1Pz/OpTdf5+W9QD/ZM9qQ0DXTJVEpXdqr8XBwqej0iIlq3PyvP14G5iVc
 y7hd1FTqrHCZK4Me1jE6IJd9/xp87mox0y0iTkA5b36xeyPhXhVMPr2EwMWFEMUHedxD
 zW/XFZc99YmTkf3LuenFl1mrZ6luMqXJbzPhdDhKft5nQvbApbNxJtFD5VWgJorTtSYf
 ySgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPYELRlFV8w4s2mD+NwhDzTDZ9N/FFBC8a9zFFIEtf8=;
 b=VUhBE5Xz5okuUn8A/QKOhf1sF/QKQTP6iNTvhrsa6NdNvWKZn2i65njDyMmTHlsHOG
 adKiyvLd2vC5Z4mss/CtpU38VTC2LXg7D3s4R9A9jt7+3pmAlbv3UPTLOIFxReO9McwP
 sJEOrMD3oi51ZEXN2WxckEW+BbC/StRXaMNPIpXO46E3lCOLUAYvX8OwLhoYaAvk1UTm
 hoUiS2XpB74wUoZW/D8Og3tn6foLd3ECMlkHkSk/III15s/3RCq+m62iN1PCU6g18RFg
 /oGPzcS3x4pPJC0Z213POF7B/2hNcQfKHjUPWkZZrtDcUX3YACZlw46e6NNK8myryMFQ
 YcxQ==
X-Gm-Message-State: AO0yUKXmIJcSgMv2noU13ywOrKZrEYNAqzUpVkqfQiB9TyUC/7T9gLRV
 3Kwb72zy5aprfnk0lGslgRUCvk878c8=
X-Google-Smtp-Source: AK7set/CD0tzk+xuenxj3W/QPe6SMokzE1EbORVEQ8n4bamR3JM+7aIPXlGLaSJtVkVEULeR/E6CcA==
X-Received: by 2002:a17:906:8a70:b0:84c:a863:ebe6 with SMTP id
 hy16-20020a1709068a7000b0084ca863ebe6mr12324233ejc.43.1675523468317; 
 Sat, 04 Feb 2023 07:11:08 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:11:07 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 9/9] target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion
 about smram size
Date: Sat,  4 Feb 2023 16:10:27 +0100
Message-Id: <20230204151027.39007-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

When setting up the CPU's smram memory region alias, the code currently
assumes that the smram size is 4 GiB. While this is true, it repeats a
decision made elsewhere which seems redundant and prone to
inconsistencies. Avoid this by reusing whatever size the smram region
was set to.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 target/i386/tcg/sysemu/tcg-cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/tcg-cpu.c b/target/i386/tcg/sysemu/tcg-cpu.c
index c223c0fe9b..8f5ce6093c 100644
--- a/target/i386/tcg/sysemu/tcg-cpu.c
+++ b/target/i386/tcg/sysemu/tcg-cpu.c
@@ -22,7 +22,6 @@
 #include "tcg/helper-tcg.h"
 
 #include "sysemu/sysemu.h"
-#include "qemu/units.h"
 #include "exec/address-spaces.h"
 
 #include "tcg/tcg-cpu.h"
@@ -36,7 +35,7 @@ static void tcg_cpu_machine_done(Notifier *n, void *unused)
     if (smram) {
         cpu->smram = g_new(MemoryRegion, 1);
         memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
-                                 smram, 0, 4 * GiB);
+                                 smram, 0, memory_region_size(smram));
         memory_region_set_enabled(cpu->smram, true);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0,
                                             cpu->smram, 1);
-- 
2.39.1


