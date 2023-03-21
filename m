Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FB6C32BB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:23:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebv0-0000BQ-Py; Tue, 21 Mar 2023 09:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuz-0000AC-39
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebux-0006fQ-0x
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id i9so13656731wrp.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vWEI0dihWwQ7A+H3p/2Im0qszRcvXvLKRn/Ij7lgink=;
 b=WHhXtcJFs4knxW9urnRQhG3ONNDy6VqFe3HMIDAws38VFYuejl8rXJbQBVs5QROPCA
 K7vnw7LzjmRhOst2Bx2BDWw7t5/IAg9hTaaaW4kIJs9BP08CbmQ3jFsmmZls2PDGkdTE
 AZkAYEXJnFkc1eGXi05wcRRit95hzvD9JZaSV9DV8+Qjo9AuyEOEWeotL3p5kCPqai1U
 ECCvTe5gM6/NdkCS+ljfv2h+s4DH1NRnzryZQgC7ATLu6Ek/7BdgwdLLgZhD6TdtDJde
 pFpmyzbz0v5DT9sF6ia0LQJWK5tA4HjxP5k/PcMAsG8u+b3K03PLvWi6AzL/tIF5GrFR
 UkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWEI0dihWwQ7A+H3p/2Im0qszRcvXvLKRn/Ij7lgink=;
 b=7qgXjovvunXc7J5Ro5YPcJv2NZyFfEUj3rocvXORPWOpjdAMJW7hQ9gR7Akj9KbjdV
 zkb0FyhP3bWKkaCHxLMK2Zl6bXWf7Yo1I6EvrQ1p4OxAi8iLiw5n7VtW3CW9l/K/v/p+
 5pJbP1LCtm1SCvp1jPj2f3rFHU/BFp5uQ8GwH6jqB4WtQSb0mpg7xKDYYOAdi5vqn+ch
 VIy90MbEDceWQgAb31z0DUk9XRX7ViJQYBWu7rhobu7ADF0QipO/5NkZzcpDaSH5KMld
 LTO3Y/a1AAjDkT0EKBxu8PjDaesMODR5DRLdK+HAZclQJIhm3bpt+0f5bKJlM03rW30+
 uNRw==
X-Gm-Message-State: AO0yUKXi9vbYu5/u6D+ra8z1KwC65an++0o6lSHTLoC1AMyJd5+pR8Q7
 1l3ubhpjpzthuxQcUfyioskIq6lP7J6UKpmWPD4=
X-Google-Smtp-Source: AK7set/arMjHAc2uhJ5UvuNGTPHKKKxmcpNMbUL1MvMaaQDVMNfylmuRLVcUB4zKlUZReurPbJ8N/g==
X-Received: by 2002:adf:e842:0:b0:2ce:ac31:54fb with SMTP id
 d2-20020adfe842000000b002ceac3154fbmr2263571wrn.33.1679404845208; 
 Tue, 21 Mar 2023 06:20:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] docs/system/arm/cpu-features.rst: Fix formatting
Date: Tue, 21 Mar 2023 13:20:35 +0000
Message-Id: <20230321132036.1836617-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321132036.1836617-1-peter.maydell@linaro.org>
References: <20230321132036.1836617-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The markup for the Arm CPU feature documentation is incorrect,
and results in the HTML not rendering correctly -- the first
line of each description is rendered in boldface as if it
were part of the option name.

Reformat to match the styling used in cpu-models-x86.rst.inc.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230316105808.1414003-1-peter.maydell@linaro.org
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 00c444042ff..f4524b6d3e7 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -177,39 +177,32 @@ are named with the prefix "kvm-".  KVM VCPU features may be probed,
 enabled, and disabled in the same way as other CPU features.  Below is
 the list of KVM VCPU features and their descriptions.
 
-  kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
-                           means that by default the virtual time
-                           adjustment is enabled (vtime is not *not*
-                           adjusted).
+``kvm-no-adjvtime``
+  By default kvm-no-adjvtime is disabled.  This means that by default
+  the virtual time adjustment is enabled (vtime is not *not* adjusted).
 
-                           When virtual time adjustment is enabled each
-                           time the VM transitions back to running state
-                           the VCPU's virtual counter is updated to ensure
-                           stopped time is not counted.  This avoids time
-                           jumps surprising guest OSes and applications,
-                           as long as they use the virtual counter for
-                           timekeeping.  However it has the side effect of
-                           the virtual and physical counters diverging.
-                           All timekeeping based on the virtual counter
-                           will appear to lag behind any timekeeping that
-                           does not subtract VM stopped time.  The guest
-                           may resynchronize its virtual counter with
-                           other time sources as needed.
+  When virtual time adjustment is enabled each time the VM transitions
+  back to running state the VCPU's virtual counter is updated to
+  ensure stopped time is not counted.  This avoids time jumps
+  surprising guest OSes and applications, as long as they use the
+  virtual counter for timekeeping.  However it has the side effect of
+  the virtual and physical counters diverging.  All timekeeping based
+  on the virtual counter will appear to lag behind any timekeeping
+  that does not subtract VM stopped time.  The guest may resynchronize
+  its virtual counter with other time sources as needed.
 
-                           Enable kvm-no-adjvtime to disable virtual time
-                           adjustment, also restoring the legacy (pre-5.0)
-                           behavior.
+  Enable kvm-no-adjvtime to disable virtual time adjustment, also
+  restoring the legacy (pre-5.0) behavior.
 
-  kvm-steal-time           Since v5.2, kvm-steal-time is enabled by
-                           default when KVM is enabled, the feature is
-                           supported, and the guest is 64-bit.
+``kvm-steal-time``
+  Since v5.2, kvm-steal-time is enabled by default when KVM is
+  enabled, the feature is supported, and the guest is 64-bit.
 
-                           When kvm-steal-time is enabled a 64-bit guest
-                           can account for time its CPUs were not running
-                           due to the host not scheduling the corresponding
-                           VCPU threads.  The accounting statistics may
-                           influence the guest scheduler behavior and/or be
-                           exposed to the guest userspace.
+  When kvm-steal-time is enabled a 64-bit guest can account for time
+  its CPUs were not running due to the host not scheduling the
+  corresponding VCPU threads.  The accounting statistics may influence
+  the guest scheduler behavior and/or be exposed to the guest
+  userspace.
 
 TCG VCPU Features
 =================
@@ -217,16 +210,15 @@ TCG VCPU Features
 TCG VCPU features are CPU features that are specific to TCG.
 Below is the list of TCG VCPU features and their descriptions.
 
-  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
-                           *impdef* (Implementation Defined) algorithm
-                           is enabled or the *architected* QARMA algorithm
-                           is enabled.  By default the impdef algorithm
-                           is disabled, and QARMA is enabled.
+``pauth-impdef``
+  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
+  Defined) algorithm is enabled or the *architected* QARMA algorithm
+  is enabled.  By default the impdef algorithm is disabled, and QARMA
+  is enabled.
 
-                           The architected QARMA algorithm has good
-                           cryptographic properties, but can be quite slow
-                           to emulate.  The impdef algorithm used by QEMU
-                           is non-cryptographic but significantly faster.
+  The architected QARMA algorithm has good cryptographic properties,
+  but can be quite slow to emulate.  The impdef algorithm used by QEMU
+  is non-cryptographic but significantly faster.
 
 SVE CPU Properties
 ==================
-- 
2.34.1


