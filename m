Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87852338F60
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:05:06 +0100 (CET)
Received: from localhost ([::1]:48388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiPZ-0001kk-8w
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD4-00031R-8n
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:11 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCt-00020U-PF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id v4so1811887wrp.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M+2/B+/0uWdP/TI7cIix782z416VMP+cMGZlRxAzHk0=;
 b=PqF80hNCEVG5NO00qo67iQXJujZ8RlqAe0Werg7SFmzrVmuv+32iUpP7KJvHOebckk
 0/53c5ElKxAaH79fvY2ieJZte1YFUqPPX9i8wKemnPWTqbV5bre6mbwIUwzVTqdfW5DL
 vX49qahCfsJJUkDTUS/tLSr72WZEP6T7NMRzT3RIMd8beXAJTkjjWWO5oV9ZZUyqD1/V
 +pOT7nom0OG6CXDCAIrT760DndxMcK6Vg4flylZOk7OhmsooP/bik7/RoVos+ZgmVlkb
 ODpL/JK4KyUsjSbPdfmt/3T8pGI/rMaJof9ZFmZlzcmdAV6ULLJaBq7zrvBDyNG1jz5a
 mgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+2/B+/0uWdP/TI7cIix782z416VMP+cMGZlRxAzHk0=;
 b=M7o39Puql0mw21BJ+g1NDyEsEt8uqOHR8qc3aFH0qaHZu0IOr6i5gch05BMOYq0mT5
 i+lchc1wy+INroTTmIv3f5FQUjx134zf9HVkpRSYp7/t6eNDaVFlVmOhqEB6SrOJ2+H2
 jOlnlFhpJa1IppaSjvaJA/FouLkYDU/DXOB+CRTUgnxuHXvzQO5VGH4uGJ07fUmeBQ+h
 hgjE/tU+UoMajD1TrolT9qvDMStGB7huAOAMdGh96PQmiEmLttSKXh41SKM+/IAuoIKk
 pyWtQQtaaCLtXd+Mu79v6EXhiTkW3IUOzGuKzWdl2Bi87LBi4CQTKd+kSEUMfSytkcw4
 VFiQ==
X-Gm-Message-State: AOAM530yAEVvRtxF5K8apfiNNVAiVNkNMh+xwc3sPRx8hVc98meVFnn6
 hXBSQ7yEJQN+SzVpQCYdkct0ec8aG9Y35K2B
X-Google-Smtp-Source: ABdhPJyJ1Od9U9LCU6f8IvFlXEzIQjYCPrGfnDCMMQhC3BTi4YAZBrb7Ouv2zTcZgaaIKeimy1pSog==
X-Received: by 2002:a5d:548c:: with SMTP id h12mr14200624wrv.46.1615557118066; 
 Fri, 12 Mar 2021 05:51:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/39] hw/timer/sse-timer: Propagate eventual error in
 sse_timer_realize()
Date: Fri, 12 Mar 2021 13:51:24 +0000
Message-Id: <20210312135140.1099-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If the SSECounter link is absent, we set an error message
in sse_timer_realize() but forgot to propagate this error.
Add the missing 'return'.

Fixes: CID 1450755 (Null pointer dereferences)
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210312001845.1562670-1-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
2.20.1


