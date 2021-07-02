Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDF3B9F32
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:42:36 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGd0-0007U5-Kg
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGav-0004aw-Hg
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:25 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGat-0006YK-Cz
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6054625wmc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=glOzzCDpuBPmTjQb5ZHwS0fOGxVVg4IovFuV0otzdc5FAwLn3JNAEZfp4bBWi9FV1m
 D7SHC0qoVvS955HPIl+ZQeoHbGVSheVpetyPyU34RnkENNqcI4pvh9RVknh2r4GWho0A
 sUtdHGtwhevjXBeWSBQSfqYk6RUACkiukpwkvNqVyGjuSm6ppBE72b4vBHbblBr6ikYy
 ModlY6X9ahXFv+CX/PaQ8Sz8QifMdq3DLGq0yJ1z0l6DSe0c2U/YmqEB0amzeQMfO6+2
 xO7to8Kh/LqcabtyQrn0P2opQ0sEQCfRcnI+aq9GVIiLMDfpkvsI1Y+7/HtvUB5BVdUv
 bHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=idtZ4VmoroddiPH8ECjXcrSkkYpEaoxBMfJct849DMkyuGwnxfojV0UgQt/sYQrTml
 KV++AgvTYbbqicYofC3R+EKakFxHKGSbvwxIkFvFUW1/zGS/wu5B1Uq0ytim8DfML2g/
 9a4KEVf6vebgMhDLokRclib425UJGExSJ2YP+NguhPv/IqUwLvkDoH8Mh+5WmdBNo36X
 3u+Kr2NxvHW4c5o4sV9AvUov76iBuNSbVH3+U13SZq6WI9ROImDZqtHQSSq/Q+90XsXd
 a80fblb9524dCCvY4SjdiqMVG1KfwFSRroK4rl62V213UrkjjuzOAICkAPTSagR+9GXv
 /3RQ==
X-Gm-Message-State: AOAM530dITjxpT/bAkUf1ZnAOqUzcYosEFTvfZWiA+U2u4D/YMVYo62V
 e/bNGXVPdVw0rdwHMa7oYLDjAg==
X-Google-Smtp-Source: ABdhPJzm3YmughZtZ249rQ3pwnHta4pk4xYaayWXpx4jpWfUhTRzbLiSM8Wb955mkhMhKYdxKSEipg==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr15561780wmi.26.1625222421543; 
 Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/11] hw/gpio/gpio_pwr: use shutdown function for reboot
Date: Fri,  2 Jul 2021 11:40:08 +0100
Message-Id: <20210702104018.19881-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Uvarov <maxim.uvarov@linaro.org>

qemu has 2 type of functions: shutdown and reboot. Shutdown
function has to be used for machine shutdown. Otherwise we cause
a reset with a bogus "cause" value, when we intended a shutdown.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210625111842.3790-3-maxim.uvarov@linaro.org
[PMM: tweaked commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/gpio_pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
index 7714fa0dc4d..dbaf1c70c88 100644
--- a/hw/gpio/gpio_pwr.c
+++ b/hw/gpio/gpio_pwr.c
@@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
 static void gpio_pwr_shutdown(void *opaque, int n, int level)
 {
     if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
 
-- 
2.20.1


