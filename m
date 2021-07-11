Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33D3C3F83
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:24:35 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gwE-0007A8-8D
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjc-0008B8-2x
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gja-0007Vh-Hg
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r11so16857472wro.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ullh4nTE/uo1kNH6VLUCVAcg39XDupueIapcLcg3Jo0=;
 b=ZQ29LSe8cYx6Wp0uomFQdo7ITLTGZB1D72T4f1qxpVp27ChQu+nDCJ9wFhy/JkiD1S
 0ISFvqJqw/no6qeZdEakC+BD/bkFt6ewEGJ8Gm+CE0OhDsrXW9edseWLbYGKtw8G5o8x
 F9iNSQppeo2znsnc9gF0ojthNMS6gRG0Hl3UBUFUxlIvH2wJeVpd1oWkcopfKLZ83b0i
 U7pbWKEThnjFhIkiPcWV+aXkeCDL3eyQz/UqD4ZbNZyjxQ3ZD6DmldfC6uvWFWAYEqXj
 JvtoHGJHk0Iblaj2L3+peta65IY0AYJXd+VCdc1zE74prMPW199ngyFjup2Gs6H3TNS9
 knbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ullh4nTE/uo1kNH6VLUCVAcg39XDupueIapcLcg3Jo0=;
 b=N8RRlvanqjcowuF6o4xtRURrbhl9BPS84enbda+s8h/yqkhwB5c6SyUBZ2QkmDCpgt
 oy9QYwRcR2VM1dmFMDtDyXMVVwIvrOtoTfaRH39GKDd+U8QPLQVTWABv0AM7XFBP1TnS
 thGTny0No3DfITi7ThGghAaffthxLv9oP0+MtrybHQAhFymCy/LG0fHpZh8LEfIdlQXj
 j6wvxHvmzc+idHAtSMf20x5pBpwc16wjkq6z3ZVyk9F7iR8eSBPSRkE6F7MOvBpkuS1g
 gsse2aebN9ek65joKmlLfO8CBUuLzEv4k9wZ11kBL9O2eB9sGqpB51K+a5XzU9a0TfGv
 wFvA==
X-Gm-Message-State: AOAM5310SryQU0UCY8NAtUl+AsJNKPm7cQrLQGXJ66fzw63hvXTEHRXt
 P2INn5On1VJIp/lJPlF2/ipKvxk+MmNPPSex
X-Google-Smtp-Source: ABdhPJxddhKwt7gi1JUoeBk/ro0ZesDzru6hin49YYInA89v+gpQs4deSfW6/mM5e29cwgMGPIVtVA==
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr17164463wrt.53.1626037888969; 
 Sun, 11 Jul 2021 14:11:28 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id r67sm6437805wma.6.2021.07.11.14.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:11:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
Date: Sun, 11 Jul 2021 23:10:57 +0200
Message-Id: <20210711211057.2714586-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711211057.2714586-1-f4bug@amsat.org>
References: <20210711211057.2714586-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joanne Koong <joannekoong@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joanne Koong <joannekoong@gmail.com>

The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
was added in v2.

In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
where 28 represents the BUS64BIT SDHC_CAPAB field.

Signed-off-by: Joanne Koong <joannekoong@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210623185921.24113-1-joannekoong@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index e8c753d6d1e..a76fc704e5e 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -316,16 +316,16 @@ extern const VMStateDescription sdhci_vmstate;
  * - 3.3v and 1.8v voltages
  * - SDMA/ADMA1/ADMA2
  * - high-speed
+ * - 64-bit system bus
  * max host controller R/W buffers size: 512B
  * max clock frequency for SDclock: 52 MHz
  * timeout clock frequency: 52 MHz
  *
  * does not support:
  * - 3.0v voltage
- * - 64-bit system bus
  * - suspend/resume
  */
-#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
+#define SDHC_CAPAB_REG_DEFAULT 0x157834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
-- 
2.31.1


