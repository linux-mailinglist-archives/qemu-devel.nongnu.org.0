Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAD6F0AC4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:24:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5Lp-0007W5-K8; Thu, 27 Apr 2023 13:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5Li-0007Ux-S9; Thu, 27 Apr 2023 13:24:06 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5Lh-0007nA-Ae; Thu, 27 Apr 2023 13:24:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b60365f53so10566086b3a.0; 
 Thu, 27 Apr 2023 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616243; x=1685208243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMm7qHxD1ENfDuHfN3u0ZIVnhWuSae3qlQpW2+gKwzo=;
 b=dhaM5Dz9c+kFH0iz+xyoPLvs0AFzZko354AAFcjRiDnD8wREQSEZf5Lh/Q76Q4xgdG
 BFZpD67GcGaAt+ca+8Rgmx+R96oO0Se6AjglboZG63hDhTSvCqcD2CHkSae1eBseeSYt
 W2p/hRZSz2hxBm52rD04+/JhlkZB0dlFSj9g7IwvkzPX2wA8wTr+bAV9Vp19YkNYwVcE
 NVY4uzfDcnkprCttRftFBDcWoKxGnKbNaTFy4bl7LbuShBc5jGHV+W79TUyXNq+LceOd
 35hYxPRFOUaNe0NmnT+jsoujGAjcWs1c3WhA0VFgxKsTeW4r2lnFWI178sL4DfeG6yJB
 4Ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616243; x=1685208243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMm7qHxD1ENfDuHfN3u0ZIVnhWuSae3qlQpW2+gKwzo=;
 b=S8b2tZ/IXBuy17utWeKkm2bYjxxaz943kBsqGvuzbJB63NAQ8bQEYsaJDwQKPMuKj+
 0X95o/eg/C/hCbJCjxEdDb/y6N+65y5d711u2A6Z/BjI/Txvgg0TuTQ01Lb85Zg65+eq
 IxAQdho3M/J4ti4vabpk5JMd0KZeekA6PEFTF86TFreB+TVyHwA11NLQ2AlbqzPDqWrS
 r4bEaTU2bTiLGhGj9tAUNJtrpT7AZSVEEO1RLG7cPMGkOqiei8yaXhiou9nItihOAO6E
 Jkc9vd9nK+aJWnNPzk06BWIXc1Gba1swxI1YlXP+3WFNSGTOtkM/xXpgmp5LGEISLWqb
 A87w==
X-Gm-Message-State: AC+VfDxVlFiXIdiFGQ+10G09Mk+ctJHC/RadlrrXuKeArAAGBLoDGWpH
 76nWwP87IT2Ue8zZXU6urwitnkSt1wXlYZtSNiM=
X-Google-Smtp-Source: ACHHUZ66mpu/JQDxC0Eg6srU06aaaBWNoClGy9dNu56CDoH7fC4KPt+3HMPNWgGvQmZ9yA5hMnuAVg==
X-Received: by 2002:a05:6a21:33a7:b0:ef:1457:6cdf with SMTP id
 yy39-20020a056a2133a700b000ef14576cdfmr3066931pzb.19.1682616242764; 
 Thu, 27 Apr 2023 10:24:02 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 x12-20020a65538c000000b0050bc03741ffsm11698712pgq.84.2023.04.27.10.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:24:02 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dlemoal@kernel.org, dmitry.fomichev@wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, Fam Zheng <fam@euphon.net>,
 Stefano Garzarella <sgarzare@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 4/4] block: add some trace events for zone append
Date: Fri, 28 Apr 2023 01:23:39 +0800
Message-Id: <20230427172339.3709-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427172339.3709-1-faithilikerun@gmail.com>
References: <20230427172339.3709-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 8fc7f73d2c..5f1745ede8 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2517,6 +2517,8 @@ out:
             if (!BDRV_ZT_IS_CONV(*wp)) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = *wp;
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
@@ -3559,6 +3561,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
         len += iov_len;
     }
 
+    trace_zbd_zone_append(bs, *offset >> BDRV_SECTOR_BITS);
     return raw_co_prw(bs, *offset, len, qiov, QEMU_AIO_ZONE_APPEND);
 }
 #endif
diff --git a/block/trace-events b/block/trace-events
index 3f4e1d088a..32665158d6 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -211,6 +211,8 @@ file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
 file_flush_fdatasync_failed(int err) "errno %d"
 zbd_zone_report(void *bs, unsigned int nr_zones, int64_t sector) "bs %p report %d zones starting at sector offset 0x%" PRIx64 ""
 zbd_zone_mgmt(void *bs, const char *op_name, int64_t sector, int64_t len) "bs %p %s starts at sector offset 0x%" PRIx64 " over a range of 0x%" PRIx64 " sectors"
+zbd_zone_append(void *bs, int64_t sector) "bs %p append at sector offset 0x%" PRIx64 ""
+zbd_zone_append_complete(void *bs, int64_t sector) "bs %p returns append sector 0x%" PRIx64 ""
 
 # ssh.c
 sftp_error(const char *op, const char *ssh_err, int ssh_err_code, int sftp_err_code) "%s failed: %s (libssh error code: %d, sftp error code: %d)"
-- 
2.40.0


