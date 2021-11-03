Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C0444488
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:19:21 +0100 (CET)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI2r-0005K8-0F
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpA-0003Ug-Kh
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp6-0000lJ-IG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id z200so2222550wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cWNpBnywY+l7pKZXWN6LNoB6JNOQy205F166UqLIg4=;
 b=ATevcCaj401p3vjjS3oFhtcOkFHGsFN7SWj+aGpvj4pOb0SAFMXBAQvb0EKcC0Z9pI
 +iRE9VV3mUfCdUcUdkqmfyKWqAMVONcYTDP2ZbhuoaJH+kHOK5X0G7OpD5BLjmGzss/6
 KFWzN0VKxTP+KRfOfbFY2Zc8lSyomiyiYgbPMjlA5yry8CosmCYXu6NvgRDGbYw8iwRy
 95++Z6n9waS7hzFPPgk761FViuSkHgHzOsTtpfZtJetWCszeYRINYOe4yEFkbfUhq50l
 mCh6Z0+WwBZpsP+eJWSGvWFyOEjyK/XfWeLDkyfKk5Fp4uk1dwgafWPZLG+/lTuG09Ui
 pdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7cWNpBnywY+l7pKZXWN6LNoB6JNOQy205F166UqLIg4=;
 b=nXK0cS4zUkB7LjWQlbPFhWfpTmMAZbCT6qvUm0/yiUBp2UauMhou0Gg+eE28dJ8CDs
 Qqb6t6xPqr/cWj16+Lhoc7FIqmyfJ8Kc1rMw+1luf1fwrjin/FcNaKhYxyb7nvVc9unF
 DudDFV725E6zYa3U+GcRQLF109pF5DXVakmj+0Gnft84NTVUI9UOrDslLgQjnh7PiXln
 r9rjJKJAUxdqIrOFhFGXDxl8ReXy8GFNSN3jf12QxoKsL8iNvMVdXCz1F2X/uJGRwimb
 PpVL2wqbZoRMbR58X+M9gGi11ViAHIkkEsqQgNWQkWonG7x8XAkDGAET245tuF2uVwRm
 Gqzg==
X-Gm-Message-State: AOAM533hp7VlEQKhNYOU2de3Q8dp8F77tlFa8L4sLconKqXUttIzji98
 XiHpNmmuZKRJ8fDnSlf+V9vtIekRfVQ=
X-Google-Smtp-Source: ABdhPJxDjpnKVuKXmmM2ztuQtbUsEwRYYUknGez7xVDHdmUHxuzFN2D3tEQvOKmiFgqpPb8Wq0B8zA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr16372682wmc.31.1635951905557; 
 Wed, 03 Nov 2021 08:05:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] esp: ensure in-flight SCSI requests are always cancelled
Date: Wed,  3 Nov 2021 16:04:34 +0100
Message-Id: <20211103150442.387121-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

There is currently a check in esp_select() to cancel any in-flight SCSI requests
to ensure that issuing multiple select commands without continuing through the
rest of the ESP state machine ignores all but the last SCSI request. This is
also enforced through the addition of assert()s in esp_transfer_data() and
scsi_read_data().

The get_cmd() function does not call esp_select() when TC == 0 which means it is
possible for a fuzzer to trigger these assert()s by sending a select command when
TC == 0 immediately after a valid SCSI CDB has been submitted.

Since esp_select() is only called from get_cmd(), hoist the check to cancel
in-flight SCSI requests from esp_select() into get_cmd() to ensure it is always
called when executing a select command to initiate a new SCSI request.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Closes: https://gitlab.com/qemu-project/qemu/-/issues/662
Closes: https://gitlab.com/qemu-project/qemu/-/issues/663
Message-Id: <20211101183516.8455-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8454ed1773..84f935b549 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -204,11 +204,6 @@ static int esp_select(ESPState *s)
     s->ti_size = 0;
     fifo8_reset(&s->fifo);
 
-    if (s->current_req) {
-        /* Started a new command before the old one finished.  Cancel it.  */
-        scsi_req_cancel(s->current_req);
-    }
-
     s->current_dev = scsi_device_find(&s->bus, 0, target, 0);
     if (!s->current_dev) {
         /* No such drive */
@@ -235,6 +230,11 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
     uint32_t dmalen, n;
     int target;
 
+    if (s->current_req) {
+        /* Started a new command before the old one finished.  Cancel it.  */
+        scsi_req_cancel(s->current_req);
+    }
+
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
     if (s->dma) {
         dmalen = MIN(esp_get_tc(s), maxlen);
-- 
2.31.1



