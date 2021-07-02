Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC83B9F4B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:51:11 +0200 (CEST)
Received: from localhost ([::1]:54770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGlK-0005xO-2Y
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb6-0004qX-8i
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGay-0006eI-8e
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so6054813wmc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIGZ1OnFIqnIhBTRUfPjwDd5CcBHiyNlzbgBPSbVdrw=;
 b=IpqWMlIuauj2fBX47HmfivH2y06YJ0rjzRziKQunFdvjyKzOAtdvQh7KALlbUYpY+w
 81/mdqajlzmxC1xXExmDNZbKaPrnADzgFEcoo79H4wQTyzm+vtZeqGHhH3KQ3dZZSKhb
 DXfwGJ/eYr5pbdIZM724imio3moC8YuEs05SNwmIjCXYK8xF0GG3q9eLaGHjrhQQg2W/
 OyLVrRF1+6DmecbHfvgKHVt/Zluxlhbh1drjAGD2WfXmAeos267rwDRuSoOHzoRoAw2x
 eL7kOmmHfwk73PPbqKHM+GqExswQEkyOIMT+6vS4cIyviwf2nnsyqjqrY3/yuRrdCxhp
 TVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIGZ1OnFIqnIhBTRUfPjwDd5CcBHiyNlzbgBPSbVdrw=;
 b=AgARDhX/H6cUQ5M7YZjnVxG/nnpHIzYkbk/MGL4lbkO+LiwH2qWDKZwgTZ0UvBTpub
 EM1ajgCRGyXVyCiuIzBupZ9CVinrwKOP/fdTko4Oih1HuhFkqyG12UBhKFT/+UdyOfhN
 CK7xpB4owlzIX4lTOUuasruYG65FMT7bt5GgD48k6k0bmomoF9qfLL4IXcuCKmm4YPAi
 QFblGO44WPTMgg2va4EJ/vDKW8QqPTANArrRhAJgvhNQcweANJVX/am3hVhFJwm8bj86
 7LgGhim8RSHeVdhI+vOKBl3Wa50tYnw4lOOcBwAKdwK5ccIfJMITlCkW3I+qp97nyyMv
 W95g==
X-Gm-Message-State: AOAM530rIFqanPTAaGW5h1n2cdfmrEss/8jffBxBjZz782jXDzUwFBGE
 iRtUOzSfsfWdV67u9zbCP3PR0orvBSfZGk2s
X-Google-Smtp-Source: ABdhPJzoTSdjxRQPcDxq3kjbX99YShRV6LjnMgTsiaNwYl1iycbOgyCAR6wED3yV9cozURGmM2cMeQ==
X-Received: by 2002:a1c:26c2:: with SMTP id
 m185mr15269864wmm.146.1625222426876; 
 Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/11] hw/arm/virt: Make PL061 GPIO lines pulled low, not high
Date: Fri,  2 Jul 2021 11:40:15 +0100
Message-Id: <20210702104018.19881-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


