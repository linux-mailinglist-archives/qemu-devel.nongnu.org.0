Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA422B64F9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:53:05 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1Ps-00006z-MP
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Li-0003Rb-G7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:46 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lf-0001vq-Tx
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:46 -0500
Received: by mail-wm1-x342.google.com with SMTP id w24so3296863wmi.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AEXyRy8nYSnTezucH5fbwrMAJ7HNi1klPTxtQNRoejY=;
 b=fQ8/7tOuRfjLC0RMTyH7yFjlM7XyH35B21o5Ei/GopCG6Ix/a4sn8KBrzdbikmjhzk
 zr2jZ7ZLIBewRqel+QXoZS+/MIEVgP/hqUY1GSZxT09fMikTbr8wzDyQsuiKUVugk8t/
 mX9aBQ2FDd+V4gpf/eA7OZ1qT7wZLrCU2XfOY48ESZ5Luq5xKEwrqYeL0YSxAnxXWa/G
 jzyBNyZB9G5Vx0wyJtYmDALLRgbe60I76Hwv0jXMN27JF3c/JfWoy0ugdoRF8xfSYqSS
 NMjmZVZGhrhCxr6zlqS236LtG4oIYk3CjUAcAVn15spJoaS+gpnOW2lCykgrjF9RmUXZ
 xxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AEXyRy8nYSnTezucH5fbwrMAJ7HNi1klPTxtQNRoejY=;
 b=eXjO+j8t5yJ5lYu0KbfUXnVQayvtioeFG01zwsZ3/XBRH1NHSJkhaRFRhGxvlseznP
 42h4euWkBZKyS0j9pEliowjD49u0trI5r4qIlhdXP6Dsos9uW/BBN4NcP/ny9rqwiuec
 alAHH8N6Wd+WkvHCAsOo5LcDCKj4RzuR5VL0D00NkP1IPy6caimYLvMFovo+Bivh4ClF
 Sw9k4fS/qxTOxSW5aNb6i3avCSGwhwZTnrl3Z5lizTYNmqSDUKlPxKPY5nBC9CVynzhz
 Ewsjq6zXQ3fkIkXkjigH9CLTd9qS/vhtv2HdOFZjQhEaAvzkZHksXdQzbXRaswy6aH4e
 jkIA==
X-Gm-Message-State: AOAM532YZbUjkPumUiNuEIp/NEqsYqKEtXeICqMo3KAgk0bzlZfV05zR
 5t5qdgz9tblteEWaT4ordwKYNNSHUrObPA==
X-Google-Smtp-Source: ABdhPJwcGnMSNb0t01y+g9twnInwEu+Bgmfu3MvAS1VmcKSvIZG+eox0yeA5sn5bMTl2xInBjEEeqA==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr4333560wmj.169.1605620921967; 
 Tue, 17 Nov 2020 05:48:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] register: Remove unnecessary NULL check
Date: Tue, 17 Nov 2020 13:48:30 +0000
Message-Id: <20201117134834.31731-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
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

From: Alistair Francis <alistair.francis@wdc.com>

This patch fixes CID 1432800 by removing an unnecessary check.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/register.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 31038bd7ccf..3600ef5bde7 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -258,10 +258,6 @@ static RegisterInfoArray *register_init_block(DeviceState *owner,
         int index = rae[i].addr / data_size;
         RegisterInfo *r = &ri[index];
 
-        if (data + data_size * index == 0 || !&rae[i]) {
-            continue;
-        }
-
         /* Init the register, this will zero it. */
         object_initialize((void *)r, sizeof(*r), TYPE_REGISTER);
 
-- 
2.20.1


