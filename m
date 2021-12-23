Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E753247E323
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:21:37 +0100 (CET)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N6H-0004l3-0w
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjc-0000jn-JB
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MjZ-0000qS-QJ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MZDcjrRTlV4xDeU9/QkaMx4+S9qLpo1jo/kWB7g2uY=;
 b=gABiCVqSYTjcUMj9mp7tvvO5HVkBdNYKyfIB9OMmUxY8KU4+JIND/R7YKgraE4x1kvn7vb
 OCWZsfVvc3RUjpAzr9tarhPlcKfO7gyXQvKh6RGaPn7SXhsKB5CZqC+YdeFQzySEuJAjK0
 rqqmwWJCLGqtTM84yBEC6VowH4h1Itc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-paakuewPNfqP3agTxEcUvA-1; Thu, 23 Dec 2021 06:58:08 -0500
X-MC-Unique: paakuewPNfqP3agTxEcUvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so4543136wmd.5
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MZDcjrRTlV4xDeU9/QkaMx4+S9qLpo1jo/kWB7g2uY=;
 b=7UqvQs0xfxSur0m9js0PaWwQZWB/VzspFqHjNNZjy9Iq3nk9E/XJjwMtccrOyse8yE
 h/Nmli0gtuJW9/c2KsKxgWplGeIj3zNVEv11m4E7uAI80o8SXplCPjkLzFO0NPyCQD99
 uFkNygg7hcRtw6L8w/zMSPo524DkOQcZBzXlhN8bmAoXHyFVFEnq6ky0pJ9/bYuTewcf
 oSfk8bIx9C/mPdxL6uqsj5qXOxT0m2Wm0DaQaJRAOYofGP5SoCieAlxos0D+inpQy55y
 N3u9tO2uDZZaJTLeAeSvMmsq2Y5M7AxTDghorRke9uwDAFWGKzsG8kp4hkDTZP+bbCnu
 jMkg==
X-Gm-Message-State: AOAM532Z+cxfjEUmQ2A0NpO7tOlSM1+a+oQCOc8jwvIYwT7MGfHRS/gB
 Vs9nfrjcJJQ/4GTQN5KVCvngsvfHXGRqk1EABuH5yKHxq6oRBMhyKMV22Se0/yre4FheeiCuvma
 vs/ezOeifNFRkl7bfuA0uMGbOcXWxFONkUUmbIOYc5JA7/PUvqYak9abdBcHwtqrT
X-Received: by 2002:adf:f985:: with SMTP id f5mr1539787wrr.14.1640260686831;
 Thu, 23 Dec 2021 03:58:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA4cNRWKqaNRPfPCkDahQPJhOFZX/1ksH6nhn80QsBvQaBrYXHasYAPCxsZWNpOBY1YHVQCA==
X-Received: by 2002:adf:f985:: with SMTP id f5mr1539734wrr.14.1640260686553;
 Thu, 23 Dec 2021 03:58:06 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id q13sm4553548wrr.64.2021.12.23.03.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/23] dma: Have dma_buf_read() / dma_buf_write() take a
 void pointer
Date: Thu, 23 Dec 2021 12:55:39 +0100
Message-Id: <20211223115554.3155328-9-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_read/dma_buf_write functions to take
a void pointer argument and save us pointless casts to uint8_t *.

Remove this pointless casts in the megasas device model.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  |  4 ++--
 hw/scsi/megasas.c     | 22 +++++++++++-----------
 softmmu/dma-helpers.c |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 97ff6f29f8c..0d5b836013d 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -302,8 +302,8 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg);
-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 8f357841004..dc28302f96d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&fw_time, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, offset, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)data, info->size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    dma_buf_write(&info, dcmd_size, &cmd->qsg);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 09e29997ee5..7f37548394e 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -317,12 +317,12 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     return resid;
 }
 
-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
 }
 
-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
 }
-- 
2.33.1


