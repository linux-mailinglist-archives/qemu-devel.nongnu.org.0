Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D933822A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 01:20:07 +0100 (CET)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKVXC-00071s-7z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 19:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKVW0-0006Ql-Er; Thu, 11 Mar 2021 19:18:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKVVy-0004Uv-UG; Thu, 11 Mar 2021 19:18:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso14767686wmi.3; 
 Thu, 11 Mar 2021 16:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ro2t9KYjjz9CCAnsd96braIE+NeDdsOkzjCPjxJPjjM=;
 b=srNIc/OFvdRu/wLKAzJAnzNg4c4mzJew0YXCJ+10f+umaf5GeSVSvOpfsCFh5VpsZ8
 fFDlPmSKKaYuJNYwJHdEWha32aSHzdcnOmAmX8p5U29/FEF9tee6WpgDh2GfWSsbgaMu
 ZJeH9L0mqFlle4brixjTcj0MYNNiQNWgWpRS7pEWKQSwSHRMRsIxj7LCFFcna1k9mB6p
 /UPqpENopY4weIfYzqOVnFltWu54Jhir66WbJTHcZHN3eIHIKWMPCBm8vtp7Nmjm97NH
 8qWt7GcFDQ1n8kC9kBFyO2v6uq33PnB7pKbGLktzMjAjR3qBXmuFFv5Oyi7ss0bsMFgQ
 gArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ro2t9KYjjz9CCAnsd96braIE+NeDdsOkzjCPjxJPjjM=;
 b=HEhfsu6RhiAQpHzVEWXX41nfVvr+kEJNe5SU18eIR86Yv5Glw8IECJq8OjVGpCsxwS
 n0HVGRrI4YRMMS1+8MvgfR7JQnXp2yHyysR38tLsuUJVA9/07oYrYZnRoim3OTuq5Rx/
 uBx30ejuTGS5UcCvpRlOHJMPUI7TYLQFM/N9xa/O4go4pGjvOgUGRlF7YvbWHMo4qjNH
 5N4FGCnI1YtaJKwDJVGPL0kh08a3uSsB+H0eqOchKMRHOMBdDsGKlpkDtb6ixozANl9/
 rTodG6pejFJd4Pft6k7+e0pVEvAI291Jea/qmMYTp09tVGDZgJ7tM/vq99qh/Foh3Q6E
 ojuQ==
X-Gm-Message-State: AOAM532H/UrxGasCHYcWn5oTD8GS+eh/X6yBvGwZIJVGupr/XKOh1jK+
 hc+QSN5nSOEl+UVY4cWSwZpKiQ+B34Q=
X-Google-Smtp-Source: ABdhPJzVEeIiqQADSYW2T2J0FHdWWSLwWyHPxX7Wyh4nQgBuWiteNR5xC8nHZpPibBRpHXboAfaKVw==
X-Received: by 2002:a05:600c:284:: with SMTP id
 4mr10643683wmk.24.1615508327937; 
 Thu, 11 Mar 2021 16:18:47 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f16sm5895407wrt.21.2021.03.11.16.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 16:18:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/sse-timer: Propagate eventual error in
 sse_timer_realize()
Date: Fri, 12 Mar 2021 01:18:45 +0100
Message-Id: <20210312001845.1562670-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the SSECounter link is absent, we set an error message
in sse_timer_realize() but forgot to propagate this error.
Add the missing 'return'.

Fixes: CID 1450755 (Null pointer dereferences)
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sse-timer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/sse-timer.c b/hw/timer/sse-timer.c
index 8dbe6ac651e..f959cb9d603 100644
--- a/hw/timer/sse-timer.c
+++ b/hw/timer/sse-timer.c
@@ -415,6 +415,7 @@ static void sse_timer_realize(DeviceState *dev, Error **errp)
 
     if (!s->counter) {
         error_setg(errp, "counter property was not set");
+        return;
     }
 
     s->counter_notifier.notify = sse_timer_counter_callback;
-- 
2.26.2


