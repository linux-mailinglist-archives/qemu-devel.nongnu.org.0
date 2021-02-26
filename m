Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F476325ECD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:21:35 +0100 (CET)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYNS-0000R3-8O
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-0001jr-Dq
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7w-00043w-9o
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:35 -0500
Received: by mail-wm1-x32a.google.com with SMTP id k66so6964392wmf.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ZErRFnPH+j+hn2Ng7+u1Gir1Cs5JNk/Mv6ocOR4JYs=;
 b=Pvg+l3gcdHJ4KfLNCv7lNVMde+IRn4u430ZT99YYNQhY5H6rb5PoPdDhFrBruLRo8d
 nCyyoH2lF5iY2Tad+I3ypwiBSijf6d6Cul0/EW+Uk+msB5VJwhE3d0Ry1izAed5GFVXo
 Xwpg3/YKwCQVtP6Ve6gEG7+7tPCCOxYrlygyPylyNeM9uyWbZoPRV0XqJwgdH3yXXJLp
 gihB1QhPVa89CPspsUoXGh19T0e9QE9VWD7SDTirXfyWomFJgY5qIH/tQG+Td8IPfV0C
 7OCl0qYFsTbw103RuQs/ob41lD8fsVxvj6Fqe+3scpfuroke6AB4T46TB/IdNw6/3Gpo
 bleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+ZErRFnPH+j+hn2Ng7+u1Gir1Cs5JNk/Mv6ocOR4JYs=;
 b=khxphEoxQPYQ+BruZt/8kM+lZURwLJfpcRuYN3lu8grVFPBbJoiWVJ1fEOQCZeZ5zt
 HNEKJVOUyljItJ7fqCeCzl1j+ddY3V84iTQTtraADagh2jyGtbhmbsbv4K3pEz0nGavc
 ytvsEo2OguDrbyRARjcosfHtektFdnxuX66g4t+qvdIsqIr4i+S4Im0UStdKqvP9/RF4
 ukkFPwZA5ZdWdC1xzfy69pfZks/jisRvCcCloDSGsfVwXd4r7M8/RnlH/wcv66r19Xr0
 btIV72zSM5wGjWZ4iPuzOVmr5F0ClZoL8RltVMqxpH6WQgxMNXJ4oRA+OQ4awOXyUNYy
 2m4Q==
X-Gm-Message-State: AOAM533jtLLb8HqH+a/83byHFr/lmotBrcmoj9CVT3/cpjHXcyI9R9cz
 LCEVSr8I4YeZmKBrsw1HtvzcoFSGHnU=
X-Google-Smtp-Source: ABdhPJzgALtm32YmunbsJfriz2pC4RX+/ADXibgYWsDzpwTlYS+zID/AXEBU8UQVChcMMS/Mymo1Xw==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr1504642wmc.35.1614326731101; 
 Fri, 26 Feb 2021 00:05:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/29] scsi: add tracing for SG_IO commands
Date: Fri, 26 Feb 2021 09:05:02 +0100
Message-Id: <20210226080526.651705-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hannes Reinecke <hare@suse.de>

Add tracepoints for SG_IO commands to allow for debugging
of SG_IO commands.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116183114.55703-4-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c    | 3 ++-
 hw/scsi/scsi-generic.c | 8 +++++++-
 hw/scsi/trace-events   | 4 ++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index c4016d1cfc..a2716b26b4 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2788,7 +2788,8 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
     io_header->timeout = s->qdev.io_timeout * 1000;
     io_header->usr_ptr = r;
     io_header->flags |= SG_FLAG_DIRECT_IO;
-
+    trace_scsi_disk_aio_sgio_command(r->req.tag, req->cdb[0], lba,
+                                     nb_logical_blocks, io_header->timeout);
     aiocb = blk_aio_ioctl(s->qdev.conf.blk, SG_IO, io_header, cb, opaque);
     assert(aiocb != NULL);
     return aiocb;
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index 3dd3ccd097..176a72951c 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -129,6 +129,8 @@ static int execute_command(BlockBackend *blk,
     r->io_header.usr_ptr = r;
     r->io_header.flags |= SG_FLAG_DIRECT_IO;
 
+    trace_scsi_generic_aio_sgio_command(r->req.tag, r->req.cmd.buf[0],
+                                        r->io_header.timeout);
     r->req.aiocb = blk_aio_ioctl(blk, SG_IO, &r->io_header, complete, r);
     if (r->req.aiocb == NULL) {
         return -EIO;
@@ -525,8 +527,12 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
     io_header.sbp = sensebuf;
     io_header.timeout = timeout * 1000;
 
+    trace_scsi_generic_ioctl_sgio_command(cmd[0], io_header.timeout);
     ret = blk_ioctl(blk, SG_IO, &io_header);
-    if (ret < 0 || io_header.driver_status || io_header.host_status) {
+    if (ret < 0 || io_header.status ||
+        io_header.driver_status || io_header.host_status) {
+        trace_scsi_generic_ioctl_sgio_done(cmd[0], ret, io_header.status,
+                                           io_header.host_status);
         return -1;
     }
     return 0;
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 0e0aa9847d..9788661bfd 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -331,6 +331,7 @@ scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI comma
 scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
+scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
@@ -342,3 +343,6 @@ scsi_generic_write_data(uint32_t tag) "scsi_write_data tag=0x%x"
 scsi_generic_send_command(const char *line) "Command: data=%s"
 scsi_generic_realize_type(int type) "device type %d"
 scsi_generic_realize_blocksize(int blocksize) "block size %d"
+scsi_generic_aio_sgio_command(uint32_t tag, uint8_t cmd, uint32_t timeout) "generic aio sgio: tag=0x%x cmd=0x%x timeout=%u"
+scsi_generic_ioctl_sgio_command(uint8_t cmd, uint32_t timeout) "generic ioctl sgio: cmd=0x%x timeout=%u"
+scsi_generic_ioctl_sgio_done(uint8_t cmd, int ret, uint8_t status, uint8_t host_status) "generic ioctl sgio: cmd=0x%x ret=%d status=0x%x host_status=0x%x"
-- 
2.29.2



