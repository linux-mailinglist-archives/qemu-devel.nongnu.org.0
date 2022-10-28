Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8EE6115B3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:17:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooR5K-0000aN-Fi; Fri, 28 Oct 2022 11:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1ooQtY-0000x5-Gg
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:03:49 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lyan@digitalocean.com>)
 id 1ooQtX-00064b-0n
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:03:40 -0400
Received: by mail-io1-xd2c.google.com with SMTP id d123so23025iof.7
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitalocean.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQaU/3JKiw+NoZHOSedRPDD9BwoZPsc+/PL8EuuZ3Fk=;
 b=MunfcooxnNkkEzpzV5c8fT7ZA2WzxeRlzO2eA2Qp9ZFZyjrNHAboPXxwSR/iujWv7l
 co63yT06dzOugG870z66II7fvHyKqRfkAtc5H/LqpN8m6buTzk2X6jvfWJ78yAXTY/rh
 sWwG9Y4HvQsycpCamZI9fkCfy+tF9F6mS3jKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pQaU/3JKiw+NoZHOSedRPDD9BwoZPsc+/PL8EuuZ3Fk=;
 b=pigk/rZg2pbkTTtHm2FYRZTAXf5dOqhUFKIqqmFgU11nir6k45uyOcDcRv0yevtJ2d
 ZV0kjhhYt/UaDl2QCW1q8kRWCqo4N8kX7ay39+U4jkxjnv4qmHET5pRNNqSQTtzJoI2a
 acnMHAIWbyzHiw4eRMfTtmlxKfAdviXp9W/DxO4rrgx5UzncwbFKtlEExxYN1ZkwiwGH
 EawwpH4HIDkjWN3BsGoZkv6XfFvw+COhWBjZU43O3Msp/bni82qTVSZka1Y++EoxA1Y/
 4V0e+T61HXry0ZjtMdF2QHpxjciIvHh+UZN2Cvh8epvHfdQgjPD5eeJ9MdkGdca2JgIz
 w73Q==
X-Gm-Message-State: ACrzQf3lrT9lgYWk+tawHsO6+6I97PDe3N+4JkSdgbDOX305IM6sNwHo
 fVfgSWd2rTX/E4klXRtwSMqTBfJ7IIFkFWVQ
X-Google-Smtp-Source: AMsMyM5PkueBJAWUlMvTvlZyyMDZHyl5Rfg6Sjg0qlDDS0CL3fFSC0ozBGQ4zEHJ/DwMDZ5CO6aDdg==
X-Received: by 2002:ac8:5890:0:b0:39c:d67d:1f63 with SMTP id
 t16-20020ac85890000000b0039cd67d1f63mr45584755qta.450.1666969404971; 
 Fri, 28 Oct 2022 08:03:24 -0700 (PDT)
Received: from xryan.internal.digitalocean.com
 (107-142-220-210.lightspeed.wlfrct.sbcglobal.net. [107.142.220.210])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a05620a450100b006ee7e223bb8sm3142792qkp.39.2022.10.28.08.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:03:24 -0700 (PDT)
From: Liang Yan <lyan@digitalocean.com>
X-Google-Original-From: Liang Yan <lyan@digtalocean.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yang Zhong <yang.zhong@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jing Liu <jing2.liu@intel.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] target/i386/cpu: disable PERFCORE for AMD when cpu.pmu is off
Date: Fri, 28 Oct 2022 11:02:43 -0400
Message-Id: <20221028150243.34514-1-lyan@digtalocean.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=lyan@digitalocean.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Oct 2022 11:15:43 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With cpu.pmu=off, perfctr_core could still be seen in an AMD guest cpuid.
By further digging, I found cpu.perfctr_core did the trick. However,
considering the 'enable_pmu' in KVM could work on both Intel and AMD,
we may add AMD PMU control under 'enabe_pmu' in QEMU too.

This change will overide the property 'perfctr_ctr' and change the AMD PMU
to off by default.

Signed-off-by: Liang Yan <lyan@digtalocean.com>
---
 target/i386/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..edf5413c90 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5706,6 +5706,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 *ecx |= 1 << 1;    /* CmpLegacy bit */
             }
         }
+
+        if (!cpu->enable_pmu) {
+            *ecx &= ~CPUID_EXT3_PERFCORE;
+        }
         break;
     case 0x80000002:
     case 0x80000003:
-- 
2.34.1


