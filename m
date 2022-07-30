Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650E585799
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 02:44:19 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHaaY-0001Tw-40
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 20:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaUe-0002Y9-2Z
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:38:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:47039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaUU-0003Hp-0L
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:38:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id c3so5912733pfb.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 17:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6tqSDvvvEDYN0rzJZ3P73zVdZpDdIhk3NmhwmND0U=;
 b=TKH4JECFC+7jF/bS/4qJ/3JSefTsczsYIvpmwyzRSVzA1byPHL50gEfisLa+5uqRxj
 KKMKGVvS8xBhruBdzT1ZI+dq9NdkSkhB0lFQDaTG5YCvylzB5XruNA3B+3WJZ/PD1jlV
 2TI2Y3cGAJzDy7zp/Rk1XvbhAa7KtR8z7hYPzGsZb4DzjQLZELO+f6DAcznlx3EMSML4
 lRsyOhoqIY3t3WEoQH2Diwv5jElu4J/aPQJn1xuhp9g/cDP4Ez9aOne3X/1/Dg/wrOM0
 jypDMc6b0RCxomoiTJQsJUjC/yKJNMNHbMCJMihBczaJWNnbVBXBkBw00RgM0yik5qNG
 ulXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX6tqSDvvvEDYN0rzJZ3P73zVdZpDdIhk3NmhwmND0U=;
 b=WaIF8byDpg1EWAmq73x5Lcw2DRIm4nFaNxLZM4B1DtjcxbaEWNoivaYW388zAX+MD9
 ZXuMcjT8uAs/1cTf/oQxRjDPLit8VkiGcvZO8InTGJ/2+klRWsvul8USSU2YF89vEeDH
 /Kzwz0WJrWlRWVTpy4Kvu40YGCdv1TA+M1wdehQUgmVxmszL6/8uXXCve1Zoj39wuHvF
 vRxgHDyYn1xSv0ZhKIOUqQR2UMPmiqsZnux2wwjBVAdn3fE+Piq8rRZVvnn7lf7MNSJX
 ae2/cSFDlXyhFb8IqCg97Wtt4NMeqi5Ia7eUkRLftNm4rodMbfma915BbVkkDChbRScG
 rv4w==
X-Gm-Message-State: AJIora9UdaOMyjm3uRpKQFaKQ7Z9P1hwKGG5hpLp3OKOz7flLh0uvKrp
 wH+zoagHEa55fJoxDmXwK9nSd4vk9y5BfA==
X-Google-Smtp-Source: AGRyM1uIcjgOVs4UgK5erZEobfRUl3aO9Hdt8pT6NBgkZBAmfGnXt/5mLPoXNrzQE+GhGwXEBMF5Cw==
X-Received: by 2002:a63:5a1b:0:b0:41a:64d4:9643 with SMTP id
 o27-20020a635a1b000000b0041a64d49643mr4693174pgb.126.1659141478329; 
 Fri, 29 Jul 2022 17:37:58 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a1709027e4d00b0016dbc169316sm4228345pln.187.2022.07.29.17.37.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 17:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] minor loongarch cleanups
Date: Fri, 29 Jul 2022 17:37:53 -0700
Message-Id: <20220730003755.54019-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As this is a new target this release, and these patches
are so minor, I'm applying these as a bug fix.

r~

Xiaojuan Yang (2):
  hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
  hw/loongarch: Change macro name 'LS7A_XXX' to 'VIRT_XXX'

 include/hw/loongarch/virt.h          |  8 ++--
 include/hw/pci-host/ls7a.h           | 43 ++++++++++-----------
 hw/loongarch/acpi-build.c            | 18 ++++-----
 hw/loongarch/{loongson3.c => virt.c} | 56 ++++++++++++++--------------
 MAINTAINERS                          |  2 +-
 hw/loongarch/meson.build             |  2 +-
 target/loongarch/README              |  2 +-
 7 files changed, 64 insertions(+), 67 deletions(-)
 rename hw/loongarch/{loongson3.c => virt.c} (93%)

-- 
2.34.1


