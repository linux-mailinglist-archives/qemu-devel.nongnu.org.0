Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEDD689BDB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:33:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4W-0006gJ-HD; Fri, 03 Feb 2023 09:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4N-0006db-3d
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:40 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4J-00054S-5m
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6153045wma.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kl1m+bg2bq062qmRTd0sPieM4oFZq05ngUG4exabYiE=;
 b=vRIphZWTyMirEag0ZByn3ahSC+LS3YF5LTF8PEW944bS+7rz6vquIpNk11tce3yYSF
 /EifeI8X4YS2x+Ju5pK+pQ8NITXhZNPZ8MHwoZuKXcjAoVO7weyMArfEg6syA4MTKIQW
 MMR4Q5e31SkniAX4ZiSYtbEbPz4v++3RSV4H6SbIDemrOlwmWnhytmKlNiGYThFA+ZoB
 HfniOlAJwVGYxfQwFlO3fx6j92pxGc6ZuPG9F//n0ptcLZGfnONL35eOBSRjH5g3jJfO
 FqeDT+EGqOotjuT5+3PDIDZ245yWLgRlwizFIPN0fsGuyqtczy5tpnST0TvWJWrrOXgK
 bPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl1m+bg2bq062qmRTd0sPieM4oFZq05ngUG4exabYiE=;
 b=GksWlQ3ja7q1fOoxrB0bdr0jpeNc+a60Awu9dOud/6MemtlL/DCjiw7Ri6ZhqYv3aT
 DdASa6E55UZoed27F54g9kv+zTt1aQQvxCxQu10E4NPL4A7tZD7iU7lVsXXa/lCqZzgx
 5CSnXlfSN/lCk5n5iF41bUvbXT4mVQtN2YPdIqSzRGB5QD1nGBRTSfcQ7TOeItaZt41x
 5Jro5uxJt7u8cR3XovZecifGqvd3k9xGAyREtiGYIYFw45HomJzSlQ64g6Fd8q4BZsnO
 excvgDtYsQ1OheBQTw9Oo955d35ApEPRof8GbvMN7PmWdx0zkSgRZXcLjyi78Ja4FIvk
 hqxQ==
X-Gm-Message-State: AO0yUKXnu668xb1m+EoS5z89N3jUvLFracBi3NczFmWFxo3LKUyAiq85
 LoNFuG8SxATkyflMbUfLJwtDv99xoiisYGws
X-Google-Smtp-Source: AK7set8QSIEqqGuCwBgSy2N9GBZ1nSN06PLf0dQ69aFSvLR2ClAV3zjad3k1TWAz8yNkfIkO8LfQvA==
X-Received: by 2002:a1c:4c17:0:b0:3db:262a:8ef with SMTP id
 z23-20020a1c4c17000000b003db262a08efmr10095638wmf.38.1675434573525; 
 Fri, 03 Feb 2023 06:29:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] hw/char/pl011: implement a reset method
Date: Fri,  3 Feb 2023 14:28:59 +0000
Message-Id: <20230203142927.834793-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

PL011 currently lacks a reset method. Implement it.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230123162304.26254-4-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 05e8bdc050e..ca7537d8ed2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -427,11 +427,6 @@ static void pl011_init(Object *obj)
     s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
                                 ClockUpdate);
 
-    s->read_trigger = 1;
-    s->ifl = 0x12;
-    s->cr = 0x300;
-    s->flags = 0x90;
-
     s->id = pl011_id_arm;
 }
 
@@ -443,11 +438,32 @@ static void pl011_realize(DeviceState *dev, Error **errp)
                              pl011_event, NULL, s, NULL, true);
 }
 
+static void pl011_reset(DeviceState *dev)
+{
+    PL011State *s = PL011(dev);
+
+    s->lcr = 0;
+    s->rsr = 0;
+    s->dmacr = 0;
+    s->int_enabled = 0;
+    s->int_level = 0;
+    s->ilpr = 0;
+    s->ibrd = 0;
+    s->fbrd = 0;
+    s->read_pos = 0;
+    s->read_count = 0;
+    s->read_trigger = 1;
+    s->ifl = 0x12;
+    s->cr = 0x300;
+    s->flags = 0x90;
+}
+
 static void pl011_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = pl011_realize;
+    dc->reset = pl011_reset;
     dc->vmsd = &vmstate_pl011;
     device_class_set_props(dc, pl011_properties);
 }
-- 
2.34.1


