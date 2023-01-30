Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A570D681922
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqI-00012F-0c; Mon, 30 Jan 2023 13:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq9-0000zb-0t
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq4-0008NL-GD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id t18so12010366wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6nliOuAuRjTcf2JoYdVKu3rNo2RhYZa+jJOmXF9ZJUU=;
 b=kQwbvB71/z0WSJG9nauI5EZOVUcseABqYN/23Efvh70IYR9DqIU4GhSsPzKSLJOEKp
 9VXaxaqtIqz/5nU21Cc0878kKi13t3QrgVohhEhZUyXU4I7/hl51m16OGZvQNSWec7V4
 nEoMs8eoU/lZXFPeeyGkjsh3K03dBJosNxOs89u3JTiqZIdHl2tvU5nhTC3T/tvzOMvz
 Jv0QmH7HGKKpdC/cOD5QPgE9o1lUmkjqP6hwxPbahYUwOVW2ESjOe9NiVSCYcj6t8shx
 9pREYPmBhYMOEAUaw9Tg7f2KEvgVngHBpcLtLya2lQQ+xktxc+C4YsKwng17D0UJFCIO
 Mvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nliOuAuRjTcf2JoYdVKu3rNo2RhYZa+jJOmXF9ZJUU=;
 b=HpkCZ0R5E6jcI0SWeMuVR/byLahnYrEKGku5ZAhm+hwEnSxm0y+SGktDKoVxMsSPd2
 4LYVZtrMUy/gT1jc0REA+N/IXgt52ByUcZoiXtDBDH0/w3kJR4X4JciHKvrMN/b3rPaJ
 0cjiJQhDOjtgMbrr+ednD0CtZY8/N4yYe6gd28ukNhS6jSO37qHuVZRDVCCwGLo3F44B
 2xhRQOVcoScNmAAeqWgBweHQE/Jl4OkDzEJWNTRl2sS1hu7jCfpV5Hb/YjXtrc9mYSJM
 fNTDlCeZzkWND/51YJfPCjlQ36Tkne8o+0qENqMoKIYrMpYkkyILXARseLg3XMu269cR
 yDjg==
X-Gm-Message-State: AO0yUKWY0NFqRV759qshie3ZiLGnEaHph9BrZi3u0c3qs4diBgXlmJHB
 tHSQRAx59+Heo6VJB9oYE3KLV7MYT6DZVniM
X-Google-Smtp-Source: AK7set+W0A8z4DgvezmvSZAGf9HrJ1y70QwjYouy1sHU5nss5aNz632TeyQGrEghhQ4RLkCiQVp5RA==
X-Received: by 2002:a05:6000:18a9:b0:2bf:b54f:61f0 with SMTP id
 b9-20020a05600018a900b002bfb54f61f0mr30607927wri.57.1675103104578; 
 Mon, 30 Jan 2023 10:25:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
Date: Mon, 30 Jan 2023 18:24:39 +0000
Message-Id: <20230130182459.3309057-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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


