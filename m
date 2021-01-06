Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC32EBA13
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:38:30 +0100 (CET)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2Si-0001jc-JB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pg-0000Np-5p; Wed, 06 Jan 2021 01:35:20 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pd-0006Dc-8Z; Wed, 06 Jan 2021 01:35:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id x12so1052020plr.10;
 Tue, 05 Jan 2021 22:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLgYDF/7oFhtxXtNL3KpSkY7bc4IwwkgKlQx9pF1SDA=;
 b=Jtx43lVg2e+9H9KQvq/4g+s6bHrXknYf4lXNZgvYuitJKxVLUXCKl8IoVCJ0sU9TT9
 YFGI93mE6u6uT2ngnJaUGoE9r6Eyz80vZNQSXjOPJ7ehRj/7pquOk2cz801p11Z+x9HC
 54e7Ej4ShwNGFPburn76ot83xPCCew3Ls5gkNySwYDJzXYcYliku14NNTUfE3rOVraYH
 Ai1bgRIoanwwqmi/HLsHyaasMLmqoW4NHekFPOUDlLLKM0tvH/otX0hIMs0yc6sk0AlQ
 OJ3ZQ/4DwWuWSiaU4QJGrcUgnLaxIQKDgqg1YC6ogKYqb/B3OKhJwNUOtW9iGz71nDmV
 t4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLgYDF/7oFhtxXtNL3KpSkY7bc4IwwkgKlQx9pF1SDA=;
 b=LVblMKzGUajL5Up2JQ4FjsB9EsrIUPHEyvwGuOIV/TotMaK3Wbc2go8VZY6uFpDOIn
 oPfF92kzBZMUC9vhEMv162ci+JYji5yIQNiTM06QdLOVMQjGzwuzPi7XVDHrvMcupalZ
 YXmoM1IYyRaCKIvpOEkuCUIY+fGnfiwJOJWNtueRaBiyw6EaJ3p7PHDqbj8Jj7i77eIc
 cBQ0nfqfEYFqJcIiYlrwdPXacb3sXAfMnAYtzXluKu81UwLjvzT0Ljb9Iy7x4kQXgsUC
 4H0dDCem+00/gp2Fu96BOxVI1hkyFeLqZ5tu0Qzlyarwm5ydR1/0JXWNpVpHWe//LU7X
 QKbw==
X-Gm-Message-State: AOAM532h7JAntA+5absVre6StUXxvqxOYVRJxU1cUci5v0M0HGDTD8ez
 L2eZ+Av6zuLWV0v+J7e509A=
X-Google-Smtp-Source: ABdhPJwU6wVXN0TfF7oZcQvpiDBg7zVbYfp/0RIEUzC2GPfoChodKmvnGCr4dLtn+WAU+uGK/043iA==
X-Received: by 2002:a17:90a:eacf:: with SMTP id
 ev15mr2941548pjb.174.1609914915478; 
 Tue, 05 Jan 2021 22:35:15 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 22:35:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] hw/arm: sabrelite: Improve emulation fidelity to allow
 booting upstream U-Boot
Date: Wed,  6 Jan 2021 14:35:00 +0800
Message-Id: <20210106063504.10841-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
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

Changes in v3:
- correct 2 typos in sabrelite.rst

Changes in v2:
- new patch: add sabrelite target guide

Bin Meng (4):
  hw/misc: imx6_ccm: Update PMU_MISC0 reset value
  hw/msic: imx6_ccm: Correct register value for silicon type
  hw/arm: sabrelite: Connect the Ethernet PHY at address 6
  docs/system: arm: Add sabrelite board description

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/sabrelite.c            |   4 ++
 hw/misc/imx6_ccm.c            |   4 +-
 4 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/sabrelite.rst

-- 
2.25.1


