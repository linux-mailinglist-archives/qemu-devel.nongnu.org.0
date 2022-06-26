Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FBF55B0EB
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 11:49:58 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Otx-0001n6-2P
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orr-0008EW-9t; Sun, 26 Jun 2022 05:47:47 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5Orp-0000AJ-NX; Sun, 26 Jun 2022 05:47:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id mf9so13329233ejb.0;
 Sun, 26 Jun 2022 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8y1YigI7ttxs3tTld6DKvzpRpRRmju3jx/o0m9Wy9os=;
 b=pCD3TQyytOn6s8CgipMMRlMe8ipJcM/lIt7qDuGLUPIXeg+yWx4ZdloptdUVNTKaDd
 sIqtC44UFMxDUCcPpiTrv/DTyFcxvk14BVhRcpSdhEXoaf908w64RBTvxNgIDr4RrQ+A
 qDHr74I4ghmr96AdkqiCMd+wk7vx9jqomIqAHyHMSFhdEvknJijiil+FPfF99ISYxHqD
 dxrbvGTN3OF/WlTnvJ/82NPHYogw5Rh3UyRYTonV0et257btT/LL3q1q00H1Vb6HENGr
 B58hlzz3kx3m7E0zYwSsRIvtuKla1CQeAPPct1v6EAPf4hH3zdy3eMn4TTSbjKGM1GgT
 gqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8y1YigI7ttxs3tTld6DKvzpRpRRmju3jx/o0m9Wy9os=;
 b=ehEw8AAPYzcpsRtjKEAVv+rpqFGvzJon6abiKBGfb2uqsaylL9OKVeO+Bq8xnqoqY9
 D16Zt0gElfsaO7o1W0n93IJj8f7bcZl06D/cmzVMihg+PdLLOTx4qkiP6cZCWaPiw/Hi
 /HFaampMwQo0vd92Bi1FUqXPm4uBo3B5XlM9AFbTAPowkKq3WOwJFlB54SEwuz4ZTsdp
 BEhQ5jwGs7hggnSYwtNiNHPOqhEOZnR5Ta7Qj0brh7GaJtn7Hc0EK1omdI4ozwADvcyM
 ZYEyymIX6k1QtqS4JWOaPVtMdnyy7iuk9DPLwGutQxZFI7qVrnD5yG0PZthu7Eqn7Dxm
 8/CA==
X-Gm-Message-State: AJIora+Tgld/LJPU0lpoYBQVVOHMbLHTHmG1wDWRoI2kveSZsy2xJ0UM
 7uOIH5D7XheQvPezd6aD733hMA3YBvo=
X-Google-Smtp-Source: AGRyM1v6iTzO4uMHp2vLzEWX53KPy01bIP+vC0hI0N/lRCRouLltezCBvCVoffSlli5cWMnSFE53BA==
X-Received: by 2002:a17:907:968a:b0:722:e508:fc15 with SMTP id
 hd10-20020a170907968a00b00722e508fc15mr7614907ejc.188.1656236861608; 
 Sun, 26 Jun 2022 02:47:41 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-055-174-013.78.55.pool.telefonica.de. [78.55.174.13])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090605c400b00706242d297fsm3504752ejt.212.2022.06.26.02.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:47:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/2] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
Date: Sun, 26 Jun 2022 11:46:55 +0200
Message-Id: <20220626094656.15673-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only user of xen_set_pci_link_route() is
xen_piix_pci_write_config_client() which implements PIIX-specific logic in
the xen namespace. This makes xen-hvm depend on PIIX which could be
avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
order to do this, xen_set_pci_link_route() needs to be stubbable which
this patch addresses.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c       | 7 ++++++-
 include/hw/xen/xen.h        | 1 +
 include/hw/xen/xen_common.h | 6 ------
 stubs/xen-hw-stub.c         | 5 +++++
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 0731f70410..204fda7949 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -161,11 +161,16 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
         }
         v &= 0xf;
         if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA, v);
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
         }
     }
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
+}
+
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     /* If vector is 0, the msi is remapped into a pirq, passed as
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 0f9962b1c1..13bffaef53 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -21,6 +21,7 @@ extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
+int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
 void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 179741ff79..77ce17d8a4 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -316,12 +316,6 @@ static inline int xen_set_pci_intx_level(domid_t domid, uint16_t segment,
                                              device, intx, level);
 }
 
-static inline int xen_set_pci_link_route(domid_t domid, uint8_t link,
-                                         uint8_t irq)
-{
-    return xendevicemodel_set_pci_link_route(xen_dmod, domid, link, irq);
-}
-
 static inline int xen_inject_msi(domid_t domid, uint64_t msi_addr,
                                  uint32_t msi_data)
 {
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 15f3921a76..743967623f 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -23,6 +23,11 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
 {
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return -1;
+}
+
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
 {
 }
-- 
2.36.1


