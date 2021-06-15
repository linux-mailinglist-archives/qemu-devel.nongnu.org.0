Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81B3A8160
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:50:45 +0200 (CEST)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Sm-00014q-By
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HW-0005aD-1k
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HT-0002fb-8a
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id my49so22666471ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufg9KAAVUpb6SdQp+JrhzTkawAhYImLq6kgNA9vSLME=;
 b=sqXAJ12bXyaBGdaVRDkATs7jmtrBnTsRM3dWuz7OzH8gB3mFec6Zx4tOcwSc07SeMf
 sE4kjY3Z10RgK9Gznqkh2zDVb3fVuMHRF8PnxRwGL0gqa7VWy2wn/FhvReXQsr2FSti/
 MW1otputzhYPOwfXDLWBYfAN7U1aEMqQZcE/icXHfz3hpn3+1welq0sTwheGiVfj8QQ1
 ic3j374cZtIBO1atD3fcTc2xpS4kNyCjRyooKVeDNrlGuNYKYV2Czsn10qxQkyzt+KRl
 cJL4ShW5tWQclSjHTHHG2nV6/FKg1S6R3tjQqIruF8kdYwTfuaQ0PfEMdZPyatssrqdp
 oLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ufg9KAAVUpb6SdQp+JrhzTkawAhYImLq6kgNA9vSLME=;
 b=GXQok4c3PInDBjjT6EgoqM4bOIQxTSVXMnF3N/enNItbPs1A2ZE5aywlqokflB1Bn/
 1nboX4OgoRPt+8sfj4gzuG4jBuKiQBbKZ00htsbeuKwilgESUMtsjwTScWKHJQIgGqiB
 owfpBW9a+0LoXK40zTdwrg6Sb2wqkML4DWflH2DglgoBxtF6dsBdpSAfN9Skcql7J179
 PKY4Gg0mzBBFmQCPcAnI92k6/jIMcivnXuehoT9qmhwJi4ueiJ+nfV7rw9v/Emrh85ZN
 bN5vKcwaOUkMw7L7wwkGokgN5rvYhqml0BMaKEtbSmWmAvb5yNr1QNP2QiMUL6rJuTN3
 ABJg==
X-Gm-Message-State: AOAM533gZLopPUP0n8YETVCBtM+FJC7rpB/2zptY1B5cgJ1FOt3jZfag
 Cv8E3C4bVCmTCH+03kAgM9v/tc+MNrY=
X-Google-Smtp-Source: ABdhPJw9hT52j2gxlH0A9VInOuQ7o9KXwMnG4muaGPWdikdIK8k+vVOm9l7U3DOvBEfHHF0ImcGhng==
X-Received: by 2002:a17:906:7203:: with SMTP id
 m3mr20597279ejk.381.1623764341952; 
 Tue, 15 Jun 2021 06:39:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] esp: only assert INTR_DC interrupt flag if selection
 fails
Date: Tue, 15 Jun 2021 15:38:28 +0200
Message-Id: <20210615133855.775687-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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



