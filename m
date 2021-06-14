Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9233A6F39
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:36:36 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssNv-0003xg-7h
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssK4-0004dY-K5
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssK2-0004rQ-Ka
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623699153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WwJjcODkch3wuwA97/f+VTf6MaRPKM6xZWzz2R2H1I=;
 b=ZLWfH7qGjfK+bLzrseEFFNxfPZ0+KgxNgr/Dc533M69N6Z4zofLTTuiOz0uhT7lQr0sxkO
 dkfWDE0M0s5N2wIWJqH0irCU9dNndjp1+Be4r0TymFzaFX2OzXMWUGMLUusysV+rSPTnHU
 7/fnILWm/s6qaNvVPQWZKpNd4rE823I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-aMnWWl4HNYi9yctDCzDK7A-1; Mon, 14 Jun 2021 15:32:32 -0400
X-MC-Unique: aMnWWl4HNYi9yctDCzDK7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so401878wmq.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WwJjcODkch3wuwA97/f+VTf6MaRPKM6xZWzz2R2H1I=;
 b=tmCKAiVE/ZnPCAxak0n3VaUuJ9zGWGZ5Bbv3yZ33pecOHEd5Sw6WYYruxADi/h4HAi
 lNeAsj8k52jCPkd/HrcqhjKzOrCWEyp21gV6xMVYHXVmaTy5alUup/1gGyd58nr6Wwki
 it0IFpy4QDXnXE/vtNvKzUADQFMXEbd/Vw54NGkqnxED5ND+T3cf4upfBZYrhcEP57YR
 +c4gpDVk6pKfl3XnVVRc/g6XQEb2+TBz5eXQV9FrtHOp6TlX37RJwlGBBbphkfWfKr/Y
 /6gllPtMaBA//Bl8guE7QnQvuWDTc3qseUd2JPeMr9HyaAjjypZe3XiYxo/UkWCctOIi
 dQEQ==
X-Gm-Message-State: AOAM531GGLJ6vJm3Fbpzk7oAGwm8G3KY7aflkMWxWVyYq+O7gEAGJvNt
 5fn9cZSFYkhyHNP76zkDKmZqYHddWbEFMZf4RtoSrFiR+K4jLzWrQ0ld1caZx40EHTZYCHe+X4O
 Oe2KFOUX93XBnvc0KvNkrRTQS0oqiPwPuFIU6N5vwIqiND1xzXwfDSHJwaB9B8wKo
X-Received: by 2002:a1c:1b4c:: with SMTP id b73mr726393wmb.57.1623699150875;
 Mon, 14 Jun 2021 12:32:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9paDnjDt9qOhtGsyQnMSzqkQrAysUO3g3Gne8vfGrc+W9LPG1E0OpBrtMH+RgDVYQNUyySQ==
X-Received: by 2002:a1c:1b4c:: with SMTP id b73mr726375wmb.57.1623699150741;
 Mon, 14 Jun 2021 12:32:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a9sm8808008wrv.37.2021.06.14.12.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:32:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/6] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Mon, 14 Jun 2021 21:32:16 +0200
Message-Id: <20210614193220.2007159-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614193220.2007159-1-philmd@redhat.com>
References: <20210614193220.2007159-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
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
index 70bed9ddb75..6a0d973805d 100644
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
2.31.1


