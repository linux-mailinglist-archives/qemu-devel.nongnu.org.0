Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA2694C67
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZf-0004og-0T; Mon, 13 Feb 2023 11:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZV-0004g5-02; Mon, 13 Feb 2023 11:20:55 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZS-0007xD-8T; Mon, 13 Feb 2023 11:20:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ml19so33359180ejb.0;
 Mon, 13 Feb 2023 08:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPYELRlFV8w4s2mD+NwhDzTDZ9N/FFBC8a9zFFIEtf8=;
 b=ZAAnAtxK9LtuTjod/R6PQ+l+OK/prV2D3SRceGlLTNFoxupCIO6oiq4pLm5uenFcal
 cnbcrztFoR1Rvb5H5mZPLbtcw2zw2eVBwhnisSv2hp/EZeyOuSkP86uy43NGKrokc629
 CDXONBFoxGx0YlhQnUvEVfaYmzKpneuq/jR7ItKxdk9NSE7qNLFRgo2P/QtSVG8bQXWo
 TMaN1VNqA5lOZKpkVP99fABfC9eqNV7XCnghyJTs6vJ02glWTNKayzqcciL5jNnJuq/S
 KtKnNgA/b8VdyUsgoqLowLyJu0PEFT3sYk4Vle+9jmBZoGpnwn2+aZJvQPQTJNKKjOfR
 8Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPYELRlFV8w4s2mD+NwhDzTDZ9N/FFBC8a9zFFIEtf8=;
 b=f/MMqYGk7egiBvilyl/UgXFSt4mJV9XO30el2xdi19B+2sVaGXz+MbNNxS0GN2RH9I
 AgCr+vBuQMT1luVnjOg4h7fI8RDnZiORhNhAYncpnqfLtSS9puZ7SLBv8kzBlLGVeGDR
 V/Wr5VvS28FARN72WYiMMhBtXqe/H7jm0WGpPhPlxQEB+5dnUa8PAcMim7FucQa1A6sS
 EPBjs6ov2NXKgS/QYQ83tVkaWc3FXmy/pDFDf1PtOFDb+q4LRFi+JqhKm+6PSkDHTTPa
 8XZBdKVo9U0bEgPYS7FtqGXPA/79VJTSvDSZ4YEMvk/hn6+gHvWecyvPexPFTBj5yfOv
 tPng==
X-Gm-Message-State: AO0yUKUBFt1QgJ7U2E2lts8KAhk1ygwi8xrJKupfCEDWoRuynniY2A96
 KPS+k/2GMEvyxkh9RQl2H1vzgPZGr8I=
X-Google-Smtp-Source: AK7set/iLM5msfhQ0NntqqM0xgMoWoYp+tTrRlaX749GUixJm5ndLSMTsH9hKcpaq5DjmhtMduxa7w==
X-Received: by 2002:a17:906:a297:b0:8af:22b4:99d2 with SMTP id
 i23-20020a170906a29700b008af22b499d2mr15993196ejz.5.1676305248556; 
 Mon, 13 Feb 2023 08:20:48 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 9/9] target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion
 about smram size
Date: Mon, 13 Feb 2023 17:20:04 +0100
Message-Id: <20230213162004.2797-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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


