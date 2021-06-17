Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA73AAFDD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:34:50 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoQD-000792-HO
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoND-0002ek-0M
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:43 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNA-000636-Tp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:42 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nb6so8664803ejc.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufg9KAAVUpb6SdQp+JrhzTkawAhYImLq6kgNA9vSLME=;
 b=V4EqL6KdnAMEqYs4oc2N4c0U15Gh3z4G1USFyrAiHguNrPe0PK4dk42RongvWyQ0CG
 i9n8FQI6Swk3MkmIIa+EA3QCyoLfY84tR9hOSz+Udw8TEbjaChQY9ZNAB6vlodvLEk5Y
 2j28bKGX/VcDHx5UlwJuTPr7UWXAsFjLR5YMeKyLaW5iW6yOzsS2crEG8QZtRZiwrkc9
 TFJod6Z3LDAqsC7jLf8UyRAkGuDAVL/h5Zip3SEqAow8d3U5efR3dhRS058zE98aS4+G
 ieKwdmO+E9baseY4sPTtlNjw00ut1x31gtT/A8XdxFiD7Xx5x4wG4GtukDSYqVZ0a77g
 o58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ufg9KAAVUpb6SdQp+JrhzTkawAhYImLq6kgNA9vSLME=;
 b=W0WdeuyyucguOr7Aab8VkHgJ9xv+Sk4S3cG5hSfXSIhknUWX58cXjAIkA7gJIsqV1E
 QE2qPFf8DVrsAb0fyyeO187padOtaleWPSq7JjwU/phAFTuSguxEWPgCNWwezsQkLE4+
 +Yv2q232F8ZQlN4Y1ohcY1oj6+Ohb1+LMN7haSrc4Y4kTnig3wlqUsn4bYjZBRXk+Jqg
 7VFA9xoAFXl39bPjVawiNcUgxFdNpmeprggmkVBjG/jdzpDsOQDdAtd4R/X+MWqkxgVn
 asqrjlp4H/J7/aqOpE7KlLrEh9Ck7qqu7mSfG1VTT5CZbcxsXNRHCa2UnpXL2/eA6VJ2
 KHKg==
X-Gm-Message-State: AOAM5322S33KmNnLllwF1z4dgBlMDSa9TYHBtmzQQ6/6taeUF/QcDhPr
 EVlUtWmbE0q0tYydLumVpn43ccxhPFY=
X-Google-Smtp-Source: ABdhPJzjZPo+GKIZ5AoIO9bMuaZcI4aGjwv0arSm1BTcs9PjLzvLd0Jk+NTDEFtvtrSGIa4D5rsM8A==
X-Received: by 2002:a17:906:27d3:: with SMTP id
 k19mr4116169ejc.368.1623922299482; 
 Thu, 17 Jun 2021 02:31:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/45] esp: only assert INTR_DC interrupt flag if selection
 fails
Date: Thu, 17 Jun 2021 11:30:55 +0200
Message-Id: <20210617093134.900014-7-pbonzini@redhat.com>
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

The datasheet sequence tables confirm that when a target selection fails, only
the INTR_DC interrupt flag should be asserted.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: cf47a41e05 ("esp: latch individual bits in ESP_RINTR register")
Message-Id: <20210518212511.21688-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index b668acef82..000e45a624 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -213,7 +213,7 @@ static int esp_select(ESPState *s)
     if (!s->current_dev) {
         /* No such drive */
         s->rregs[ESP_RSTAT] = 0;
-        s->rregs[ESP_RINTR] |= INTR_DC;
+        s->rregs[ESP_RINTR] = INTR_DC;
         s->rregs[ESP_RSEQ] = SEQ_0;
         esp_raise_irq(s);
         return -1;
-- 
2.31.1



