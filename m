Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A23C2799
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:32:06 +0200 (CEST)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tQ5-0008Ce-Dd
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t57-0001Yw-6j
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4y-0000wM-Nh
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:24 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so26460737wmq.1
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OMOutzP5V+LKhVzV0NiCVOi1/mPW5v43bptuBd6wcgo=;
 b=Dj7H1+4vg2laI7rDF8KXygC9Bv0KwQzh/VKAu0pphs+b99VzNX2Mr633kXFI/2Eyc3
 rPweFleCHGh9mpe606obQ4ghvjQLsGSNY2D4sP+qyWSp/MUXLcszQKOHRLX455xJ7YSZ
 oV415V5zbfixVebmc11rZrS3U/E7bwVhEEn6j5Ggf5VGwGqHKVnqHexKVgybTHFtYXjU
 Y6z4vy8wAZj84nU3+YFjLCyFc8HLQT2NIvc9m3n9ZGCj0aSDlYPRBtEmUL63Qv34lLd7
 LJTD5FWfF6mi3cD4hmWYXj++WYLrJ4335/mHjA6AOIMUbJDcb6P80sJaqzQFjwHq5qlH
 IvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMOutzP5V+LKhVzV0NiCVOi1/mPW5v43bptuBd6wcgo=;
 b=QxJRT2aeWPnQeWzdsvxs4+Kot2grtsoHsoc4eBGZLc1aRMcTkK2URjlROU6UWdHFFO
 4rbqBBiIBCURQYcVVmi+ClAn85/1RhNR4ddiK8nGYt+9Yn5MaMOJHPNGo2Gz4RR+mq2Q
 gDTitRU6Ob91etrGIez/39zlFulq8LU3jpcXqDH2eZ83PeAkS4WIcesDNZN5LTteIV0O
 CQhFRriHsoKjfxoRGftf/ph29xNoaKi38xwBWlMq//YRkQ0wFdKeC//mN0yN6G2U2Qs9
 mIbkfy8dkJs0B5yNBvg24HqepX7Xbd1ERX+7Fd4XSz5vx52AqBRWbkygYB2piwSgMqFg
 Gwhw==
X-Gm-Message-State: AOAM531S3r1xLnwaZBUpP2qAcDQs9tmV56jkGgRbUSUt4V98IUU9GW8t
 pP/K0K8gMcPWhXRbSrtIJ/5cEUOyVfV9cdve
X-Google-Smtp-Source: ABdhPJzaFBuexlUbLIdAQ9xhd7z8Uj7c286u/rAqTCzSfvCoYfAfIcV1aw2FhLqjg8+20M4as8T/3w==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr41290167wmq.9.1625847013810; 
 Fri, 09 Jul 2021 09:10:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] hw/arm/virt: Make PL061 GPIO lines pulled low, not high
Date: Fri,  9 Jul 2021 17:09:58 +0100
Message-Id: <20210709161003.25874-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

For the virt board we have two PL061 devices -- one for NonSecure which
is inputs only, and one for Secure which is outputs only. For the former,
we don't care whether its outputs are pulled low or high when the line is
configured as an input, because we don't connect them. For the latter,
we do care, because we wire the lines up to the gpio-pwr device, which
assumes that level 1 means "do the action" and 1 means "do nothing".
For consistency in case we add more outputs in future, configure both
PL061s to pull GPIO lines down to 0.

Reported-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4b96f060140..93ab9d21ea0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -895,6 +895,9 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     MachineState *ms = MACHINE(vms);
 
     pl061_dev = qdev_new("pl061");
+    /* Pull lines down to 0 if not driven by the PL061 */
+    qdev_prop_set_uint32(pl061_dev, "pullups", 0);
+    qdev_prop_set_uint32(pl061_dev, "pulldowns", 0xff);
     s = SYS_BUS_DEVICE(pl061_dev);
     sysbus_realize_and_unref(s, &error_fatal);
     memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
-- 
2.20.1


