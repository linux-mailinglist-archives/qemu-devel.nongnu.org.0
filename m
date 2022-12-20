Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EE651FE9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atW-00040L-6t; Tue, 20 Dec 2022 06:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atO-0003wK-HG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atM-0007xC-No
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w15so11423890wrl.9
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KMtFXkxth+Pqg/m5gJ23rWTq6dEumxmDlt1ZlpxusaI=;
 b=QXso5BiS+vmk+dLITWap2CeQOALPIqPkeV6Z7SLlghCGwHzjYD/WtN504bPO0CiJFY
 ctkLMeNebaHcR0LusLfhyICvDAq9/isl3kGBgfL1/0KXqY2BgJzf84xsdktAa2pwxu4w
 ithWWTiQehj3gFACM/vc5ECn2i19u1jlTbG2yvOaM8Sbv2Eaqk7EQ8sG1sxJu3EOWxnJ
 O+t99b6ejLVp2QC0chN5POb/xf5e0o2p00Cx7Hqkm5CcR+dUNzOM+iFsHQa5S7wvVGib
 06s5HjnjYU1OZtMZA4zV/0IfWk8QOE5BOI3+mIbaYvTfPrD1Sfe+kw/VnX+VmQ50Vo7u
 CfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KMtFXkxth+Pqg/m5gJ23rWTq6dEumxmDlt1ZlpxusaI=;
 b=UCTQWHnQFYCjlM2WCqMvyzvaw4SIrlR/4cmpT5O4ngHzDgbtHpC2uGxB65ytYA5iuM
 1HC7xbnm6Fx3Ap76AnAXiR5PzrhA3+YDvybDIplPXnGcrO/ByVs5R2cNWMaQolVOFbin
 vWPNJK/vy1Pfer3sX3FCtwxoyad4MWINBlCtwKSM+CvlgzO6g42mLPbEyKi36ItE7PDq
 ehYod/5pBm/J7SQMZKcjfiKEg16k1QBTOFJzbbOASoI1MOCKVF2AGaHsgOw3K5o/drp5
 t5DgTuWl3Lxm+ccZgb/6ptnIli2ERFnO3+2OIfUNT9gWMpwgXMJlxkur43Cl73j7alzk
 /wrw==
X-Gm-Message-State: ANoB5pkLYntrGQHNJ8zWzo5m0ToUkwFuS0zkMetJKxuVVsNCRoHfUb/y
 v9FaTO4zT4NWgvVH1MmBzLM/XJxDB7ZM9d8n+ew=
X-Google-Smtp-Source: AA0mqf4QMWTdEkO3/ZR7zaHDER5SjjVEG+bSi9yv01e1tHiEuspRjcZ0vV/KNuwsScLzlw8samAkXg==
X-Received: by 2002:adf:eb4f:0:b0:251:d76:94d1 with SMTP id
 u15-20020adfeb4f000000b002510d7694d1mr19870490wrn.54.1671536079015; 
 Tue, 20 Dec 2022 03:34:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm12425545wrn.52.2022.12.20.03.34.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:34:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/mips: Make gt64xxx_pci.c endian-agnostic
Date: Tue, 20 Dec 2022 12:34:29 +0100
Message-Id: <20221220113436.14299-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patches missing review: 3 & 4

Respining an old/unfinished series... Add the 'cpu-little-endian'
qdev property to the GT64120 north bridge so [target-specific]
machines can set its endianness, allowing it to be endian agnostic.

Since v1:
- use DEFINE_PROP_BOOL (Richard)
- use R_GT_CPU_Endianness_MASK instead of deposit32 (Richard)
- keep qdev_prop_set_bit() for QOM boolean
  (there is no qdev_prop_set_bool, object_property_set_bool
  seems overkill here).

Philippe Mathieu-Daudé (7):
  hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci.c
  hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
  hw/mips/gt64xxx_pci: Manage endian bits with the RegisterFields API
  hw/mips/gt64xxx_pci: Add a 'cpu-little-endian' qdev property
  hw/mips/malta: Explicit GT64120 endianness upon device creation
  hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
  hw/mips/gt64xxx_pci: Move it to hw/pci-host/

 MAINTAINERS                                   |  2 +-
 configs/devices/mips-softmmu/common.mak       |  1 -
 hw/mips/Kconfig                               |  1 +
 hw/mips/malta.c                               | 11 ++--
 hw/mips/meson.build                           |  2 +-
 hw/mips/trace-events                          |  6 ---
 hw/pci-host/Kconfig                           |  6 +++
 hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} | 52 +++++++++++++------
 hw/pci-host/meson.build                       |  1 +
 hw/pci-host/trace-events                      |  7 +++
 meson.build                                   |  1 -
 11 files changed, 57 insertions(+), 33 deletions(-)
 delete mode 100644 hw/mips/trace-events
 rename hw/{mips/gt64xxx_pci.c => pci-host/gt64120.c} (96%)

-- 
2.38.1


