Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D909036A37E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 00:26:41 +0200 (CEST)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laQjY-0005gI-VL
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 18:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeO-0001Ik-Rg; Sat, 24 Apr 2021 18:21:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laQeM-0005nA-Jp; Sat, 24 Apr 2021 18:21:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so3097596wmq.4; 
 Sat, 24 Apr 2021 15:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bEF88+Y7hdHhJKBoBriz3EJ+bNW8vwjDBCHyZi0evw=;
 b=HDt0CysOc5JoFOt2P75tHMp/lgi3KNk+OawEPNayX5ek02wG9EPa0FiiI4J+kI+1Vz
 BDgl8X3UOwNAWWwyIHx6hG96SpcJLdGgR2kx/908LwmyxBJoe605i76SNzUZk5jG1QXZ
 eS/RNVcBA+e5ipHDQm427jmZTK4ddI3CX4KeT6uO/4gefnsWfkG6dcGYEMxSJLijUlET
 gkwcBV63h+QtOMwp9r02+R4Tp3SdyHzP5yaNiHaGyRJ5jFM8DXaF9s0d5vNnCixZ0lqY
 2BclwWrztU/0ORoyoLHfx9fs17MG3S0zHeRtzOQLEcs4aj6R5nQZ/7IHrqW52ABEiU1k
 MqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5bEF88+Y7hdHhJKBoBriz3EJ+bNW8vwjDBCHyZi0evw=;
 b=p+Dij5AIoRNouRx1Wl1FsHhnmTOE0AsvoAEUBjRTNJskYhf+P4+kKCZ7lPE60jVI6d
 RcxGLi/ekMF3KXOpHeUUXn+69l4qdgIPw7glfm56QYjJqfOKxX97f7I8y3hUZJm0pkQO
 Z1oX4RIKgts7dyhRyC/fdWNPXCWga3M3iu6ijjQ0lHjFmutR30rOYWQX3G0uBfuBIFbL
 4oKz2fNjc7O5pYD2Grqz0PisWiCIN6waxbHtztVH3+eZNzzKF8e+0OQ44/9NPldx/+it
 CWLtWR2JRtAEgF2chOTGEKqzDlQM9siUFeknk8mpT0aRnc+4wv9eeaEjETLb4UU5m1TO
 uNqg==
X-Gm-Message-State: AOAM531Ibl+zZCfSxPegIoWVK3mV7eCKa/uRD/xxs148l4jLYfv/wiRF
 AqzpeH5/I2H40oehLuf07IN+1q22r4gAPQ==
X-Google-Smtp-Source: ABdhPJw30FSOIw548EgcxwVJimDOwYNne9D6NSJ09RTalXepqUEpTRaGzLe39Gv1Kn3hQCUCXgBvqA==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr10893510wmb.183.1619302875834; 
 Sat, 24 Apr 2021 15:21:15 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l13sm13738457wrt.14.2021.04.24.15.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 15:21:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/pcmcia: Do not register PCMCIA type if not required
Date: Sun, 25 Apr 2021 00:20:57 +0200
Message-Id: <20210424222057.3434459-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424222057.3434459-1-f4bug@amsat.org>
References: <20210424222057.3434459-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Miroslav Rezanina <mrezanin@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the Kconfig 'PCMCIA' value is not selected, it is pointless
to build the PCMCIA core components.

(Currently only one machine of the ARM targets requires this).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pcmcia/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
index ab50bd325d6..51f2512b8ed 100644
--- a/hw/pcmcia/meson.build
+++ b/hw/pcmcia/meson.build
@@ -1,2 +1,2 @@
-softmmu_ss.add(files('pcmcia.c'))
+softmmu_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
-- 
2.26.3


