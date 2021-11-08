Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B54481FB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:40:21 +0100 (CET)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5oq-00065z-A9
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:40:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l4-0008A6-M6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:27 -0500
Received: from [2a00:1450:4864:20::535] (port=42562
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5kz-00074v-BT
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:23 -0500
Received: by mail-ed1-x535.google.com with SMTP id v11so60832124edc.9;
 Mon, 08 Nov 2021 06:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ENOdbTpjWaps6H1BTH69NWFKpPcyVeSjIgQ8RCGKNss=;
 b=hSiJ+4Aemx0rUvrzQzHgPd7p3v6g7psXhqaa2th5GiAwDwbsTh8QjPI1Ai9HO7lcEr
 l7viYS2MMEh66k/Wjs7mmduqnMmEiYo/vLfDyN7w/xc+nta8Wa49bbMnFwpQ8LBl37yS
 dI09kiPzah2vPEKLDoVOgFUY+8IBSSTRgqF6+Xaz5lYm/BP0Ft5n5D/OKR31D8dokfrf
 XteZOGogedWlUA2omiEWUXTiUXQulJjIFeyW+YE6Dukf9jXos6K8GKDfy8jEYiO2jVEo
 nWZdVlb0V5AIoQwZ6CeQ5oG+61n4aS75qjEWjSeWEJwTrAUGeN6Qe9/+P9r4+M+qRInr
 CL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ENOdbTpjWaps6H1BTH69NWFKpPcyVeSjIgQ8RCGKNss=;
 b=Uol6ad6C5r/8opPITw5YGp3LeNEH9iwypKmAIhpEft/sb0a3h0WoCtYVl/l9Fp01zi
 AMkI4STcSfVGKNgUF9wZ+q4NM98WTBWYFFG7kqHmDK0462abv6ydnk6ST0HNA57loNb1
 D7AHjlztquAxYBDrF4HhANXs+TtHubof/Nk53+0Nl3HNtfwHlGdCaUuqUFiZ1bcTDTpD
 2dxecrMbMrPWVt39NRFiM3DZ/TkVuKw4ZJJPYfzRjCIbWSqvqSFnCBuv4GQBe+U3andf
 FI0RnkeJxRHrbAfX9ZcXlKMzHgoCSgI4dDovdHG+JYvgx3KqzdXEPY3ZpLEdCzv5n9sK
 CPWw==
X-Gm-Message-State: AOAM5338aO2u2HPjFvex0zX5ZG4wvUDDqpSkgTzY7qFLJyocWG+ryDLx
 m/EQPgvbNhrM0pYABiuOK5fQRymUq1w=
X-Google-Smtp-Source: ABdhPJwvo4sXr96Qal0DWRqrDXiAF8fR8FX/BbXwKeRJHu3UyUKdrVp6YwjbavWueRf4k3JjF21LiQ==
X-Received: by 2002:a17:907:9707:: with SMTP id
 jg7mr298174ejc.533.1636382179555; 
 Mon, 08 Nov 2021 06:36:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] target-i386: mmu: use pg_mode instead of HF_LMA_MASK
Date: Mon,  8 Nov 2021 15:36:07 +0100
Message-Id: <20211108143616.660340-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly look up the paging mode of the hypervisor when it is using 64-bit
mode but the guest is not.

Fixes: 68746930ae ("target/i386: use mmu_translate for NPT walk", 2021-05-11)
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 7af887be4d..492b777de9 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -90,7 +90,7 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
         target_ulong pdpe_addr;
 
 #ifdef TARGET_X86_64
-        if (env->hflags & HF_LMA_MASK) {
+        if (pg_mode & PG_MODE_LMA) {
             bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
@@ -287,7 +287,7 @@ do_check_protect_pse36:
         *prot |= PAGE_EXEC;
     }
 
-    if (!(env->hflags & HF_LMA_MASK)) {
+    if (!(pg_mode & PG_MODE_LMA)) {
         pkr = 0;
     } else if (ptep & PG_USER_MASK) {
         pkr = pg_mode & PG_MODE_PKE ? env->pkru : 0;
-- 
2.33.1



