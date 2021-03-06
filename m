Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990F32F993
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:05:32 +0100 (CET)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUkV-0004eF-Ho
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZu-0005yQ-O6
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:35 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZt-00089m-AB
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a18so5171372wrc.13
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5f9t5j4/QGWJNhsSofDm2TZVW3Y7Podv7uACdRkSTU=;
 b=BK4TQz11Mg1++WmQy33q2mnHIIkjTB+7Xl5M26O7WNZXLcoY8ZApFWrBUju2p/mcN1
 KPG9lylNE1/KxuwSXgp+Nqjuwum17JiEPXEMP+qMJDbtWdZKQL2tUQZbuPvA7OZRE+q+
 UZpZUmi9dK7QlthP7Mm2YNR0/vqYeTpfDECcitDFfgM2Jzc4Zvf9DRTksK8wySup8a3m
 TmQppluYM5/gNx5JkPLBgYey2Zolvu91O4mvJKUvFt3ZUZEAWSv2myjkUm9zNOo0Q6BN
 f80R7ntM2TabEZFeA29h2qNnGWZKoFrAPwL/lWeKJuhGsZ1uQJO+LwvWSOgy+n0VcOvd
 opGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q5f9t5j4/QGWJNhsSofDm2TZVW3Y7Podv7uACdRkSTU=;
 b=CEl8qba4TZTlqJfqqz82khVw+uMANjUSfehAClBrE0/37u0++ajayyhmmpXZP/3tco
 M324H6G7HGLvq5PeAjalvWjdyXxUKj3COWiBKcbZQvusOgyxYEp0j+f6Muc4XxjmS6oW
 aVjm9OcBpUqk09y6mubdFXNx7vSBOMsnnEpPUX3Td+/eDjgm5y/FXczbU70Jh07Zg7Wb
 MHYPn/T59fUB6hLTVJo4YKPvB/qN0cofs40Iynt7TwLN9WvNWwFoXuCdQ2J/d7nalmxy
 FTx/7nba+FmMjQE8XRSh8XiITje2+I5ctoOSOAtc7aiL/Rsa7mlVDvvWnkc6OW180r9c
 mTeA==
X-Gm-Message-State: AOAM530VFNSn3ynyqeXdely122h2Zaa5nEO8Y9xrAPVW7jO74tWF5CIc
 GSEPe0zaBh33z1U5V2u4b4RkFaiNKzU=
X-Google-Smtp-Source: ABdhPJw0YSpC3L5gcc9Dk2szO6JdMAZOs7O8TwBpWGl01jOL0QJnhvZYbBqnnUiMuCIVSxnCM2zakg==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr13309107wrn.226.1615028072076; 
 Sat, 06 Mar 2021 02:54:32 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] scsi: Rename linux-specific SG_ERR codes to generic
 SCSI_HOST error codes
Date: Sat,  6 Mar 2021 11:54:09 +0100
Message-Id: <20210306105419.110503-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

We really should make a distinction between legitimate sense codes
(ie if one is running against an emulated block device or for
pass-through sense codes), and the intermediate errors generated
during processing of the command, which really are not sense codes
but refer to some specific internal status. And this internal
state is not necessarily linux-specific, but rather can refer to
the qemu implementation itself.
So rename the linux-only SG_ERR codes to SCSI_HOST codes and make
them available generally.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116184041.60465-5-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/scsi/utils.h | 23 ++++++++++++++++-------
 scsi/utils.c         |  6 +++---
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index ff7c7091b6..ddb22b56df 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -16,6 +16,22 @@ enum SCSIXferMode {
     SCSI_XFER_TO_DEV,    /*  WRITE, MODE_SELECT, ...         */
 };
 
+enum SCSIHostStatus {
+    SCSI_HOST_OK,
+    SCSI_HOST_NO_LUN,
+    SCSI_HOST_BUSY,
+    SCSI_HOST_TIME_OUT,
+    SCSI_HOST_BAD_RESPONSE,
+    SCSI_HOST_ABORTED,
+    SCSI_HOST_ERROR = 0x07,
+    SCSI_HOST_RESET = 0x08,
+    SCSI_HOST_TRANSPORT_DISRUPTED = 0xe,
+    SCSI_HOST_TARGET_FAILURE = 0x10,
+    SCSI_HOST_RESERVATION_ERROR = 0x11,
+    SCSI_HOST_ALLOCATION_FAILURE = 0x12,
+    SCSI_HOST_MEDIUM_ERROR = 0x13,
+};
+
 typedef struct SCSICommand {
     uint8_t buf[SCSI_CMD_BUF_SIZE];
     int len;
@@ -124,13 +140,6 @@ int scsi_cdb_length(uint8_t *buf);
 #define SG_ERR_DRIVER_TIMEOUT  0x06
 #define SG_ERR_DRIVER_SENSE    0x08
 
-#define SG_ERR_DID_OK          0x00
-#define SG_ERR_DID_NO_CONNECT  0x01
-#define SG_ERR_DID_BUS_BUSY    0x02
-#define SG_ERR_DID_TIME_OUT    0x03
-
-#define SG_ERR_DRIVER_SENSE    0x08
-
 int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
                            SCSISense *sense);
 #endif
diff --git a/scsi/utils.c b/scsi/utils.c
index 6b56e01002..4d994b6d56 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -612,9 +612,9 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
     if (errno_value != 0) {
         return scsi_sense_from_errno(errno_value, sense);
     } else {
-        if (io_hdr->host_status == SG_ERR_DID_NO_CONNECT ||
-            io_hdr->host_status == SG_ERR_DID_BUS_BUSY ||
-            io_hdr->host_status == SG_ERR_DID_TIME_OUT ||
+        if (io_hdr->host_status == SCSI_HOST_NO_LUN ||
+            io_hdr->host_status == SCSI_HOST_BUSY ||
+            io_hdr->host_status == SCSI_HOST_TIME_OUT ||
             (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT)) {
             return BUSY;
         } else if (io_hdr->host_status) {
-- 
2.29.2



