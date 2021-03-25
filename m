Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42932349042
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:34:00 +0100 (CET)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOFT-0008BH-9c
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBP-0003Vc-Qy
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBO-0006hS-Cl
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:47 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4183704wma.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tnr9N7af2ViS1uL0xjvifCX4tlVCM+d0rldwp52WGRY=;
 b=QMmkhFCLyPGPkNqblRf540DjJ/fse6cNc8l/Bl/byMmLrxpQxZbweTkhxTqGHN14T5
 FWEyqbLPKYsjiDLepIM6vBYu3+mfkIptik5UN2Pu7jwIkEnT5PaKS4vx0RBWqRASrZ0y
 JBehMo2zc3NNw5LhnuHJ3WzArxCon3nl6rTjqRBpIEfqVVT0peZmgeUNJSzMnfDh7yq5
 urL3nsPB8Cq0tksjiBDKWbHvMiM92UggcGMZHuah3kLgY+UaQ23hErCGom50jMMM6CwL
 FPP1ClVbBa2bTTr3wcQRHQEA5osK3F+ikAScCRXUCNir9ZYhqWGFeY8FVuGIudyyDScI
 m8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tnr9N7af2ViS1uL0xjvifCX4tlVCM+d0rldwp52WGRY=;
 b=T1DslXQDrvN6qkogNdGXkX7ls/UKqBBtc4XXvGCmK0BFVP8H4UF1X/ALm31K2y4opk
 sP6lM2IKNwGuBJkczgnffaYMWA61frd4owocigJF/pxW0Kb8C7cYOJRG2gZxxBJPE/pE
 9csICNETx60HZyTdTsb0JYUYX+IyCsq0CVn0cx87Y9RSCnSptWChJL7bNzO3BJ02LUnV
 3QlmcdZwIFLG/qJpp1SM7akbX73Y9I9QQZ+3SGx4Nn13ws8TGVROafFVh9ikjXedhW7v
 AyEOfZTO0AFME9Omuf14/2i42c7SWqfL7cvBitApznbYKvkDdODdozJqoL++trsuu2/p
 4Lcw==
X-Gm-Message-State: AOAM531FU4qKluL/FsuVG9BdWDfgqfwC3RMLX2FRWf8SbmhZ/D2R89lW
 bv7OADgAKfzVs6Mgej2X8uSo090lQH8=
X-Google-Smtp-Source: ABdhPJwzbnRTETEdHdK1NCB50FKfLw21FsXUooax6R4RYJGjdDvZk+Gsn8ZvDPOa5V/jHiqzdtWjPw==
X-Received: by 2002:a05:600c:252:: with SMTP id
 18mr7280562wmj.67.1616671785094; 
 Thu, 25 Mar 2021 04:29:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/6] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Thu, 25 Mar 2021 12:29:37 +0100
Message-Id: <20210325112941.365238-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: david.edmondson@oracle.com, stefanha@redhat.com,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Given that the block size is read from the header of the VDI file, a
wide variety of sizes might be seen. Rather than re-using a block
sized memory region when writing the VDI header, allocate an
appropriately sized buffer.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-3-david.edmondson@oracle.com>
Acked-by: Max Reitz <mreitz@redhat.com>
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



