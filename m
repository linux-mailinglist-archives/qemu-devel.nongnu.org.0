Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E959AAA6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 04:18:42 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPE4P-0003QQ-Jm
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 22:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE1w-0000rH-1S
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:16:08 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <john@john-millikin.com>)
 id 1oPE1t-0004oJ-6s
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 22:16:06 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r69so5002411pgr.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 19:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=john-millikin.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=g5XZOb0Q7BuQeZ8cCWEQb0w9M9Cn6VklLGrQ4izBCdw=;
 b=deW2FitciT+8Pgpwm5cMBT5UoeYWmOFBGFPHo+7OcRGwXvmqqb5cyYPOFcE1u1NMMb
 Idf3bg4jUIt+Kwnv5Z7Gz8ttR1QOOf0AzbmU5f2Ew/IyUTqXaSxQzNZzPATnhyU1Pm38
 wuZLV5ZfLLwqq7pbnUdbRhp86/on8kPpE5iSTQRUBF0OY8qi/fN++NRg4lFLroZP4xqR
 +urFTM/BtKYvH7X3CYV4UrVFe0ZaBwqboq4NRNlW/m+TBcrNkeS7X4g4tVDkkp2GGWnw
 1SMEmc5Up5fOKl3fB1ECPTYYxsgv8czBm0W6nOll1Lm7qQFED3uiDs5pNyb6KQretpyU
 htnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=g5XZOb0Q7BuQeZ8cCWEQb0w9M9Cn6VklLGrQ4izBCdw=;
 b=qDQiV5EBljaPGpZExFFtGeidJcro7nC0qs6+eVxT1x9PXN6qi3eZcTGSxcdecrIKOd
 Fh1msgB4KYD945NsK69VnCPSCxXuiNM4mbBnU87WHAmgRibsYj7PKsDfOF25xtSZNLtR
 rsNpLxiPTa9fBeoRm/K2wy1I242QPUP47ecAIAfW8QRztNqs4qqJfUBc82maanEHPOSD
 hVb8ely9dgpFgtieifdjZeUVXAChFEFgn8uZlE3CbRjMEmuFJZiQrI0BXCjsFR1xPFxk
 3N4iZ9Tc29b1sY32YuAMFie/CHMHKnzwqe7cT8Mmhqouq+yaDpQJyP6wC/45kQhDIkHS
 WWdQ==
X-Gm-Message-State: ACgBeo1N2dK+i+8YFo8HDLj78OhfcGMSuRnO+t/N3lZclRu2jB9leO98
 H3Q+pkfrFcjudDqQeNLFo+TOKFO3sHbeKksM
X-Google-Smtp-Source: AA6agR47Zqfcwmvmb1OmctHSD+f79gV3qDB+Wxzo6UgYPt8l3Ddlsqy2wmSP3g4MXxMkiWAIwcDf5w==
X-Received: by 2002:a63:fd14:0:b0:41a:20e8:c1e2 with SMTP id
 d20-20020a63fd14000000b0041a20e8c1e2mr8525985pgh.286.1660961763861; 
 Fri, 19 Aug 2022 19:16:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2405:6580:98c0:1200:e418:76b4:96e0:cf28])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a170902e80f00b0016d95380e8esm3819729plg.140.2022.08.19.19.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 19:16:03 -0700 (PDT)
From: John Millikin <john@john-millikin.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Bill Paul <noisetube@gmail.com>
Subject: [PATCH v2 2/2] scsi: Reject commands if the CDB length exceeds buf_len
Date: Sat, 20 Aug 2022 10:56:50 +0900
Message-Id: <20220820015648.902562-2-john@john-millikin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820015648.902562-1-john@john-millikin.com>
References: <20220820015648.902562-1-john@john-millikin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=john@john-millikin.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
---
 hw/scsi/scsi-bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index b35fde0a30..abe195b22a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -712,6 +712,8 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     SCSICommand cmd = { .len = 0 };
     int ret;
 
+    assert(buf_len > 0);
+
     if ((d->unit_attention.key == UNIT_ATTENTION ||
          bus->unit_attention.key == UNIT_ATTENTION) &&
         (buf[0] != INQUIRY &&
@@ -1316,7 +1318,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
     cmd->lba = -1;
     len = scsi_cdb_length(buf);
-    if (len < 0) {
+    if (len < 0 || len > buf_len) {
         return -1;
     }
 
-- 
2.25.1


