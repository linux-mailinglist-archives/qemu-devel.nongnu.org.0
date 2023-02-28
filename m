Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCCB6A5DFB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:13:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3Vs-0002YJ-GE; Tue, 28 Feb 2023 12:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pX3Vp-0002XU-Sj; Tue, 28 Feb 2023 12:11:37 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pX3Vn-000443-MV; Tue, 28 Feb 2023 12:11:37 -0500
Received: by mail-il1-x131.google.com with SMTP id b16so6749271iln.3;
 Tue, 28 Feb 2023 09:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sGSrVK0Q1HIlTI0UG3N3rknX+5ELVG4laIJiA/mrLaQ=;
 b=L+4b/5bWwbeTU1M/mo27S+AQE1jIrM5u4i9MWSGEPHCUCqgocjiEOLke9XfM9L7Lur
 ssFaChgW+yfAHzpwKjWmdvBGCnqmW7oB2irGdxUdiV6fB6jEBG0DvN3tIINxBcbJQ+OG
 lE/nOTjWZPOInEy4Y0qKUVRjWrucncpm+H8lxwnukpP7bUoVzYgRVL6LpXf1gEkwRw/n
 34d7qvxetSQtLnvRhL01tnpF8TKmQ6oub3boFsVDVwO+V1FCzEmLKBG0An5GGvlvpuB1
 mGBhsp1sq14jCSIKGYbuAoEGJ80mul2BVcQdarUKDK5CdZ07VavrI/2xCkDKuVCtIaGf
 8vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGSrVK0Q1HIlTI0UG3N3rknX+5ELVG4laIJiA/mrLaQ=;
 b=U0x+W6Fpp71EU9wCiCdtQlxjmJio8Q+y/9W3wt3+qCTgv4Y9YyNqvcEM4GOGxQTSre
 7sMpe7gORa5A2HIjhOus14o8QLUQ7SzLVGIu7I/wh9U8Dev2PwNq/WGzgTkr7K3h3z5I
 AlFGIXdZ3U2IXjyZyGcz7fknc4QtPOqQiAJKJyNU0h1uD+7W5x8z42YGCt/n0JrpTlv4
 JIKO9N3XFccMcp1IUWYhhk7Vc2V2oK6JMJanDppWYKK+gBZ79LIxkC0+zsFrFGN0/S5S
 fSzflio3BdeXDWprhET2kNfgB7ERs8E/xqo5DYuDcswjC+VxaTrUgkJFcyLKpzMVR+ZP
 lOHg==
X-Gm-Message-State: AO0yUKWtzXxRa1QspUxrRRECOdPI2WHJW7PLpZbKmD6JZ9O/kFbDLduj
 cPfJTUbTtZSuAGkbE8h0u7M=
X-Google-Smtp-Source: AK7set8cEl94p+1U5AjTGXi/rvMeK3i5cU8GScKWBAY2H0Ewnhd8hZxuEmbPphf0MNLyT1mmN225iw==
X-Received: by 2002:a92:cd89:0:b0:315:34b8:4c6d with SMTP id
 r9-20020a92cd89000000b0031534b84c6dmr3252901ilb.17.1677604293511; 
 Tue, 28 Feb 2023 09:11:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a92d288000000b00313f2279f06sm2813107ilp.73.2023.02.28.09.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:11:32 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hannes Reinecke <hare@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] scsi: megasas: Internal cdbs have 16-byte length
Date: Tue, 28 Feb 2023 09:11:29 -0800
Message-Id: <20230228171129.4094709-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Host drivers do not necessarily set cdb_len in megasas io commands.
With commits 6d1511cea0 ("scsi: Reject commands if the CDB length
exceeds buf_len") and fe9d8927e2 ("scsi: Add buf_len parameter to
scsi_req_new()"), this results in failures to boot Linux from affected
SCSI drives because cdb_len is set to 0 by the host driver.
Set the cdb length to its actual size to solve the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/scsi/megasas.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 9cbbb16121..d624866bb6 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1780,7 +1780,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
     uint8_t cdb[16];
     int len;
     struct SCSIDevice *sdev = NULL;
-    int target_id, lun_id, cdb_len;
+    int target_id, lun_id;
 
     lba_count = le32_to_cpu(cmd->frame->io.header.data_len);
     lba_start_lo = le32_to_cpu(cmd->frame->io.lba_lo);
@@ -1789,7 +1789,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     target_id = cmd->frame->header.target_id;
     lun_id = cmd->frame->header.lun_id;
-    cdb_len = cmd->frame->header.cdb_len;
 
     if (target_id < MFI_MAX_LD && lun_id == 0) {
         sdev = scsi_device_find(&s->bus, 0, target_id, lun_id);
@@ -1804,15 +1803,6 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
         return MFI_STAT_DEVICE_NOT_FOUND;
     }
 
-    if (cdb_len > 16) {
-        trace_megasas_scsi_invalid_cdb_len(
-            mfi_frame_desc(frame_cmd), 1, target_id, lun_id, cdb_len);
-        megasas_write_sense(cmd, SENSE_CODE(INVALID_OPCODE));
-        cmd->frame->header.scsi_status = CHECK_CONDITION;
-        s->event_count++;
-        return MFI_STAT_SCSI_DONE_WITH_ERROR;
-    }
-
     cmd->iov_size = lba_count * sdev->blocksize;
     if (megasas_map_sgl(s, cmd, &cmd->frame->io.sgl)) {
         megasas_write_sense(cmd, SENSE_CODE(TARGET_FAILURE));
@@ -1823,7 +1813,7 @@ static int megasas_handle_io(MegasasState *s, MegasasCmd *cmd, int frame_cmd)
 
     megasas_encode_lba(cdb, lba_start, lba_count, is_write);
     cmd->req = scsi_req_new(sdev, cmd->index,
-                            lun_id, cdb, cdb_len, cmd);
+                            lun_id, cdb, sizeof(cdb), cmd);
     if (!cmd->req) {
         trace_megasas_scsi_req_alloc_failed(
             mfi_frame_desc(frame_cmd), target_id, lun_id);
-- 
2.39.1


