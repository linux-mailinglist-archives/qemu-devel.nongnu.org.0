Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64802383BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihPb-0001RD-Em
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNT-00071X-MB
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNP-0002wL-TP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKTvIJltaWyJ3tXssokHbyKTt2E/IQqH3Pybl80dLEU=;
 b=bn4ZcXVXZKqyPv2ebdHn0YOLwvqtVgGQIoZEJYv7X+mVSM9auo1BaGCon7O3J42oBgJbvj
 jwrt2xzQrCqk0bMo+sBmuJEIzJpXR+a1lcyAq7poPYHeFPPp7EDz+NHA9ZsY90bQKJC8JS
 JBA1gJqth+Wqilu+5vhiXAZCNvYIzu0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-b1qeFzEbMAWo9RAoOKWzVQ-1; Mon, 17 May 2021 13:49:55 -0400
X-MC-Unique: b1qeFzEbMAWo9RAoOKWzVQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y19-20020a0564022713b029038a9f36060dso4333247edd.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKTvIJltaWyJ3tXssokHbyKTt2E/IQqH3Pybl80dLEU=;
 b=iE2/+DGfuFRjwdUhJIZhPAMfBm90PYbkAfVMSPyLhyRP05ih5+nOkBrR7/mmQDi+X9
 PFvZ5kT1FyqV/nssBuW0Pf0roYl12/oBJMaVQfo6NitM6QvIpmJwIaN6UQ4/aR0SGQO0
 LCXVim0VMb2rDZsn3dAlusvNbEhiVATHxo3NyzIPtw0aYCHSe3UU3LLl5MeIn9meTVBb
 gaVL65lAvRC4sa6kDVH/bSJf1S04Y0Oeci/25ABvcVF4TJQVbxz9NONpglbTubJ5mySs
 4QXPWHYJ4tKm8CByndWlOD3bNOk9AETYLjNPv+hrZTxwzK8qfkQ1nWPaGNwMiVVUIJ5p
 ddKw==
X-Gm-Message-State: AOAM5300h5MfJkdPAOqw0pchr5n3u2zR4ayhdUH5EjM1PH4vIIEXbtEt
 iair4rMR1XYQ+VxchHGqT1hwaYH7TnktvIiTnfSgzTIMiDExzt7LIMZ9wq+X//tLiQHrkTozCHf
 rpDVqojxEcdTNkgfP1hWQN2E/Sf1G4hhwlN/+/TsTj/4DkayTFcdsjI/XnVSMSCee
X-Received: by 2002:aa7:c782:: with SMTP id n2mr1505896eds.77.1621273794404;
 Mon, 17 May 2021 10:49:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj5JLSE+WMRh8WJJp+/HYGYmcfXFusRt9aLzm6vIieAb6mRxvMgOK/punaML/5gRG+21bsgg==
X-Received: by 2002:aa7:c782:: with SMTP id n2mr1505863eds.77.1621273794193;
 Mon, 17 May 2021 10:49:54 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b9sm2759384edt.71.2021.05.17.10.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:49:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 1/8] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Mon, 17 May 2021 19:49:40 +0200
Message-Id: <20210517174947.1199649-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517174947.1199649-1-philmd@redhat.com>
References: <20210517174947.1199649-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c        | 7 +------
 hw/block/trace-events | 1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index a825c2acbae..1d3a0473678 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1242,12 +1242,7 @@ static void fdctrl_external_reset_isa(DeviceState *d)
 
 static void fdctrl_handle_tc(void *opaque, int irq, int level)
 {
-    //FDCtrl *s = opaque;
-
-    if (level) {
-        // XXX
-        FLOPPY_DPRINTF("TC pulsed\n");
-    }
+    trace_fdctrl_tc_pulse(level);
 }
 
 /* Change IRQ state */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index fa12e3a67a7..306989c193c 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -3,6 +3,7 @@
 # fdc.c
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
+fdctrl_tc_pulse(int level) "TC pulse: %u"
 
 # pflash_cfi01.c
 # pflash_cfi02.c
-- 
2.26.3


