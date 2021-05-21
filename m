Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E638C9C1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:05:36 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6iS-0002OD-35
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lk69x-0008Co-OV
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:29:53 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lk69w-0004up-1H
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:29:53 -0400
Received: by mail-qk1-x732.google.com with SMTP id 124so7569615qkh.10
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O7rt0kZkDqC8mbcZmXOjgr37QsMYtJsCfMgtsKv2Vfw=;
 b=Drfxu7y+WnZWdP6hyvITG0NfTeqvxQteLjNXlRHzaxDQcYE5rKy+wUZfLAk+zxJMTg
 fdclJZvIz5MGH7Cstfcx5cs1Jd5xIT/T0HtMpwE2fwL3C9tVDCPg1CIHcwbV5ytoqQ6d
 23LrOdnnwr2OjctYEJQIXqW4MgcrwW/x24nHtNrFQyMKl7TbGQ+DPrimsT11hn+PDMsf
 Gz9P/HfOJkyHNkNcMJmkTo28nzD9GUoF3ZEzvbsOvpqjhHfsB7DY7A92mk/UTkjkhErN
 o9hjz2VNLamb2f6CCL7laIVoosdCrXTPzFyJByoZiAARz+W35Zd2275QY9l10OHzIUtN
 Orug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O7rt0kZkDqC8mbcZmXOjgr37QsMYtJsCfMgtsKv2Vfw=;
 b=XXCjDgDUnuUfhcgFqOdOStmezD/TGwOgrb8Oiy3bvU+qivYhTK7AOKgRRIQ0EEaHAn
 6b/PkSoCu8f4UiGRFrIbq1SuaqgOvsEmdqwxq8kZkj5saawefHIOCeMx2xtkdimX6XJZ
 EOdN3Lz7A7oLFopFz6Aox7vkM2YpZQhDlKnn50HgP2/NRSdhEePQRnVoio6IZstmOyNO
 FKoIAJS68vPxkugVa9wOwsX1pMNH9KEv6SA3OjNefuuKYexbIqMzpW5amy7mtqw88JOW
 sv0vXSmYjp1csqlBOYTRyi53ntulpFNbBDgU2PEZMlLzbIa1VFuCov4uaYtdoc+kVMWg
 hfnw==
X-Gm-Message-State: AOAM530Vn1SgT5v6/MBenLI93LFlt43BXnNCKvxFd3+GlyM56pycvmek
 x04e/yiBRrVMzgkGkOVkoLeDkLKUpgtrog==
X-Google-Smtp-Source: ABdhPJxwNyvwJ7nveqk6pOENIYmWSW3Mx9K20w4n3hXSnVABmu/FE5LLcfMfMf/UAY2xaigU7yb2Kw==
X-Received: by 2002:ae9:f113:: with SMTP id k19mr13056685qkg.483.1621607390397; 
 Fri, 21 May 2021 07:29:50 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id u186sm5106884qkd.30.2021.05.21.07.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 07:29:50 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi: Fix sector translation bug in
 scsi_unmap_complete_noio
Date: Fri, 21 May 2021 14:28:29 +0000
Message-Id: <20210521142829.326217-1-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 May 2021 11:03:35 -0400
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_lba_range expects sectors to be expressed in original qdev blocksize, but
scsi_unmap_complete_noio was translating them to 512 block sizes, which was
causing sense errors in the larger LBAs in devices using a 4k block size.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/345
Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
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
2.26.3


