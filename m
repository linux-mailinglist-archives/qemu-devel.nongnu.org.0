Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09D52F36DB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:18:34 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNJR-0005xI-NZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzj-0001hR-Ac
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzh-000708-AD
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c124so2505314wma.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L3GALm6LLUsg8yV05FVw9G4wDZ2dY+fohGIhr6EXc10=;
 b=IIMbCDnNCjYXnPaxxV3eJdcHLm4Hcb5NgT0fPam9tsphULuxvo6dFalf39rwGNz8Zv
 ib44ohMa+K6uJsHBi+OnC5aHBHRzWonpvn/2SloOuoqRK2F0xWwAp54E5sxNT3OifosJ
 2+uq+QDDudFG9AYx2EVeXq/K4EDDx+6VSfsx6Y4rE/ceoTBFtEHtQmoCVxnUAsZwWD5f
 X24mRZ8LaToYjxQitQ3vXtVOWWabHHw5MaQNCPWe/uYN83RVy0aU55NrLV/p10zgHoiC
 Sfil+s37x36L+SiZ+QcyL/iUHl+S7jux69f27MeZOqBOsUQ1s7S5EXAwdtl0WTQQKbwX
 9LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L3GALm6LLUsg8yV05FVw9G4wDZ2dY+fohGIhr6EXc10=;
 b=LnDwoaxTTjV1cvfu1jkEr9sOyI8UFAYedsA3E/QGY/hXRm8H63uibeMQGbr5AJLFkY
 aKDLv95CTeVtFXhh03KkUzmaMs64xTfQwQr9LpDYVYvc5QFjVooJ7OrvN0chByURRg+r
 CODTliwU4t6zwvNx2WV8mxZfgHhk6hdYjoeOXTwwJa5bW74s9NhnOe8hV+a8Fh3qJIhr
 DQtNrMV8Hs0yBDhLcUQ6MJk/ylRVacX4Di0bdqrAPYgnwDUK0hwtGTz5rKis6AvveQi7
 C5uc5SfR7u0EDRkTQbOaoBpXIFzdyboo3VsswtBmbqH2gRYI/Kd6/K20Y0iJmYwRz3va
 3VFA==
X-Gm-Message-State: AOAM532Cqa/q+wiiT64wKzAfHU2bl+gbJPv//eHKF1pgp7GhC5Rk4V67
 FkhFpci2ATUCmEZMsj+bCLBLy3ytAj2kzA==
X-Google-Smtp-Source: ABdhPJzpijNpb9gjB+Xl19BGoMdAY57zBGBcLK/HhMr4jGJwguh8wq67ao8vpAJIeKrV7HUI3jvSwA==
X-Received: by 2002:a05:600c:2303:: with SMTP id
 3mr167563wmo.129.1610470687813; 
 Tue, 12 Jan 2021 08:58:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] hw/net/lan9118: Fix RX Status FIFO PEEK value
Date: Tue, 12 Jan 2021 16:57:42 +0000
Message-Id: <20210112165750.30475-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

A copy-and-paste error meant that the return value for register offset 0x44
(the RX Status FIFO PEEK register) returned a byte from a bogus offset in
the rx status FIFO. Fix the typo.

Cc: qemu-stable@nongnu.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1904954
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210108180401.2263-2-peter.maydell@linaro.org
---
 hw/net/lan9118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index ab57c02c8e1..13d469fe24f 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1206,7 +1206,7 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
     case 0x40:
         return rx_status_fifo_pop(s);
     case 0x44:
-        return s->rx_status_fifo[s->tx_status_fifo_head];
+        return s->rx_status_fifo[s->rx_status_fifo_head];
     case 0x48:
         return tx_status_fifo_pop(s);
     case 0x4c:
-- 
2.20.1


