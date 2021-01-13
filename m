Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25B2F47BC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:43:24 +0100 (CET)
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcgV-0003ax-PF
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXp-0001B0-LU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:34:27 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXn-0004Fh-Pb
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:34:25 -0500
Received: by mail-lf1-x12f.google.com with SMTP id 23so1747277lfg.10
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBDRE3qynYwWfAy+Mm1zpl50/3ms5+CYx7IEUQMytFI=;
 b=CzDb30v0TBSF3EyHcPdyAVckpdAIvTBD2uPxeSLBVWyngh3EL8ZeZLPn7igdB3tLq7
 rWqNkg4EoJgIRUro5oPxeEPLmmVb9pAEowsV+3TAVpXFmgTBXrEIITSpUBedMpYpkNPr
 O1X2zBUFOujqMECGRWV4NvjLp2lLxI47qRyp6dz9y36ezjUqkvzzTJopjlxMO+FZQuGf
 NzRPG2o7rI7baJxMi+frk2Wu7LVyzjUXNy6KgtpZ7iThvUUCzPDVPsMJSTFtR3zp0suD
 iwlWn2fXCstbmNg0386d6E1F4x58b22a1qaQPZlzAc6ulWk4Tx+uP+USdgeC5PcKfX6h
 gtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBDRE3qynYwWfAy+Mm1zpl50/3ms5+CYx7IEUQMytFI=;
 b=sF+nmAPzf4eSDL6n97l3TzxDacFyDG4qBX/uyDXBKUbLXm02Y5iRIMcznHQQFhLdEa
 mnVb/RKkKpx9xtW9UhQHeGjELx5ZJ+ZbmeGFrM+huYHjkNqcYruwKS3n8puXu9XSl8GY
 wda5LnxiArutmjpZx9YRKM083yXm50YS+BWZFTo4+txraUJF369qKzX/miPccLW8W/A8
 WY0IXdl/5d20CaGRKZWG0SKeo3oNODJNIFU5fpvMsu/xgjTr8b7gioSHtRJuNcKNgk3E
 G9rwURcL4mamhPzQOjhm7w0NnV5p8e7bUU/CUUCC8iBaH83klGtKFCZq38c3hdxv5rGf
 Z2Gw==
X-Gm-Message-State: AOAM533CdH84p2RsMNwG5CS+ZdpsZ/nMjoe9GyXFSNE+LrlJpdeeY8kw
 X7M/DUhU/+t8ldqeZsFHt6BBgw==
X-Google-Smtp-Source: ABdhPJwmM8879y39CbU/mIiqLUxM3o0gGgULvvuoQsbVlBo70d4iweW80+qykVVxkmpkQpr4S8VU3Q==
X-Received: by 2002:a05:6512:788:: with SMTP id
 x8mr531622lfr.250.1610530461551; 
 Wed, 13 Jan 2021 01:34:21 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c3sm127472ljk.88.2021.01.13.01.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 01:34:20 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv5 0/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 13 Jan 2021 12:34:14 +0300
Message-Id: <20210113093417.11606-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x12f.google.com
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
     https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f 

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: add secure pl061 for reset/power down
  arm-virt: combine code for secure and non secure pl061

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 118 +++++++++++++++++++++++++++++++++++-------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 +++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 175 insertions(+), 20 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1


