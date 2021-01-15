Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900222F7644
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:13:07 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0M6M-0005Hx-LI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4s-00043s-5l
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:34 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:43474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4q-0001xy-LB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:33 -0500
Received: by mail-lj1-x233.google.com with SMTP id e7so9763082ljg.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dI3m5apsFpRzkZoJU0PtHodMAshsYUKsXH+0XXCFfFM=;
 b=MHyD8mGnSVVB1d36yaC+ardXR4WaRHkCgqUNiOafXFgC1UMzHzoMkQ+OOaTNkw43v1
 TljI25K/B/u9lfjL7iV04wpADD6sWCk3SORQ0c5uLxk26jf+4SX51m5jqdZNegtcw9gX
 UZhlQ/1itisx7/+05hAiI2w0EJkvRivfkL+fcJD63DrKEeIO/2RLyv451erS1niumvRb
 QY9N4B1pMtYRk1KLB885Qzbo2q7jn9sKo/7zXzyf1pAocszo5pqDPstz14qs4FfvtBYI
 57d5CuGSyqRt2WidoSqoU5jcq1asaT+42PORfVi+zzTLvHOq/G4Fjd4/2RzIaEs11UTb
 gk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dI3m5apsFpRzkZoJU0PtHodMAshsYUKsXH+0XXCFfFM=;
 b=nusibhlNdP/Mmmxj5L3nGt3fhAsl+F6nBav7jywBvg4ipso7wCvWxlg23sPkmzK5Nj
 fv+b7tRezH/eYUVFcRShOc718Y7V+P3HV6Z0osYc+IHR6/FgRetF99x+1G0A8sK+PkHu
 jCfl/gXU+IgtwIXW3SurGB3NLQ/6pvb3kDtKUUTNkjIjM6e8waisL2jKSgvDZA1SDahF
 AMMRbgnd7c2cmRzF/VJxhWexb/nXDIicxxd8XxZ7jaojeoLdi0gQkK90AApEUtgy/ZTk
 xJL85XrIkXce98Veb94qT33YLEkd44quGLvYQAoBJNEvrXPlqcz+gsTOagNc8YlKQtNH
 65/Q==
X-Gm-Message-State: AOAM533N1bVTIyPMXWGhBFqApqtIHB6FDnGmGhp7e0EafkSZCT+ojOnN
 0ryN0IO2g/SEr20snALa44NasQ==
X-Google-Smtp-Source: ABdhPJyVXYNtdF6AgCPMMyKLMwqYEVcQGgwfvlM7P94Eg65N3P5KWqrX+X5NzOvgt63fcrlrFF/s2Q==
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr5262677ljh.477.1610705489942; 
 Fri, 15 Jan 2021 02:11:29 -0800 (PST)
Received: from localhost.localdomain ([91.193.178.207])
 by smtp.gmail.com with ESMTPSA id a15sm731886lji.105.2021.01.15.02.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:11:29 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv7 0/3] arm-virt: add secure pl061 for reset/power down
Date: Fri, 15 Jan 2021 13:11:23 +0300
Message-Id: <20210115101126.4259-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	https://github.com/muvarov/arm-trusted-firmware/commit/7556d07e87f755c602cd9d90359341bdd14d9d57

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: refactor gpios creation
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 117 ++++++++++++++++++++++++++++++++++--------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 +++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 174 insertions(+), 20 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1


