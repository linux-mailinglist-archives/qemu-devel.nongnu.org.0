Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF84435E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:42:09 +0100 (CET)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyjY-0006aO-7z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTU-0005rU-Ei
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:32 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTS-0004Er-DW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:32 -0400
Received: by mail-qk1-x72b.google.com with SMTP id ay20so5219934qkb.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Kz+tFXT6K2UnZ30LjvUt2SSF2VfSMoswo/CAJ5bGD8=;
 b=RoBJMFvyHtgjdSELtMp7ShBpBzmLUd5vs5yshJw8ZlxLKLZebCMehwaYw+qDyoB/m+
 csV/RETGHql3CUxH283f5BlH8FJuJrwzOrHxu1h8n/OGSaePX6YDrRzC52dc1oE/dfc4
 UH/YOMwMmaWqSms/hSTs7Isrb0AcaSWOMIjqFdHPzMagAWrHU8ouLTC+Zd3ndIPZiOzI
 ecc+L0iGjBMQeryUsmsnm5wI8Clg3ztYHpDd6SnML4mPRK3F96lZREmntpopOMg7ZcpF
 EEKFDvUas7wQaPmy9td2Sr25sJ0A1O+7BjqVZV90qKrsWg0NJ4mZnTm4JrX4q0nwqNSN
 1/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Kz+tFXT6K2UnZ30LjvUt2SSF2VfSMoswo/CAJ5bGD8=;
 b=Yt65eUllePMDcxyQJiVvrPjEk+qjIipgXlHQuoI5ha0cPtiRvcIXF9Fhzn8sGhIKZS
 vq50LfQNU0VcJDOiTgZ4gWfCMBpNgi+4G9tONyVVBgcl047beUOkWShvXSNuhv9tbUo7
 T9j2djf4aA7DB5Qkj07+DrX9P3pjhn88QR59UjQjMitZrtapaOmIPHK2kfuH9LnBoRlk
 Z0TCvkVHri/LpFgPss7audwSo4e0cuBfMKWiBerbr7OyCayKYrnbH5QFml8cKFiMD6nq
 N7ZfLPWuNU7iIi8nQzO1I6yG5D3BWl6QdzP6wsJIp8TgJswgkEsOXp/LoiyP9E6tOjYF
 XgnQ==
X-Gm-Message-State: AOAM530Jjw+vHE1jvQ5I1zIQRthUym0Y3kVMgQxeVQkVeX2MWGea8WLP
 Ph9FrSQ7SHr2jlasBbMJ7ZZTcsCo7Mvf5w==
X-Google-Smtp-Source: ABdhPJyj2qyW5Qvm/aG2dWRnhYJohizisYDfuxOoUSHZVd2lWR4kmN+3A6HnOj85X0TEkB9EAxCwCQ==
X-Received: by 2002:a05:620a:2a10:: with SMTP id
 o16mr9043917qkp.88.1635877528333; 
 Tue, 02 Nov 2021 11:25:28 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/12] hvf: arm: Ignore cache operations on MMIO
Date: Tue,  2 Nov 2021 14:25:19 -0400
Message-Id: <20211102182519.320319-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: Mark Kettenis <kettenis@openbsd.org>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 AJ Barris <AwlsomeAlex@github.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Apple's Hypervisor.Framework forwards cache operations as MMIO traps
into user space. For MMIO however, these have no meaning: There is no
cache attached to them.

So let's just treat cache data exits as nops.

This fixes OpenBSD booting as guest.

Reported-by: AJ Barris <AwlsomeAlex@github.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reference: https://github.com/utmapp/UTM/issues/3197
Message-Id: <20211026071241.74889-1-agraf@csgraf.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index bff3e0cde7..0dc96560d3 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1150,12 +1150,19 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint32_t sas = (syndrome >> 22) & 3;
         uint32_t len = 1 << sas;
         uint32_t srt = (syndrome >> 16) & 0x1f;
+        uint32_t cm = (syndrome >> 8) & 0x1;
         uint64_t val = 0;
 
         trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
                              hvf_exit->exception.physical_address, isv,
                              iswrite, s1ptw, len, srt);
 
+        if (cm) {
+            /* We don't cache MMIO regions */
+            advance_pc = true;
+            break;
+        }
+
         assert(isv);
 
         if (iswrite) {
-- 
2.25.1


