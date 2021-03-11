Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5503378C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:08:08 +0100 (CET)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNr5-0007bz-6W
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKN3F-0004eR-9E; Thu, 11 Mar 2021 10:16:40 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKN39-0001zX-CK; Thu, 11 Mar 2021 10:16:35 -0500
Received: by mail-qt1-x82d.google.com with SMTP id u7so1361447qtq.12;
 Thu, 11 Mar 2021 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5HRq2jicD595BmWdGmB4bullPdtRS2N1TXJwqYMkI4I=;
 b=t9DNXwJuMyzutDWZRZ4a4TqMi0oWu3YFhLSyAexlNRbpPJ+gZjLBzAeGKVvYjTa/Gk
 yVPJ2CALv3qq+XLSsx2eb6f5y5IJllx5riIthR7haYxjAPH399halDYTbcQQ7MVBa+iB
 mZsV0Wwb6ejD1jqc4S3u72mCoiibYRmnv6tuPZfmJ2beu4kXxCuH60+4xoJI5AdyCu3e
 ajhxpEOsNN4Q6vZVMGRkiLSb6kiqDqtf1IiK+1B5BWSk4skMtMWjymgZ98cjoWzOcyXZ
 bNCvykbUx4lMplYu5wZtl2K0O/cU8SYdIbG7CmkmenLSYeL2JwUvd4BolbrQ0qVMF3AV
 2iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5HRq2jicD595BmWdGmB4bullPdtRS2N1TXJwqYMkI4I=;
 b=i4VYw6kZu3zohVSi6xEXBemRnI1n8oIgoxvA8kj1fsp2RiiEvmVCE4QQcwzc1lMWD7
 yxc+TcW+gUzL8kzClfQGfF3kKwMx6rqHz9T8dUCi7XI/uX5u2SX8Ilsjo2E62xK1ozG3
 UzunrAu+N4VBN5rJ5cQGpNafNl6A+O3bMuleLynK2sMzi5kOeAR6Ds15sT1pcmXnpvS/
 +yJ9iqx0dtkIpJGaRKVrLQEctD/9F4JjNyPrMW13YMTSTZ6I+tuTR4j5DiC4lgjLBZEQ
 SnvLeJKR84prAVnxwe2V0cNUlBtr4WMLz+O5ET4FVul9e4oLnaQcR0k1WN0g94MO2Nwu
 q2Qw==
X-Gm-Message-State: AOAM532u0XheluhtjPTVZoI+PKTt2D5v0gtUgrpz4Nb8PCnGuU72HsB4
 15DU7pkhKZ6N9Tb4keA69iI7knR4lSL2TQ==
X-Google-Smtp-Source: ABdhPJwa9rvzKLtcTqfTdUrfGr9d/YKcgz3m1L56Ga6p31iOYQcQTZBH7Wb3Z/5ndQ5tJO/EBNc14g==
X-Received: by 2002:ac8:498d:: with SMTP id f13mr7701809qtq.54.1615475787622; 
 Thu, 11 Mar 2021 07:16:27 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id z11sm2212374qkg.52.2021.03.11.07.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:16:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] spapr.c: remove 'ibm,chip-id' from DT
Date: Thu, 11 Mar 2021 12:15:57 -0300
Message-Id: <20210311151557.705863-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The attribute 'ibm,chip-id' does not exist in PAPR. This alone would be
enough reason to remove it from the spapr DT, but before doing that,
let's give a brief context on how and why it was introduced.

'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
commit references kernel commit 256f2d4b463d ("powerpc: Use ibm, chip-id
property to compute cpu_core_mask if available"). In this kernel commit,
the 'ibm,chip-id' DT attribute is being used to calculate the
cpu_core_mask in traverse_siblings_chip_id(). This function still need
to consider 'ibm,chip-id' not being available as well to avoid breaking
older guests.

Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topology
construction") removed traverse_siblings_chip_id() and its callers,
making the CPU topology calculation independent of the 'ibm,chip-id'
attribute. Today, the kernel uses 'ibm,chip-id' for PowerNV related code
only - the pseries kernel does not rely on it.

All that said, since it's not in PAPR and the pseries kernel does not
rely on it, let's remove ibm,chip-id from the DT.

CC: Alexey Kardashevskiy <aik@ozlabs.ru>
Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 85fe65f894..d2e448fd9c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -657,7 +657,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
     unsigned int smp_threads = ms->smp.threads;
-    uint32_t vcpus_per_socket = smp_threads * ms->smp.cores;
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
     int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
     SpaprDrc *drc;
@@ -744,9 +743,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
 
     spapr_dt_pa_features(spapr, cpu, fdt, offset);
 
-    _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
-                           cs->cpu_index / vcpus_per_socket)));
-
     _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
                       pft_size_prop, sizeof(pft_size_prop))));
 
-- 
2.29.2


