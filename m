Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B805E1DD419
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:17:07 +0200 (CEST)
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbooc-0003z8-LU
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJD-0004Qu-4l
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:39 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:41135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJC-0006iw-3C
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:38 -0400
Received: by mail-qk1-x744.google.com with SMTP id n11so2380952qkn.8
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ikNoVs9W43MQHNtBQQlhNjgAh1VrOkQ69KYUdVCDpg=;
 b=hNvaKt/cGY4AMEGn8KNxL/Mha+loy3VFykuKGtc3go4qnetkx+mUcaxqYPVsTxmF2Z
 0JKVAhnSiWWq2dNkLROUxLIvUAJnvj/oIJUDq+2ODlflOFYYxbp6HAzKFOxc54BLWUA3
 HU0vZS1l3Y1WgRqaRBsFrWlYr30EStf3xFz1xiNraaH3qhM5VEZaWvnXmFVakAh8exui
 Z0XMzlv+DCcOW4A9+lyDMHpuedZC3y5BPnk4SNU12w52WuquAfE7LP/0I8plkCqzOTI8
 kEezx+SKu2yu1VjUFvSw4CMwMB3AOSSTNureLFGjWizLmPAPoYO9LTylePy2Jt9NNR93
 zsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ikNoVs9W43MQHNtBQQlhNjgAh1VrOkQ69KYUdVCDpg=;
 b=bQwbdE8vNJJUCZg2NqGCcv1zRqPOoE7y8roagNiXF0+tY/b+sjdCNBXv93Gin7VmQo
 ubAiBzszD3EGpp73R8+L6lhQRf7SZz56Pv5FHdc1b71riW8ZsR2MvG1wbtwZQ8z/eR5y
 AGbjpCkX7/SIXv0y0mr71da0hTUpdL/LOoNJQfMGR+L8eY2QSpWxbob7M0wD1K0j4Eo1
 oiKA8aUDTZyKu2TqSt8RuPXrDxQk8e4QfyvcuiYczmiLp2vpSyt36FXgEzycEAfHlbxs
 q2YfG7OjcvgrtKGKebyStshnIZyUMCUbMKYfnO/uFmNE/YJANA43gYK4PBnrtTy+irbB
 qtDA==
X-Gm-Message-State: AOAM532mmkwhnDD5MQSHNe2S4XXsMCsN97+zkNpR4qbvCW+OsqaVJLXV
 yDUNsVCXKF51FB/VdS+08jpyRXERWVw//g==
X-Google-Smtp-Source: ABdhPJyNV9i1GfxxH6cjnTXP8fhw3zeC9wecTSvuRzS+TaCtETcm7Cltxr62+oFXLHNfnnS/5n09Ag==
X-Received: by 2002:a37:9e8a:: with SMTP id h132mr10497691qke.48.1590079476494; 
 Thu, 21 May 2020 09:44:36 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:35 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 61/74] cpu: convert to interrupt_request
Date: Thu, 21 May 2020 12:39:58 -0400
Message-Id: <20200521164011.638-62-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x744.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This finishes the conversion to interrupt_request.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 hw/core/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index be9efbeaf4..ee20f8e0ad 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -271,7 +271,7 @@ static void cpu_common_reset(DeviceState *dev)
         log_cpu_state(cpu, cc->reset_dump_flags);
     }
 
-    cpu->interrupt_request = 0;
+    cpu_interrupt_request_set(cpu, 0);
     cpu_halted_set(cpu, 0);
     cpu->mem_io_pc = 0;
     cpu->icount_extra = 0;
@@ -411,7 +411,7 @@ static vaddr cpu_adjust_watchpoint_address(CPUState *cpu, vaddr addr, int len)
 
 static void generic_handle_interrupt(CPUState *cpu, int mask)
 {
-    cpu->interrupt_request |= mask;
+    cpu_interrupt_request_or(cpu, mask);
 
     if (!qemu_cpu_is_self(cpu)) {
         qemu_cpu_kick(cpu);
-- 
2.17.1


