Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2154CC706
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:25:39 +0100 (CET)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPs14-0004Zx-48
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:25:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzI-0001tz-W0
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:49 -0500
Received: from [2a00:1450:4864:20::333] (port=53092
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzG-0001ZE-Eg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id r65so3852696wma.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rl6rJQIZ9uwk1nMGAp/sf9VVKFi3/MGwZkX1vKUurA8=;
 b=uUjDecKomiu193RYcyBu8opxoK6sguqYVjNV+LClXua5ZO3zU6UodJVhuhA+YPOZB7
 A6yM/KzsZQ1GA8oot/m4Dit4DwZizlPYjb89GShWCAMJregD9xQgfG2YzP1cUmq7dAwK
 FUQCAK/36yjhyqtWWMjXF6EmEjEp4BRt9vuG1uMXZcXl1AYsF4xfUxY8xKS9qtE1hxqG
 rk8Z3HQut1XByxa2iagPoTh00e3Fp/Sju2pooPZ49Q/rnC+mmOQ6HXTASoh8oGc9NFQ0
 7PEkU/vAp56dz5bYgR1kCjta2s2StQ7CMP9S7h1TeLdvD8yFhZFMT34aF6AY1nUz2bbl
 iHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rl6rJQIZ9uwk1nMGAp/sf9VVKFi3/MGwZkX1vKUurA8=;
 b=lWVTRGiGrFIdyjgbys77ZCOnHtFTCAQre+qMrnlryh3CMXWQ4YHD04NJHK3NqKtPMC
 bqfrOMTK3+u8B4yUWQu61/knOMXek9wDtwegGnJrtN7rWbQOFR6gjXt0afy+AinliyAD
 0FpMHC7+VxjqnAaRlWPHAdMaGnA/5wWwB+fAbx4P6mP9z2Izn7fXaYalPjrmlAajvdr9
 gY1KYxzmbSu5/APtl7xp34JQm+yimXAu213cGnMQ89uvMzTlXgK+MlsI89iUuFnLl3aP
 nlNWBK/vYknb2EaOANNIUCJjbZ+b3R13g7euXqeCuQnyXUWmoefalGcqyloKHp7wyw48
 x4dw==
X-Gm-Message-State: AOAM5314X40JUmnD8/kMIaIGagK4UUSeIhgrA8+XuQfmlDT+tonD/Fei
 OWPKQWb/tA8LoYB6jm6agbz+Vw==
X-Google-Smtp-Source: ABdhPJykm+4SobxLgrF7QJZY3XdvAk+PZMxo3eVIc3WPJGI1H33p7MBQ/e+bEV0/Guv3T/BANEm+tw==
X-Received: by 2002:a05:600c:190d:b0:382:f9f9:bd33 with SMTP id
 j13-20020a05600c190d00b00382f9f9bd33mr4987698wmq.155.1646339024361; 
 Thu, 03 Mar 2022 12:23:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] arm gicv3: minor bug fixes, ITS trace events
Date: Thu,  3 Mar 2022 20:23:36 +0000
Message-Id: <20220303202341.2232284-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes a handful of small things I ran into while
I've been working on adding GICv4 support:
 * it adds trace events to the ITS for all the commands and
   in-guest-memory table acceses
 * it fixes a couple of text errors in some log/trace strings
 * an actual bugfix: it specifies .valid and .impl for the TCG
   GIC MemoryRegionOps so that we actually use the code we have
   for reading/writing 8-byte registers rather than letting
   the memory system split them into two 4-byte accesses
   (which is mostly unnoticeable to the guest)

thanks
-- PMM

Peter Maydell (5):
  hw/intc/arm_gicv3_its: Add trace events for commands
  hw/intc/arm_gicv3_its: Add trace events for table reads and writes
  hw/intc/arm_gicv3: Specify valid and impl in MemoryRegionOps
  hw/intc/arm_gicv3: Fix missing spaces in error log messages
  hw/intc/arm_gicv3_cpuif: Fix register names in ICV_HPPIR read trace
    event

 hw/intc/arm_gicv3.c       |  8 +++++
 hw/intc/arm_gicv3_cpuif.c |  3 +-
 hw/intc/arm_gicv3_dist.c  |  4 +--
 hw/intc/arm_gicv3_its.c   | 69 +++++++++++++++++++++++++++++++++------
 hw/intc/trace-events      | 21 ++++++++++++
 5 files changed, 92 insertions(+), 13 deletions(-)

-- 
2.25.1


