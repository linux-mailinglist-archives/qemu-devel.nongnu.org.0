Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E260FC6E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5Bn-0002Mb-D0; Thu, 27 Oct 2022 11:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5Bl-0001zU-7x; Thu, 27 Oct 2022 11:53:01 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oo5Bj-0002MH-JV; Thu, 27 Oct 2022 11:53:00 -0400
Received: by mail-pl1-x636.google.com with SMTP id u6so1917960plq.12;
 Thu, 27 Oct 2022 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Fss7SWkcWPOiRxCjosHdHx2iUNVuQMQCnMg6vKHl34=;
 b=d/2iI4mCwLDdGuYrs7/Svd2VMiHXVD81dDuUa7IvPf1UD3EeD/whXSvUBe8NZ1xv7h
 ovqGm/8u5nLXdo+22BiQqMOIQBd7FHvVpK0ZNREkOEoyp7hi+gNpj43AYp2j+Ss0BPwY
 lae5P+ukZgukxq7jieaUHfa4bQ5KYFuMcvAETLmjPORtfKm3Ox58UPQgOuvz5ZtQHc83
 aQ7JrnKsv+afVxrEkZYuM0zp2bMO8wsn+ZZMyFUI8+nF6j1GRbtfE61UgJ6c3kdNMKNh
 2DEeGAavcmEU1FBO3pWo08nhrOwTh1Y946wbQV+Bmvypdqwk/PZT5IH0oMs1qmyqKxGm
 diOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Fss7SWkcWPOiRxCjosHdHx2iUNVuQMQCnMg6vKHl34=;
 b=R0mBP9EnBuhFakwN9pwAHY3ohLWO8YSC6VJ951tYNlDEvxvn418QbZAj/jdnZfnuhg
 iOTFkCCF8bT6aaU1NbFhiFcw9xIwF2Y5eyH3BwoAtl5es1hWEJRA6EEarQeGW8i9p7OS
 Q9tqVtd0Bd4oqyJh1Le0hXCr5niHgwihmLhH1o/FNEFNy/cSEmPJrlbNJTpOlgbY3zvg
 nj9SD1Ukk1+JGSigF9iPLB/frznXUTkkMx3S2wlrqk2S2zkDQhRDDqDsuvrVnvjeFOGF
 yV+3L+AzNPZdQHBtP0C2Jq0Bij4ttUF8WcqkAfN4gIS6Vwfaq9nDXZmIKE9VfXjaLHdv
 VpyQ==
X-Gm-Message-State: ACrzQf1Z/9e7mv+SH1Sfwquu5EswjtMRg10yfxNK6kXGt4CSy3VrzGJ1
 LhdzaLiPl1nRQy19rq7pLkD6Ghq0Pq6J3JDp
X-Google-Smtp-Source: AMsMyM4S3CSHyec+Xj8O3gatHF9yXungcQsZspkeOkDARiqE70pI/pjRm+LoSWqFq1JMWWrNJWueJg==
X-Received: by 2002:a17:90b:4a0d:b0:213:587b:206a with SMTP id
 kk13-20020a17090b4a0d00b00213587b206amr9784731pjb.195.1666885976091; 
 Thu, 27 Oct 2022 08:52:56 -0700 (PDT)
Received: from roots.. ([112.44.202.248]) by smtp.gmail.com with ESMTPSA id
 f21-20020a623815000000b0056c058ab000sm1327744pfa.155.2022.10.27.08.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 08:52:55 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, Julia Suvorova <jusual@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v5 4/4] block: add some trace events for zone append
Date: Thu, 27 Oct 2022 23:52:15 +0800
Message-Id: <20221027155215.21374-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221027155215.21374-1-faithilikerun@gmail.com>
References: <20221027155215.21374-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block/file-posix.c | 3 +++
 block/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9c1afb7749..b23cfb02e3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2489,6 +2489,8 @@ out:
             if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = wps->wp[index];
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > wps->wp[index]) {
@@ -3540,6 +3542,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
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
2.38.1


