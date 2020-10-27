Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125A29AB54
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 12:59:46 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXNdh-0007S6-3H
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 07:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPr-0001oZ-UJ
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNPk-0004g2-Vz
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k21so903031wmi.1
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x+z76sBDiTKxcFiBZPjvGWYLyhzSNJkqbg7nmpKkRJc=;
 b=ueuFNkYWyYlop/7aHP9cYnbUe5U4x2zO704f7WpgL5Ic3xrZTuPeshxupCL8yAgTeA
 wWUFezpDFajh9VBgdYXb/llzGFPoZC0coOhqjpTfiSdJf7+QpZphVVJ8sDV0NxL1rSJe
 tdlSH0GXntqOmKHuGugZG7cF5omEYjoyxmLcDKLBM7QgnD4vCB7kpUYUO+n4ET5mdnDO
 M8SKVkP8h4iB4jOK7wgG0ixDIonWxGnU2R0bg9mQcnFrheXAbpsX3K5uV2j13+e8cmy8
 X0utjKiHTWGjzi26ttrb1ZV2I4c5zaOOFpBkXtKJP/9xCc6zuiMcm8g5ROxa1/fuUJay
 0pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+z76sBDiTKxcFiBZPjvGWYLyhzSNJkqbg7nmpKkRJc=;
 b=AY4FfWkPE9gHx1ZY/AdXKLFXFVjwt+qCegX9VTdG10nb2pGyrWk3u1iT7steshUK1/
 ToiH+pQo/b8RDBIgbd4xGWynZzYyiJrTKSLdykvXpqLPZ7Dn4k8UKVgyvME8O6k8EIhb
 FF4ysN9CES4VJJzDLbm7MBSuA7Fx+sgUwT82HzZ60/jxhe7oV5MeYKLcA8BDuNkhKSTf
 lqcdis96iHFFVNGmNZ395vWdceQkvpzFMWAZGJ2ULiXsfcZTufuoQzPnalm99uD6q+ST
 LO2Omdp7DsN30oyjDmI0NNdQbkg10ZPG3tZgg1M93fU8Ojzer18XCw+bUvHrjfxw3wEi
 lgHQ==
X-Gm-Message-State: AOAM531kgHlizhYjt62rH6IwYfCvE1Jd9n95Kfsp8SXSlheELw6wKaTn
 qgGkxpbFWu2CA5sO4WtbC6CqgsBobPPzdw==
X-Google-Smtp-Source: ABdhPJxQu32LKf0i8FHlLmwRfI867qimtF8rQw+WMLaRu/KCfTYrXe46C/Q3mBsP7VR/NzpyzW4gFw==
X-Received: by 2002:a1c:383:: with SMTP id 125mr2380350wmd.175.1603799119319; 
 Tue, 27 Oct 2020 04:45:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 32sm1712203wro.31.2020.10.27.04.45.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:45:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/48] hw/core/clock: provide the VMSTATE_ARRAY_CLOCK macro
Date: Tue, 27 Oct 2020 11:44:21 +0000
Message-Id: <20201027114438.17662-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027114438.17662-1-peter.maydell@linaro.org>
References: <20201027114438.17662-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <luc@lmichel.fr>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Luc Michel <luc@lmichel.fr>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/clock.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index cbc5e6ced1e..81bcf3e505a 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -81,6 +81,11 @@ extern const VMStateDescription vmstate_clock;
     VMSTATE_CLOCK_V(field, state, 0)
 #define VMSTATE_CLOCK_V(field, state, version) \
     VMSTATE_STRUCT_POINTER_V(field, state, version, vmstate_clock, Clock)
+#define VMSTATE_ARRAY_CLOCK(field, state, num) \
+    VMSTATE_ARRAY_CLOCK_V(field, state, num, 0)
+#define VMSTATE_ARRAY_CLOCK_V(field, state, num, version)          \
+    VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(field, state, num, version, \
+                                       vmstate_clock, Clock)
 
 /**
  * clock_setup_canonical_path:
-- 
2.20.1


