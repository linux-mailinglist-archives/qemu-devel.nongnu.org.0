Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82AE6EF22D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:38:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcX9-0007tN-Ju; Wed, 26 Apr 2023 06:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWz-0007gX-Fj
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:50 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcWx-0002pZ-OF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:37:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-247296def99so4870343a91.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505466; x=1685097466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4uJN0iy+s7MSPURvkGvWZYRnxu2nNdOIstdrqPSpeQ=;
 b=U5QkINFc5QJJKwXYIsGVQyCujp3+9MO7TvVe9kpKMni0I+Sln0tEhesbPXrYsMQ+uQ
 hwhXLxfaHuE2KBhMUsNteiW4rUsESVQWo2B2WBQS1zT7WsdLjV4nNoyBhQOInCwIrOSJ
 Y0V3DI3LlqAhmTIXQhd4QfZXM/I+jS+gaSN70Rwg3JyEGqc+W3rfHCCWIccKpu2DN8sp
 ls7OOXONzJcwGndIC1iohKFyj0tfP0WlPxanIxzSvCZ03qV2D8Eaj+sTgy685RaYY2D1
 Hze8AQPxLz2ggSx825OuRhRwTEx5aSZfbLpR+0fM5LixybqswsV0hT50BFaokCVSNnxF
 afyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505466; x=1685097466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4uJN0iy+s7MSPURvkGvWZYRnxu2nNdOIstdrqPSpeQ=;
 b=aGCLh16fgAnF8/4GuFT1ACBKw/jE5GGaUqO/A1vHlfp6ngHuTgr8y+MpNAOR5vZzPO
 J11/DiZQuJul8plYox2GQEjO7aUY41VRLpLB25Z4c/uRIytAPKeiUTszuuKwvfT2cny/
 lTOPZCGQYCJnw8k+Q3yqWQt9qav7FItqdkUUUAO7uv0dF7vee3jlsrpRmIiaE+D+iwGM
 j8NcX7n58T9PMpgm0MlWQyw6f+aVOU30l06IoXbs/P6uqpSsOo7BSr75N5WOkciaecNh
 TGYledjB+r67NwOZRtGVY8Owvp5S2+JX3siLnrP7AARztjtjeMAH72dtz8hJfIKGNKC2
 eyeA==
X-Gm-Message-State: AAQBX9fDhTLhpDQc7sViBOGD+110D2dQpsloq1leHnWLxm/m7OfliJSN
 fRF04aHG8o43rUfdFADF9viZ8A==
X-Google-Smtp-Source: AKy350aApsuTgl9wiOD/WIt93YWeSgFqEYRdAqIas1XWbYxG/d99e0X9mqMaH2+kABeMw3McFdIQnA==
X-Received: by 2002:a17:90a:e518:b0:247:2288:851d with SMTP id
 t24-20020a17090ae51800b002472288851dmr19206318pjy.35.1682505466486; 
 Wed, 26 Apr 2023 03:37:46 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:37:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 06/48] igb: Clear IMS bits when committing ICR access
Date: Wed, 26 Apr 2023 19:36:34 +0900
Message-Id: <20230426103716.26279-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The datasheet says contradicting statements regarding ICR accesses so it
is not reliable to determine the behavior of ICR accesses. However,
e1000e does clear IMS bits when reading ICR accesses and Linux also
expects ICR accesses will clear IMS bits according to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igb/igb_main.c?h=v6.2#n8048

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 96a118b6c1..eaca5bd2b6 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -2452,16 +2452,16 @@ igb_set_ims(IGBCore *core, int index, uint32_t val)
 static void igb_commit_icr(IGBCore *core)
 {
     /*
-     * If GPIE.NSICR = 0, then the copy of IAM to IMS will occur only if at
+     * If GPIE.NSICR = 0, then the clear of IMS will occur only if at
      * least one bit is set in the IMS and there is a true interrupt as
      * reflected in ICR.INTA.
      */
     if ((core->mac[GPIE] & E1000_GPIE_NSICR) ||
         (core->mac[IMS] && (core->mac[ICR] & E1000_ICR_INT_ASSERTED))) {
-        igb_set_ims(core, IMS, core->mac[IAM]);
-    } else {
-        igb_update_interrupt_state(core);
+        igb_clear_ims_bits(core, core->mac[IAM]);
     }
+
+    igb_update_interrupt_state(core);
 }
 
 static void igb_set_icr(IGBCore *core, int index, uint32_t val)
-- 
2.40.0


