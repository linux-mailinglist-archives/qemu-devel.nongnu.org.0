Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D85BF048
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:38:42 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalt3-0007lL-HB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGX-0004RJ-PJ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:47 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGL-0007Ps-8i
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id d82so3553944pfd.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=hKIIfo0kOafzZI/l+Xv6mlltwvxjf40Nw35tJ9rDgpA=;
 b=zm/oBklR8lyjdgs4pjLM6NmW53RXmAu9chZbRuHT6fJpJnHJd//pWZkFPRCAHAcDUg
 cbhNDygvlbSR+GHZAxQOLa2fR0gQhMPs4GAbuuhswcpO27xwo4ErcywVLwhO8xQ6ktx9
 IxuYw4bIUOHrHLp/0rqfp2/e+IUVt27UzAcVn8lQVPD21O0yqf2mUrrGe0sM4QDTPnkG
 nAu+WUYCLNAUw2yF9b9a/gy3ALkb//r/PD/hE/CY3Ku6qY2QHqwyL8dEqt3iuzslJa4C
 XP/De7mx6xs7M3am5RB4bBxvE3ehDwlR8vm99O332VClO8aWbvRUsGW7qzpXUCJsjbxZ
 zTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=hKIIfo0kOafzZI/l+Xv6mlltwvxjf40Nw35tJ9rDgpA=;
 b=p8m32LyNNpnFb8HomXphqQk8BECEaS3zuINqJzN/jExPGZa4pIwrwCF5vNsdMw26sE
 r6wlKz3vpQMeC6M8o3Nb4W4AGEpNeSDeratDO+S3xTmwOLA2wgpGFEc12lIHPCQB0giU
 cKoJjZ3sb87RXH8zNSEuc3OUSiwvw9cb5WBBXo5XjKN72maP2DBxjj5uDZSpefbt6+PA
 IiMecVgJJDnVr102+pYrhD2wP0ShdhwMNzwGB+Zp11JkgxyEL6d3xK+eiU3DTfthyr4K
 EZSqLuh171j8ZuHeuU7uHmRpQdPjHkqzFE3hN6SFaJ9gJGJKGFQkoNv/gEAoM6vC6EEQ
 YY4w==
X-Gm-Message-State: ACrzQf0s96sW3nWFe70HiN9iGCChXiINLnpZh3dLy4l1TkuxpG6siHGP
 q+t2OAYhWTwUiegxL1g0CwPDqA==
X-Google-Smtp-Source: AMsMyM5CHiXcgmGbg7pLbDntNJFn01bcWed3CiC5F9F+LtzynucuylIEapvk8om6bQF/OYjGfrRbuA==
X-Received: by 2002:a63:5b63:0:b0:434:df94:fdf7 with SMTP id
 l35-20020a635b63000000b00434df94fdf7mr21519959pgm.354.1663699586276; 
 Tue, 20 Sep 2022 11:46:26 -0700 (PDT)
Received: from localhost ([49.7.199.42]) by smtp.gmail.com with ESMTPSA id
 y7-20020a623207000000b0053f9466b1b2sm263237pfy.35.2022.09.20.11.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:25 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 0/3] Add a simple latching_switch
Date: Wed, 21 Sep 2022 02:46:16 +0800
Message-Id: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This patchset adds a simple latching_switch, which is a switch that
can be turned on/off by a trigger.

The latching switch is a switch that can be turned on and off.
When the input new state and match the trigger edge, the switch
state will be toggled.

This device privide 2 properties `state(bool)` and `trigger-edge(string)`,
and 2 gpios `input` and `output`.

The `state` property is the initial state of the switch, and the `trigger-edge`
property is the edge that will trigger the switch state to be toggled,
the value can be `rising`, `falling` or `both`.

V2:
- Rename `host-power` to `latching-switch`
- Add `trigger-edge` property
- Add `state` property
- Using anonymous gpio
- Rename power button to input, and power good to output
- Reorder the patchset
- Rebase to latest master

Jian Zhang (3):
  hw/misc/latching_switch: Add a simple latching_switch device
  hw/gpio/aspeed_gpio: Add gpios in/out init
  hw/arm/aspeed: g220a: Add a latching switch device

 MAINTAINERS                       |   2 +
 hw/arm/Kconfig                    |   1 +
 hw/arm/aspeed.c                   |  20 +++
 hw/gpio/aspeed_gpio.c             |  17 +++
 hw/misc/Kconfig                   |   3 +
 hw/misc/latching_switch.c         | 212 ++++++++++++++++++++++++++++++
 hw/misc/meson.build               |   1 +
 include/hw/misc/latching_switch.h |  56 ++++++++
 8 files changed, 312 insertions(+)
 create mode 100644 hw/misc/latching_switch.c
 create mode 100644 include/hw/misc/latching_switch.h

--
2.25.1


