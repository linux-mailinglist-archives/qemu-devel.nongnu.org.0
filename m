Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C46EF253
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZE-0001N2-Hi; Wed, 26 Apr 2023 06:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZB-0001FA-A8
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZ9-0003Tz-NI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so8913313b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505602; x=1685097602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0cD7P3pMGkzQqnF3+r3pe1FYP8aalGdf1sSQTiCfaI=;
 b=DBNI404s8c2VkU6/P2dtQO7EyCq5ICBmPj26OiIE12r0d2q4UBsB+6rYpZc4kvjwgV
 pnDSjlrANiOI+qLocUOpiFdyZ/6Jv2NEg2BShCXMhZrodas3lCG3fWVaJHYwvnxzmof8
 FJFi/1AV4tqqf/d4k7UsGyllBj1MjMJ5DZK+hmNBfWpCGxQzo0op1xl2ykWWaSFcQbOo
 1G97lu/jo0VBwow4P8MI5MONjKLBFcrK7JHlBsZnu0M5g2H1el43EwGZ07EacHbIZkOe
 zyFCUs32aZ8eIQrfQm5bNr7c4Btf656j6RiL3zHycfPuNnskODiyjbP85gKMBq5BUYwy
 BQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505602; x=1685097602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0cD7P3pMGkzQqnF3+r3pe1FYP8aalGdf1sSQTiCfaI=;
 b=VSaod4aaonR8tS7klnqpJ7o7ebax2XS8nUkLjNmkRaD/jhNFMcrG5dFifTGvRvIf5t
 zZeWTRXOuJT/0lgjvhQaxuRhasH9zr4c1vXmm5nroW011QmNrlglfZ2HxTFJZoAUklPW
 JnGlD2zT+LE0Gbs0hu1XhvEsFSiQ/rOekF5sOfFxeUMI9MQQUUIKFKzMofUV9GzMhj3q
 98GapXbK1LnBFPO3NaHPvb/Za720q2fM6uv6fKproPMu769Xe1CqZfGyqrvspynnQ4G/
 PHM1CH8jsuLXfLU0UwKaao+0Bf+D8RTs0/qQzepd2JdGM5w5H7h3DmEwRnFz/rQ3NHMf
 0yHw==
X-Gm-Message-State: AAQBX9dzmEZeAb/t0f3s6AindRSFu7qBsGIgB2pWT4RrHfIWe2yAB8j2
 2eHiO/+Gj16KUb9mzsFx/k5/dw==
X-Google-Smtp-Source: AKy350Y+ylqTtCUqLlUnW/OjtaRiyT94kdL3dC9CZyaNpXVtoid9wN0LP/sv6RmYkdwBHoXAsUFOCQ==
X-Received: by 2002:a05:6a20:3d1d:b0:f0:b6e3:90d9 with SMTP id
 y29-20020a056a203d1d00b000f0b6e390d9mr26440938pzi.44.1682505602558; 
 Wed, 26 Apr 2023 03:40:02 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:40:02 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 45/48] igb: Clear-on-read ICR when ICR.INTA is set
Date: Wed, 26 Apr 2023 19:37:13 +0900
Message-Id: <20230426103716.26279-46-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For GPIE.NSICR, Section 7.3.2.1.2 says:
> ICR bits are cleared on register read. If GPIE.NSICR = 0b, then the
> clear on read occurs only if no bit is set in the IMS or at least one
> bit is set in the IMS and there is a true interrupt as reflected in
> ICR.INTA.

e1000e does similar though it checks for CTRL_EXT.IAME, which does not
exist on igb.

Suggested-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index b68e24c9ee..29190054c6 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -2598,6 +2598,8 @@ igb_mac_icr_read(IGBCore *core, int index)
     } else if (core->mac[IMS] == 0) {
         trace_e1000e_irq_icr_clear_zero_ims();
         igb_lower_interrupts(core, ICR, 0xffffffff);
+    } else if (core->mac[ICR] & E1000_ICR_INT_ASSERTED) {
+        igb_lower_interrupts(core, ICR, 0xffffffff);
     } else if (!msix_enabled(core->owner)) {
         trace_e1000e_irq_icr_clear_nonmsix_icr_read();
         igb_lower_interrupts(core, ICR, 0xffffffff);
-- 
2.40.0


