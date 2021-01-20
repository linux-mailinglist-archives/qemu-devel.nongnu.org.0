Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC222FCD73
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:30:08 +0100 (CET)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29oQ-0002AR-8k
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mQ-0000rm-MW
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:27:58 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mO-00055L-R8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:27:58 -0500
Received: by mail-lf1-x134.google.com with SMTP id h7so3958049lfc.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBGOBlbBtO/dbxctd0HuQeQZa7qOrzfcGEX+G2MkXNo=;
 b=JN46kY24Ces71pTPLAp1wdyWGh9w4KVU6hBL2wZKDb2rcSyYMP97Psd9SZW22gHsok
 zlz2bLf174D4EoeNg/61lAVTTf0I6f/bj+r3pevvWLS9pBguyy52BJOVq6MBqVltapUL
 Qe4H3z8UJ38ZfT6m2KQZKZOr6uWsJGXRSh4HRB/H1K8BmEUCZKxVXRkyrsRj3cO/Pynb
 tgVSWjoFYJST2/adXJeNMdbzUtKGtT8xdlHtQ2IP2Hzul0ljnpW2PihqLJU7182yOvik
 7sQapikhfmBQtAs77FcztcElaLRu7QdzCQAf4m6K+yTX6bNX9Ouy7+L5fDIdlLFcyoB/
 j8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBGOBlbBtO/dbxctd0HuQeQZa7qOrzfcGEX+G2MkXNo=;
 b=G/eak9JbuTaI+IYRbQ7YHC22ss16eogTH4ZDZrm/cUPkDAN4XbAlDghGr/0aLycbkr
 dxrH9D0rLpf7hy9AOenvy3hxiIPX5JjaGGD8lZVoOAgq25r1xJj8xGKlXrphwJdJUMzZ
 HGaMprS5Bi2fRc5bcTCQECmA337iFL1a5OsrovDzW4itNP5QypTUhejJRp2RdGHwIu6d
 P/52q+UcnT+P04ocndZPajsErp5CFgLVbWa9D4E0S3iTt5j+a7a3tMU22GCz9nIxFtgI
 EoVIIhUotUvVq5CDG/yojqf0eVLfj6JpV6xOSirvIOwry2wsA07aEio7NlTdBbIxA3ix
 8IYw==
X-Gm-Message-State: AOAM533K5r92hWx9DSfBqICRW4r8/eVLMWi8rx+RLz4IY6ESRJ7GT3cL
 8cjf3J03JPzGbMJPWsBtQcP3rQ==
X-Google-Smtp-Source: ABdhPJxITQ5uYk8k/iEyMvSMpntVxAv73JkCmYIpw6v8gVqeFrGWW27qViMvnncC6F4Nlesh0v8wvA==
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3510903lfd.626.1611134872351; 
 Wed, 20 Jan 2021 01:27:52 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:51 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 0/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 20 Jan 2021 12:27:45 +0300
Message-Id: <20210120092748.14789-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x134.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 v8: - use gpio 0 and 1, align dtb with kernel gpio-restart, gpio-poweroff,
       change define names, trigger on upper front. (Peter Maydell).
 v7: - same as v6, but resplit patches: patch 2 no function changes and refactor
	gpio setup for virt platfrom and patch 3 adds secure gpio.
 v6: - 64k align gpio memory region (Andrew Jones)
     - adjusted memory region to map this address in the corresponding atf patch
 v5: - removed vms flag, added fdt  (Andrew Jones)
     - added patch3 to combine secure and non secure pl061. It has to be
       more easy to review if this changes are in the separate patch.
 v4: rework patches accodring to Peter Maydells comments:
	- split patches on gpio-pwr driver and arm-virt integration.
	- start secure gpio only from virt-6.0.
	- rework qemu interface for gpio-pwr to use 2 named gpio.
	- put secure gpio to secure name space.
 v3: added missed include qemu/log.h for qemu_log(.. 
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

This patch works together with ATF patch:
	https://github.com/muvarov/arm-trusted-firmware/commit/886965bddb0624bdf85103efb2b39fd4eb73d89b

Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: refactor gpios creation
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 111 ++++++++++++++++++++++++++++++++++--------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 ++++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 167 insertions(+), 21 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1


