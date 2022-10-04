Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129705F4617
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:01:49 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjQY-0004Kq-RK
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidS-0002AU-9A
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:02 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:47078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidQ-0004II-LR
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id u21so7596026pfc.13
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=GvH38QsivHGSJsi1S5pIpAQDCJG9W7vPFdfHHljzOZEeRzBxWKV0fwbYt3FZPzzSG1
 Q2xhxQenjVsGZhjVDHpNaiv1xGtIA0JqCJDFy70fthkLLSOtIrk2b/JXLVe910HeU2Us
 zIGTEyHdAPYkTIW0ykDKV6o2ChcJAG9WUAepJ0H1MRD8DhXEjFzeXl3zKec5+4Qu4tzW
 iSDUhyn29oRrIpDv810KESY98zWDstXXF6g2yZLuWRTi9Lk0QQ2FBPVcmgDSJhsdlm31
 SiXjM+K08tPQnRsbJJ8Elp3HPB4/NfpjvuEYjJJh2WVz/+2g8pe2RB07SKs8Qj8YXg/P
 1qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=qWNf2IBOoaRq26gDVGdn/zbkznszoiy+2tKT9Ppl6syMRmxbG4PFvFp6p7OETXwTf0
 D7rvFRF5mIuet1Dd6Qb2awq1SUsTEcAf+6lXA1SAvoGQTyEc8hV0zdDtbEVCN2AEicFq
 pLOXDr/RuzU/vS+7umsiLc75LC3cyAUDjIR0BvbHMPoNIM1b9TeDZi9tf+WFWyPyNE1v
 QMGRUXPXOpfKCB7QrGBYHu5h+JZQQTDng1R0tVRRj/ZoK51FKTZl2meW8TyO45PN9u/f
 GjXvmGUYl+uypee/wDYjkuLzYa+xzRgPZSKJNsFoIwCx6FB70OJZjGjjl+mAkoxbZ3zC
 I29w==
X-Gm-Message-State: ACrzQf0lXZrG0UH72e+YadQuUIJV7gbMMd3iA9XaHvnvWm1mWRLTGTQ0
 FTrZg5oniKXZKHojDLjmCyXs/H6OjWt3IA==
X-Google-Smtp-Source: AMsMyM7aDi8e8Q3+2bH+LErwbvQyRlGZYUIOXKUbzucpyQGPs6oD3V7wyN+O/k6yUX6L21/FV5ED6w==
X-Received: by 2002:a62:6544:0:b0:561:7446:fdf4 with SMTP id
 z65-20020a626544000000b005617446fdf4mr10139530pfb.41.1664892658167; 
 Tue, 04 Oct 2022 07:10:58 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:10:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v7 02/18] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Date: Tue,  4 Oct 2022 07:10:35 -0700
Message-Id: <20221004141051.110653-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220923084803.498337-4-clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..5eaf2e79e6 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.34.1


