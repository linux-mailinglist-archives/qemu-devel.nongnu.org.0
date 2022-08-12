Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29896591065
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:55:06 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTFp-0001kO-8Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6c-0000Mt-0p
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6a-0002P5-6d
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso2438697wmc.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=1ZbaCMFWI7gK+g488PCV1yrLBsHg1eArDm/sE2QskbE=;
 b=pFhYwXSCEuS0nMu7nyXUvFbqL3BVKj2Fu57IKBdO//OjdJKznDmRHvar3Ivh4HAD/L
 7AJjgT5gMLt+/tA9vY9gdmrUfi4AA3g2pzerDBPlgVPVNDtfCVz7R7qtDKHBPMg/NUtB
 apF2VLm17LcKLFhkLmJ4AM2NvsRckjCzFE0fv5DrCs8Kw7u29et8xnu002FTWDU818oB
 dk6qc5bm6bFhtCKNOky1gbLGYUtkuWT5hGZNwL83gB3XuV7jCJrlJlm/0fT73DOAp/am
 Z4BjVCQLu5uV81g7TeiNoHbwBEUbqaegG540FOTRvP/wXaq/9owr3+/nLP+Bb/cIIX1v
 FSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=1ZbaCMFWI7gK+g488PCV1yrLBsHg1eArDm/sE2QskbE=;
 b=NV1SosbP7YcP4pys3nNZ+/nmxQkcTKPsj0Fik3lpI/2FTds4B5235JCu4s2uTnDcdK
 Gp7kRMGrPwvQee51GysIpjrTJ4vjdWAss1Sh4hykZnZRoWZiraxmx5WiN5O7rs9Um9dQ
 fLmou5cVkfdmibEWnv6sXrSL7LnDsrQ1RoUpk+arZdeT92gDvpNnH+G/LlmKxkXEp4Kk
 oV6FtoY22DcmQZmHG3joujjGa27lU5b5rCQ2HjnhpqgIyMck3VGMPsQvvPFU/MNH0gpb
 W2xrtAKVBe9lJxSlDNROYt44zYVgZmEmO3A8/iHu9rK6aaFHoxET+R3LMWa+tjcVp4SX
 +UcQ==
X-Gm-Message-State: ACgBeo0omD2TClvH8XJLAN/69casi6+rg0fsXGVFQZqYVgQzpwexCSsP
 NqKFCoLgTHKQ6igeTHbEZ2jcd1+iRjPf/A==
X-Google-Smtp-Source: AA6agR522RjkPYPKk5aPjUEUm7TzGrIjegwC7CWZ8Z83skD6NYm3NhW6EfGUnKzxPoMbD/LKskwjYA==
X-Received: by 2002:a05:600c:3d1a:b0:3a3:7d4b:edc5 with SMTP id
 bh26-20020a05600c3d1a00b003a37d4bedc5mr8852296wmb.156.1660304730818; 
 Fri, 12 Aug 2022 04:45:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] target/arm: Don't report Statistical Profiling Extension
 in ID registers
Date: Fri, 12 Aug 2022 12:45:23 +0100
Message-Id: <20220812114527.1336370-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812114527.1336370-1-peter.maydell@linaro.org>
References: <20220812114527.1336370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The newly added neoverse-n1 CPU has ID register values which indicate
the presence of the Statistical Profiling Extension, because the real
hardware has this feature.  QEMU's TCG emulation does not yet
implement SPE, though (not even as a minimal stub implementation), so
guests will crash if they try to use it because the SPE system
registers don't exist.

Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
we don't advertise to the guest a feature that doesn't exist.

(We could alternatively do this by editing the value that
aarch64_neoverse_n1_initfn() sets for this ID register, but
suppressing the field in realize means we won't re-introduce this bug
when we add other CPUs that have SPE in hardware, such as the
Neoverse-V1.)

An example of a non-booting guest is current mainline Linux (5.19),
when booting in EL2 on the virt board (ie with -machine
virtualization=on).

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20220811131127.947334-1-peter.maydell@linaro.org
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b7b3d76bb3..7ec3281da9a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1933,6 +1933,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        /*
+         * Don't report the Statistical Profiling Extension in the ID
+         * registers, because TCG doesn't implement it yet (not even a
+         * minimal stub version) and guests will fall over when they
+         * try to access the non-existent system registers for it.
+         */
+        cpu->isar.id_aa64dfr0 =
+            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
+    }
+
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
      * to false or by setting pmsav7-dregion to 0.
      */
-- 
2.25.1


