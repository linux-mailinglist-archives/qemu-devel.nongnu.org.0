Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14A4B5169
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:14 +0100 (CET)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbE8-0003gd-7C
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJaVe-000677-AM; Mon, 14 Feb 2022 07:31:15 -0500
Received: from [2607:f8b0:4864:20::102f] (port=36556
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJaVb-0003es-8I; Mon, 14 Feb 2022 07:31:13 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso17191967pjd.1; 
 Mon, 14 Feb 2022 04:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWG4AvScN0e/qlwCNTTNBkLEAuHdc5j1KGAWJxWIMsU=;
 b=pkCQbLvU48nbTgCj80VTV8cEmoLXJb8ptb878y21rH1VS8NbBYx/hohURAeYPgkE0C
 z79H2F7BbKqPsFyXTiEyKC91zbYuRH9zTjG2M/TLRPZBJs82wGphBP+ggZH54JxBT0NH
 1+cU6ZPLDEyBMnWkRoZmB6fy+1EaZZfivjAZTU86A4xrQmfqNDamIfha1IBYRLzTYq+O
 VTc+Xt0z+5fSOFXH1NXCJIrt2hK7eKchqfcGEegCzUkNZYm71+sr5vkob8CoMInw8PyA
 DNYSnj2vnN1xFR/MXJUHU21gASindsqGJMjeEuC7jqAtmZzo/J6Ys1fMmcgcbHHthDWf
 nKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWG4AvScN0e/qlwCNTTNBkLEAuHdc5j1KGAWJxWIMsU=;
 b=MaJ8m1FukOl7sWGv2fzidUq/Zp7VSa6WWXk+jkwFn0OTQMTM2LmqJkjHoBZ2KrIxm0
 6A3EdIrvlaOj6Q7h8/UVumUAfmKBrQh5LOVTtviBl6ymOJZd5V2w7pNzZfj/TKreVztg
 PSepVDUldr7umPkgnNaUNpN7uB3X37UMNil9jHqdwtBbuxhFZ2xd68QJXrtiZl+mhBha
 IrV4kaZg6fZwctIQ0JDPd0MQ8jlYGBke+SzMNvJIm8MTn9M1gSa5rxnSa12bhiSdjuj7
 g2G/T3X0Sy69SyFP+VClenTUI5aDra+ZL+bMgZ2HgacyaRmCaQcNJb03qGgdfoVxkfc9
 I+Nw==
X-Gm-Message-State: AOAM532eiGVNnwW3Q0KKN6lSsKVlfNalIDBxoSq7kFJFRyTVUIARQ87U
 x5k3CQR35RhwHhPLBFFTX6NsW94Hv58=
X-Google-Smtp-Source: ABdhPJzRmqYoAfttbuB1gxzOXQbEiCkLrQxLjwPuurJeImJ9aCK3zDmNXEYXnDJQ0mfuNcE4hvVqIw==
X-Received: by 2002:a17:902:e80c:: with SMTP id
 u12mr14096581plg.159.1644841869163; 
 Mon, 14 Feb 2022 04:31:09 -0800 (PST)
Received: from bobo.ibm.com (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id a20sm30915653pfv.150.2022.02.14.04.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:31:08 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: raise HV interrupts for partition table entry
 problems
Date: Mon, 14 Feb 2022 22:31:01 +1000
Message-Id: <20220214123101.1546351-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Invalid or missing partition table entry exceptions should cause HV
interrupts. HDSISR is set to bad MMU config, which is consistent with
the ISA and experimentally matches what POWER9 generates.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mmu-radix64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 040c055bff..54fb3ce98d 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -560,13 +560,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
-- 
2.23.0


