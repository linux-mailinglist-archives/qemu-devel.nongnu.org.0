Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1866A4495
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAV-0000TN-Lf; Mon, 27 Feb 2023 09:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAK-0007vS-L4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAJ-0000J6-6D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so6352850wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FlE7UGdxR/uM/IgeqU29kmjHYiv7oetRrBoHo0yqcyc=;
 b=Or7Ts3NI0L56hQaab+RAccj6pS6drEp2Vx+U1CwurQ8sjpUNw6Q0fFzOm0AomaEPBO
 b/9Z93jVjshedO0xvPs9KE/QpontXL28Fo+3Uwb9Q6Icl280iaefaKGW/wSO88wR2E9X
 fMSnA2gR7Mmjdm5VwQJ1vgHpVGaaJ04rAQMbgQ+YGQLuKp8fAHrXnaCZtNpQLwPjbTFa
 gfBsVgKVTfThqb7PJV4vKJ6H0Y/cHxOzuct2upLYVBsQOr5KW/0DaiquCopop4SrK5is
 ezqGyiUegSPg9zmadcPky/4MtcozNeV7X35isp33gcWL/1RdrFfYihX2VTt6+Vr4uwzm
 GlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FlE7UGdxR/uM/IgeqU29kmjHYiv7oetRrBoHo0yqcyc=;
 b=q0/LM7CX1k1WBwb+Y8BfgPJxMqeEZ7CPX0XNwyeM37VsdF7pFbx2F+j6evEhwAA/kh
 vYB9FWUTWwlSEnUeVntB+y/vjcGEyAzt3suKj2p6rC/JBWsYOGgtLk13AvdimzxIP+gB
 3+m2IotQQjurhEFJMjTmCaUVZOUylITw4zYjdXpJmxJ/yuSprFbf9UYnyGhwf9Q8CV9m
 8q1msSGCUfHiCBHxlYh5V87BI5zaLSbei578eM7fFC9dbX/904cJrkCzSYCErecY+S/u
 DYoIrVdwxvsfh6awlm1RKzxuMxEp7fYVlaKQ0CoZQ61/yYvbdKNd60VxnzREiH2kAlcj
 Dl4w==
X-Gm-Message-State: AO0yUKW3957IK9Ay5lrSkVFpZv68BuwyLysug85OMd0BUPB37iol9k1r
 lZi/TxFVKsdj/ca9V42ToEyrPjVqaDdKxcWA
X-Google-Smtp-Source: AK7set/vAArA9PbjYIkVdzuvmaGE4nAoXJNJ7RK6ekBDUyQU6EmhXtljNsCWPeG4YR+c8iO0OLXSrw==
X-Received: by 2002:adf:e58f:0:b0:2c5:a07e:4bb6 with SMTP id
 l15-20020adfe58f000000b002c5a07e4bb6mr20580291wrm.33.1677506861222; 
 Mon, 27 Feb 2023 06:07:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a05600c1c1800b003e22508a343sm9905965wms.12.2023.02.27.06.07.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 069/126] hw/timer/hpet: Include missing 'hw/qdev-properties.h'
 header
Date: Mon, 27 Feb 2023 15:01:16 +0100
Message-Id: <20230227140213.35084-60-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Avoid when refactoring unrelated headers:

  hw/timer/hpet.c:776:39: error: array has incomplete element type 'Property' (aka 'struct Property')
  static Property hpet_device_properties[] = {
                                        ^
  hw/timer/hpet.c:777:5: error: implicit declaration of function 'DEFINE_PROP_UINT8' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      DEFINE_PROP_UINT8("timers", HPETState, num_timers, HPET_MIN_TIMERS),
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230215174353.37097-2-philmd@linaro.org>
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


