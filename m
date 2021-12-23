Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9947E32A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:25:14 +0100 (CET)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N9l-0002m8-PK
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjx-0001WI-3O
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjv-0000tB-A9
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIMQ6+5zcOJyU3/jxVV3Bhh/HwifxZgqMUUJxuhYIK8=;
 b=V3MSy1KQMcCauM9AUhG4DD3p/YiReRdQ64IQMI8Nxjg6Hoel/22Qsb7niA8FtpbH0uee2C
 npsONPjs3NCVwWUyjqE9+iKx1bcW8+hFtdpDgTVAqhlvWOG9tZSeqnWeJh8SvNb50lFbXx
 278nE6g5z9ahCuStp1LVy5vKlUPW0jY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-hOCtPbPCNKKxMHkMVSAL4A-1; Thu, 23 Dec 2021 06:58:30 -0500
X-MC-Unique: hOCtPbPCNKKxMHkMVSAL4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 r8-20020a05600c35c800b00345bfa31160so1892392wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:58:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIMQ6+5zcOJyU3/jxVV3Bhh/HwifxZgqMUUJxuhYIK8=;
 b=QCH8yr6CpQGzyq9rD+tvvupnicuIK2rP1zjC3bw4Q3d6p1QpBfSafaPTajvLzSIdtd
 PtddIdqquz37eFxkSBgptP3dYukv9PWjci8/6l235uA6xc4X4OVoeMAXfPzTf9bNb8xh
 rP2/ApFwr8erlx2ueKGzj8yM97kKWXk1ysHc83WkTvXC+8drO0HBq4J50TuNhDnMSQj9
 hH2xvNvUgv8XlryeReSMLMP3KwX53Z0cqLTYlORdMLV7aWoHbd9+CACH7ZiAZDTHsjw5
 cP2JkZwkm005tmyjp+VJ1mWSOM2SGyzXU9oDyll5Rr4QyVplmPCSFqj4D7o+h2QOC2RP
 y1gQ==
X-Gm-Message-State: AOAM533zv68UmKGvRwCnJ6hpkH1KKUXyrl8Liur5LBxQ590QKqwybBdU
 pfPHe10MW4eMzlJa+lzhkG9IXEFpvjNp9PHSUxnnR2MOiBV+klxGdIFrsT3e83RHGlSH8pMplRE
 gGSwecbGOCDwOchhkn+ZsVQmNUxoRTGapOpis+OGrnOhLGOLVUty0+COl9J9kLm6r
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr1453693wmj.3.1640260707566;
 Thu, 23 Dec 2021 03:58:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLg7ZBmot/JWFarBL1366EEW2gjsu8I9BPhoO0enF42tjxKy/3erccjpOE4zYy85mbwd1wfA==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr1453641wmj.3.1640260707375;
 Thu, 23 Dec 2021 03:58:27 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id l13sm5229854wrs.73.2021.12.23.03.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] dma: Let dma_buf_rw() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:41 +0100
Message-Id: <20211223115554.3155328-11-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling dma_buf_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7f37548394e..fa81d2b386c 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 
 
 static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir)
+                           DMADirection dir, MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
-                      MEMTXATTRS_UNSPECIFIED);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


