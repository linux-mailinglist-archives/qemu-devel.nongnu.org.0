Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2164A3AE7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:16:21 +0100 (CET)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJQi-0005yB-3X
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMq-00038B-GE; Sun, 30 Jan 2022 18:12:20 -0500
Received: from [2a00:1450:4864:20::136] (port=37810
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000vo-9c; Sun, 30 Jan 2022 18:12:20 -0500
Received: by mail-lf1-x136.google.com with SMTP id n8so23223338lfq.4;
 Sun, 30 Jan 2022 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyWgnKcFsZbjV25ohAQeWlsgH9LfoJT09eJHJH1WZ64=;
 b=iyXVa56Nh7gQaFGKA6CmPa+29S1osWPxw9KVrEPxAp28dBJjhcGMHI0ee06RS1IsPV
 h9v2J3nstH7oGUgJjLPH3wx6xoDXXZPzN4+RPcpHksDk523PbrwfXbOhQoJiQ9bI8E5v
 LjF2G/Y5Euf3ptYHz7qKhmEdOxl0cy8CJFdbxu8TFQcFpUg/AOFySbV0xkzEwntr/xCC
 uoUDFnOXHUNpjnVbl9KL+eyCAM7185qsNc7YuzCmePxyRo2sQfNXX7r/8vVgKf1KAvSy
 S2NLrA7rn6VfNvp9v8Ui7yduySspeJOiEP4D3nQdN34iHu86BpfjNpoqPKxAb5KFEog9
 aWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyWgnKcFsZbjV25ohAQeWlsgH9LfoJT09eJHJH1WZ64=;
 b=XXAugRSqm7jk+6ZxAqXC7E7hi3T2lXqXq4MWEWB1jcdSjL/QkeybzZka+D9lw0itqn
 VYf6kC/MPYGu5oi1lpCjEnOOQU2cJ875cHtC42EyHkDDju0sSZKmcVB9n0ZRpQyiRRXz
 cU3rl41n6Thb9HXsfaYMtyuQ8J0NOEvEwVGx5SZXuPeR1dDTME/ggj+3QGyajtO7WJkx
 juN8mUXcB/4QFYxJHMLa9VG0I1LJPdVPbi/XCi8GQxQyrJHsPbFVLubnjtn9312SdTiX
 rHpLl3TcpwdUk7jgJa0EQpWh6qfg7NDP8vxVxv6TUdeQOzTygckxRCXgeRV6N+6HSK+4
 TNug==
X-Gm-Message-State: AOAM533xXXSXbFrZqm1lAWeq5d6J7roxuGY1MbxXZyeaPjCCunV2pPn8
 Da9PNcpxv0jWyqFlTt+mt+cXBAINftAdvQ==
X-Google-Smtp-Source: ABdhPJxenPMFl1vdj/W2Lqsbwv1fW1EVMu1d5x2crgl7CTfHmvBYDYwAG72eRwdMmhumRGkDMuAM3Q==
X-Received: by 2002:a05:6512:32c5:: with SMTP id
 f5mr8393000lfg.361.1643584327654; 
 Sun, 30 Jan 2022 15:12:07 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w35sm3433795lfu.273.2022.01.30.15.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:07 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/6] hw/arm: zynqmp: Add CRF and APU control to support PSCI
Date: Mon, 31 Jan 2022 00:12:00 +0100
Message-Id: <20220130231206.34035-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the necessary modeling to support some of our firmware
tests at EL3 implementing PSCI (TBM). These are the test-cases
that were previously relying on QEMU's builtin PSCI emulation.

I've only tested this on top of Peter's recent PSCI emulation fixes.

Cheers,
Edgar

Edgar E. Iglesias (6):
  hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
  target/arm: Make rvbar settable after realize
  hw/misc: Add a model of the Xilinx ZynqMP CRF
  hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
  hw/misc: Add a model of the Xilinx ZynqMP APU Control
  hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control

 include/hw/arm/xlnx-zynqmp.h           |   4 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
 include/hw/misc/xlnx-zynqmp-crf.h      | 209 +++++++++++++++++++
 hw/arm/xlnx-zynqmp.c                   |  45 ++++-
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c              | 270 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   7 +-
 hw/misc/meson.build                    |   2 +
 8 files changed, 879 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c

-- 
2.25.1


