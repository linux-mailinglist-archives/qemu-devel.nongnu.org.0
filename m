Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3462F330D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:38:34 +0100 (CET)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKob-0003Wj-Qy
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhO-0006CF-O5
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:07 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:46269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhM-0004eh-8k
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:06 -0500
Received: by mail-lj1-x22b.google.com with SMTP id u11so3002686ljo.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0fGFtDB9UaIfo7eTN9dKMiaJiN3lP2/cxg6roRa40k=;
 b=RUEYX1uw/vJDKloh3uQ3Bemy0fwmQ5BXSxo5MvGfXW5ln3Iax9G2pRGRKlr3lVkdoG
 EVvQyuPMjL9glKWXdDZ9xpmg6f7qRsLsOUmbwwLxSqKkfl0TSrXoftaYf+3QsIrjFt5D
 /6ULaZyaqs4e7jBVqJCrxWGhEHXM48NjwfbuiDLyvLCW4UybfcNT4OzeSFGb2VIoVVwU
 IF7hrS39dI1Rovom2xpaWdIIIhrvRDMechAB0lI4MWVo4Z8cVOvOe16v9n4IdK3x1JDe
 gfTnedz8H492ZkT/YSNm8Fi7O2fVM7S3algmrDoE7pgyw19YHfQYJTjCy8P9ee5zrnNe
 t7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J0fGFtDB9UaIfo7eTN9dKMiaJiN3lP2/cxg6roRa40k=;
 b=eHOAr8CqNplOdEcjAQtY5odmIhsm7iodhOxcNA84YadUi1qWTt1PY3S1qqwZLzEf+C
 9K2P00IhS044GuNmgKEuspnJvDOmw1XnNXNpItu5ANLB+RA9tH6LLR2FkER0dZXlH2Wn
 XEcgUOtK6bK8ZGfBxdxDbtUwoESNvMQhmYt3tbqaJydCawsmf0GwXZuV+1RI2TD2dbG3
 SyKuMmxczNQphbf/84kZ7vXwVD8OVJ5Ed2fUgX+IUvUI0WaG5ujlTV8PclS3gdJrxUaL
 JCU1Gkm2nCy8+MIg+d57ps14TYxVksKNKhVpjpBHHYskENinxxbhWwl4zmWiW0ycLZ2I
 CLzw==
X-Gm-Message-State: AOAM530w9jnqQ68NgrktC3yO2jMjORYm/FdQpWdK7LBXktGJnlLa3Cib
 MeaTM0cIE0/5CJv13aKdnbX1eQ==
X-Google-Smtp-Source: ABdhPJzWY7UqqZKFSo49hcBWAKz2yKm6u7ReJXo9QqqhmiQ17vGpVKajgIZBHxDEKwHXm0m/P5N88w==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr2038590ljg.451.1610461861839; 
 Tue, 12 Jan 2021 06:31:01 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:01 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 0/2] arm-virt: add secure pl061 for reset/power down
Date: Tue, 12 Jan 2021 17:30:56 +0300
Message-Id: <20210112143058.12159-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22b.google.com
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 v4: rework patches accodring to Peter Maydells comments:
	- split patches on gpio-pwr driver and arm-virt integration.
	- start secure gpio only from virt-6.0.
	- rework qemu interface for gpio-pwr to use 2 named gpio.
	- put secure gpio to secure name space.
 v3: added missed include qemu/log.h for qemu_log(.. 
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

This patch works together with ATF patch:
     https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f 

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html

Maxim Uvarov (2):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 40 +++++++++++++++++++++++++
 hw/gpio/Kconfig       |  3 ++
 hw/gpio/gpio_pwr.c    | 70 +++++++++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build   |  1 +
 include/hw/arm/virt.h |  3 ++
 6 files changed, 118 insertions(+)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1


