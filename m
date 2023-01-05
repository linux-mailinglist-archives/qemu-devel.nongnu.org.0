Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF0D65EC57
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPxm-0004AW-MV; Thu, 05 Jan 2023 08:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxk-0004A8-Fu
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxi-0004Eh-Pi
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o15so27956371wmr.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=egTSnIY7yNl3vp4BayJoB6mxFUUqmm6/NOKnAYXJzPQ=;
 b=KwUSJBAs9HXOgZ/ZkizyUgYPbwVLzwp+oFnQvJmHiPZcckmUnxd3SIfwgJ/X14jn4K
 4hx14c1qrK3pC7/btcJ3OJdm2SHh34CjAQkxIe/JpWXGQsIAJ77qYCClagEdBnlsLDAb
 3lvUEv0zmngtqfaO5W/X4VOokkpLdzf+rm2XjbXaCAWrrrVUpVlLKx1j5jVlHRMVLDJb
 vyPB3ksWsyqrDbYyoxkRsqke5kZzkbURszuJvf9fHdPsYWpgdWSXP/L991sEVRubIbPe
 XNymodA0RU78baOziNMVphGaZ7YPK2ogMxnglJBcQx1HBFvT/1m2AtKV2gyL5ftvX4Gm
 +x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egTSnIY7yNl3vp4BayJoB6mxFUUqmm6/NOKnAYXJzPQ=;
 b=jI2JNtttfrBgpEQrp9BmYI6l/ONs7DrzrgPDhd8faupI8lHMPv7sU2RbZPlFJTzBfJ
 KfHQvmFy03uBGt8BLH9FQOunrTC5KknzRndc7XhceE0J+8c4KpqjLQI4AcuSXj/NUkh6
 ZGpd0oUzibyT2Bd2NhzF5ifq/UKOTwN8qnpOrptbmVFtbZKLNRpNid9HAmKwwhRb7Hu/
 LtOl4KuM1WENkfobbl14pIskzpQD39hSb4/JctOjZ5i0s3RalCR63oZ5+NVyYRsZl7BD
 9o8f+Fm3/etPUT6STW7O4yc3hL2F6Pfcuq7scWHDV1eA0JIWDGzo+Hw2SciVE4SlByX3
 E2cA==
X-Gm-Message-State: AFqh2kofWa8hko8BcONMmetEWufjw3CLKL1Hu5or62iP2Id9CpLFXlDy
 h14Gj4XEqfsDl+fkrmQHNG/6WQAKuhhVgNzk
X-Google-Smtp-Source: AMrXdXuLAyBiTSufjKjoIp+X+AdwtE3fKpmIxRkT2Zm/ynxX65/hxQsHxbRc3U8L60QugxRsoqbwaQ==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id
 u33-20020a05600c4d2100b003d22a722573mr36375972wmp.11.1672924032469; 
 Thu, 05 Jan 2023 05:07:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b003d973e939d3sm2643810wmo.1.2023.01.05.05.07.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/8] hw/pci-host/bonito: Housekeeping
Date: Thu,  5 Jan 2023 14:07:02 +0100
Message-Id: <20230105130710.49264-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Minor housekeeping while reviewing PCI host bridge models.

- Convert to 3-phase reset
- Set reference using object_property_add_const_link
- Sysbus'ify IRQ
- Open code bonito_init()

Philippe Mathieu-Daudé (8):
  hw/pci-host/bonito: Convert to 3-phase reset
  hw/pci-host/bonito: Use 'bonito_host' for PCI host bridge code
  hw/pci-host/bonito: Use 'bonito_pci' for PCI function #0 code
  hw/pci-host/bonito: Set reference using
    object_property_add_const_link()
  hw/pci-host/bonito: Create PCI function #0 in bridge realize() handler
  hw/pci-host/bonito: Sysbus'ify outgoing IRQ
  hw/pci-host/bonito: Declare TYPE_BONITO_PCI_HOST_BRIDGE in header
  hw/mips/fuloong2e: Open code bonito_init()

 MAINTAINERS                  |  1 +
 hw/mips/fuloong2e.c          |  6 ++-
 hw/pci-host/bonito.c         | 93 +++++++++++++++---------------------
 include/hw/mips/mips.h       |  3 --
 include/hw/pci-host/bonito.h | 18 +++++++
 5 files changed, 63 insertions(+), 58 deletions(-)
 create mode 100644 include/hw/pci-host/bonito.h

-- 
2.38.1


