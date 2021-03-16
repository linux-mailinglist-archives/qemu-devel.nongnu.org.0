Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1A33D8F4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:18:17 +0100 (CET)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCOe-0007DQ-Jg
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7C-0000uD-TI; Tue, 16 Mar 2021 12:00:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7A-0000JD-0Z; Tue, 16 Mar 2021 12:00:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id o14so6942390wrm.11;
 Tue, 16 Mar 2021 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=GrZTqi7U3gcasp9/+Bg3Ygrl95eTyoYLpkTxp/aB/bkUBAqc5mnac4SJiJwjrd0ND0
 Y/GhA7PUz1EvoMmdYetCSYT+kK4ghSNZ6O9nnUNRxtfSuKlvoGEACWeP/t3qXzciT/YE
 zIATpKGm9NMuAizxUq+JOGXp9WsITyVtgAks5XHmzsN+sEsEqUOECPpXEhcMIYTw4OXV
 roVv2ykskKBXvWNYX52XufJN3y84C7MP6T+xftlBN8lJ7+9edAcw207cRtur79xG2VP1
 eMdKKp2w+G59MuW05TGLj9Cdz7uvfuxomH0JDINvwWuUjVZinsuYgsQcLNajVuIiT68n
 PQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sB3+w5MPiq5YtSsSHBffd76Yw89YjLssV56LPOeeU7o=;
 b=rcPD5BN9N7sOqUP/Hprh3PwAz3b4SGKShlbdpwRCuvkQm4/MQMeZQDB1CL6MRBAnOj
 AoZKbDTnlFaFGJGsyvufPNJ+0JVjyTMykOWDkPCgz7+6a/y0kRYYDetXPxLybzP4jQi8
 Dzc4Q7/zjQYKEwt92Z5Apd70Kf8bk53GnNjeeoyE0YoUh7nwM9Z96B0itc/MSGlkq3E7
 XfOBvDKA/7BR24UUFAJQYoPPF8fG2t5yaxhr3MJNEFzArK9+/TYE85bxNPv5Du/YMc7C
 qyt0uHoI+jFX+gBeYAyBlq2M0Of4V08i1zXwLxo+ft+9544G8FpjcfReDrUx5xy4Ry0q
 VIVA==
X-Gm-Message-State: AOAM531fN9d9b733e5V45w76uLmcedTqz0r3cQgrsrQcRlRFpO71E7xG
 91TiC44ejKd8EwvZuE9fvO6kl0sYizI=
X-Google-Smtp-Source: ABdhPJzXj0/+GM1NpiLIhdnOYsqHh5e7gnntlvz2vlvZ7KapdtE7Yp/Vs/ZkPIByTs1aTk4KH97k0Q==
X-Received: by 2002:adf:e4c7:: with SMTP id v7mr5741126wrm.245.1615910410440; 
 Tue, 16 Mar 2021 09:00:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] block/vdi: Don't assume that blocks are larger than
 VdiHeader
Date: Tue, 16 Mar 2021 17:00:04 +0100
Message-Id: <20210316160007.135459-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316160007.135459-1-pbonzini@redhat.com>
References: <20210316160007.135459-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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



