Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C919448B638
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:57:43 +0100 (CET)
Received: from localhost ([::1]:44388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ML0-0005fZ-Pa
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:57:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7f-0004Db-V6; Tue, 11 Jan 2022 13:43:56 -0500
Received: from [2a00:1450:4864:20::433] (port=37715
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7d-0005zt-10; Tue, 11 Jan 2022 13:43:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id t28so27952578wrb.4;
 Tue, 11 Jan 2022 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dm0cTZ0uVSvTrDWViyeYPNq8wk38OYgLeR7LOGaCswA=;
 b=GTkvDChf/M1exQtEg5hKnj1aaRGNqPLaxBgTDY7j51nX2O+GALdD52PMiGBNY8cffI
 p6y5Cr66MTGhocVpOTuKvaWUy4uyhWZwCrpC8QD87yrKx/nK2Nfc9G7Bij5U8lODg2Gl
 2iOEbPQWBhYlm1GcfDyblYkiH03pm5izReIu0+chgsCawKuVskj8J1+4UMBGc/3JRnAz
 a4mrwU+3svczI64J2/dU7wkgVWjN0fayfe8PuBiwYo08pEs7e4s/hCYZM5Yj54e6bzmG
 up0HUgiNMppx/5KamUS+8cHMzUf0AC8A/JC8StL1se52AzWYW0oOJYuMvfmBhaj/FJhF
 H9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dm0cTZ0uVSvTrDWViyeYPNq8wk38OYgLeR7LOGaCswA=;
 b=HcJ2RYS5vGLpDIhg7x3Nhd6qs938/TjlVewqWpgb7VtKD2XQtQmEyd9twQv0o2tgVm
 AfBnYtjxcfCtg3Z4gXPj96oakpxOg7BcH78Ssmdn63/vD6KmlS20HU5UvXhcxCUWMuC5
 aytmyXfrn7ZHEbuyeRAs1n2c5/KeRITWHaJrQLGqHlkxvt0IhIjqyvZI6tEtG36jB4xE
 i4u9Y5dNtiasGXjYA38hxgY+KIe+Fzj2GoXOo9nS9/cI4G5rhhORahMjdYE2jzlS4u9u
 sVVduvhMxyuqcV84DUsON8v8Ol0lax5/PMvFVlm3w2jaXyiHSje7YPnkMCpz9qq3axfn
 hNAw==
X-Gm-Message-State: AOAM531oKaDWxnU5H4Z809Qs8TL9tIJbFxDAmLBiT8395I/stY0UOsfT
 VR6rTa3zqTZRvWAmaQ8bIBEvSBZtC0xbEg==
X-Google-Smtp-Source: ABdhPJwsjMfmd1A77RNyRNP/t4rHrWSfdSEqSRn0uS0PegxbAxv2977464Rjx2qJ36Oc63M+1J435A==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr4937917wrs.192.1641926631213; 
 Tue, 11 Jan 2022 10:43:51 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id a3sm11151508wri.89.2022.01.11.10.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/10] hw/dma: Fix format string issues using dma_addr_t
Date: Tue, 11 Jan 2022 19:43:07 +0100
Message-Id: <20220111184309.28637-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/ahci.c        | 2 +-
 hw/rdma/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 205dfdc6622..6c727dd0c08 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1159,7 +1159,7 @@ static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
     ahci_populate_sglist(ad, &ncq_tfs->sglist, ncq_tfs->cmdh, size, 0);
 
     if (ncq_tfs->sglist.size < size) {
-        error_report("ahci: PRDT length for NCQ command (0x%zx) "
+        error_report("ahci: PRDT length for NCQ command (0x" DMA_ADDR_FMT ") "
                      "is smaller than the requested size (0x%zx)",
                      ncq_tfs->sglist.size, size);
         ncq_err(ncq_tfs);
diff --git a/hw/rdma/trace-events b/hw/rdma/trace-events
index 9accb149734..c23175120e1 100644
--- a/hw/rdma/trace-events
+++ b/hw/rdma/trace-events
@@ -27,5 +27,5 @@ rdma_rm_alloc_qp(uint32_t rm_qpn, uint32_t backend_qpn, uint8_t qp_type) "rm_qpn
 rdma_rm_modify_qp(uint32_t qpn, uint32_t attr_mask, int qp_state, uint8_t sgid_idx) "qpn=0x%x, attr_mask=0x%x, qp_state=%d, sgid_idx=%d"
 
 # rdma_utils.c
-rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRId64")"
+rdma_pci_dma_map(uint64_t addr, void *vaddr, uint64_t len) "0x%"PRIx64" -> %p (len=%" PRIu64")"
 rdma_pci_dma_unmap(void *vaddr) "%p"
-- 
2.34.1


