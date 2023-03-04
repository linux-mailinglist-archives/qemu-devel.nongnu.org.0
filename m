Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAD6AAABD
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmt-0003Lo-5E; Sat, 04 Mar 2023 10:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmp-0003Dy-US
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:04 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmo-00089G-Ah
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:03 -0500
Received: by mail-ed1-x52c.google.com with SMTP id j11so2097955edq.4
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytlxY0zu3YbNBlg2oKGSu2APVkm2r+KYa2pKwsCh7sI=;
 b=Jz8nEQFCzRoD10+qbx9R5hPCWum+hFJXidyKp8/luaWBZkhFw7Ti34t9T13qDoH2Ea
 HYZ+qmhJUyteSyoUNJl0bbcsg0ScMqofPrHqNesgia6kQKPGktLTw6HH0a9QZZeek3Jv
 G86MpiQzNCcR1/LoChYnhd9XFYoJIBUtgntOeXaceZpRV4bRzNA8ZHGgzTUCJ6fXSXcf
 dJXX6Y29io3NVaRqg//SEmjbJPv1iLCZBN0nMuM/AstsIKXKlrbKbJGfjBuHFGB4Eb11
 2K/FyEsh/q+p95FZUhizS4Q0x66InNw3U1t7i5Qj86gDUCDRbe+dVuyHK3QSddhUTuPp
 LjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytlxY0zu3YbNBlg2oKGSu2APVkm2r+KYa2pKwsCh7sI=;
 b=wnhHOm4a689tKf2Fn25fTUgtZ/eZnclg4jOC+VpfZbqNayMzYlRxWKgoMIVuO6s15g
 RNqXraSmiIsZH5SdMKjJ9PLqIkLsUxO1kUpDTHjl6RUoW/+X9Wz/WnlFP1XuTPPgIaA0
 qztu67rICqP7qY0Eb0y9CieBxgjeDY2giptWIDq8p/il4eexLcbbrtzDF7rZrJmL025n
 Jc3QJ0Zcdm3xWEm5nqrLAmrGDTTEtVtk7OorETp8LVGTiTNPowvw9+Uyx6Wt/cxdHxBm
 w9JMlEe+D9UmSW7aFYEPGTckwXMH3w/F70+5jSxSX/x5Y/lyXChfwedxRB6aKY59+/bC
 vVkw==
X-Gm-Message-State: AO0yUKUgS3W1ebR0hkBICeIonYxZpqtZwsI85XpbsB8/l5Q9iNZV/2Ab
 NXws2B564PVIxtQkIn/pNOn8M9hjMFQ=
X-Google-Smtp-Source: AK7set/SRdMm6RO6h7ZxEUIc34emNcIDK09YXyZR7iMp1562Rqy0iZDxrTyG4rJPGSjDkgSB/rnvsw==
X-Received: by 2002:a17:906:6a0f:b0:889:d998:1576 with SMTP id
 qw15-20020a1709066a0f00b00889d9981576mr6913416ejc.66.1677943619653; 
 Sat, 04 Mar 2023 07:26:59 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:26:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/13] hw/pci-host/q35: Use memory_region_set_address()
 also for tseg_blackhole
Date: Sat,  4 Mar 2023 16:26:38 +0100
Message-Id: <20230304152648.103749-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

Commit bafc90bdc594 ("q35: implement TSEG") uses
memory_region_set_address() for updating the address of mch->tseg_window
but uses memory_region_del_subregion() and
memory_region_add_subregion_overlap() for doing the same on mch-
>tseg_blackhole. The latter seems to be the old, cumbersome
way of changing a memory region's address. So make the code more
comprehensible by modernizing it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 40bfe99910..0497194983 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -404,12 +404,11 @@ static void mch_update_smram(MCHPCIState *mch)
     } else {
         tseg_size = 0;
     }
-    memory_region_del_subregion(mch->system_memory, &mch->tseg_blackhole);
+
     memory_region_set_enabled(&mch->tseg_blackhole, tseg_size);
     memory_region_set_size(&mch->tseg_blackhole, tseg_size);
-    memory_region_add_subregion_overlap(mch->system_memory,
-                                        mch->below_4g_mem_size - tseg_size,
-                                        &mch->tseg_blackhole, 1);
+    memory_region_set_address(&mch->tseg_blackhole,
+                              mch->below_4g_mem_size - tseg_size);
 
     memory_region_set_enabled(&mch->tseg_window, tseg_size);
     memory_region_set_size(&mch->tseg_window, tseg_size);
-- 
2.39.2


