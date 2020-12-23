Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74DD2E18F3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:32:09 +0100 (CET)
Received: from localhost ([::1]:58346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxgu-00029v-Tp
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbK-0005uj-4H; Wed, 23 Dec 2020 01:26:22 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbI-0001wO-16; Wed, 23 Dec 2020 01:26:21 -0500
Received: by mail-qk1-x736.google.com with SMTP id n142so14195573qkn.2;
 Tue, 22 Dec 2020 22:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QG4Fqpu42Vyf/NIfwutbufDTylz0SgrZtIAjsTyZ6E=;
 b=hLtbCz8khUVPHTVqrVTLcnGNmfHwQ19QM5R+S8snH8JxBH4cEGrQOT7Ry7xhCwEHKK
 x7sQYU3eWEeSghEd9ffM2ynfjAWS7s0qx79OCZMOP4sb5zLdpEhIe+QIjreNp5QrPpNz
 vSz6KhhH3XL3kwWHSbpjzoRRSfFd531zhcZ2/2d55hi5hIqH0o4fJcdQ+vGx6vBfRAkF
 hOGIzd7Kja+smgKCF04IEuRuF6u+k3nmupuu/rwJ9jvDsSh9V0UJy9jGTATVnUCFG6Qh
 ce/ktu1pTmkH/A4wqukyRvqfuOKOA/tAhLwcDDVh7KZ2+bvBhBAOK3P2TjtMkWCoLZyk
 mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3QG4Fqpu42Vyf/NIfwutbufDTylz0SgrZtIAjsTyZ6E=;
 b=i/Fte3WIzT+cfpPsqmv9g8g/VYdyuzMq662/WtSuXMoh/uAdb7OP0aMM4wyeCznYPk
 vLf5qQTj3y8EqMEgrd9QvRp7n0ZEiUCLh9WTnNBqqwX8aXFDlkPhgBF36HtmZSNeDxk+
 pBiC5XtsJKODbPWDb86DktMKV1cwjKhYdXiDhkiuaQ4BviDjP7AL3IGxTvnoQt4eHJpU
 RSDcr+uigtO8ikXzJJs1W21IqB7kG1iDSvfcurKlzgPoc8jiJKWIiLW3OdjmWegzVV7k
 NDmjS6WZaa4JYd+vxMz69Y2qX8hend+UjPOh3aHOuL+tTt8FZspL01ZAgLa0l9MdOOUb
 /7Vg==
X-Gm-Message-State: AOAM531Atn+skTUN5dYJcqMy8TaCveUJpaw6jbtgPLqwKecMjeN5dnUk
 1rlT12YQkN6oM8OCMLW6yb0=
X-Google-Smtp-Source: ABdhPJyVbtkqZrflA/2W+3M7hnbO9zyz31JDmBFiMXbJij5/sq1wP8nykyzonCslpDMPg8FwWCtwVA==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr25271357qke.64.1608704777506; 
 Tue, 22 Dec 2020 22:26:17 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 22:26:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/arm: sabrelite: Improve emulation fidelity to allow
 booting upstream U-Boot
Date: Wed, 23 Dec 2020 14:26:03 +0800
Message-Id: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the upstream U-Boot (as of today, v2021.01-rc3) does not
boot on QEMU sabrelite machine.

This fixes several issues to improve emulation fidelity of the i.MX6
sabrelite board. With this series, upstream U-Boot can boot to U-Boot
command shell. While we are here, add a target guide for this board
to help people run Linux kernel and U-Boot on QEMU.

Changes in v2:
- new patch: add sabrelite target guide

Bin Meng (4):
  hw/misc: imx6_ccm: Update PMU_MISC0 reset value
  hw/msic: imx6_ccm: Correct register value for silicon type
  hw/arm: sabrelite: Connect the Ethernet PHY at address 6
  docs/system: arm: Add sabrelite board description

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/sabrelite.c            |   4 ++
 hw/misc/imx6_ccm.c            |   4 +-
 4 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/sabrelite.rst

-- 
2.7.4


