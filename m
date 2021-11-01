Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE41442005
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:27:09 +0100 (CET)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhc1V-0000hL-3G
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9S-0000Il-2g
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:18 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9D-0001E1-BO
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:17 -0400
Received: by mail-qt1-x830.google.com with SMTP id t40so16520366qtc.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=k8pcFj7PwobkSZbG+qXXMBqC7duxK5atVPtouxFkztt/FdWPV/xebSJpQEd1jVmGhv
 cvuq518G+IaM39I7N5QeWQWYp21LZVW833bvctT1o+U2VVIv6IHF+0LqHxpibsLcJShF
 VGI694V2V1WYcFP/3QzYCDFozbYlVzsJWieLxsiU4JcyrwBf0zOHeOunLP3rTvT50MK/
 hLRi/NepPFCHYHfQZmAXqrbFEsqpcwwBNGpxPOMcdWnlMGo+HnhgVfNeq3rrIRbP6WVt
 jXfQ7ZeC6H1GOA93XrJZR1KJhQjiRQlIX05d1AV7q/ULWCimUoq7WCqUeg45OxxOqnW3
 0rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=atdiUdHab0jMUqpxE6IL+PL591L6X1q39b89ZcWcduPY3VdNDjRZ4eaU4IqU7RcFlq
 +k+hEK+7Vmip13D+iL8pzbRDwjt7rOZl/lMRqp9flMqCclL7t9tXS+SZMOjhY68nCgJR
 Dnc3lXBipe8W9liEbp3I1UtaZh7Bpbol/yMRtxdFmvlcfIEjLgY0boLqbz7j6s+mzsQQ
 9ZLEQXyqBLY0XPEEGaEFcW2QwTdpBN39tlJp7YcsrUy9tW+3qBYrTEkGoS8vZb0ihSiZ
 l0JcS67GOaN4oHLWLo0uf4lXWfwVLZ2pzUOArOFh/YJFEtrokZa7yNHQD/k1USEDYGFl
 LECQ==
X-Gm-Message-State: AOAM533iXfHW1FFSkrq0N+NYKGr0y7s4Wl9fq64FwHe5vAsjbyit8rpD
 8YhjogG8IgD72Vp/zwtNsEEY9U9+XwvcRQ==
X-Google-Smtp-Source: ABdhPJyg92OuxlSwRaakzoymmyf5Z+4c5J3EU2+8E7VeZJVxYTtyNb6/7YkdNXUsdD2cOBGwLm3wfQ==
X-Received: by 2002:ac8:578d:: with SMTP id v13mr31662103qta.61.1635787862255; 
 Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 53/60] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Mon,  1 Nov 2021 13:27:22 -0400
Message-Id: <20211101172729.23149-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c996dce7df..752669825f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


