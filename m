Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F86A4423
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAv-00028a-2E; Mon, 27 Feb 2023 09:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAf-0001x2-Uz
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAe-0000Ne-Ck
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3914625wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Yk2SedGuzUoZBp5OVz40sDs6z7kS7gFYhnzajKNCxAo=;
 b=lwgnM3U6M7R26MZGTPQr7cgy7l/lk/xITg0TjLlBQalZSMX6Mixj62FOMi4p1p7zeg
 povadoFnpOabmst/wR69sMtbfDt1FJWLNRuocSOAsJb7daS1feIQcowGM7jlpx9QBus7
 d5yEiK+b54wLv45NH9wgOHEfoSRkoILwTrN9yKVO0TgWhPAHX25wPGReIiTOqyf4pqoH
 Zg8cvhNvH3ysS/Lm9mdA1Ll1bjPxTawd6sMEabPIc8Se8jT+RTR2/2KMkEM5OoCxGQ87
 305TtMxa+RH2NZjvdv4Fa5Ya4TnUdzdzebOmw1WRCQGQpZ4s+eqQpKXEe+TwKlfoXqrw
 zEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yk2SedGuzUoZBp5OVz40sDs6z7kS7gFYhnzajKNCxAo=;
 b=upvn9scaxKgdh3YlKimZe6cMl+4h/NJOhwyCd5o/SZxCKq04Ta11dSvJQe6HzBxx0K
 UrYbK+pH80voE51xSsjO/63sUE8j1nhlHSIUwifVjgrd8qh48Ieh2rDHUkS1Gl/frc21
 hlzOTCSpF10oApRZNhtC4CQLCiUmHbJrA8BsftEOWV9zmtFFsU0DY6a4tn2D3kMVFVTV
 xngcZE/SCgjXyCB9lFZOcBTN5/f+r1XvsVgDosx3aT6CTw3hX4KD6G5Ua+kuBqjUMZM4
 +WHYMG/VrpB3ux3hKDvTuqauLkR4y4OhkScjrxvOQ2QncYhWJDtyOxTX4dZfC++smrTp
 V3rw==
X-Gm-Message-State: AO0yUKWp+1QEj0BIwKDUDJhjXsVErzlDJ7djdyJBOJgVRAWQlx9JFgn/
 yhCttLMSJNkyHzeymY6H8UJgxZSTBIbKTnnx
X-Google-Smtp-Source: AK7set+GiV8Ip3ZDRDrphmUK/AoI1/shGz0QOLh/cD3aJUIJnzxsrBoY04/KKZUvOfdhjMbs6TUASQ==
X-Received: by 2002:a05:600c:43c8:b0:3e2:1d1e:78d0 with SMTP id
 f8-20020a05600c43c800b003e21d1e78d0mr16725248wmn.22.1677506882850; 
 Mon, 27 Feb 2023 06:08:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm13710323wmq.29.2023.02.27.06.08.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 073/126] hw/audio/ac97: Replace container_of() by AC97() QOM
 cast macro
Date: Mon, 27 Feb 2023 15:01:20 +0100
Message-Id: <20230227140213.35084-64-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220131837.26292-5-philmd@linaro.org>
---
 hw/audio/ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 364cdfa733..b3a45bb49f 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1295,7 +1295,7 @@ static const MemoryRegionOps ac97_io_nabm_ops = {
 
 static void ac97_on_reset(DeviceState *dev)
 {
-    AC97LinkState *s = container_of(dev, AC97LinkState, dev.qdev);
+    AC97LinkState *s = AC97(dev);
 
     reset_bm_regs(s, &s->bm_regs[0]);
     reset_bm_regs(s, &s->bm_regs[1]);
-- 
2.38.1


