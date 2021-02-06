Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B08311DD7
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 15:40:13 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8Okt-0004RM-RV
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 09:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjP-0003Ua-LM; Sat, 06 Feb 2021 09:38:39 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjO-0006aK-66; Sat, 06 Feb 2021 09:38:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id f14so17586075ejc.8;
 Sat, 06 Feb 2021 06:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KvKuWCIQF7OQoxnfE7BME6o1oPVf1VqyWZGdd/uj+Cc=;
 b=X83aNLBc1YNfByUNEMgmpAHbeKszVGBbjPWOeNEY5vxn4qqEbWM1oL5wZSAzE3m3yD
 1BpyXeUN+9D5IQ0b7CxVtnSm8Q9KeLQmVdAR8mhVXCr5oJjasxdFTBjTzXsL4kVmBhA7
 clXYxC4wyjBedJnmEpMJjVebsH495yGC4xjKpoDw8u3TedyEf0PotD77Y0c+d4sTLI3c
 I25yOjRH8AM+J6qPeEgno6tOrhZdFedIxcLcqATjU8fPfjwwZr7sFhh6sOL5xu1Bi/vW
 AKgsbbgdmsN/JslycY4WOQKLtJjIgw1/dXLTZ9KNk+ACGtg0cIQnU+lRvUunpKfant3M
 EwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KvKuWCIQF7OQoxnfE7BME6o1oPVf1VqyWZGdd/uj+Cc=;
 b=oZiqIgdox1fzKKxTXLClVzQuvwf11Jy8p0RXpdrmD5p1i0Ux+ku/1eilqa+Ts6z4oI
 MWH5l39KQ2eQCUdkTz+/8ETBKLmhEpOsbepJfQqlKxDSl0RyLjS5v0/zJfFmnBEiEw4I
 ++NrvbatX5oKZs+nwVvp0oh/QiQEonh/4Bf42nFYzh2PlqUBCt7srCW6NJAM2RB+A/JF
 4hIT32JpvZLnZPCIncrWo4vAFVETr325yr8M8wEF5PU+SD/o+9ERGs8gvU4F3JYW/hUX
 JmkXPZzD5HVKtw3+qf/YB3ptBZijB26heXx/LHiPswerNckGQWaLE4454hp+q7FBniDx
 WJkg==
X-Gm-Message-State: AOAM5302hkGz6tb7yz91zUpFWuX9CrTgsPcj//JjOFvzzbu7njG46wfS
 WyPZabGHxlfKX/GJd5tUjgo=
X-Google-Smtp-Source: ABdhPJzDhvO268rAue7hv4SFiAyxYvqSwzuKQJx+L1KOEjTHCuhr2iAj+CkcrT3JEgdSuvhsB2ofwQ==
X-Received: by 2002:a17:906:c299:: with SMTP id
 r25mr9238162ejz.80.1612622316031; 
 Sat, 06 Feb 2021 06:38:36 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g22sm5394513ejw.31.2021.02.06.06.38.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Feb 2021 06:38:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
Date: Sat,  6 Feb 2021 22:38:12 +0800
Message-Id: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

Add a basic implementation of QSPI DMA functionality.


Xuzhou Cheng (2):
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Implement basic QSPI DMA support

 hw/ssi/xilinx_spips.c | 211 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 28 deletions(-)

-- 
2.7.4


