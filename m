Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DDA4E67BA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:25:12 +0100 (CET)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRCx-0002nH-9z
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:25:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6K-00060x-Um
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:20 -0400
Received: from [2607:f8b0:4864:20::435] (port=41692
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6I-0007mb-H2
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so4468373pfh.8
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak6xLCDwVU8ioN+CYYmtshSznyjHwv6PMmK0K42DToY=;
 b=gyM/bDfg1Tnxu7K87MarihkhNv/mphvUWta/GzbeSoL3OEhRiM93fB1E/7G+jAOa2U
 V2lBGcv3H7tpeLwh1I4aWwuL+IPCOvov2urtboNxAXklEy49uNd8ke5fSagQrrfvH4YR
 n0jskyDi0yqI4fVQaEKdBAF8UX2ponrXoqOpqreeILCLW2BkGgLx65j1emnakDJO2NWu
 vXJew4vDnOnAHsse0RfAUKiU0LGxXTNdMNWL+UK9Vl44TxOMgclYIOw6VuhTYCl1mYCp
 Xp+WQ25O+yC0z0q3bsm2iDf1ETLSCaHgCG+tVGT+h1cbFch33BtH4HSmahED1RVxNg8d
 ow+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ak6xLCDwVU8ioN+CYYmtshSznyjHwv6PMmK0K42DToY=;
 b=wDcVCHGZhm5Erl10TCwfxs+sJ1H8LCeNR7Z7bsb4KfF2l9WCkcHgeOEMq4SSB5q1WD
 /jeya+5szgHxwrSvuD2ayeM8FFRn+xwCrUcLEEovZNAw0fmMjASR+HsCigxAX6HRvOdV
 PxLUKVBMR17uiKuiYeGWHL6sPSYb1nr8xUdnndjNpc/uMOV6YTHZ4eVL6ZsVmKA69a6D
 cz+FApDlbPiKwUXDpZqJk4EHtgT/kXtjymkKYhXny43kGCArWfy6qY8/QBdBGaS50mOv
 ttDtKUckzG409QRNy1FpZ0dFIvVXVm6lHKENC0T+3vRuzdgqAIsf6wVK4uxHsOOCJ0pz
 jbgg==
X-Gm-Message-State: AOAM531au617+kAJ57z8VH+NFfE6pPiQA3qT2SLK7e1DUQpEk+bMYPut
 xn+qnTI5BjMSYVoYFXkBl5MTC0BBAO48Uw==
X-Google-Smtp-Source: ABdhPJxQ1f/4fsPCCDpj2+ZSL5SJlxxCVVzbXaChHJBlFoH5aNPFF00dbk2rEl4GYfE7CBc5pVI4Cg==
X-Received: by 2002:a65:4c0f:0:b0:373:f389:b7e0 with SMTP id
 u15-20020a654c0f000000b00373f389b7e0mr4689410pgq.411.1648142295998; 
 Thu, 24 Mar 2022 10:18:15 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:18:15 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 01:17:52 +0800
Message-Id: <20220324171756.196654-1-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set tries to replace 'qemu_irq_split' function with QOM
object 'TYPE_SPLIT_IRQ' and totally remove this call.

If this patch set is applied, issue:

https://gitlab.com/qemu-project/qemu/-/issues/811

can be closed.

Changes since v3:

1. Squash Patch 3 & 4 into one, since they would affect each other.
2. Use `object_initialize_with_child` and `qdev_realize` for device code.
3. Code style fixes.
4. Remove unnecessary `if` statement used with `qdev_realize_and_unref.
5. Narrow scope of some variables.

Zongyuan Li (4):
  hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
  hw/intc/exynos4210: replace 'qemu_split_irq' in combiner and gic
  hw/core/irq: remove unused 'qemu_irq_split' function

 hw/arm/exynos4210.c           | 26 ++++++++++++
 hw/arm/realview.c             | 33 +++++++++++----
 hw/arm/stellaris.c            | 15 ++++++-
 hw/core/irq.c                 | 15 -------
 hw/intc/exynos4210_combiner.c | 79 +++++++++++++++++++++++++++--------
 hw/intc/exynos4210_gic.c      | 36 ++++++++++++----
 include/hw/arm/exynos4210.h   | 11 ++---
 include/hw/core/split-irq.h   |  5 +--
 include/hw/irq.h              |  5 ---
 9 files changed, 161 insertions(+), 64 deletions(-)

-- 
2.34.0


