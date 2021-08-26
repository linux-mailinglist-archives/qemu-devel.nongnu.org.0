Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D993F8CC2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:12:40 +0200 (CEST)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIva-00065a-AL
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImg-00059G-I2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-0008JS-9z
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x12so6125391wrr.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ekDeRLUXDV67GkBcdjvaNeAu7C7psK02VAbALc84YcU=;
 b=V4jrOwQx2o8x7VG5Xio9v5W7bRUznMg0Yq9tcjDKx28KA1zPX9acwtTYrvKpn+Wdhf
 XQaRvBQ0NOEn8vkyEuAgLnU2SigNnNSphoVAv2J4DgPYztDG+nfcQTWu72N89NJbwIsr
 mqWetdjjSZ5ioa/SNbt7MUf4Edkjrhd7DJ/KLrtBiCtw+eQ1Ojyn7KRHO2IgqPboblVO
 4DZsH3O8Nd5cWsdrj8FnIws2QfK+Oej96LfZqz2HZeDTb0mKIR+j95vm4HU9EtAnE2tp
 C0aTiY06COYxjYZF3CEXc2mtNeVwVJgtmUjqaQcXh9p11p8rK2PaR2p1dWhXwcgj4yca
 pBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ekDeRLUXDV67GkBcdjvaNeAu7C7psK02VAbALc84YcU=;
 b=F/AnbR1OjNOxTw9ju8B3gUbZ/J93dpd+BWA7+w07wc/vQqqF/K/ksy1hD3jgljIPmB
 Rcr8j5Q2mWBXmkE5uQs5IPy7Cpj+XCCZdSrSD+BRxlc5M7TLlpTufMuNLT5y9Eg4crhn
 53xPrxkosaRGIKIaecLCx/yF0qp2YtWWq8dbtsS+jLp1WWbdDX4y8eMGuYdGVevYNyvg
 B4UF0Bvmib02u7ZeRilrGATCU9FFd7QFgMwuc0L805DVRWV43uJ+5xZ9QnQrCYjuOznN
 C5cLHbbjB8yMQbiMM+t8g6b2j3HXcNzaiwVaFL9NGohZHXCG60hqRuxT7dtOUOFgPhdO
 bwbw==
X-Gm-Message-State: AOAM532UkCblhHAloE6A0WV9yK/tdVW6uCd3vFd+m5boQS2N4B4BdISU
 fwiBjRWD3QqJfKVey5sJKdhpKptkhT1/Lg==
X-Google-Smtp-Source: ABdhPJxz6bzVUETeKrjx/i3ghFieu6CcVfr8zG9JhOzarjCy/qQ09KZF8BxDfEAoTL042LKKRRnttQ==
X-Received: by 2002:adf:e702:: with SMTP id c2mr5124842wrm.397.1629997396480; 
 Thu, 26 Aug 2021 10:03:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/37] target/arm/cpu: Introduce sve_vq_supported bitmap
Date: Thu, 26 Aug 2021 18:02:36 +0100
Message-Id: <20210826170307.27733-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Allow CPUs that support SVE to specify which SVE vector lengths they
support by setting them in this bitmap. Currently only the 'max' and
'host' CPU types supports SVE and 'host' requires KVM which obtains
its supported bitmap from the host. So, we only need to initialize the
bitmap for 'max' with TCG. And, since 'max' should support all SVE
vector lengths we simply fill the bitmap. Future CPU types may have
less trivial maps though.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823160647.34028-2-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h   | 4 ++++
 target/arm/cpu64.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5cf8996ae3c..1060825c746 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1020,9 +1020,13 @@ struct ARMCPU {
      * While processing properties during initialization, corresponding
      * sve_vq_init bits are set for bits in sve_vq_map that have been
      * set by properties.
+     *
+     * Bits set in sve_vq_supported represent valid vector lengths for
+     * the CPU type.
      */
     DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
     DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
+    DECLARE_BITMAP(sve_vq_supported, ARM_MAX_VQ);
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c690318a9b6..eb9318c83b7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -840,6 +840,8 @@ static void aarch64_max_initfn(Object *obj)
         /* Default to PAUTH on, with the architected algorithm. */
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+
+        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
     }
 
     aarch64_add_sve_properties(obj);
-- 
2.20.1


