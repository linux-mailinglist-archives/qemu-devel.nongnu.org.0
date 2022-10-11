Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B65FAB23
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:26:06 +0200 (CEST)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5u9-0005sb-0V
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5no-0002Gs-6t
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ni-00030k-OF
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h13so10915577pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2ixa769MahWYdKSZ05XJ7WAaj+VfGkFP7b3KRkRK2I=;
 b=i+B8jp+F0HOVS3raIzD4eIt5hxNTBWG9HO/1CWjnFbQuWw5fajvuH9uiZjUKMsKyhA
 LDWL71MyBXJs7K9EmzqFRRb7yGxUgmKK5yAfn9slXPJXe/C1FFxuFvy2BpvxS7ANbl0I
 W2rydIS9uyr3R+NKL8dALhLGICuJw6imPLH1OR+JnSaRsc6RuXAUrBOC+xdq1QTNNDzs
 xoP/Zzq/3Pu2mP/zXslE/Kf7XI8ojGxoRDc+lqdTx+0Yw9M//ymnC68AuUI83X4ixEla
 /scgo2ur/RTvAJjmPU6GvLIs1cJeE0+HAwDSZWk2lEMGpmzSeP+igi5VUN8i1R0aBUk5
 UdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2ixa769MahWYdKSZ05XJ7WAaj+VfGkFP7b3KRkRK2I=;
 b=lYgNlprZ/4hel7ftW7j5yHHKOTpRb0TuYdYrsPbjCjUA25G6nY1PeqnW0GzAxyWXuB
 gmhr+cxHQKguvMcoQtDI+gIYvJUIkHefhe0nynuwTiIG4jGb+RYGQ8PvGlUiUQImwQpG
 N6L+WHo0JeObgRlJrSWNgeWdMROES5otx4MpankMlJgsG5nugBr+YqV0+Pv0JKxlIxxB
 bGn6OFPhPorQ/doubRNUI6i3r/bdgunaK+mXLIBNZaUjDAV/UUV8lLPWjo1wE8G3+Xbb
 9DWz7FTapicVF/fwK1slP7B3yIm2cObhDcJVMUoTGXVsZdRHqryqPzrap6qTmgdSVV76
 gQ1A==
X-Gm-Message-State: ACrzQf1fLft0XSlwUejSuv2if+NrM8XIEZXDofnYtKC/EvB7S0i2iUOE
 8Mj+pvj3seoCuoUYlD+gC33uJahwaBX4aA==
X-Google-Smtp-Source: AMsMyM7hARSOFpEk+jYagua2UKrpXMRFWJmQdzcD4NYLZOB84pOHsPV08Iqpy78xoWpCd2lbTWX2lw==
X-Received: by 2002:a63:d51:0:b0:438:36d9:7fd8 with SMTP id
 17-20020a630d51000000b0043836d97fd8mr18436428pgn.547.1665458362981; 
 Mon, 10 Oct 2022 20:19:22 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 06/24] target/arm: Restrict tlb flush from vttbr_write to
 vmid change
Date: Mon, 10 Oct 2022 20:18:53 -0700
Message-Id: <20221011031911.2408754-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Compare only the VMID field when considering whether we need to flush.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18c51bb777..c672903f43 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3815,10 +3815,10 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * A change in VMID to the stage2 page table (Stage2) invalidates
      * the stage2 and combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
-    if (raw_read(env, ri) != value) {
+    if (extract64(raw_read(env, ri) ^ value, 48, 16) != 0) {
         tlb_flush_by_mmuidx(cs, alle1_tlbmask(env));
-        raw_write(env, ri, value);
     }
+    raw_write(env, ri, value);
 }
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
-- 
2.34.1


