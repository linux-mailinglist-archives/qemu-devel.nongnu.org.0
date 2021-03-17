Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBD933F043
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:25:06 +0100 (CET)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVEX-0008PN-Me
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6Z-0002H2-TS; Wed, 17 Mar 2021 08:16:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0007ip-Dv; Wed, 17 Mar 2021 08:16:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id p7so2239528eju.6;
 Wed, 17 Mar 2021 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=VPa7OkfIBFuMIPg6IXR6b2rNuIdaNT2vqM7FR5TnUc5IDHTgJku2n8YeUsZdu7QctD
 fSh2lJ26+N5OxiYx5Pg84+bDVzo6DsOIoaO/xhRvf2bFItf8LANrCbKDx+iO6qSrghke
 6FqmsFZwBcO5ger5S/MQhENcDqs80hgwleN3uj1srKBweAKWSYQWZJMTneU88SgO++bP
 EfoQWRRfi0amPcAXjIU+GsBS9JkbQG+1jXjPMm2Ux361Z9KYLi2z3InUrFNdUhep19ts
 c9k9W8Y4g5dRfjQmWhAqlM/m5XtT2cwm44u9oGK1qojPvtMS4Nh7ekpAVTkXZD4UYWda
 mNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=CKRt1cYpZ5yKWnfu7o7MaghVsFpE9PrjepZSQO8YriP8JKEDZR02MGfrnHNtZo8Adv
 N3jcGzZaqnPNoKSKRgXmn3/hLJyfDtIIRuB9T1qS/OwR5Hj83sBNDDDUANEW/qtffypK
 jHTdFybTiDVPWa7g0jaoGZK7iZ5JmUOgQRgcEFRx8YK5an9w8oaFw/5xtoLPRYQraUkN
 Rh+NuIroTCuPz0m+qSHjd+8JBm2PN0fiL99ZvFhXOvEGM7QceJa6TnhNZ0wP8lwSFYCQ
 gUrgSZ7FRYyRjtTTZAGhfCndklzB/DtO8ZmXri7E84y/xK+RVSBRTg9pwI6tH66vuKSa
 W42A==
X-Gm-Message-State: AOAM532L26pfbvjo5POTj2F17XNZlMwtaCH/ns9xYaRkWtBY+j1qwpMJ
 R6pPR5NhQEycXkV9HZHtrkkgJhCVFTk=
X-Google-Smtp-Source: ABdhPJy3dE9kGJ7QL8WMi98Ffukvg8Y9sTxeBUyR/opbydoGRQTbu9Sl7jgBkJWxc49nRWb5l5BheA==
X-Received: by 2002:a17:906:2816:: with SMTP id
 r22mr34459159ejc.2.1615983404471; 
 Wed, 17 Mar 2021 05:16:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Wed, 17 Mar 2021 13:16:37 +0100
Message-Id: <20210317121641.215714-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Given that the block size is read from the header of the VDI file, a
wide variety of sizes might be seen. Rather than re-using a block
sized memory region when writing the VDI header, allocate an
appropriately sized buffer.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vdi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 2a6dc26124..548f8a057b 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -696,18 +696,20 @@ nonallocating_write:
 
     if (block) {
         /* One or more new blocks were allocated. */
-        VdiHeader *header = (VdiHeader *) block;
+        VdiHeader *header;
         uint8_t *base;
         uint64_t offset;
         uint32_t n_sectors;
 
+        g_free(block);
+        header = g_malloc(sizeof(*header));
+
         logout("now writing modified header\n");
         assert(VDI_IS_ALLOCATED(bmap_first));
         *header = s->header;
         vdi_header_to_le(header);
-        ret = bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
-        g_free(block);
-        block = NULL;
+        ret = bdrv_pwrite(bs->file, 0, header, sizeof(*header));
+        g_free(header);
 
         if (ret < 0) {
             return ret;
-- 
2.29.2



