Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD82B656F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:56:19 +0100 (CET)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1T0-0004wk-85
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Ln-0003VT-VB
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lg-0001wT-Ro
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d12so23200954wrr.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DaQ2Ssteyoh9bTakUkfVf51UsrSaiaOBWtYl8OKifX8=;
 b=UCb4V4/toPgMB0Z1BJLoZQ5s8ziWnl90DLN+ZZsXsjrTF93RmEDsHZW9yHUmdi6jpo
 OG/M79L30et6LhDImPZM0KDHS/Kqb/yyR7PW5F/9WW1l7U47FfXv99A55HyTEmYRVGMv
 QS1b4NZTnb9i8jNpiPHLdspeSdEqgLIkjeLkpxEvpR5WCh0qmmRUd53vVOMgSxaT4FQR
 dciNiAicqFZYhL8nwNvSh01MwvHx74QZfQRe3hrDP480hGQvJcS1z86hGwBeZpODt2NY
 HFlCmsraY5bKu4xzQQA5s/G8ZbmehLsoij8OA9pCfH8Dej9qvLZzzrbKIh5P2gaTX5fw
 1qMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaQ2Ssteyoh9bTakUkfVf51UsrSaiaOBWtYl8OKifX8=;
 b=kIxWjfkgsAX5ogIjd7MEM3WsGa5HjtekItWxex1dgPlL/AJDj3dgr16tgIT6sZvN+I
 rin7CuPLheN6PcI/FYMEn9x4q8YQMk86gRKlGjFAnMxL0zwWUmQ7eY/gmx6O6TicItwz
 /bK5QjGyumi+bl6J3kwLQBLVKE7QjAbbKrVj1X/39b0YgUVtWfl3IJ5Tzk0pevJxMhNb
 T3Xj61vd4t3FOxN7nr0VIGrUlKZqK30NDL+SnaeZy7P1HpHdBIzQKknh8kMZNPd0YCrZ
 vkHvt4g3bbwWy3OEm901+8FPOgb5C9NMXKIZjLwyf/QGfLOOx7T+vFW3CFY0bANMa/OL
 ss/w==
X-Gm-Message-State: AOAM53058xLdQd6jVU4z0bG9XUm3I58O9W7/wCHd85igtpApx3CYzIKC
 C/FW/qnTkAQ+ImkrHXhqGj4GE7MZnRSb6A==
X-Google-Smtp-Source: ABdhPJyHUDee1IHcxQPrzIAIinio+hHI6roEfhHjXHzOUQW5levf3u7u2IpgX1JaLmmvJ+8cWKWMzw==
X-Received: by 2002:adf:93e1:: with SMTP id 88mr24301822wrp.37.1605620923033; 
 Tue, 17 Nov 2020 05:48:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] util/cutils: Fix Coverity array overrun in freq_to_str()
Date: Tue, 17 Nov 2020 13:48:31 +0000
Message-Id: <20201117134834.31731-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix Coverity CID 1435957:  Memory - illegal accesses (OVERRUN):

>>> Overrunning array "suffixes" of 7 8-byte elements at element
    index 7 (byte offset 63) using index "idx" (which evaluates to 7).

Note, the biggest input value freq_to_str() can accept is UINT64_MAX,
which is ~18.446 EHz, less than 1000 EHz.

Reported-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20201101215755.2021421-1-f4bug@amsat.org
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/cutils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index 9498e28e1a2..0b5073b3301 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -891,10 +891,11 @@ char *freq_to_str(uint64_t freq_hz)
     double freq = freq_hz;
     size_t idx = 0;
 
-    while (freq >= 1000.0 && idx < ARRAY_SIZE(suffixes)) {
+    while (freq >= 1000.0) {
         freq /= 1000.0;
         idx++;
     }
+    assert(idx < ARRAY_SIZE(suffixes));
 
     return g_strdup_printf("%0.3g %sHz", freq, suffixes[idx]);
 }
-- 
2.20.1


