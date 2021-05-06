Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3282375506
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:45:38 +0200 (CEST)
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeJu-0000FZ-1G
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeDG-00089q-2k
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeDC-000827-F1
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaJZZTBiusehu1Tq7zBJHOToPc0jvSFCIFWhGsqf9q0=;
 b=fresYRepUTg/YtxMS/3eGVjkRpuHC2Xi5fEGESlljRXmD5PL2fWTexa6z2dHsysbpno9TJ
 tkwTRHAiN4vJN9wgANKJgwRKXkgLVDloiLlGdGf+yccTbZe6atcZxHWkoBcfxYN1bgt7Gi
 Pwe4Jhb+5LbDNGRhRbmSjgWJlSTV28w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-fmo4zyHLNJGEOGswP-dONw-1; Thu, 06 May 2021 09:38:40 -0400
X-MC-Unique: fmo4zyHLNJGEOGswP-dONw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso2224388wri.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaJZZTBiusehu1Tq7zBJHOToPc0jvSFCIFWhGsqf9q0=;
 b=P2keawXndB9xltoA1BEHjl/eCAxHCx1xUdwaO7P3qYF3kDzIvyYaZILoIP87n6B5OX
 ItD57xstZQzd/TvA79IiDqzlCOcOYpqH2AN6j+QC+JrJjVFlr8TmVTKl/Zon/h93toKQ
 6f0QID1IQ/6LYQuVlcJMZkf3khlub7rAbiGD2xmma+GFXoKVLs6Y6e0zho2JhJfClGIH
 I7y7tI8JyRxW5BlpDI3QrmIOvLZkEEN8QfHakHwvo1Os9IWOviitGYs1Zrna+OiqjaAy
 Lv+hcOe0N8UTuZzyvJakQUz0A/EZdYIfZaqvGc5dk+0rPxeSFOBYRwfp5P69ryRkrVNq
 g25A==
X-Gm-Message-State: AOAM5335+cvWLRnFz4iMBQLqFyksOmFiHEA8kc15K4Ux4m2e0yUq7jyt
 iQ8y0cFui7TKd+z+Ps4pwiE1f0XhRt+updjHowL5lH3yuoAeNR/ECroLZtaiGljyHi2Vt5zedFK
 iP9hTVc4UAhCdb6HkDImkoJcMX2p+9K0L46tT7u4Yk719t48N7YID87dK2DG4bZYY
X-Received: by 2002:adf:c002:: with SMTP id z2mr5292561wre.100.1620308318988; 
 Thu, 06 May 2021 06:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyHdfkaTmkvWQf5Hf6Mx8u2g2OWRDThcbJG1gkPh5MWHU1eQptHFzQJqG0ffuS/NnFVO+6Rg==
X-Received: by 2002:adf:c002:: with SMTP id z2mr5292527wre.100.1620308318789; 
 Thu, 06 May 2021 06:38:38 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id l22sm9501029wmq.28.2021.05.06.06.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] hw/misc/pca9552: Replace g_newa() by g_new()
Date: Thu,  6 May 2021 15:37:57 +0200
Message-Id: <20210506133758.1749233-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace the g_newa() call by g_new().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7f..facf103cbfb 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -71,7 +71,7 @@ static void pca955x_display_pins_status(PCA955xState *s,
         return;
     }
     if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
-        char *buf = g_newa(char, k->pin_count + 1);
+        g_autofree char *buf = g_new(char, k->pin_count + 1);
 
         for (i = 0; i < k->pin_count; i++) {
             if (extract32(pins_status, i, 1)) {
-- 
2.26.3


