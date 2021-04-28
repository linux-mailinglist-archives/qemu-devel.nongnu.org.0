Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38F36D7CC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:55:48 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjjH-0006ZA-4f
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjey-0001u2-Pm
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjew-0001hb-6Q
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rszJafCnyNWycC3JCo6/5f7yLN9qGaXOTFl5n8p392I=;
 b=Hf8MGBrK9CTP8dt3zP8XaOGLcfCYcuMeOkhIQXw7ZS3cnM2atr/esy0CoCekSJ4wTstZFB
 c5z45CgWW0266ZtkweZp4VQ64LODI0vvqDPa+JPHJDFQP3EROWoT/ViIzzvCIAg8cd2+QP
 SkOhwNwYH8c8Lbo6XEWjHHk9GPYmJ4w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-qrAr4sv5Mi2l7O5qfMJVKw-1; Wed, 28 Apr 2021 08:51:13 -0400
X-MC-Unique: qrAr4sv5Mi2l7O5qfMJVKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 32-20020adf92a30000b029010d6849a4e1so2134705wrn.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rszJafCnyNWycC3JCo6/5f7yLN9qGaXOTFl5n8p392I=;
 b=R5II4N6czklP8THU8943SV4W5GmY87Q0myE02ulaPT1vlI6P1VNWUShIA4vqJH1hfi
 RwTfZEggPlId7lcVHohTTa4T+7BBvkWa9b+SQAcAEOj7PWcYo0trPbnVC2iMco7Pq87P
 5TOEnwZ9Bj6hIiV8tV1vAsck4+x8TzmgAJR8DRpIvmTwcRuQarUt0N4XL+RRUwmtOZDS
 RFRmAisWmaH1shFt17/8hTB5796TBk1xhB3+coZ1ZbDRjK4vyosMn+AjPCaXknptdOvN
 yM46B36DQHQpBTmtwyUAOslFPNbBcj/Jl5xw3Pp7xIYVlXBAK0VEvmO/1TSkdXGpJE2v
 x53Q==
X-Gm-Message-State: AOAM530FjjaEvlNl7LLCLJbEQsBMgr6avy8MApRN63+51JVxMwAZlJut
 Nwo9/X0UIajYuQHeZvAzhTLTpbalHlD/oZiB25iMZuDBy+dAcGSSYP9q92vdf8dnV1h1GGwcvEC
 qGJa73wxU4Pc1jE8=
X-Received: by 2002:a5d:6145:: with SMTP id y5mr34997517wrt.27.1619614272057; 
 Wed, 28 Apr 2021 05:51:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz61VG118UfSl2+PXbhlQc+4e39CWACMo+zUJ8n8qWW8PaseAF2kXslsRxRixMrlXQFBWJmzg==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr34997498wrt.27.1619614271900; 
 Wed, 28 Apr 2021 05:51:11 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j15sm8068534wrt.17.2021.04.28.05.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Wed, 28 Apr 2021 14:50:57 +0200
Message-Id: <20210428125104.358535-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
References: <20210428125104.358535-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


