Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CC59FF2E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:11:57 +0200 (CEST)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsyy-0004nK-GB
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029Q-Ap
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf5-0002FP-RI
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l33-20020a05600c1d2100b003a645240a95so1092664wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Wxzqdi+mz10a5dL9bQmvPnzJspb9HKfQG9mi/kFyPd0=;
 b=oNfi3TFFRFzGLF0iMJJtspA0T8SSoBaGniumg6fYQcC5nU/NPFOY7ijCUNhsnADBuZ
 Fb62+FD/VrErLPfrU0/+Kl0v0BId2jvvFcud74GvRkCZ7UoudTCw/HXGPDUjACG03mP/
 2Vny4Rjfszh+P0OhWZoirjEFeyAbSH5nnKUV2oobiO6zZHKNNmoAwSycbeij70tp3Shl
 Ukb29zbWZG3gwK5qRdDDkQbID5kINZT20yVX+jG1TyfOxwEjst1YMpS2wyF13wAzgI3d
 pOvIjTDJ1TzoveGs13cZRNSzzW1rIfrdGmFsLA/FOUoeN+FrezqcgN4mCd6vShG/Zw5s
 o3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Wxzqdi+mz10a5dL9bQmvPnzJspb9HKfQG9mi/kFyPd0=;
 b=Qr/BskwEJJmXoPTgDun5nqTcRF2DvMJmU5yY8B9VqlZM41P/gMKNi+xhDZAynpXYhx
 +HsTNdnLjo8PqB8O4QP7S/W6cbGG660FNBM/2ThtASR3sCEWp14rOCd03CbgMTTjFMXR
 grzg5/aU3DPRF/nzFyyFjWi5CE1YX+U4t9fpQo/cQ0o3hKyUxYNbbfuEMEK9twph2/wc
 RGiGPIN7ZU//+o3YaRQr4Ioz2ZP6fIKfNPLhnDvWqgSQUG9BFsgPxqwz1SLwgwC2NzEd
 XQn41WvpF32CtbVc2M0f9yxQBi1E6Hd0CimcX3OpL/TbGLnThnk9QTZUOsmK5TUeuKW5
 ALkQ==
X-Gm-Message-State: ACgBeo0uwAS5BkHH7Gp6TDaEeRifvrO/JuGFEiWYa44mi2SBhHhrgkRo
 F5/MlgGxMCWXSWdf5YXlU0iDRw==
X-Google-Smtp-Source: AA6agR7qyy1VCrkBiWQyfRudsyHH2xYi5gV80sAcSuper+PrUrh72otBUs0Qy55FscFc/zg9kCzbrA==
X-Received: by 2002:a05:600c:5010:b0:3a6:804:5b08 with SMTP id
 n16-20020a05600c501000b003a608045b08mr5581717wmr.10.1661356281578; 
 Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the timer node
Date: Wed, 24 Aug 2022 16:51:09 +0100
Message-Id: <20220824155113.286730-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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

The compatible property of the Arm timer should contain either
"arm,armv7-timer" or "arm,armv8-timer", not both.

  timer: compatible: 'oneOf' conditional failed, one must be fixed:
  	['arm,armv8-timer', 'arm,armv7-timer'] is too long
  From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca5d213895..5935f32a44 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
 
     armcpu = ARM_CPU(qemu_get_cpu(0));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
-        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
+        const char compat[] = "arm,armv8-timer";
         qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
                          compat, sizeof(compat));
     } else {
-- 
2.37.1


