Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA768E4C1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0u-0005j6-2J; Tue, 07 Feb 2023 19:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0r-0005dx-OV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:37 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0q-0008UA-4m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:37 -0500
Received: by mail-wr1-x435.google.com with SMTP id bk16so15169322wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sg0r6PGoxk1gksSrk3lmpIJquA29NN0p4VPmWvLuBck=;
 b=stgA1RjcwivJZ3RRONhjsEOyqE4DR0Prn/WEq0ksnxdRtrf6/xKiXte6WZ3JPdSkWA
 u4vWxEx5o95hhjRHKFE1IXxkSDW/saYEsR34hQ/TtNoak/CmtW4ARiHpvTbKkV6N9kcf
 sDDUcqz1IAvM6ZhVDRKgvfI8HK2Dtx1jX8CGbY+m8vP4HIGICHG/RCn0zcC7SUXktS+T
 ZDVn7gfIUAB/EXrn/JTqr7BQ5pEGxw0IQlrEpS4Y3+TS9cah80VvUyZ0p+1XtxZQ7xcr
 dEjkLMp/cMb5kF5LEJp9GpOvuuwcqcAx+fJA9/6xKSHcUI8Uz0R4l9pCmyMyVhrxXhKS
 vL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sg0r6PGoxk1gksSrk3lmpIJquA29NN0p4VPmWvLuBck=;
 b=G+eTu19CO+HTc/uJfiq1+qSbfiEEWE+mLez0wM2jlH2FBrbdknUypsumbmh+kfFp+Z
 dOPklEsMDbP0mFYaogepwZGLePcu0RXm0TyP0HRvqpYNvCMGNJRevH7JWmYF6MUP4x45
 ZVUzbYxsTyM3xLwVy4tMEs4G0vjiCky3oeym4iiPiQTTHEDymaxztTCNK861C2bT8DhF
 tDapDPf8vzu0H5Jbt11XOLlbnZO3FcwU79TGr31Rdd/RVHMuQRlgdj/lHqNd0tUUlegL
 xzSWEsszssOiHz12X9vu3ZnQ7lPb6jRdmL0KFFZQ6VfJ396upQRwNHY0NmczRVIVjFrA
 ENqg==
X-Gm-Message-State: AO0yUKUR2Te3nlQcNUbuF910qCPUlO2T5+zz5gmdi2NMJyCiWkRb9lAM
 cikDjp9nKSIdmpkE2MMF2gSG51RunG70To4v
X-Google-Smtp-Source: AK7set+wvOLG4m2eIautZaPam1zZPq7MFHAKf6e8cP1FMs9zBQkgLGkf/G1XqfULcd/VnUxGuvbDTw==
X-Received: by 2002:a05:6000:10a:b0:2bf:9656:d1a8 with SMTP id
 o10-20020a056000010a00b002bf9656d1a8mr440178wrx.32.1675814898407; 
 Tue, 07 Feb 2023 16:08:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4986000000b002bfc24e1c55sm12145081wrq.78.2023.02.07.16.08.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:08:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/7] hw/isa: Assert isa_register_portio_list() gets non-NULL
 ISA device
Date: Wed,  8 Feb 2023 01:07:42 +0100
Message-Id: <20230208000743.79415-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The previous commit removed the single call to
isa_register_portio_list() with dev=NULL. To be
sure we won't reintroduce such weird (ab)use,
add an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 95fc1ba5f7..3d1996c115 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -107,7 +107,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan)
 
 static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 {
-    if (dev && (dev->ioport_id == 0 || ioport < dev->ioport_id)) {
+    if (dev->ioport_id == 0 || ioport < dev->ioport_id) {
         dev->ioport_id = ioport;
     }
 }
@@ -123,6 +123,8 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *pio_start,
                              void *opaque, const char *name)
 {
+    assert(dev);
+
     if (!isabus) {
         return -ENODEV;
     }
-- 
2.38.1


