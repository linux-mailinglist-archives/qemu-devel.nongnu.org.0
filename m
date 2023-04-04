Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46466D6772
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjien-0004cl-Oy; Tue, 04 Apr 2023 11:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjiel-0004bI-FC; Tue, 04 Apr 2023 11:33:11 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjiej-0006Ag-Nb; Tue, 04 Apr 2023 11:33:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id s19so19911885pgi.0;
 Tue, 04 Apr 2023 08:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680622388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIUl4aibgYpMUzkAkax39ZDiJuLd9+zXASXmdChjI9U=;
 b=Ophiuqt/ZzQ8SMrVWEuYuxilO9A/E9bmSwlC/0peLIra3durd/vkAZ0+K74QCoJ6yX
 ep2+xi0JQoteolldR/aLQSaovbdggUwScBdPPt0uLyp9uOVlplCPsDnHUqYeVDhosOK/
 TyxbFsbXHc6BEOfs3M/ckwJfJAO1KxTlIvOt7TVKhznjEZ0SKv+I8FlNyOhVxyPvqj+v
 i1CLmAQi6RCPVbPEQ5KdMzKPryLyrti4oMUzXUR4nYHtA14wUr5gFX5QErkx6WUjzzqQ
 5+PxAxvE7rc2XqmFTLFEayqVB5oJRfFlmPaGWqQZdimShKOjUdguUW5lw9b980+kYGtF
 ylNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIUl4aibgYpMUzkAkax39ZDiJuLd9+zXASXmdChjI9U=;
 b=cjuaICjyDHuqwHRl2EN3TmywuP+7YI0el3StY57uTyPcBIp6p4I6FkCtOoQXhAXV16
 VP+b+TYtGm++sK5swX5U8KIhu0hMBn2VMezLEGEdSTT90H1FUdkJ1IJk1YmZfRBIfDaE
 NBCW9L52RTlBy0Ry1ETPc/CHhHPL2ScbAQN9mWDrDAFgoFG4MIGbcTspKOujYExQxoHz
 36/fb/6xgfjH7Jr41wJEru3WmMtDBnrwWdVd43zcJut3ZexUx4b4R4xI83oR/BeSSPs/
 TQl5/ox6sjjlsy2u8fkLT2JXLRTXiWpR4fuwN/P5hBvCCaN4UZowLgI4XlJmGMCtGtyj
 xZ1g==
X-Gm-Message-State: AAQBX9fhWo6i0w5NYUe2MtQYNzDohoxsjZKEfNZIPEzY1wMZOITDB8su
 7nIUaBz4dZ2e39ly9GOkOMtqLa9m/eIIXN+3loE=
X-Google-Smtp-Source: AKy350ZkFQGgRrBJTtdPY0vsKdeol+znGMP085cE8xd4TABj2ArSbvIO2IenLJmXUNOTAh1lGKQhsw==
X-Received: by 2002:a62:3847:0:b0:626:a9b:94b8 with SMTP id
 f68-20020a623847000000b006260a9b94b8mr2515425pfa.20.1680622387516; 
 Tue, 04 Apr 2023 08:33:07 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 p11-20020a62ab0b000000b0059085684b54sm9231519pff.140.2023.04.04.08.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:33:06 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 4/4] block: add some trace events for zone append
Date: Tue,  4 Apr 2023 23:32:39 +0800
Message-Id: <20230404153239.32234-5-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404153239.32234-1-faithilikerun@gmail.com>
References: <20230404153239.32234-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x531.google.com
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
index a7130b1024..825301467e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2502,6 +2502,8 @@ out:
             if (!BDRV_ZT_IS_CONV(*wp)) {
                 if (type & QEMU_AIO_ZONE_APPEND) {
                     *s->offset = *wp;
+                    trace_zbd_zone_append_complete(bs, *s->offset
+                        >> BDRV_SECTOR_BITS);
                 }
                 /* Advance the wp if needed */
                 if (offset + bytes > *wp) {
@@ -3546,6 +3548,7 @@ static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
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
2.39.2


