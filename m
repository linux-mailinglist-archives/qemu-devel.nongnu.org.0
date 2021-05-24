Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7538F211
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:12:49 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE8G-00060F-CY
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeW-000571-JW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:11 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeK-0004Q8-Ga
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:03 -0400
Received: by mail-ej1-x629.google.com with SMTP id f18so12625143ejq.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDuY3FOPTKsIVSVkuFvz8ny58BlbRg0sWUb7PMImOzk=;
 b=Z2OreiscSluR+xn/NPAsxr1bmgKboU5qicwZToOSGL01nXblzUBrHVLyoGUCjyxQ0M
 JJSE8ySq63NK8AZqHDqszqI5CT/va4PfVbiBogRsuuoilxdQ3asmbXS0X6EjyEWcDuna
 +jaHhzgCSxQys+Nn4NqMz7mJ+m5sSCVdoB63F5HD7GMmjSZgmizTbzdLdWvRxUr5sJV7
 jnLu6gXSuwFXVhIiqioS3fkEPM0KE3FugYFxPm4VPT2kjWwTY361CWyvpfHqIH0Ev+DB
 aLf6M8n9n5x2o3TpvGqkHyz7SnS6Bv/zwQ20/GYGBgTBUysPW7zUd+s+eO1itJeV7lcl
 T0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zDuY3FOPTKsIVSVkuFvz8ny58BlbRg0sWUb7PMImOzk=;
 b=Fk6IBwGlV36tTq762dSEaz1cA7rRMQ4GXiA8zeGwG+58P2UDjXVql6FUnar1ve8Gxe
 jY0KjHdDuxxafIxBViBd7V1wUq8zSmX+gcXtpexXAjDig1u07UsBp9sIvtgbqabO2/v5
 OhANczULbddhDE8z7ms+o2J4jkLf7k/IZN2+VnUuCpsYjxbBG7o99E0Y+jCjW7kPjPJN
 y3s/EuS1N5e1rI4R8iS2PV6yvmhaqdHAoiKGCS7WLuI+tSUnaVqe4YybBRmPgoVNKKcV
 9PKf1MHuZs7CgztUumCg47JE865z9rMx+0WIFlkJd/G1KoM5craHE02aC42AYVbFpQMY
 Ag1g==
X-Gm-Message-State: AOAM530rXbAZH5ABR5fBiROosaFoWrU3Jfav9AJjvDlqi1xguzQqj8oD
 DJwiw7lwRInWWTjEDTAO1qs2O/D/Pp5Jcg==
X-Google-Smtp-Source: ABdhPJySBfbbuM7/tWQEP1Er52iCRde4r1n3pHRqvJ73VecQscymRIyEpqfHMs3HOxfIT4G91lXsaw==
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr23785885eja.547.1621874511189; 
 Mon, 24 May 2021 09:41:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] hw/scsi: Fix sector translation bug in
 scsi_unmap_complete_noio
Date: Mon, 24 May 2021 18:41:30 +0200
Message-Id: <20210524164131.383778-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kit Westneat <kit.westneat@gmail.com>

check_lba_range expects sectors to be expressed in original qdev blocksize, but
scsi_unmap_complete_noio was translating them to 512 block sizes, which was
causing sense errors in the larger LBAs in devices using a 4k block size.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/345
Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
Message-Id: <20210521142829.326217-1-kit.westneat@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 3580e7ee61..e8a547dbb7 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1582,6 +1582,7 @@ invalid_field:
     scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
 }
 
+/* sector_num and nb_sectors expected to be in qdev blocksize */
 static inline bool check_lba_range(SCSIDiskState *s,
                                    uint64_t sector_num, uint32_t nb_sectors)
 {
@@ -1614,11 +1615,12 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
     assert(r->req.aiocb == NULL);
 
     if (data->count > 0) {
-        r->sector = ldq_be_p(&data->inbuf[0])
-            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
-        r->sector_count = (ldl_be_p(&data->inbuf[8]) & 0xffffffffULL)
-            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
-        if (!check_lba_range(s, r->sector, r->sector_count)) {
+        uint64_t sector_num = ldq_be_p(&data->inbuf[0]);
+        uint32_t nb_sectors = ldl_be_p(&data->inbuf[8]) & 0xffffffffULL;
+        r->sector = sector_num * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
+        r->sector_count = nb_sectors * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
+
+        if (!check_lba_range(s, sector_num, nb_sectors)) {
             block_acct_invalid(blk_get_stats(s->qdev.conf.blk),
                                BLOCK_ACCT_UNMAP);
             scsi_check_condition(r, SENSE_CODE(LBA_OUT_OF_RANGE));
-- 
2.31.1



