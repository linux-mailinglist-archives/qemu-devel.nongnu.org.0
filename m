Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0D3BA0E3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:06:00 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIrn-0007rr-1V
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm4-0007Z8-Se
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm1-0007ea-QN
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id g7so12336003wri.7
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=VgOC7nkboDTgpzX+145+UH9H2GT4wdCedZegLOEyExgFm+m9ztmmGpxvWPy0Sm5IDR
 0cFuH+VqvkWxyZ8tb5u925+VZ22Vf5cNXWizRxkxLOjjSaW0593WCtptP2nX6vY4TF8J
 pUtmwOwzl558gmswv6/OIQ1M8TlNst4vDu4/XasuFgD4c/kGCdyKP0a8lJZiVczlYtNe
 uqivvCb8RaiinEsAnWmjsuJuXp6AXdsxQTRc/DEAsd9qJp/3n0/knbtSAvp2YaU299Lp
 JUCJ2nhkUoLqvTykhqOMfRQ2ocWKTZqDEBakcn5TqImpr+CG5VpG+gni7ideTzK0t6eE
 nk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMxqgRMRaEeAuAomNzQfVfuioKmuSQPXmbHQvftFpp4=;
 b=BQWvzxTJMK/dqi4oQxpnjp9U7Rvzd2ocuZKEbhpqs0g0XiRO+RIGKCP619FRxFfPr5
 JyJMeiwzTom62Zx70bCh2rc/95638Drf5qYznu/b8WUV/SqwQ6wTLgGOd+rqxAbXiHWH
 VeWGfdaaE6+h17qxyj2Mug/9R4SrhywIMZHwAVbB576WnP7ONSn6jhN3Ppj3FSFhYYn4
 dzqlm7k2ntpMpv/7W2fx5zHC1F/wALW8A7PG9A5aPCPyQkKXJ7uYg8jVDOXp0zmBQP66
 Mjj9GjX+fUQBkL2CzygKQgO1IX+D8J+SNcA6gryZ17fOSxnh8kG7nH54vkxy4lnTmJ9y
 M7zA==
X-Gm-Message-State: AOAM530l/6QdeDIhuE1dXAnub5v5tsS3M/IUY5PkDOTchgVnWqMJkJjA
 nGGOy98dKtN2UEGRAmJ7wRejC6ao0VPGbCFq
X-Google-Smtp-Source: ABdhPJzYFLq0AgwiExHHyJd18KiaGPP/Uh/Ie/fgbACmp7/x97VGmUXinflxk5lqRgr/kzU6abTVeg==
X-Received: by 2002:adf:e804:: with SMTP id o4mr5691776wrm.103.1625230800499; 
 Fri, 02 Jul 2021 06:00:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] hw/gpio/gpio_pwr: use shutdown function for reboot
Date: Fri,  2 Jul 2021 13:59:36 +0100
Message-Id: <20210702125954.13247-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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


