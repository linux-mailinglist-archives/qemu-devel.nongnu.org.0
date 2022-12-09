Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6A64873A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:05:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gkX-0000se-8A; Fri, 09 Dec 2022 12:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk6-0000op-JY
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:01:00 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk2-00055G-HN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:00:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so307193wmh.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HvWuonDFMYSygKevdOVH1hFRJX7SHrA9K478xa1gmU=;
 b=q3F4okP0rLas6AI7c7OGgAl+wcgMEE4v1JqZEdafjH1UZpiWVNyMVNTgftYTzQgmsQ
 tW9TxJgDLVSUkbtf4WvwmQ4mYxup69bVr+s4utfpGuwi6uCS/hsLubSBzNZhz5Nvsg5M
 i36de/F45FicPeWuzOT+CjL81B73VJeBIwWWy9+mwB1Ud9sZNc5nMASPS3LA1neGSjYE
 IzYxwg21pvwWl5z348t6tnMQbWUEGWZc97sAyzkt1Sl4Yoi82RSA/3+gcBVeqrjzIX3I
 ljHzklZk8QrzG1DBwvTKcTEWDT3jSDCB105n/DcgyDp3ep4flUxzqL7ZnDSQ5Z3782Ja
 QomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HvWuonDFMYSygKevdOVH1hFRJX7SHrA9K478xa1gmU=;
 b=BYQdolQnbvyNpC1y1dqNa76nwnJyhVsVA0Cy9UplQBjky0zZSlf1bERpQaGXeDDEbI
 pvsAFGYjS1hcj940sVx7B/tvpRu0+SjaubWauGTw4U/2wCzvQ8COCRLYPP942hhCdCBy
 0jNygsTa18OWX6oaS9XpSAcFP0V/kXgHSoKj9oW5uML3ztaoa0MiQr45lACIrOVuQs/j
 1WqunBoDUbAUpPT1Iq4znUst47CTA129iwj1+5QUyg7vUhi1Sb3ZYCnEpucx/bTRt4pg
 Pi4o3ukDKmZxOAOe2BJz0H9bNr7ao0qu11gA5oSRQ6dcMkIRVTKDn5GcgjsLHpuCA9Xu
 28rQ==
X-Gm-Message-State: ANoB5pkn30OeWgvt88JpFS/ceCL0YwWCFRbIpj/DP/E9SsqWApmtNZzK
 hT3BiQmGCYmWJZkR5ZYVQBBZ8mqU3cNAaqxnKEc=
X-Google-Smtp-Source: AA0mqf7ymrFfVvL76NYDaAac+Gu5B3h/7tfWpbGIW27xBH+S1xklVUbpTjscUCrYvaB6Qqv5eH4wpw==
X-Received: by 2002:a05:600c:654e:b0:3d0:6a57:66a5 with SMTP id
 dn14-20020a05600c654e00b003d06a5766a5mr5788807wmb.0.1670605249457; 
 Fri, 09 Dec 2022 09:00:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k62-20020a1ca141000000b003b492753826sm259365wme.43.2022.12.09.09.00.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 09:00:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/3] hw/display: Move omap_lcdc.c out of
 target-specific source set
Date: Fri,  9 Dec 2022 18:00:40 +0100
Message-Id: <20221209170042.71169-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209170042.71169-1-philmd@linaro.org>
References: <20221209170042.71169-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

While only used by the ARM targets, this device can be built
once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80e..2cab7a8ff2 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -111,7 +111,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
-specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
 modules += { 'hw-display': hw_display_modules }
-- 
2.38.1


