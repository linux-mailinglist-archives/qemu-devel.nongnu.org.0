Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9F59FEE3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:55:04 +0200 (CEST)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsic-0000rJ-KV
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029P-8w
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf5-0002FY-Rt
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id d16so16004925wrr.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eSq6FUdISef71pKleYGNA95iIGprMsybKKFsYohX1lI=;
 b=lmqkf0rn4nHErTSCI4YuPBvNdMr6YKs91zgxvTt5gnhpL2kwhvVy0W4oKaYv55QTfR
 dnik3gcHMEdcR3gPAeSfoz9migNIJvhqebSTXeV5NqTPZTZ+LRnm/IKT3B8u2Bu7t0FB
 0P/MHNsickJx1IrTsAInqRlZC8QB+MGc+hJten6A3Wd9qyM1QeZnLJrssEojJsYsmOEv
 IvUpT2CvOHy8QpifpFb7UgNBMCur8lsBJxwMC6HeUv/SZUoCI+N+V/L2kAOBmVm3oodX
 Eh/IY7kC1wbj+GYXlCCqRJHYKessRci0Vk0e8+1WvwGkZsEFB41+ukMT6Fy6SDzzlnhF
 NY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eSq6FUdISef71pKleYGNA95iIGprMsybKKFsYohX1lI=;
 b=IJmHZbW6mRqR/RVS44+Ks0HSwxbdP1YIbEAe0FReam6R8GF43meHlQmF1D7e/eGwH3
 8s2dG41Cd1mWlPrYnb9zFt87FrNtURL2DO+BYoEt4sKa1NRqFTTGeiBQ1zKp9MiCE4W4
 9TbCZMHq7rX4+CnCiASEQyVOytjPCYDNMUGm5qZJqCHGl+Qe+x3OWrIQT4UH//lqcqW7
 St3nY2sjl4UT/uJ3+Bg1yLBa1pnyASNo+Eom/mUB/rqwhIHGoaHVBsr47lmfOjOLKznd
 ookAAmcfRNKnbhiM3hNUB6tqv/a0YVEZfhhS6EiB3pWSow4yzWcYBE/DOy10HtkN1R/e
 n3ig==
X-Gm-Message-State: ACgBeo12zGUmgDYarrGlbAIir2ZxuhsYLNwqsfl7+qRyhUESnNBtwwhx
 lEqHHDaIfNpqAncqp+ukESGhGg==
X-Google-Smtp-Source: AA6agR7RFS7Euh7gY6WrHxyo/B7uTWndlgwiswVjJD142bvHuoF3VPNsINBkd0HZeh2IqyXl9G1JWw==
X-Received: by 2002:a5d:59a8:0:b0:225:61a0:e603 with SMTP id
 p8-20020a5d59a8000000b0022561a0e603mr6810303wrr.469.1661356282308; 
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 06/10] hw/arm/virt: Fix devicetree warning about the gpio-key
 node
Date: Wed, 24 Aug 2022 16:51:10 +0100
Message-Id: <20220824155113.286730-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The node name of the gpio-key devicetree node should be "key-poweroff":

  gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
  From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5935f32a44..3d460f3686 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -932,12 +932,12 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
 
-    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_add_subnode(fdt, "/gpio-keys/key-poweroff");
+    qemu_fdt_setprop_string(fdt, "/gpio-keys/key-poweroff",
                             "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys/key-poweroff", "linux,code",
                           KEY_POWER);
-    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
+    qemu_fdt_setprop_cells(fdt, "/gpio-keys/key-poweroff",
                            "gpios", phandle, 3, 0);
 }
 
-- 
2.37.1


