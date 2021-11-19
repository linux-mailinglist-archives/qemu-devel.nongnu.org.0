Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C745712D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:50:50 +0100 (CET)
Received: from localhost ([::1]:57888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5E1-0000er-I1
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:50:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59A-0002hh-7i
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:49 -0500
Received: from [2a00:1450:4864:20::52d] (port=37671
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003a8-C4
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:47 -0500
Received: by mail-ed1-x52d.google.com with SMTP id e3so43703654edu.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQKZ9bRtqSvHpNaLNoc+FaaQORBxNiFocmVVGQINbJ4=;
 b=h1pXpsUm9vhjIWkXu1cPvKosFlP6v1VI6cfKf60PpoAsELLioV+ybgRHGr65Uxpa6F
 Mqn+PSL77zZxqiczdb390GUKWEwLZ4dP2v1bn6MaJqKCbQa8j4S0m6xhw6jmWwd7AZII
 p+oYqZUEVbmmpXfyddCv9p8OEF6GJAecOcMDr4ciXblCUwFSs5RhMcxXScYQ6V1y28nr
 03rRs/PMg9D5ZwQQP1ehWowziyDoRIt5sHRfAODVgcYcaZcOMgxEalLaCjfr1zbNTFTS
 2ebo2jcfu9t8sjU1IhosB3w6yw1Aemb4Dep1SsJ4BEWwXQdkvmmTpZJswFOYrVhhgwkT
 C8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JQKZ9bRtqSvHpNaLNoc+FaaQORBxNiFocmVVGQINbJ4=;
 b=OeQ9kKSiLWjhG73tmlVqrqCR9iW14DVE6o8ExGSDllmQK/m5C52o0topzPKC2q50u7
 2goiSJAlr5Z1tHEfivWIGYSktbpYurweFCn6D6GpsvjUtmgyjXCV8nXzS824sVB22iv6
 XUA1oDXFK1VBQEBOqkbBLyVAaQjTQGwS09H/X5vSHgzsZpA+uYkmkuaZS6KUT9cUgXee
 8WcNKkgAE4Vh7cq3L83cuIYjPz6Z92NSkwQoYRiEiE7eg4C0dJHEL0J4GHq2tCR9gfIS
 5RJCe5XuA86nnzMBZ4t/CbufMG4QKVFqyHE0ACUcCM4FnUKhqsjidjZpPajO06lAsTo0
 aFvA==
X-Gm-Message-State: AOAM532Ux06Hib167mAOB6qhKbpD3tzlYazoxeysMxmifchqNmDW5d6q
 IJTydATWW6KxW7WKcUy5ZN2/nkcs2E4=
X-Google-Smtp-Source: ABdhPJxceXjuqxfcU2K/ftzWRspg5fzOSokNA8fjiOsQNvNPGh6WlkUrFoE3FH3+1RxgCvlY+gwKQw==
X-Received: by 2002:a17:907:8a1b:: with SMTP id
 sc27mr8630830ejc.572.1637333142744; 
 Fri, 19 Nov 2021 06:45:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] esp: ensure that async_len is reset to 0 during
 esp_hard_reset()
Date: Fri, 19 Nov 2021 15:45:35 +0100
Message-Id: <20211119144539.285740-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

If a reset command is sent after data has been transferred into the SCSI buffer
ensure that async_len is reset to 0. Otherwise a subsequent TI command assumes
the SCSI buffer contains data to be transferred to the device causing it to
dereference the stale async_buf pointer.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/724
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211118100327.29061-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 84f935b549..58d0edbd56 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -894,6 +894,7 @@ void esp_hard_reset(ESPState *s)
     memset(s->wregs, 0, ESP_REGS);
     s->tchi_written = 0;
     s->ti_size = 0;
+    s->async_len = 0;
     fifo8_reset(&s->fifo);
     fifo8_reset(&s->cmdfifo);
     s->dma = 0;
-- 
2.33.1



