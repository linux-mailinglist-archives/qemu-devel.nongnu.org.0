Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F0D388093
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:36:24 +0200 (CEST)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5Vv-0003z9-5s
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5Sf-00019I-V0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5SZ-00076J-Oc
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621366373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQBaPB2rPx7zwmJ2L9PvToDExIoXxeF+Eyck4rA2oM0=;
 b=NgoFI48JFjtYk/fM+Gh/FbulQO26GNL/s80ChDyvLnFp4K/mHUaAJesa+VGLIj29rvhHKd
 150ws2daeG4h7srtQkOwzjfbwps+y3CThwTusp29BMMMToqIllxyfu+BtBNV8ovwawa65u
 4gyVo6jOmiSLXPkg0KF+g52wnoyvCco=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-HxPjhqy2NfG0CIAfrRjBtw-1; Tue, 18 May 2021 15:32:52 -0400
X-MC-Unique: HxPjhqy2NfG0CIAfrRjBtw-1
Received: by mail-ej1-f69.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so2799447ejd.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQBaPB2rPx7zwmJ2L9PvToDExIoXxeF+Eyck4rA2oM0=;
 b=qrK3KlEatSvPgWFwa8Smt+9KShgtIJT7wRzwCJDL1Nn16PfVqhdUH289oUnJOwQuiC
 VUbufJSBVrs7sreszO7fOHFfntDioo3BI/YrQTdcoY8KOj6Uz8F5s6pTBqySsx3Fj1CN
 CeeeyPqG8DzJJwo+ZNfPA4ztNHlYJCCEA4Pp3LvHNhB2a0FXxbYzRVLfXup8XbYMFbSQ
 HYJx7sVzprbm1IDPjS3JmDppyrw8+bCLr5+CKDPORo44vG/o83L5YQSKEujm8j9D/4Ff
 4n5GMAPH8ndzuGqKzA8BVgSTR0sL2GKB3QRMkNvN+vbkVifLj5OYhFmBwAiT9ZxZaMs0
 RYUg==
X-Gm-Message-State: AOAM5311R9oTB8ExwYZlvuOnqun6jvrNVSbs1a2OvQc/hTffgT7yUOVs
 Q/DpIIUh1KJsm4xbw2nCc1+V/1MvzYy/J7AWxGa+zSdY3xgxb6pHyzATR8S0AmISlG1GdxCCs0T
 sUb2EdFdaHeKg9sTAUoaQCy2KQ+mAyMgaBnglknjTM70lvO7Q5CNCM/cwHxRGvpnc
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7540159ejm.527.1621366370851; 
 Tue, 18 May 2021 12:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQlqwGuNWZE/w+xuvejbIZiFbzPdPfRz8bH6wbR6h8wIcu4lGd062J8/Cx60CAyIM8mFgtXQ==
X-Received: by 2002:a17:906:5291:: with SMTP id
 c17mr7540136ejm.527.1621366370623; 
 Tue, 18 May 2021 12:32:50 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k2sm10880861ejj.30.2021.05.18.12.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:32:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v5 2/6] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Tue, 18 May 2021 21:32:35 +0200
Message-Id: <20210518193239.1725624-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518193239.1725624-1-philmd@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
index 646917d045f..7b26fc738f0 100644
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


