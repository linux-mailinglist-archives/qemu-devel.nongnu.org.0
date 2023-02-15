Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818D4698299
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLp8-0000bE-H1; Wed, 15 Feb 2023 12:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLp6-0000ak-6l
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLp4-0008D3-O5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id k3so12340688wrv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=heFm5UqUphDjJpVI7Qv+ZKuvoLHrfHy/aAGqW6xSVEo=;
 b=w8OC715+aOMsi5OmhZ3/3915Wpmr4UaBPw/l9+UT6ZztgIO7uB/Cf1zJS51Erm39On
 M37AHEy0UPw6phGdnh8GuDzIiBqrVEvTrzrvJ31eX/0EcYLw39AR7GePTiNRgC4nVqZz
 Ng7qjUBYwlDO1Am7qbCjsaOJ9pYi5LOqB3rRz9qn0/72BR5PzypZRWcWZcjoZO4/wF8E
 j9ZrUM1nah63GXuse1P2N+h5+F39qljWEglEOYEu6L0t59OJH5G/7LW7XYJpLtNcLuTh
 R8N0vw6iS3jHRMrkxypkswbcI41eSWwNLObPQ+p+e8DMd1pwiuICQ+VyZ3jea78dtV0R
 Pp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=heFm5UqUphDjJpVI7Qv+ZKuvoLHrfHy/aAGqW6xSVEo=;
 b=ft0XGn/PnxmnDFmjmzUmON8thrHSAQhB2wFoML4LIvZsMwHX5PLyHbjCJSIp+T7wRV
 VyQNEYImXQVTOQtA4t6OMC4PDhaKr5Wn48w8Sf40Wi9EH2ktV9xhA7YS217nEoGyrcAa
 F9wFN48RKP6wp1E6mtYe/kDA/mpishGlPQvpdlqgamcywEXl6syhTIJVUpLtX+vcByvo
 zIP+5uH8zoTVmxjsLtgAY1tTd/Q2xep03gJxLZXfqArXF+Way64YXXhvXINb40m+dhwO
 TCZdM1BBB0ZxNT4+iEhBG6bQVkn8iJE0y/LoDJKu4F+JMO+5tl+ROFORFSW2xIpD4dii
 PpTg==
X-Gm-Message-State: AO0yUKXLFrmkU/+J0wbXEuXbQAFec1EWHuXngomd6lEKaas8wxQdqVY0
 EwGVYyKEll32aKJed1P5bbpACQ4XDfNf7PYv
X-Google-Smtp-Source: AK7set9QBzatX+iyzVMoe6/2+9iCbBIcnZ+Nl4ZdjUTu/yelgqHueAFwPIoLUgQyYvb7peWPRbfvPg==
X-Received: by 2002:adf:ce02:0:b0:2c5:50f2:fcbc with SMTP id
 p2-20020adfce02000000b002c550f2fcbcmr2514670wrn.21.1676483040963; 
 Wed, 15 Feb 2023 09:44:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b002c54c92e125sm12669586wrq.46.2023.02.15.09.43.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 09:44:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/timer/hpet: Include missing 'hw/qdev-properties.h'
 header
Date: Wed, 15 Feb 2023 18:43:49 +0100
Message-Id: <20230215174353.37097-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215174353.37097-1-philmd@linaro.org>
References: <20230215174353.37097-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Avoid when refactoring unrelated headers:

  hw/timer/hpet.c:776:39: error: array has incomplete element type 'Property' (aka 'struct Property')
  static Property hpet_device_properties[] = {
                                        ^
  hw/timer/hpet.c:777:5: error: implicit declaration of function 'DEFINE_PROP_UINT8' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      DEFINE_PROP_UINT8("timers", HPETState, num_timers, HPET_MIN_TIMERS),
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9520471be2..214d6a0501 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -30,6 +30,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
+#include "hw/qdev-properties.h"
 #include "hw/timer/hpet.h"
 #include "hw/sysbus.h"
 #include "hw/rtc/mc146818rtc.h"
-- 
2.38.1


