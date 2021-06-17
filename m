Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9E3AAFE6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:37:47 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoT4-0005Ed-4u
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoND-0002g0-Br
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:44 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNB-00063X-KI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:43 -0400
Received: by mail-ej1-x62e.google.com with SMTP id ho18so8719984ejc.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f14dpNn0/J+5dS2KxNQSZZBoi/TEgJbxNaHvHTAG8hM=;
 b=iRxUQ5U1f9NzMLxIfLn8j4AwpPzk3U0oTHl1DniHkbf+eEWE+KeIP2CL1gdcZVtD/U
 zwYZtDHRE7NtTNjTx9/45K5zXPIAAEPxY17CAUuA/aYwDRF1iA8EWozH+ZmvBDkJjqW0
 yOvoepgz6JCDWy5TFGpqGx0QgPYNOlCEA34NZaN7oZ7yqWkTlCD/3QGRShTbPpvlQiWd
 awjqi9Sz6cFsiOOed3OFOmMlWm5sXmW3fOtqO8TdJhOFPhMQL7dYdwyoVMjk6Gx8vJKd
 UXg6duk8Ak9Bn7BDSFXQr4vPwRQ+uYYQ7G3qS4Xo0Jn6p81ZnehmI97ik/ViSJuLBt4L
 HF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f14dpNn0/J+5dS2KxNQSZZBoi/TEgJbxNaHvHTAG8hM=;
 b=Ub+XjU0lS2K2Cn1f/1qt7UK5O4HHZDoZk14BtrC4a34Be+51YZ0mBTJsFzFub/YHvn
 klcm1V8K+3AYlV4sC/lW+I+lj7/m/okQ32OsE9xXU1koBFrWfHnrtBLRPTsuI8Fp7STB
 UavgSLJQflX4dwMq5PnnB47y3ugxlvVY/rD09yaEwNO8uNfWiQoOto/W73s/V5Nd9QEn
 YTUDJnWeOZPIlDKN/b6uEwJJ6HCD401Lh4etM6tW/3Lmx+A5/QKq8SttS6WhdmIpgNEn
 +qwU0uVAniWyjbbDuFnJ9Nj2PWI+5n1DGP/9YQeJ9xSKPSOlEiDrLE8+SDcuEmS815uT
 tzUQ==
X-Gm-Message-State: AOAM530SPtNtsb6ch0q8rHYKI1cbYtZ77y9oSbwgaAO5k8+BYUJe431V
 djQMMqi2hMIWJ596Us6Od1eMYJn/ECc=
X-Google-Smtp-Source: ABdhPJziQgDifU19btvAhZmE010mxD4axOyVJlnkk8+q1iP5YCsOwDcddka14xIIKxIglzDr8DXjnw==
X-Received: by 2002:a17:906:110b:: with SMTP id
 h11mr2101942eja.356.1623922300182; 
 Thu, 17 Jun 2021 02:31:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] esp: only set ESP_RSEQ at the start of the select
 sequence
Date: Thu, 17 Jun 2021 11:30:56 +0200
Message-Id: <20210617093134.900014-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

When processing a command to select a target and send a CDB, the ESP device
maintains a sequence step register so that if an error occurs the host can
determine which part of the selection/CDB submission sequence failed.

The old Linux 2.6 driver is really pedantic here: it checks the sequence step
register even if a command succeeds and complains loudly on the console if the
sequence step register doesn't match the expected bus phase and interrupt flags.

This reason this mismatch occurs is because the ESP emulation currently doesn't
update the bus phase until the next TI (Transfer Information) command and so the
cleared sequence step register is considered invalid for the stale bus phase.

Normally this isn't an issue as the host only checks the sequence step register
if an error occurs but the old Linux 2.6 driver does this in several places
causing a large stream of "esp0: STEP_ASEL for tgt 0" messages to appear on the
console during the boot process.

Fix this by not clearing the sequence step register when reading the interrupt
register and clearing the DMA status, so the guest sees a valid sequence step
and bus phase combination at the end of the command phase. No other change is
required since the sequence step register is correctly updated throughout the
selection/CDB submission sequence once one of the select commands is issued.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 1b9e48a5bd ("esp: implement non-DMA transfers in PDMA mode")
Message-Id: <20210518212511.21688-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 000e45a624..18d4d56392 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -481,7 +481,6 @@ static void esp_dma_done(ESPState *s)
 {
     s->rregs[ESP_RSTAT] |= STAT_TC;
     s->rregs[ESP_RINTR] |= INTR_BS;
-    s->rregs[ESP_RSEQ] = 0;
     s->rregs[ESP_RFLAGS] = 0;
     esp_set_tc(s, 0);
     esp_raise_irq(s);
@@ -917,7 +916,15 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
         val = s->rregs[ESP_RINTR];
         s->rregs[ESP_RINTR] = 0;
         s->rregs[ESP_RSTAT] &= ~STAT_TC;
-        s->rregs[ESP_RSEQ] = SEQ_0;
+        /*
+         * According to the datasheet ESP_RSEQ should be cleared, but as the
+         * emulation currently defers information transfers to the next TI
+         * command leave it for now so that pedantic guests such as the old
+         * Linux 2.6 driver see the correct flags before the next SCSI phase
+         * transition.
+         *
+         * s->rregs[ESP_RSEQ] = SEQ_0;
+         */
         esp_lower_irq(s);
         break;
     case ESP_TCHI:
-- 
2.31.1



