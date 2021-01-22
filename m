Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A843E300F43
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:54:14 +0100 (CET)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Nh-0001eZ-O7
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M4-0000Rz-6E
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:52:32 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:39571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M2-0007GV-8p
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:52:31 -0500
Received: by mail-lj1-x234.google.com with SMTP id b10so8216932ljp.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3NmXY82AVsBjMLhUcX3GeVAxWcAOFNsrsf94y63Cq0=;
 b=pRFYWlBCZbepop+QMXe9sLJGi2YLCVzJ2inK2+C0xo8fpz5ZEMHKbGgtSK0sN0KUC3
 WYf5UqV+6HW5fX9RQMnQt+ryXl8zAriZx57RgrXXqy7my92f/CQtx/lVpokQhF+gbfOo
 FL7ROmgPh+SM48wMuAf+NJwOnyPS7Aj/IeN7apxNmtRR3yGLeoxVD3K9DEUha4QSpsiX
 aMNVswN5ApqFeAMDppx77/QO7yk02KrEEwU1Cw964dplfy/jCGzCddrbyIWJD+P+r0dH
 ooXBCAMrevPFUXFGMpHffJ/LetDzUYkoY90hATKU2O3a3bcy6jN9Bhtn6HOryTGtdLY8
 32sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3NmXY82AVsBjMLhUcX3GeVAxWcAOFNsrsf94y63Cq0=;
 b=VwOMSJASGcr9SPAxMNJUBw42h2+tyR3BBdM4fuZiGolyVpRN/BuWoZ4t1atscei6Kk
 0gfZiAum4ICS3pL72oD45SKTLLqiYF5JIQLn2QoD6hQ+TxtdsgVAPIr3ROxHE5OML7UP
 sMdy118y4FEDQiqoV3BSM0GnB4NcpAT4dZWJdb3+ris1bgfNVpuiPZo9nfnCxppXFJW3
 ww1P/Ze6eK6y42Ge+vh4a5uJHfGH3LTlrmUDtqkt9g6u1eedCakPdcyNuoWMEN2JVyu1
 37mDtg20Oy+lajgzmaozDDrNsUCFQjpLueVzz2eCignnrzSxeR4Wz5PnbP1DFSbvviwG
 1k4Q==
X-Gm-Message-State: AOAM5328PGgr3Saqc1U6v80+btNUeVdWvLLaQKUTddq1NWx7I46kjNJU
 Ye4RdbKANwU7wb7aLCkpqwWkfw==
X-Google-Smtp-Source: ABdhPJw9vqgajjbc+EKO0WgYhB80EQqZSlG82msKcTCUHfy07xEyaaF/pYqXXQ2cyBbfDmkXk+zVJQ==
X-Received: by 2002:a2e:96d8:: with SMTP id d24mr1586288ljj.62.1611352346168; 
 Fri, 22 Jan 2021 13:52:26 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:25 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 0/3] arm-virt: add secure pl061 for reset/power down
Date: Sat, 23 Jan 2021 00:52:19 +0300
Message-Id: <20210122215222.8320-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x234.google.com
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

 v9: - cosmetic changes (move if from patch2 to patch3, rename function name
       and define).
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


