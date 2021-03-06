Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEA32F98A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:01:30 +0100 (CET)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUgb-0006Fw-3N
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZv-0005yR-KV
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:35 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZu-0008AW-7e
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso847234wme.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtBT0u+jvn6wnMBv0IRJDqOEAKiAeRmCEq+7vu/c0Yc=;
 b=dvfxn+PEE+V8AmY9DNE5C4SxXBPN9DCRnJiDVJ01I1hbNO/2Be/RiXKQeYyKwC+/NW
 YYSDW9YWYBuMJFgFuFTdnaYHA1Ce0prCI8nXsmmXI/SGp9J1JjrU49vAH0uAyJ3cTYft
 6vo/UGwbM3v1emj326TmKavbpvu13e1WQciQBFL5gO2IXLDG7GQxRoiScU50m1gxjywa
 RczAGkXMouPGhK7I6mrl+afzVPnLeGdc2Zu/ct52nrur4AxzK09xzFjpEQdrtlP9OliD
 Rl7gPPGyWi1uuG/RI4d7vUN9ZgRrixpXsFewsceFAbhyjP2gxxH2Dp5IVmfnKz8Ld4kh
 wIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WtBT0u+jvn6wnMBv0IRJDqOEAKiAeRmCEq+7vu/c0Yc=;
 b=ZHLB4u9ifn86LldEDAt1Lc86L2GQcUMwo3t+Pkf6VuOQQcP13xkE1hRbteTgWAMRF2
 kxYyAx6PlRROpvurexl24R7WLTk5vrO7nmXUmUCC6Tk8pyxbGaOls1IPnf2STlO3O/uA
 y0O3XrkNwckbuHeJQK01NTM5wgv80lieDf+95VVxojcFIpRccKayReUyEg25Ly+luYPP
 3kyabWeD/Fw0Z6BalMchafJzq8QYXO1iF5yIw2iu05Q6iEgU6awpeM5DOG2EaQqFmnwq
 9vH/sY8edN9AT+yYjE2kK8qLuzUfksXm2/MiEwaGtnLYqiokxWwWb3S1lyV4hPZXuazz
 YKrg==
X-Gm-Message-State: AOAM532AoUR5RWaYk8ORBxtuU4KQEMKop1XnoyIyqzvkp5viRSc0vegF
 X30DnSx87AqHAT1EFtwMBMxBX6ZzndY=
X-Google-Smtp-Source: ABdhPJw8bid5/4iumXqF8r57t2FxexkWI7lkGSIcT1mPiQw2GmA7VQB5JatK3ng+Ew9R4B1xjva9Cg==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr13032666wmc.103.1615028072969; 
 Sat, 06 Mar 2021 02:54:32 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] scsi: Add mapping for generic SCSI_HOST status to sense
 codes
Date: Sat,  6 Mar 2021 11:54:10 +0100
Message-Id: <20210306105419.110503-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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

As we don't have a driver-specific mapping (yet) we should provide
for a detailed mapping from host_status to SCSI sense codes.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Message-Id: <20201116184041.60465-6-hare@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/scsi/utils.h |  1 +
 scsi/utils.c         | 65 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/include/scsi/utils.h b/include/scsi/utils.h
index ddb22b56df..9080d65e27 100644
--- a/include/scsi/utils.h
+++ b/include/scsi/utils.h
@@ -145,5 +145,6 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
 #endif
 
 int scsi_sense_from_errno(int errno_value, SCSISense *sense);
+int scsi_sense_from_host_status(uint8_t host_status, SCSISense *sense);
 
 #endif
diff --git a/scsi/utils.c b/scsi/utils.c
index 4d994b6d56..28eb32746e 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -257,6 +257,21 @@ const struct SCSISense sense_code_LUN_COMM_FAILURE = {
     .key = ABORTED_COMMAND, .asc = 0x08, .ascq = 0x00
 };
 
