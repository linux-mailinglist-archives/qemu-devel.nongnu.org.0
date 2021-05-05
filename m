Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47414374A1B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:27:08 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP2x-000198-9d
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnx-0000IX-1r
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnv-0004Re-7R
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJ65+lbAUX8QcisU4vuprIDcRwCJu4Ba2BnPDegiv8w=;
 b=BMmaabNmRIsjbi16SxVtD0nI+ZmOm3cSwhLPJUl7sR6A5MBz3MUBaRa6vehS0FbRyUU+mI
 M0SJhmprQMPtZdC4lgiRfAa34HG3IHn94ISwT5qz4rsaQN+nBD3lkcQwczbTbaYGNwshfJ
 I6rmkEmQHAS600mbgMrjBe9nlPOCm4Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-u6ZH4po-OvCljXQV0qisLA-1; Wed, 05 May 2021 17:11:33 -0400
X-MC-Unique: u6ZH4po-OvCljXQV0qisLA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso1218637wri.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJ65+lbAUX8QcisU4vuprIDcRwCJu4Ba2BnPDegiv8w=;
 b=awLjgMQY1OZLyixixI5C+qFPyuSxwINRiVHCa8HCl/vvreSCwzHSCb8MmnD/Y37xKS
 zOuQAnsVzG/0rwgqgLMCMXwJf2QEoUR5VQTV45zdNC1ny5OHIWeghH6hvbLTwWE12ZSh
 k6/i3SdX5li8qHINtEoDF0c/zqlIFATkb29/RoWEyxZLthmRT5Uh+D908I65PgHA8WPS
 5LB1oXn2E/B/HVPiFtVWTe10bYTbyYrFnrVX2ftjSrdZ807msy4Seje3UbkFDZ8IckV0
 e4XK4T3dO+VF0VI/Ln3iAodAgbzBMM8TLeu6efYHPnI4+bZB3aD9kIV6sqBJCaORXayp
 oX6Q==
X-Gm-Message-State: AOAM53092qIqk0cy4S4cNYpDWWyVzD/RRNIR7RHnsEuSG7IZIytFx5Z1
 TLh92UFv20nJm73DTAcWyNoixkktaxeOIDnUpS0e4Nn3c57PQNhLKr25RMuBfD9CAENrmb+TuRu
 ftZ9dmHiWwikTIQ+Qh6F9TYCDXyJzCfshohLxg0eOkRsmuF8uBvzVUhLlQzuWVNa4
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr12041994wml.146.1620249091869; 
 Wed, 05 May 2021 14:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzIMjK9/NTEFGGXqDWqO63JpMTqBTawCLT2PdxiP+MClvhrTwARMYmp46MDNqPPs3YusKXzQ==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr12041972wml.146.1620249091649; 
 Wed, 05 May 2021 14:11:31 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id t2sm7180507wmg.38.2021.05.05.14.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/23] hw/block/nvme: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:32 +0200
Message-Id: <20210505211047.1496765-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2f6d4925826..905c4bb57af 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -652,7 +652,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
     len -= trans_len;
     if (len) {
         if (len > n->page_size) {
-            uint64_t prp_list[n->max_prp_ents];
+            g_autofree uint64_t *prp_list = NULL;
             uint32_t nents, prp_trans;
             int i = 0;
 
@@ -662,8 +662,10 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
              * that offset.
              */
             nents = (n->page_size - (prp2 & (n->page_size - 1))) >> 3;
-            prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
-            ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
+            prp_trans = MIN(n->max_prp_ents, nents);
+            prp_list = g_new(uint64_t, prp_trans);
+            ret = nvme_addr_read(n, prp2, (void *)prp_list,
+                                 prp_trans * sizeof(uint64_t));
             if (ret) {
                 trace_pci_nvme_err_addr_read(prp2);
                 status = NVME_DATA_TRAS_ERROR;
@@ -682,9 +684,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
                     nents = MIN(nents, n->max_prp_ents);
-                    prp_trans = nents * sizeof(uint64_t);
                     ret = nvme_addr_read(n, prp_ent, (void *)prp_list,
-                                         prp_trans);
+                                         nents * sizeof(uint64_t));
                     if (ret) {
                         trace_pci_nvme_err_addr_read(prp_ent);
                         status = NVME_DATA_TRAS_ERROR;
@@ -2510,10 +2511,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
     if (attr & NVME_DSMGMT_AD) {
         int64_t offset;
         size_t len;
-        NvmeDsmRange range[nr];
+        g_autofree NvmeDsmRange *range = g_new(NvmeDsmRange, nr);
         uintptr_t *discards = (uintptr_t *)&req->opaque;
 
-        status = nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
+        status = nvme_h2c(n, (uint8_t *)range, sizeof(*range) * nr, req);
         if (status) {
             return status;
         }
-- 
2.26.3


