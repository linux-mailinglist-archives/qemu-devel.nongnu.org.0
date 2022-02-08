Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAAE4ADA69
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:52:47 +0100 (CET)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQvG-0007Dc-4x
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000l9-PF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::432] (port=45055
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqo-00026n-Ht
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id k18so30169617wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=17laaPJRMH9FCMUGpQ5IzmJ4dX79Qam+3Hyao1VjYHY=;
 b=H/ycfy3+lPaqcbWJlZrKN0UBsqjewpjA6CZ00aaYncOawnU9ZAvLFi//B3DfMEBExR
 u1n+vHB1ET8c3+ewnh79tGEdnSNCso7wUGB8DaVv3bwKPyKxHbP5xVo9rczExbp4gkGG
 w5MZLR5kH4KLy1yS1G/G7Se1ulqD7ZxDKj+tbtvuPWj6jgV8MWN8d4ZrtnCY24EUvLPm
 2ozpiKw/gch4oz+i1G5WziUj4hTdehPMwB8GLH7OWv6YjBIDugBJqg6fvLqNpT+pYLgr
 Cvo5KpWuvxGh8r5hqqKqw4vstJ6HErkCN8Ly16OuxxqXJttbDWeT1KgFIMMEGAKv0CSb
 rbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=17laaPJRMH9FCMUGpQ5IzmJ4dX79Qam+3Hyao1VjYHY=;
 b=cVdqEWFDjdXFy1YSJlAT3nxOuf93fPZ+CcJXB9PcdAiZ1XjWmsxCdukFlqAF94naFR
 M8zl/xQgLrXFFh4u69/OjCJNESsLUjFfUX1+VbWraUAs4QV0TBY3Mi6MN7IlCQkS3kgG
 jEmZ2Vl+52Za86ms0peFyodKsEcP3o5Lvjh8rVg2zo3R0HHFpGy3PC19DfAtUzdiwpMg
 VecanlQf0hCvnzeUBeHSyj02c9KkakK6lhCUqvx2QtNuwNbWZfm7LnAZSuNCJLGpOhoO
 6sJvLXYqnT0STvmfimSEF/2yGPceg/xy74axq4+ZdJtZh8MnMFASwTLpfKeLdCZkgz26
 J4Pw==
X-Gm-Message-State: AOAM533GF9wABBqpDA02hQCOhjF2TCi0WzlZCushYN7GCiwWdoUHtMte
 UFGb2aHx5f7N4kFzIGlWl78fxruYJra5kQ==
X-Google-Smtp-Source: ABdhPJyWebZVH+nTu1Eq0ZnAHEXnpyXxI0tWXPGMNEiouq4Jr2UBlD493jRY+T7NFMGFCmmZReFMWQ==
X-Received: by 2002:a5d:4706:: with SMTP id y6mr3246539wrq.331.1644320401126; 
 Tue, 08 Feb 2022 03:40:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/39] hw/arm/boot: Prevent setting both psci_conduit and
 secure_board_setup
Date: Tue,  8 Feb 2022 11:39:26 +0000
Message-Id: <20220208113948.3217356-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have dealt with the one special case (highbank) that needed
to set both psci_conduit and secure_board_setup, we don't need to
allow that combination any more. It doesn't make sense in general,
so use an assertion to ensure we don't add new boards that do it
by accident without thinking through the consequences.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-13-peter.maydell@linaro.org
---
 hw/arm/boot.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 327e449f831..0424c178305 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1339,6 +1339,16 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      * supported exception level or in a lower one.
      */
 
+    /*
+     * If PSCI is enabled, then SMC calls all go to the PSCI handler and
+     * are never emulated to trap into guest code. It therefore does not
+     * make sense for the board to have a setup code fragment that runs
+     * in Secure, because this will probably need to itself issue an SMC of some
+     * kind as part of its operation.
+     */
+    assert(info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED ||
+           !info->secure_board_setup);
+
     /* Boot into highest supported EL ... */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         boot_el = 3;
-- 
2.25.1