+/* Command aborted, LUN does not respond to selection */
+const struct SCSISense sense_code_LUN_NOT_RESPONDING = {
+    .key = ABORTED_COMMAND, .asc = 0x05, .ascq = 0x00
+};
+
+/* Command aborted, Command Timeout during processing */
+const struct SCSISense sense_code_COMMAND_TIMEOUT = {
+    .key = ABORTED_COMMAND, .asc = 0x2e, .ascq = 0x02
+};
+
+/* Command aborted, Commands cleared by device server */
+const struct SCSISense sense_code_COMMAND_ABORTED = {
+    .key = ABORTED_COMMAND, .asc = 0x2f, .ascq = 0x02
+};
+
 /* Medium Error, Unrecovered read error */
 const struct SCSISense sense_code_READ_ERROR = {
     .key = MEDIUM_ERROR, .asc = 0x11, .ascq = 0x00
@@ -605,6 +620,45 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
     }
 }
 
+int scsi_sense_from_host_status(uint8_t host_status,
+                                SCSISense *sense)
+{
+    switch (host_status) {
+    case SCSI_HOST_NO_LUN:
+        *sense = SENSE_CODE(LUN_NOT_RESPONDING);
+        return CHECK_CONDITION;
+    case SCSI_HOST_BUSY:
+        return BUSY;
+    case SCSI_HOST_TIME_OUT:
+        *sense = SENSE_CODE(COMMAND_TIMEOUT);
+        return CHECK_CONDITION;
+    case SCSI_HOST_BAD_RESPONSE:
+        *sense = SENSE_CODE(LUN_COMM_FAILURE);
+        return CHECK_CONDITION;
+    case SCSI_HOST_ABORTED:
+        *sense = SENSE_CODE(COMMAND_ABORTED);
+        return CHECK_CONDITION;
+    case SCSI_HOST_RESET:
+        *sense = SENSE_CODE(RESET);
+        return CHECK_CONDITION;
+    case SCSI_HOST_TRANSPORT_DISRUPTED:
+        *sense = SENSE_CODE(I_T_NEXUS_LOSS);
+        return CHECK_CONDITION;
+    case SCSI_HOST_TARGET_FAILURE:
+        *sense = SENSE_CODE(TARGET_FAILURE);
+        return CHECK_CONDITION;
+    case SCSI_HOST_RESERVATION_ERROR:
+        return RESERVATION_CONFLICT;
+    case SCSI_HOST_ALLOCATION_FAILURE:
+        *sense = SENSE_CODE(SPACE_ALLOC_FAILED);
+        return CHECK_CONDITION;
+    case SCSI_HOST_MEDIUM_ERROR:
+        *sense = SENSE_CODE(READ_ERROR);
+        return CHECK_CONDITION;
+    }
+    return GOOD;
+}
+
 #ifdef CONFIG_LINUX
 int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
                            SCSISense *sense)
@@ -612,14 +666,11 @@ int sg_io_sense_from_errno(int errno_value, struct sg_io_hdr *io_hdr,
     if (errno_value != 0) {
         return scsi_sense_from_errno(errno_value, sense);
     } else {
-        if (io_hdr->host_status == SCSI_HOST_NO_LUN ||
-            io_hdr->host_status == SCSI_HOST_BUSY ||
-            io_hdr->host_status == SCSI_HOST_TIME_OUT ||
-            (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT)) {
+        int status = scsi_sense_from_host_status(io_hdr->host_status, sense);
+        if (status) {
+            return status;
+        } else if (io_hdr->driver_status & SG_ERR_DRIVER_TIMEOUT) {
             return BUSY;
-        } else if (io_hdr->host_status) {
-            *sense = SENSE_CODE(I_T_NEXUS_LOSS);
-            return CHECK_CONDITION;
         } else if (io_hdr->status) {
             return io_hdr->status;
         } else if (io_hdr->driver_status & SG_ERR_DRIVER_SENSE) {
-- 
2.29.2



