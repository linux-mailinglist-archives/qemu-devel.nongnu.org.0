Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2C95A9EEC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:29:13 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTowC-0004nm-Rj
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTort-0007am-W3
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorn-0008GD-9l
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2M3S8TTwR4ctM/wbULw9aUViSscaYCtyhfRNgsXz8k=;
 b=M+7B+xDOLKG8hEkH51CjRkMrwHToJM0dkZLc8ClkU2AHrnHOTCuVdB/3Nyus/LYz5Nz5cz
 w9SJXmE61SuHpPKbvzoBh25vQVpZnpkLwGqKFmAPP+CAOOcmfDuQAvQ53p6/1noyaPAc/b
 PBs//86JG/RVT1G2vRVNVeDceWU2Zac=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-aXsOS_obPra7Z6t1Obcymg-1; Thu, 01 Sep 2022 14:24:37 -0400
X-MC-Unique: aXsOS_obPra7Z6t1Obcymg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso12188388edd.9
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M2M3S8TTwR4ctM/wbULw9aUViSscaYCtyhfRNgsXz8k=;
 b=nY2s6QKmX10AuHo3mzLun72ZQruCBVhmIKge1faHCETZg8QyzgIgAprZwLFoO1iP5d
 vg+qic3ASPNQgEZ+tIdWsM1fs8HDEaowPEAkWRB1xdo/hIKKy0xrxXtPfQGZRgX2jqWF
 RJ+1S5pfsQD5RKaPkEu3NEDsvUz2CBeWNTd0bcDKjYjNy41KtgXM4mNqWbtdq2DThV3p
 HF3A/XmIpIQ2c43Jx3S8O5IWqMcSF3NR8Z3IIULcdVPi9zOVPNbxBIBe8J4OWK1B1w5S
 AZyloqW5n2OpxYSVL2pmBHjUMY+PJs6/ZV5YGH8eAxrfjHG7CKZkCLx34XHBrcqTxw4e
 zHzQ==
X-Gm-Message-State: ACgBeo3xnjNvEvWdnfrtVF+80iwa+4EW39l4Am4dYz6kk+SBDEy/10cl
 X8IoncIjr7CPZxY0R2bjdemdQywZn5JAou5rlyStsIjg8vxSSd7k0GW3XSId63qv9bFHg3dYINU
 ++6+Tk9fHXR+arill//XYhhbX1xDR3YWi4F+fDzk04BBQ4JFXzHvLBW5bwsF1sTYOAxE=
X-Received: by 2002:a05:6402:288b:b0:444:26fd:d4c4 with SMTP id
 eg11-20020a056402288b00b0044426fdd4c4mr29726156edb.249.1662056676274; 
 Thu, 01 Sep 2022 11:24:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5kVoZZ33jw4hVXP43OZc0H//2XR+fMNtIJam65eWRlrZQTRAgBO8UKYJ0CwvI15K4eeec/bg==
X-Received: by 2002:a05:6402:288b:b0:444:26fd:d4c4 with SMTP id
 eg11-20020a056402288b00b0044426fdd4c4mr29726139edb.249.1662056676008; 
 Thu, 01 Sep 2022 11:24:36 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 fh10-20020a1709073a8a00b007307d099ed7sm8719780ejc.121.2022.09.01.11.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>
Subject: [PULL 03/39] scsi: Reject commands if the CDB length exceeds buf_len
Date: Thu,  1 Sep 2022 20:23:53 +0200
Message-Id: <20220901182429.93533-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Millikin <john@john-millikin.com>

In scsi_req_parse_cdb(), if the CDB length implied by the command type
exceeds the initialized portion of the command buffer, reject the request.

Rejected requests are recorded by the `scsi_req_parse_bad` trace event.

On example of a bug detected by this check is SunOS's use of interleaved
DMA and non-DMA commands. This guest behavior currently causes QEMU to
parse uninitialized memory as a SCSI command, with unpredictable
outcomes.

With the new check in place:

  * QEMU consistently creates a trace event and rejects the request.

  * SunOS retries the request(s) and is able to successfully boot from
    disk.

Signed-off-by: John Millikin <john@john-millikin.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1127
Message-Id: <20220817053458.698416-2-john@john-millikin.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index cc71524024..4403717c4a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -712,6 +712,11 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     SCSICommand cmd = { .len = 0 };
     int ret;
 
+    if (buf_len == 0) {
+        trace_scsi_req_parse_bad(d->id, lun, tag, 0);
+        goto invalid_opcode;
+    }
+
     if ((d->unit_attention.key == UNIT_ATTENTION ||
          bus->unit_attention.key == UNIT_ATTENTION) &&
         (buf[0] != INQUIRY &&
@@ -741,6 +746,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
 
     if (ret != 0) {
         trace_scsi_req_parse_bad(d->id, lun, tag, buf[0]);
+invalid_opcode:
         req = scsi_req_alloc(&reqops_invalid_opcode, d, tag, lun, hba_private);
     } else {
         assert(cmd.len != 0);
@@ -1316,7 +1322,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
     cmd->lba = -1;
     len = scsi_cdb_length(buf);
-    if (len < 0) {
+    if (len < 0 || len > buf_len) {
         return -1;
     }
 
-- 
2.37.2



