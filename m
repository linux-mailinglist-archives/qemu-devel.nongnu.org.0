Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC05479B88
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:13:31 +0100 (CET)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybOs-0003xK-P7
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMW-0001tk-MM
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMU-0003M1-VT
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639840262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxJO26xUVhJDGKKsrabAkJZAk9ARqJcAEf/XTPsKxI0=;
 b=gZvmtY6MdOcmjvReoJEfqeTllf0JO19tgkPH8VsSItKRgbiSwt3FSYPBAmpwxuWGf528zB
 p5o6BW5ryaTAp+88R4Vzqz9rVPqzC5iYPuD2NKJ2IwqJOB+WhEwhj11lcoc5F56/HyZZX0
 t66MtXWzN5lf6V4LEMSXQ5DdFM6ZspY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-lDr0DFvKMpa3ByXqxpPfpg-1; Sat, 18 Dec 2021 10:11:01 -0500
X-MC-Unique: lDr0DFvKMpa3ByXqxpPfpg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso1508987wra.15
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 07:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxJO26xUVhJDGKKsrabAkJZAk9ARqJcAEf/XTPsKxI0=;
 b=DaZUKKnkvoETt2WixeHyTn9pbL2TcyTcqR6IXwmiTTD1Z+pmyX122QoRGlR+2ZGxNJ
 98JM5pJCBxFV1966bGh0/6132/obNNd64Qnpu7G9UushRO+9/C9PiwyfikyUXj91gnQy
 6iqlLTnbyqdKE6FNIabsKnjYKQqPZ/A6giu2lOx0Kwsacqu73Pwbs4qy6L62fuAOKT+A
 4KgqVtFSch44LeaaWcPzhVbWP7zj0boDrCJ5UPHgHTrV6Rk+Dq1cfDad3JPZBNkwvKrw
 75KsAEZFMPej64yCUdU4CwVAq7o2+E+mg8yj/9BUQxDSBDR381nVduFx2feS9mGtWVXy
 CABA==
X-Gm-Message-State: AOAM530856+1BFTq3FK1SXhzjEEV58naEpU3PiGc+y7pJUEwSU7PwZSL
 PkdoFImr5IFwblrwQgIf2vOLNWotyjSt9GHiIBCBHeqcytRC1Y8wGb5szaa3y3ztUc3nujwYdga
 HGhmB+gMty4suPkOUv89fappsGWLccauSrhqmZ201m+RHcpxJfcVOlphq5AP7syig
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr6388203wrd.704.1639840260008; 
 Sat, 18 Dec 2021 07:11:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0rhoPm8iOAl3vcUsVgZF+dwupGSwaQxQN57e4AO14JQDryqY6TgeqBFmIuPY9XpgEGz/UGQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr6388158wrd.704.1639840259593; 
 Sat, 18 Dec 2021 07:10:59 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f13sm12012953wmq.29.2021.12.18.07.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:10:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/scsi/megasas: Use uint32_t for reply queue head/tail
 values
Date: Sat, 18 Dec 2021 16:10:49 +0100
Message-Id: <20211218151053.1545962-2-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218151053.1545962-1-philmd@redhat.com>
References: <20211218151053.1545962-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the reply queue values fit in 16-bit, they are accessed
as 32-bit:

  661:    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
  662:    s->reply_queue_head %= MEGASAS_MAX_FRAMES;
  663:    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
  664:    s->reply_queue_tail %= MEGASAS_MAX_FRAMES;

Having:

  41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */

In order to update the ld/st*_pci_dma() API to pass the address
of the value to access, it is simpler to have the head/tail declared
as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
the MegasasState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/megasas.c    | 4 ++--
 hw/scsi/trace-events | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 066f30e3f22..cf8adf39ca1 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -109,8 +109,8 @@ struct MegasasState {
     uint64_t reply_queue_pa;
     void *reply_queue;
     uint16_t reply_queue_len;
-    uint16_t reply_queue_head;
-    uint16_t reply_queue_tail;
+    uint32_t reply_queue_head;
+    uint32_t reply_queue_tail;
     uint64_t consumer_pa;
     uint64_t producer_pa;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 92d5b40f892..ae8551f2797 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -42,18 +42,18 @@ mptsas_config_sas_phy(void *dev, int address, int port, int phy_handle, int dev_
 
 # megasas.c
 megasas_init_firmware(uint64_t pa) "pa 0x%" PRIx64 " "
-megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint64_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx64 " tail 0x%" PRIx64 " flags 0x%x"
+megasas_init_queue(uint64_t queue_pa, int queue_len, uint32_t head, uint32_t tail, uint32_t flags) "queue at 0x%" PRIx64 " len %d head 0x%" PRIx32 " tail 0x%" PRIx32 " flags 0x%x"
 megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
 megasas_initq_mapped(uint64_t pa) "queue already mapped at 0x%" PRIx64
 megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max fw cmds %d"
 megasas_qf_mapped(unsigned int index) "skip mapped frame 0x%x"
 megasas_qf_new(unsigned int index, uint64_t frame) "frame 0x%x addr 0x%" PRIx64
 megasas_qf_busy(unsigned long pa) "all frames busy for frame 0x%lx"
-megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, unsigned int head, unsigned int tail, int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
-megasas_qf_update(unsigned int head, unsigned int tail, unsigned int busy) "head 0x%x tail 0x%x busy %d"
+megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, uint32_t head, uint32_t tail, unsigned int busy) "frame 0x%x count %d context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
+megasas_qf_update(uint32_t head, uint32_t tail, unsigned int busy) "head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_qf_map_failed(int cmd, unsigned long frame) "scmd %d: frame %lu"
 megasas_qf_complete_noirq(uint64_t context) "context 0x%" PRIx64 " "
-megasas_qf_complete(uint64_t context, unsigned int head, unsigned int tail, int busy) "context 0x%" PRIx64 " head 0x%x tail 0x%x busy %d"
+megasas_qf_complete(uint64_t context, uint32_t head, uint32_t tail, int busy) "context 0x%" PRIx64 " head 0x%" PRIx32 " tail 0x%" PRIx32 " busy %u"
 megasas_frame_busy(uint64_t addr) "frame 0x%" PRIx64 " busy"
 megasas_unhandled_frame_cmd(int cmd, uint8_t frame_cmd) "scmd %d: MFI cmd 0x%x"
 megasas_handle_scsi(const char *frame, int bus, int dev, int lun, void *sdev, unsigned long size) "%s dev %x/%x/%x sdev %p xfer %lu"
-- 
2.33.1


