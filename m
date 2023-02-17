Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F069ADCE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1Zs-0004tf-8H; Fri, 17 Feb 2023 09:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZP-0004YD-4W
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZM-0005SK-Ns
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:18:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg22-20020a05600c3c9600b003dff4480a17so835953wmb.1
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMB2dD5lCH2dHu+DW95zlHGEg0teFHAondWvf3QDOdE=;
 b=ILF7lQmUy7pIw30jIw3uXlSTwt4Rz45Px1s6ub/dnBNHOZXyP266rcPGucCib6hLI9
 IreIzc34OLTWq51hO8tsy1PrIOUBE2nci9AmRtU+ywnFcOTnPraNzDJ30aKp7CIBRqmH
 XrocoT0UjEz4o72MJwa0YjgVWOqTxhYURfvk8GB8v1TZSjTJVmwrpdIPb/hy14vtH/tE
 b+0sWXgPOt/3d1osck0Ny8V9Nr2tunA1RRHWBHhT1+CF+yf8YpM0wyDdoQuLFGMbKBUD
 WF4A9y63ZiWCltcQiT2BowIdIyGIHM//OG0OUYfkcnSQpKL5ctP/HGhuYzaJKQ8gB9lh
 APWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMB2dD5lCH2dHu+DW95zlHGEg0teFHAondWvf3QDOdE=;
 b=tLEs023iCAkaOYJ+rL0Rqfc0LNlBqeeV4lHaY7pOV5YZZchYRQaHEEKWORcpPp/ffW
 BmCdV2t3JZM/6JI6oLbysuwkPz1vC0++B0Y3bqP9DKekZdNQe75+M7yx5EVViNNeMjHN
 ZaifizC1RFbevOdx7Bn8HulVZbs+y2Et8rcjWCCgunMaUAM5zmoq+Mr9JyqRAZZ4pwuX
 Ov0HpoTqiZUsuDFX6UASzJ97bXxqqKtZuY7bS1PTjCqWvEKDEYwdEfE5l7h/d5gomqva
 okRT7OdvUjSLHE9U6JiyvTSKOZ04xkwNtP6LjP/WjUyn+Fl8edeiT67td5ha8s46AFSY
 ivXQ==
X-Gm-Message-State: AO0yUKW8o8Dv7RUHd8bEzY8MlQHYCwFcDtIoR6trrURckE6wkPd98UJT
 EDidw2p6zCInqJNLterNopPtJ4Y/C6GyQTNB
X-Google-Smtp-Source: AK7set9BgWWHzdlP8n2RsdQSkYPqVEPb+4JFNrszBKIqrEugTO8GTIfTe3Yrv5oJ+Hua6NWIUTD8Eg==
X-Received: by 2002:a05:600c:4918:b0:3dc:42d2:aee4 with SMTP id
 f24-20020a05600c491800b003dc42d2aee4mr542863wmp.25.1676643514850; 
 Fri, 17 Feb 2023 06:18:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b003e1f6e18c95sm8823263wmh.21.2023.02.17.06.18.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 06:18:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/timer: Reduce 'hw/ptimer.h' inclusion
Date: Fri, 17 Feb 2023 15:18:30 +0100
Message-Id: <20230217141832.24777-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Yet another "try to reduce build-time" series.

Philippe Mathieu-Daudé (2):
  qemu/typedefs: Sort in case-insensitive alphabetical order (again)
  hw/timer: Reduce 'hw/ptimer.h' inclusion

 hw/display/xlnx_dp.c                     |  1 +
 hw/net/can/xlnx-zynqmp-can.c             |  1 +
 hw/net/fsl_etsec/etsec.h                 |  3 +--
 hw/timer/allwinner-a10-pit.c             |  1 +
 hw/timer/arm_mptimer.c                   |  4 ++--
 hw/timer/armv7m_systick.c                |  1 +
 hw/timer/cmsdk-apb-dualtimer.c           |  1 +
 hw/timer/cmsdk-apb-timer.c               |  1 +
 hw/timer/grlib_gptimer.c                 |  2 +-
 hw/timer/imx_epit.c                      |  1 +
 hw/timer/imx_gpt.c                       |  1 +
 hw/timer/mss-timer.c                     |  1 +
 hw/watchdog/cmsdk-apb-watchdog.c         |  1 +
 hw/watchdog/wdt_imx2.c                   |  1 +
 include/hw/display/xlnx_dp.h             |  1 -
 include/hw/dma/xlnx_csu_dma.h            |  1 -
 include/hw/net/xlnx-zynqmp-can.h         |  1 -
 include/hw/ptimer.h                      |  1 -
 include/hw/timer/allwinner-a10-pit.h     |  1 -
 include/hw/timer/arm_mptimer.h           |  2 +-
 include/hw/timer/armv7m_systick.h        |  1 -
 include/hw/timer/cmsdk-apb-dualtimer.h   |  3 +--
 include/hw/timer/cmsdk-apb-timer.h       |  3 +--
 include/hw/timer/digic-timer.h           |  1 -
 include/hw/timer/imx_epit.h              |  1 -
 include/hw/timer/imx_gpt.h               |  1 -
 include/hw/timer/mss-timer.h             |  1 -
 include/hw/watchdog/cmsdk-apb-watchdog.h |  3 +--
 include/hw/watchdog/wdt_imx2.h           |  5 ++---
 include/qemu/typedefs.h                  | 11 ++++++-----
 30 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.38.1


