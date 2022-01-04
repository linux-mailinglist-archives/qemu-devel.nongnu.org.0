Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F9483EB8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:04:15 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fjr-0006Fe-3K
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fb4-0008JA-Qw; Tue, 04 Jan 2022 03:55:12 -0500
Received: from [2a00:1450:4864:20::42a] (port=42788
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fb3-0007sw-Eh; Tue, 04 Jan 2022 03:55:10 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w20so65680499wra.9;
 Tue, 04 Jan 2022 00:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60PmjFSOz4LxR71qC2E79A5XbDuODi29+fZxuczWIE8=;
 b=j7A2NkZebqOoWz09xC1EoxqzCYLROCu6eLnXunDkLMCGvCjAfxYB5BloqpknMU2OHp
 fLFr9l+cE/k19iD4xh08Wl32wT4TcL5W/buR+xr5OJ1M04bD5o/3+ZRbWXqZ+09YNVma
 Aum2JNTvfxUERosCUUrtGwCdsMB6DMWaGKQeWsNhL4sKoSYUXET5nVuCkr9sj89jB4sX
 6iQ2wpxhHO0X6aHbQorDedoYo2SXR0nyscjWa6R4HhVPyUNX1EAWNZwLc1EfSm2WjluE
 EWfbQdAO2+U1Qgdzzi6Wj9AXH7POeko0AqoIH8bLgdroyPR+85lATBKy6aigEU13HstT
 qVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=60PmjFSOz4LxR71qC2E79A5XbDuODi29+fZxuczWIE8=;
 b=PzPfTzKQN21oM/3KKirnXy6PVvynZmrg5gIBM1Ku8HcmW47+7KQcHuKBxb6JLiN84O
 DJ4ZAdxdhDdNKGxyPkBK+Yz4Rhjj/lcPwkwbPM9I9ep2W4pIMsKCIFCMncskcTEDIq7W
 wBW5vGsNmG4HV/73Tk74rar3UnaDUUK6o5fPiThEtxpH4OuIcaoRXlmuL0lHqZPlJp4p
 P7hqGz+XUwfQTa9gaKCSXorDYmmKDW07s0zNP8nnigxBSmT2FOn69tHzS4/mgKUaUXq9
 tcUhZzq4hl5K5zXPxJ9M7mtYLIIL1fv4hhBb+rJXJTlSJyXw6rlaEPGWYc1JyRUpCwiX
 /yow==
X-Gm-Message-State: AOAM532oIMn4Bx4dLwiG7l6q8Wpa3yY70FRKWYds+dGaw9JNrBKicQWr
 8nIPySoAraDlPLEkinprcWmM3wzZmNdRjw==
X-Google-Smtp-Source: ABdhPJzFavXeV9MJU5Gpvuv+L1ysPbD5FcDJkIJ0JaEuttyUiJolJg++YERDStfI1KvZIEqyHc0Jtw==
X-Received: by 2002:a05:6000:1861:: with SMTP id
 d1mr41723680wri.338.1641286507769; 
 Tue, 04 Jan 2022 00:55:07 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id o12sm41016147wrc.69.2022.01.04.00.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:55:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] hw/dma: Fix format string issues using dma_addr_t
Date: Tue,  4 Jan 2022 09:54:29 +0100
Message-Id: <20220104085431.2122999-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.33.1


