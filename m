Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C4514CAD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:23:29 +0200 (CEST)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRWq-0005z6-Kh
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRx-0005ke-Uq
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:26 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRw-0004Zh-IO
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id p4so9320705edx.0
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHPW7yfli727FMhApbuFCfFM7ic91z4RB4PVmidJ+ZM=;
 b=ASQENc31kom1dH3Vaz1Yp0IpvhoLEyUYSieYFq2GcVc4g662Vn1EsPPKILMRJbmknF
 esG/d22jwBBvyX3ps1ehv9efP1PK9MfT0+eYHW8bQEIaSgSSeYHRKoIShCFzAeHFKZHL
 ieioknJeYtp4ObTKy/OO+EuCoyZ30zHgR0lcf4NO3E+dxTuc2riZVrSzgxVBAsUJG9qG
 pOc5HW28RVd7R8m6pMmndRYDFhMfg23VkWd0WSiKDTL4szY9+cnRcgcYSydEI9u+mY9/
 07a0UdOJMLmo1MoRpGyPa1gn9wSxPuU7IzX1yknr5r23tLzU8dmfWIc60RNzfUc2EF1E
 WB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nHPW7yfli727FMhApbuFCfFM7ic91z4RB4PVmidJ+ZM=;
 b=Phs2apRfoU2GafLFvMqurKMROXLOMLdP7zrIVu8CXqhvS9EiHCmUE7x8a/V8uVkgOS
 lPswBRbbDFxLKyQqTuB1wnH//PrAJnT/la2pCvmDOlmE9y0W3LPtHR9Lr3aEUf69eeW6
 8XuQXuj6i0LM/wccmvSvVoVk/aN5LMQit41/VVgfE0xwuIw1ezxsUesVY7CGM6RUTbpm
 Y79XJOsYp+8CqKo4N0M7MulhyPLirBQb9uGtj3f/n4YjETlOBsoK4xC7m4ryukrXe/ba
 1kHl6Lxgiuun/7vU7F9wDy6nRZSmeYUjEe7c9DRb2hlsKw0YKVsuwOio54gdyG07+tIw
 NMBw==
X-Gm-Message-State: AOAM532xKWsDiyhhWd6AupEaXlCmUGHh30sgwNif4lirELFrVrWi2iAi
 xgUfLX0yC7tsuWaH2D+p1oOGHP15IWlShw==
X-Google-Smtp-Source: ABdhPJwrpBugsfXoPmkT0Ih2b0kDKTJR8zj3G4d4fnyaXuWbcTKyRBfVMpx6tps9lQ3zViA1cwoGUw==
X-Received: by 2002:a05:6402:3553:b0:426:2b19:a4b0 with SMTP id
 f19-20020a056402355300b004262b19a4b0mr8438453edd.66.1651241903261; 
 Fri, 29 Apr 2022 07:18:23 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/12] pc-bios/optionrom: detect -fno-pie
Date: Fri, 29 Apr 2022 16:18:10 +0200
Message-Id: <20220429141813.328975-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not rely on the detection that was done in the configure script,
since in the future we may want to cross-compile this file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 1 -
 pc-bios/optionrom/Makefile | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 5c34d8ffc2..07ee586ef5 100755
--- a/configure
+++ b/configure
@@ -2396,7 +2396,6 @@ echo "CCAS=$ccas" >> $config_host_mak
 echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
-echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f1ef898073..8de5a9461c 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -22,7 +22,8 @@ override CFLAGS += $(call cc-option, -fcf-protection=none)
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
 override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
-override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
+override CFLAGS += $(call cc-option, -fno-pie)
+override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
 
-- 
2.35.1



