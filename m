Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D6069CBEB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:20:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU64O-0002Dq-KC; Mon, 20 Feb 2023 08:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64N-0002DZ-7K
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU64K-00073w-6I
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:19:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id o14so1260049wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN0WAsB9L5CFqp3vtKSX1KHSdW1kdU+eQCKL82nmG4w=;
 b=Cbc/reFexjbdSsRLAjHHhGGkImZERRqiQJl8SZ3EcLskeFj4+286UXKUpEX4ebq1dS
 UNyxbwM1vURGydatiX2yZf9EsxcoerHHj6UEqsUY3Chtp7iJflIW/BsGQo+AGekcIzQ0
 4jvnun1IAg5aFqkrdrJWqPLi1Dx0scXiaxAnLZrx9So3al++2YoklM0IZ3df6Pu5yO2m
 UyzVhTnNLYdplrPyNbDZwk6HfW/tN4vkeb7InvajlqMqWboDEv/bBH0ziMvKnyvKbftW
 BP1zOZKozLrBpH4ms/8hjxpdvGTDwNMCNINv8z/X727Yskth8Swr/EQNvwcSeP0hpL2X
 Pj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IN0WAsB9L5CFqp3vtKSX1KHSdW1kdU+eQCKL82nmG4w=;
 b=2Mr/4EcWQy15OUBFbrbjYu8N3PkpXlO2jh50zkbuvF9rbmRb+vSPIAzZX1UPeopN6M
 tFOaOEeqRSIBXa8Vfm/Ws/4MUTw+6MvXkyA6X9+axj9JKzj+eK4Kd5IpD7Og57nHVpSE
 V49VE5sffL/kxHB9RPmOR+KqBjcXXEom9wI5TDxPxNCCFs+y2gv3/k/KC25WIQeLX6sU
 PVy7On2Cw59Q1myAhOeb3XJhu/SY/IsmOIksrHYOGJxajaHb/luFxTYftiPAJXhUeQNG
 C1cQelbOoM33P+Y+CPdMocfCDnbhzkPvswATqSjUZ82ofEDbvDAhMZZ5T7YNcR6Ohc/4
 CdlA==
X-Gm-Message-State: AO0yUKWsKU6berIZWXGn7+dBbD8QqXFfSHLIAQWJh1HS9u+6tNjK3NgG
 Wa64Gfjul6d1ardqkme7oQ/fokIxvtxu7qgU
X-Google-Smtp-Source: AK7set9QSwlMEARWrr+B73cGZ+LO9x5VUYIP9nSL+Y+4Vpc8AzpCBkPhHrbwqErz2I9+XpeAjKt+Fg==
X-Received: by 2002:a05:600c:708:b0:3dc:1687:9ba2 with SMTP id
 i8-20020a05600c070800b003dc16879ba2mr5547678wmn.35.1676899138305; 
 Mon, 20 Feb 2023 05:18:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0ac600b003dc434b39c7sm1241768wmr.0.2023.02.20.05.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 05:18:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/audio/es1370: Replace container_of() by ES1370() QOM
 cast macro
Date: Mon, 20 Feb 2023 14:18:35 +0100
Message-Id: <20230220131837.26292-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220131837.26292-1-philmd@linaro.org>
References: <20230220131837.26292-1-philmd@linaro.org>
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
---
 hw/audio/es1370.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index ea76c9a734..4f738a0ad8 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -843,7 +843,8 @@ static const VMStateDescription vmstate_es1370 = {
 
 static void es1370_on_reset(DeviceState *dev)
 {
-    ES1370State *s = container_of(dev, ES1370State, dev.qdev);
+    ES1370State *s = ES1370(dev);
+
     es1370_reset (s);
 }
 
-- 
2.38.1


