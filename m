Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88C5305EF
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 22:48:04 +0200 (CEST)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nssUd-0002aW-A4
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 16:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssR0-0004dg-EF; Sun, 22 May 2022 16:44:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssQy-0008QC-Ua; Sun, 22 May 2022 16:44:18 -0400
Received: by mail-ej1-x632.google.com with SMTP id wh22so24784376ejb.7;
 Sun, 22 May 2022 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WoiVLmOvFiBXBWe7BQz1kBS+GqA1IFsINI5KHtpnXF0=;
 b=B5WHxfXpTNYcmSUTWIRfwU+BE2kYxbPuynIhKtm7Ci1Mr79nNBJhej69Z2fO36U7c2
 v+fuxqA1Cw9rfg6cWzwfcGBAcxg7SWzeHyrcHxshgZl+bX+ZQeTpDslAYgb0HErEhr9P
 MMZcUjfZPZvPrNByPcGr/7cTV9A0jItJbwIkDRhY+oBCZs/22qUK2h7sYc7MsDF0WrCN
 x1YzWVezIm5OwpXnGQlLHYwDskwjVYd8iYrwqPSz+d+F5rbbxewJPe6JLtmGT0Xc8yVF
 mLpb+PrT3F5LzM5BFr4ZrUDG25PAHKlRZhnTSlHg31a2CYZeMbAB3bgN/T8Mzlo8NODw
 Kgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WoiVLmOvFiBXBWe7BQz1kBS+GqA1IFsINI5KHtpnXF0=;
 b=CtlyDVnFKoHx15bKZ73Vm2Ht466AYTroNZSJbVX62Y+ui1hGrwNkHsfYvMtHf4f9x7
 AKapYGh0EzNnWfkOiCUCjeoJUU3u7wz2FfzFsP6IOdPX/VPFA85uwVgwWwHVV90aLUoL
 reC/u1mCQHrh808MFPxIZ/+rFV5u12bEGRVFU1LwKvV5noegRSa62uBQMABbovH7AlW3
 gYFxGB5LxzY3Ivom8MQNtUGJAmFMeo5hphvnd2OVj1Itjod4qUuqot4X+kvPYLc86XHf
 0w0RW3qVc90syVK3TVNriXYa08hF5g0uyzZnxkyKgkpfJShUhVx12rNHDsxndDgwt/4q
 u+2w==
X-Gm-Message-State: AOAM532FB43ZDrnMLT0HX8Pro2uPqeyokMlXAG0p1cd+TF8yRii/vXlS
 +aTrAQgpdQo9kyMptUy1yV1rGjm+TDo=
X-Google-Smtp-Source: ABdhPJz3GjvnMMOjMSFm+lZ9mpBo+Et7tlUdoSU/U/uqf71o/2nVNfN4WZVTN5NyKg8R+SrzE4i/3Q==
X-Received: by 2002:a17:907:8693:b0:6f8:635a:1d32 with SMTP id
 qa19-20020a170907869300b006f8635a1d32mr16874067ejc.663.1653252255246; 
 Sun, 22 May 2022 13:44:15 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1709063f4800b006f4c82c2b12sm5533968ejj.19.2022.05.22.13.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 13:44:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 2/3] hw/i386/microvm-dt: Determine mc146818rtc's IRQ number
 from QOM property
Date: Sun, 22 May 2022 22:43:46 +0200
Message-Id: <20220522204347.10438-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522204347.10438-1-shentey@gmail.com>
References: <20220522204347.10438-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
configurable. Fix microvm-dt to respect its value.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/i386/microvm-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index fde74819f2..287818c641 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -209,7 +209,7 @@ static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
-    uint32_t irq = RTC_ISA_IRQ;
+    uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", &error_fatal);
     hwaddr base = RTC_ISA_BASE;
     hwaddr size = 8;
     char *nodename;
-- 
2.36.1


