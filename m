Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B16C130F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFOd-0002v3-Qh; Mon, 20 Mar 2023 09:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kozlowski.mateuszpl@gmail.com>)
 id 1peEpt-0005tj-En; Mon, 20 Mar 2023 08:42:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kozlowski.mateuszpl@gmail.com>)
 id 1peEpr-0007TY-D0; Mon, 20 Mar 2023 08:42:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id o11so12288398ple.1;
 Mon, 20 Mar 2023 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679316114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uELllllIT6ap0txurg9j0z4sGzWjdXJWHDI95ZuPdr4=;
 b=Exklrgzz0xM9Y0OZRIdvdoIHmDxxVfhIfqatPr6w9FJU+/SrVnT0XoBTPXsLQnzF+O
 M1CvZR+5QkzcZRFaegxAuSUeU24CPbDPjL+GJnYd7At0FQk5rIzE2Wj02ldMEtJKPF4b
 /PfwbOaywPY2Qf15GNZJHjpjECAOp7SCS0fg3cKEiwaqAxLMCntPkT4VTJdlz533qBvV
 gVQIRoG/crWcJdZerUB5r3FqcUDrIrtwEHpyeD/ysiqY+DZ2/in4133GrVuQzFI7I6pD
 kTpLxZcvEyo/hHqYFqL7RkocBYwQivW5grZ3oGBqvMPz69LZLOO4j0+X2fC8A6Ch5+qX
 jZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679316114;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uELllllIT6ap0txurg9j0z4sGzWjdXJWHDI95ZuPdr4=;
 b=oG43SAO3H1AKkih0Pl51E1Y1f7u/DEA4sudrhhIqfptVY5Gie7y3eODzWYSeSzwaIr
 auc8GGtCTR43CjjqVfJP9/kgeKVTJpYTW1e2ia1b0bNcXjhJNgsidTMWfIB/9TzUYFAn
 S8T1/K7Oh0Oc3t950weoOUAGYqF/EYU1GWjEP4D2gkVYbvGDbtvGUUsRuw7glTnAmRjL
 LFKeKpAbZuudUXEMidTQuP0xuXNKiGtIgmgLWsgG/GDcZx6jM7NIlmHxkScC//vCvjmd
 fC7yC9O5SPXoAdFF9Gh0IsV/7GBFX2hxnXtxcYJI1kmQWdfIrfhkcAkDtGX7t2FQYUKS
 SX6g==
X-Gm-Message-State: AO0yUKU01sKW2Kv0PWnTHwk6FguN2r525kBsqduz6DD7n/lEvkWfzkMj
 D4NKqBdrN62wm9ZpWLhS0Ng6K1rQqJBFwkP+nHtLrw==
X-Google-Smtp-Source: AK7set/qz+MDASqGMnCgzd9TwzKjTZc9C9vB/yN0ng/5wXSqWhk5vlN2yTFhAu6QvkFF7nvfY42XPw==
X-Received: by 2002:a05:6a20:a794:b0:d9:e6a9:d3e2 with SMTP id
 bx20-20020a056a20a79400b000d9e6a9d3e2mr1775147pzb.3.1679316113777; 
 Mon, 20 Mar 2023 05:41:53 -0700 (PDT)
Received: from localhost.localdomain ([134.238.136.60])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa79007000000b005a8b28c644esm6295016pfo.4.2023.03.20.05.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 05:41:53 -0700 (PDT)
From: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>
To: qemu-devel@nongnu.org
Cc: mateusz.kozlowski@solidigm.com,
 Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org (open list:nvme)
Subject: [PATCH] hw/nvme: Change alignment in dma functions for nvme_blk_*
Date: Mon, 20 Mar 2023 13:40:36 +0100
Message-Id: <20230320124042.1404-1-kozlowski.mateuszpl@gmail.com>
X-Mailer: git-send-email 2.37.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=kozlowski.mateuszpl@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Mar 2023 09:17:43 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the nvme_blk_read/write are used by both the data and metadata
portions of the IO, it can't have the 512B alignment requirement.
Without this change any metadata transfer, which length isn't a multiple
of 512B and which is bigger than 512B, will result in only a partial
transfer.

Signed-off-by: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>
---
 hw/nvme/ctrl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 49c1210fce..291009545f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1434,26 +1434,26 @@ uint16_t nvme_bounce_mdata(NvmeCtrl *n, void *ptr, uint32_t len,
 }
 
 static inline void nvme_blk_read(BlockBackend *blk, int64_t offset,
-                                 BlockCompletionFunc *cb, NvmeRequest *req)
+                                 uint32_t align, BlockCompletionFunc *cb,
+                                 NvmeRequest *req)
 {
     assert(req->sg.flags & NVME_SG_ALLOC);
 
     if (req->sg.flags & NVME_SG_DMA) {
-        req->aiocb = dma_blk_read(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
-                                  cb, req);
+        req->aiocb = dma_blk_read(blk, &req->sg.qsg, offset, align, cb, req);
     } else {
         req->aiocb = blk_aio_preadv(blk, offset, &req->sg.iov, 0, cb, req);
     }
 }
 
 static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
-                                  BlockCompletionFunc *cb, NvmeRequest *req)
+                                  uint32_t align, BlockCompletionFunc *cb,
+                                  NvmeRequest *req)
 {
     assert(req->sg.flags & NVME_SG_ALLOC);
 
     if (req->sg.flags & NVME_SG_DMA) {
-        req->aiocb = dma_blk_write(blk, &req->sg.qsg, offset, BDRV_SECTOR_SIZE,
-                                   cb, req);
+        req->aiocb = dma_blk_write(blk, &req->sg.qsg, offset, align, cb, req);
     } else {
         req->aiocb = blk_aio_pwritev(blk, offset, &req->sg.iov, 0, cb, req);
     }
@@ -2207,10 +2207,10 @@ static void nvme_rw_cb(void *opaque, int ret)
             }
 
             if (req->cmd.opcode == NVME_CMD_READ) {
-                return nvme_blk_read(blk, offset, nvme_rw_complete_cb, req);
+                return nvme_blk_read(blk, offset, 1, nvme_rw_complete_cb, req);
             }
 
-            return nvme_blk_write(blk, offset, nvme_rw_complete_cb, req);
+            return nvme_blk_write(blk, offset, 1, nvme_rw_complete_cb, req);
         }
     }
 
@@ -3437,7 +3437,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                      BLOCK_ACCT_READ);
-    nvme_blk_read(blk, data_offset, nvme_rw_cb, req);
+    nvme_blk_read(blk, data_offset, BDRV_SECTOR_SIZE, nvme_rw_cb, req);
     return NVME_NO_COMPLETE;
 
 invalid:
@@ -3607,7 +3607,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
 
         block_acct_start(blk_get_stats(blk), &req->acct, data_size,
                          BLOCK_ACCT_WRITE);
-        nvme_blk_write(blk, data_offset, nvme_rw_cb, req);
+        nvme_blk_write(blk, data_offset, BDRV_SECTOR_SIZE, nvme_rw_cb, req);
     } else {
         req->aiocb = blk_aio_pwrite_zeroes(blk, data_offset, data_size,
                                            BDRV_REQ_MAY_UNMAP, nvme_rw_cb,
-- 
2.34.1


