Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E16980BF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTG-0007DH-Nk; Wed, 15 Feb 2023 11:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKT8-00070O-Mf
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKT6-0008I3-W3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso1970865wmp.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fwf3B8Umbt5plQJjIYprPrULazHXeAYCSttsSsG++/E=;
 b=qkGAG7kOkskl36bFhSWGOdlSEQRpmI/4HMV+IQ1pZgH+vZg70sfuC3QP6M7HO8L4Gi
 8loZ9KPxLqz3C/RmeqmIn2Ky9P/5+BH3ajVK2sgEfhS4Y2Zo0M250r9Oc/+wFm27B7kd
 UuXTY1qB1DNOGd4KOJa2BgSmdkYc2GMX/LOB35/hUfpm7WVzNajR+7E0ZYtk0h1VS37+
 h7WREDcdTHG3tgNXtSYB0/QVIeI9I3OnXrOUrKYIj09OTEMjp9ftLN2TCyA1/th6c/BT
 N92qIgfrUJLaOJ4TuQpVv/bQcYX4bhZFnM3VtLj7CpJJH7zCCyllggkJGbZPQXh+uyLj
 DU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fwf3B8Umbt5plQJjIYprPrULazHXeAYCSttsSsG++/E=;
 b=uBcZ0F0hYr7QhXchTCoChWsou9LrkqpdL9ce6npz2ecC7VarTsF0x7+u+i2lUJqbqZ
 vCJWURli/u+Lc1UNqXzMw4AseMHNbAdIATjPO1e7dd5ubbKlt4jg7NCjilJZe2/FX2w2
 /IZCwybt7ylqJws3L6w4ZNWpXeNg++/geCReusjw6yOBcTpjflTRdiI1uN+dDzIAxL3h
 iP2PMpIufEmCqkC2/JPpNgfW+nsdROQq6JqzZ0PfDDYcv5EiZcs4SxJErAB3JH7zTMC4
 2KvoCKA+n46xRHh4a+qJphQcdVEnzSR4grZ7haJzaxishG6E8iDp3bOn/2p8UcX0kvvH
 37hw==
X-Gm-Message-State: AO0yUKWdwhcttHDQyKdRfSPiFPQVrM+Gvu8CYTUhm/thEzgJcNE68/5B
 VeuyIP3qll3dMKpFoEOSBKorHTIWi7OZiHur
X-Google-Smtp-Source: AK7set//ZaOFWcJvj+Q68jEmMZYh3YtCP97LCn1KQEfrssVJqwqHK3FfudTDcRPR6y6zzk450NzHlQ==
X-Received: by 2002:a05:600c:4d93:b0:3dc:57e8:1d2f with SMTP id
 v19-20020a05600c4d9300b003dc57e81d2fmr2331503wmp.9.1676477835546; 
 Wed, 15 Feb 2023 08:17:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b003df245cd853sm2718598wmq.44.2023.02.15.08.17.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 06/18] hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus
 IRQs 14/15
Date: Wed, 15 Feb 2023 17:16:29 +0100
Message-Id: <20230215161641.32663-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

piix4_realize() initialized an array of 16 ISA IRQs in
PIIX4State::isa[], use it to wire the IDE output IRQs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de60ceef73..94e5dc7825 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -229,6 +229,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 0, s->isa[14]);
+    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 1, s->isa[15]);
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
-- 
2.38.1


