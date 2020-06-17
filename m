Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0A1FD741
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 23:30:37 +0200 (CEST)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlfdk-0004mR-QC
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 17:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfEk-0004QX-SP
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:04:46 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:42312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfEf-0000N2-8V
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:04:46 -0400
Received: by mail-qv1-xf42.google.com with SMTP id p15so1751102qvr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 14:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gel5qcjCCdr1MutUEbekB9AJ+USfjviG0mT0qyFu6k=;
 b=t24d0x6BQM7S8qLKgPPOpQYxItr1MVKjih5JCkiDdhZ7wDMdfAIpFm6Dt7ExJsSdZB
 VhCe+A6aQDsKrg5Ze6A6fP0OxwuxxhtPvTJYafSmT1dZR+Sr37sgalHf3Soao3apwpXg
 F6lLWIROdhfdQjE1OWBra31oKhq+Oqt4LQK7X5Wv6o14oe37CuiI9G0k/WgeYmzCsSOs
 Vmx3/fhEs1be5bcenmdY1/1eSREBk1mORtbukOJ05e9lh1/A2C0/WS9ZCxq5jng/mI0s
 HMJRz/I7CIl9lhZPA2FWcadarjQ9vkC4KYNDFydydjURY87oNPxVzyF9JfmcycG2WJpy
 cL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gel5qcjCCdr1MutUEbekB9AJ+USfjviG0mT0qyFu6k=;
 b=gzd4sf/H+yC7k9iZ2OLBMIQoQyoAaF8gCbmLRsJIW7YI2nv1IQU6/ggsYZ+0wGTAsP
 j4vjsFLb4yXgD6boCcgMDI3Z3H1NrZGgpb00h4EHuugzFZ0N1KFMNi+MZ52GcJlvbZqQ
 IZ8wH8wzM80ISGoEN1tgha1ZdXT8iNvjg2tr6TuYdPYFqBgsJvVG+kxkQNM6zeQl8ES4
 KlTS6OxRQix5/hKUohiVEvP2slMQztlbuljeZJLSOd4BMn2R/hBPCLdjVrYT33X5nyyE
 1+QbGsDjTC6abPD6AJnzB6hnsT8375djYiSbDm7FcqR9XkPHAthLcpfwsImrQpyXZxIq
 UmXg==
X-Gm-Message-State: AOAM533hx3POsuHAHCdh+hnIFV677uB2QYRjiQX3ZqAT2E+nRt6iKAlT
 XRnzH86Z4exuKQXGbrpy1pYKlQqpOnS7hQ==
X-Google-Smtp-Source: ABdhPJyg9mnaprijMjYRGZe5I4jl8clpdTB2Ur8jXW9CwriqZ+7eMVzzHW548HPNHo8B6v9E6bXfLg==
X-Received: by 2002:a0c:f949:: with SMTP id i9mr556056qvo.75.1592427879628;
 Wed, 17 Jun 2020 14:04:39 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
 by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:04:39 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 58/73] microblaze: convert to cpu_interrupt_request
Date: Wed, 17 Jun 2020 17:02:16 -0400
Message-Id: <20200617210231.4393-59-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/microblaze/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 51e5c85b10..ce70f7d281 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -84,7 +84,7 @@ static void mb_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool mb_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cpu_interrupt_request(cs) & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.17.1


