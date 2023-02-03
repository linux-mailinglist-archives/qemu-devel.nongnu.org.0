Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B532E689BB9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:32:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4h-0006sv-I1; Fri, 03 Feb 2023 09:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006hl-Kr
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4S-00055y-L0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id bg26so4031531wmb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sdt11QbukYZJY11YGNYm/awc0QmfZC+VMlPzEhlWldI=;
 b=xXRco1L51IAQ54FA3XZBtXgDImQcDfT1e4IDAXCOzisC51ffYnt1Bno8fRfgxadu8E
 ZLHqHkHoWjT44tqAbmJymTQv7rqys89+I4W7uEhe4xJ8OyQqrWqY5JNULpMsr7RJR7Yb
 duqYjU3rfQFxGBUpEyFuyzpOTef6fh53gml2ERns3OVAimpxfamC2PeiNRbfLRAd+9Jr
 bO/up1oIbt+DeQLz5a0lMyh+U1KCRV6Y4Swu7jpBfNLFHKgQuD7recCxi1mQAiIIo+Q+
 9FOMq55aUXaJP/TgaHEyose9/OlK1L643V5hkklKtIrKUk/IJ6GrqZySqTmuqhFtHqMy
 n1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sdt11QbukYZJY11YGNYm/awc0QmfZC+VMlPzEhlWldI=;
 b=y0fN/bTrDyS4OQzV4+V+T8SlpNFkbkXbe2vs32nc11y4jpBo/QjvkKccYTfQZFlLdP
 5+dLj3or/m+PL6A7CXq/bfMtBh7Ug05ZP1tIUoHReP4UwtIYUzkuGSeTmpt7VnFr1R+y
 FAYDzI6OK4TUWuV7RC9RY65p4mc+IDWho2FmyCDvUpPndzehRF73V8cb1Daq17Y2OqGa
 1/hLTOEPPTgBrhTBEaGH0TM94uGtcrLhINZwnwQYAmktzeAjvaxxdf8c12xaMl9LwHTT
 MGPZ2BEhoHv862Fhb1AA7LzbuTWUtjtPDuV32wrQrPRbEZ+oW582A6ikADaZiZlOjWfb
 J57g==
X-Gm-Message-State: AO0yUKW1FVbOmFsu31JbOMUu7MsIUOfPOd2noZRfqG1CHYSgvjnH5nIv
 B8scen+iZYT7BOlyVQSia4wYUnTdWl0j/uLH
X-Google-Smtp-Source: AK7set/TQSrvVHzod2kxyhY0GaJunIu0jPOeglJrhfFTXQWgLBwnf30uSJrKXMcVGjgB2crAy2ps6A==
X-Received: by 2002:a05:600c:1e24:b0:3da:f665:5b66 with SMTP id
 ay36-20020a05600c1e2400b003daf6655b66mr12426685wmb.6.1675434580123; 
 Fri, 03 Feb 2023 06:29:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2,
 EL3}
Date: Fri,  3 Feb 2023 14:29:07 +0000
Message-Id: <20230203142927.834793-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

We added the CPAccessResult values CP_ACCESS_TRAP_UNCATEGORIZED_EL2
and CP_ACCESS_TRAP_UNCATEGORIZED_EL3 purely in order to use them in
the ats_access() function, but doing so was incorrect (a bug fixed in
a previous commit).  There aren't any cases where we want an access
function to be able to request a trap to EL2 or EL3 with a zero
syndrome value, so remove these enum values.

As well as cleaning up dead code, the motivation here is that
we'd like to implement fine-grained-trap handling in
helper_access_check_cp_reg(). Although the fine-grained traps
to EL2 are always lower priority than trap-to-same-EL and
higher priority than trap-to-EL3, they are in the middle of
various other kinds of trap-to-EL2. Knowing that a trap-to-EL2
must always for us have the same syndrome (ie that an access
function will return CP_ACCESS_TRAP_EL2 and there is no other
kind of trap-to-EL2 enum value) means we don't have to try
to choose which of the two syndrome values to report if the
access would trap to EL2 both for the fine-grained-trap and
because the access function requires it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-4-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-4-peter.maydell@linaro.org
---
 target/arm/cpregs.h    | 4 ++--
 target/arm/op_helper.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c6..9744179df01 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -224,10 +224,10 @@ typedef enum CPAccessResult {
      * Access fails and results in an exception syndrome 0x0 ("uncategorized").
      * Note that this is not a catch-all case -- the set of cases which may
      * result in this failure is specifically defined by the architecture.
+     * This trap is always to the usual target EL, never directly to a
+     * specified target EL.
      */
     CP_ACCESS_TRAP_UNCATEGORIZED = (2 << 2),
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 = CP_ACCESS_TRAP_UNCATEGORIZED | 2,
-    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 = CP_ACCESS_TRAP_UNCATEGORIZED | 3,
 } CPAccessResult;
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 31f89db8997..def5d3515e2 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -673,6 +673,8 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
     case CP_ACCESS_TRAP:
         break;
     case CP_ACCESS_TRAP_UNCATEGORIZED:
+        /* Only CP_ACCESS_TRAP traps are direct to a specified EL */
+        assert((res & CP_ACCESS_EL_MASK) == 0);
         if (cpu_isar_feature(aa64_ids, cpu) && isread &&
             arm_cpreg_in_idspace(ri)) {
             /*
-- 
2.34.1


