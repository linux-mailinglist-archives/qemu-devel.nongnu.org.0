Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14504EE3F4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:22:32 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3BX-0002yZ-VK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:22:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39S-0008SO-PK; Thu, 31 Mar 2022 18:20:22 -0400
Received: from [2a00:1450:4864:20::12f] (port=33621
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1na39R-0001QA-DS; Thu, 31 Mar 2022 18:20:22 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bu29so1738357lfb.0;
 Thu, 31 Mar 2022 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s49JRAND5k9mnQYv1I2X80ZqscHkuz7UOfCPnd/YvBI=;
 b=a9KA9oO9uut13vmgwxWjQIpx43rhPr5W+vxHuDZWtWg3Omzatv0NqZikSCZ0wfFbXg
 4147yCnDSoY7uJLDFN0t1SntMKEYZcXkgRWCsIRvFRo4ZJAz+n88w6lvv0AQO4lNvLbl
 vYtWmnSuINTdMWRNpHtMEsiWgD73THlsswEhMf0XChD1Ln24ZwIpISBqXn8ijCBHy3kx
 b79C0Ta2wrIHvPI66qQaEeVe42BqafVgKiAv6kofa8hEmmB6pOISR1saDYZ9nP0e9IrT
 g+HJaBkCJWZfEYQe5TD06EffUv44ziwcJ8weBcKedqNzYRSI6Oh4HEQRWMluYRl2GwSM
 z2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s49JRAND5k9mnQYv1I2X80ZqscHkuz7UOfCPnd/YvBI=;
 b=pI/cPbX2BnZ5SnR4ywTSppHlgaYE/WuaQ8KJ8p0+mkNCEEthC+7/fvtoQHrirra7cL
 Bt9BrnIjNzK9zkg8ioi8FO7+9cDucWFqJ3YtZJInevlU+fLXDGLr+giyh2XYZteb6tFh
 xXIChCa3bnPq0XSwnL7h0WyuwqXh0FfbNH2HngQbIUVwBk9FElV1GZ3RJbg0Xml9sKMW
 ceBGBywhHfC+a9TUB+e4LQTh04+F2J3DQASwmhI65h3B5Sonq6AVsAhEkFcZ8oIPkTIQ
 hMLmL/y/ePP76nx4mmHF/CGKmh3vVFPXtS4jkI67erHFEuKq2Qzd2PqseSW91DHVou4y
 vhag==
X-Gm-Message-State: AOAM5309/5lOoAcrLPCFkxtVrpkJPqsvcCL2I2tW2pZUwdNG4eT4lNvy
 t73XX+4wld03VSusw/qHcKGe73/3wSoNQw==
X-Google-Smtp-Source: ABdhPJyJQuDz89kVqXZZ9OPhKAQiF/5XQAeNgp7dmZNJVjQWsH5dbT6HpljK2qJjKkoHYe8uiKKh3w==
X-Received: by 2002:a05:6512:2244:b0:44a:5fab:5ac4 with SMTP id
 i4-20020a056512224400b0044a5fab5ac4mr11424076lfu.665.1648765218379; 
 Thu, 31 Mar 2022 15:20:18 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a0565120b0e00b0044a9b61d2b3sm57318lfu.221.2022.03.31.15.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:20:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] hw/arm: zynqmp: Add the 4 TTC timers
Date: Fri,  1 Apr 2022 00:20:15 +0200
Message-Id: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This adds the 4 TTC timers in the Xilinx ZynqMP.
This is for after the 7.0.0 release.

Cheers,
Edgar

Edgar E. Iglesias (2):
  timer: cadence_ttc: Break out header file to allow embedding
  hw/arm/xlnx-zynqmp: Connect 4 TTC timers

 include/hw/arm/xlnx-zynqmp.h   |  4 +++
 include/hw/timer/cadence_ttc.h | 54 ++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c           | 22 ++++++++++++++
 hw/timer/cadence_ttc.c         | 32 ++------------------
 4 files changed, 82 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/timer/cadence_ttc.h

-- 
2.25.1


