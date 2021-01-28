Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C73081B4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:09:57 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GQG-0000y8-PB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzn-00067p-Mu
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:35 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzc-0008Eu-9W
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:35 -0500
Received: by mail-pg1-x52f.google.com with SMTP id c132so5287733pga.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1HR7ri25V0SiyAVmlpxEOPAwd8z1s6dfRj86QGjtrs=;
 b=Rn78l5i/mDHGv+CnxSdJk8JezkCDFkg5sMXfhABcygQ14Tz899ENlvpQByYmRtDi+s
 OeVHdX+d8rqrvLDrj7N1GWEZ0XUXO7YmCnFsoYTF6PTVcYbqW7txGCNlvhk3ND6av5Sv
 mXF/w/2Zbq0796fxlaXPYS7+bzjyqrfl4528rZuwRIECV1IkfGDLfpW72pqkC167l6Hp
 bbCHg+b6golFUkCM8zogzJ8oXIUASv9nDitKgXOBAx93nm+jANMscBczgdJXwfNAijra
 nRI8eLa0eFkN+TyiLChFCt/sAgit25dN7Tk10CYcWtSKyq8xHLbvedJEQiT3KrIMsSaO
 m+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1HR7ri25V0SiyAVmlpxEOPAwd8z1s6dfRj86QGjtrs=;
 b=hxa1dniyMTKy5TkhLXzmHnjCpWWKotBvwKCgs4c/2lP8oET6kZKE206eOIoOkrC8Zh
 J/FwS/xyKM6NVoCec5nS3Jv9iI5SDspBVwMHaCZlDw7Aj8y/oxaTGqBf8v88fj1MxbzG
 o6XtI16gy6FytS/0kUl7KavVt6FWXs4T7/Up0iMTiu1dx+0080H4BPhvDz5NFfGjOvTz
 e0KUAQPapMTCbZEbrj6iUnvGGqCDZxRO3pd26UoJrrNCPxbAdTgVbRQsgAQnwBbnetbS
 LP5NqkvUjWxr3+lJS/Rn+9oQm1d71JCSxGadEcKJi1dDixe7NL4+gvClRQdPoXqKmFQd
 Hkxw==
X-Gm-Message-State: AOAM530fJd/wxQs6PDsYmkcs/JrTag9EKF0Q3Jyt/S0Wihi8jQnn2PRI
 Iy8NOvn7yNJZSUFRNfkoz3HnGxQCjHJUJxal
X-Google-Smtp-Source: ABdhPJx14wqhLg8pZBq/f86TFSQveYEFtblIKxLEMQCgt6pABwZqCNqK1T8fQRRzvtGy5Fu5nKi07w==
X-Received: by 2002:a63:d917:: with SMTP id r23mr1621705pgg.126.1611873740877; 
 Thu, 28 Jan 2021 14:42:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/23] target/arm: Enable MTE for user-only
Date: Thu, 28 Jan 2021 12:41:40 -1000
Message-Id: <20210128224141.638790-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db81a12418..43933550c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,6 +204,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1


