Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C393243C2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:30:40 +0100 (CET)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyvn-0007gO-Aj
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqM-0002Lf-K8
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:03 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEyqK-0004nq-NF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:25:02 -0500
Received: by mail-ej1-x632.google.com with SMTP id jt13so4674017ejb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q5f9t5j4/QGWJNhsSofDm2TZVW3Y7Podv7uACdRkSTU=;
 b=FmwSuZyMaBTzqNBluJ3p3vKIKI2B4afm+R7NL6MW9pacFgp9WlmEyj89+hz9vMLmFS
 5jKMAgQ3de91/JJVRLpKvbJiG7LvAF5YwNYdU+8IaOFhvwv70eFjz8cukxIv4HwJ6rbG
 8kmk81/IT112v0U9e9vg4hgpF24vfMpVafN7CNPx6VKKNeFriTjrjM5UEZ3kTjowM3eB
 iJO7uo0F9EOPOR9Q8VzHNkelr9Xm/kdmnUqi1YSSetbqo3B28IHvNznqKei82+hH1DCN
 UvK/T/XdKCs5juOS1pDNZ+xPg8GcISzQ+kcgvmnMvw61kUAlumfeHd6ZtRCyKJcIZOrY
 EH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q5f9t5j4/QGWJNhsSofDm2TZVW3Y7Podv7uACdRkSTU=;
 b=UjG0E9FOpCPV+kMSMIhkevZXs7M2eIfKw0wU8h2b5/IOm9Rj2IHSZBKEZJj/DOy4uO
 UGqzCkW3klGKwqwxLnh2ng1y5YwaUNmOClb9t8AeYktjbs+HVROjMzKp1KKi5HBMjsbw
 cMi0SEl0PfoQpny5UTr5jJcE/Mu03jiXJWRRFcqYikC7pwx4bzhi7SlEot/FDD1VGfPY
 dY378eyyXIbI+av7TdyD6itturqNCnLXfkcBl4SDM2nh6iK9CdjUUEu2vqFF6+j6/45p
 Zq+CA6YsO+wghlf10ob37zbpxfQHt2/wDbO6cYvIhpenJ4D4JulhRyBSnR3TjL8HNRll
 XBdg==
X-Gm-Message-State: AOAM531UUIYoJQuref5aKe7J37sxCOj+XjXd/RclTKOTKYk/xePgzGmu
 kcdtRVo/MtmtCHMBiin7utrsaM/hYlk=
X-Google-Smtp-Source: ABdhPJw3ZUe+YM68rRubpP/44D5fif9cQo9+2pg8nrN3Onun7994MXkzhIBrkj5liZmeS7V9fpDr7A==
X-Received: by 2002:a17:906:4c56:: with SMTP id
 d22mr4280886ejw.426.1614191099442; 
 Wed, 24 Feb 2021 10:24:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bw22sm1791172ejb.78.2021.02.24.10.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:24:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] scsi: Rename linux-specific SG_ERR codes to generic
 SCSI_HOST error codes
Date: Wed, 24 Feb 2021 19:24:50 +0100
Message-Id: <20210224182453.587731-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224182453.587731-1-pbonzini@redhat.com>
References: <20210224182453.587731-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: hare@suse.de
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



