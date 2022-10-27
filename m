Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1560F467
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:04:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjc-0007mq-OZ; Thu, 27 Oct 2022 06:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjK-00074D-Kq
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:22 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjI-0004Fk-Gw
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:17 -0400
Received: by mail-pf1-x42d.google.com with SMTP id e4so1008024pfl.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27tU7q4skqyWhNaj53PDReLhseNs0R74OdN+/vV4qx0=;
 b=afTJeOoXkkYIDOk3H7ZGJ4lUWq+jJsPbsXfvwL7lcFznokxqDDe5f+kb0vW0606uog
 qvAjy1sPR1cchr2Uuz5njE5uo+fNmTuvhnApbG268B2Xh++pCMgUq6EQkUL6m18jGoJi
 AR2eA+2h74BqNOEk/rjHetd/KaqJks8XNPzpuq7msvTfksi7W7GM1QdO4q+MyIDrEE6/
 7hE0+936iSnC15K1AEwhGsMR0hrDY2aRqrkHdgaPjkwiySaHsC0U1D/THlfLMX6GRtTJ
 1IPdLV+8UI5iIuICgwFmiIvFOr80Wzh4QAWp21ZXCKDM+P4VTs4L2tDyIsRo53rJ91eL
 C+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27tU7q4skqyWhNaj53PDReLhseNs0R74OdN+/vV4qx0=;
 b=SF1lXl5M7gxT1/LxFs2gVGjM6cXNB94CmtBNoKskCYINVnOfbcrk1nwdHG8B2IlSTM
 Ac78wvSyZJND5detPjd4Mb3X19X/ELzo147XOAWbKhMyzeqBQe0ifm2Oc4gNQO79E5Kn
 xhdQkhUuuA6QV30uxDX5JbAK3a2VQqVjHjkVvV8SQOTtN175VuTfHSC4zIieZMxVkois
 CLprw58C5EwsL+iUrEWq963pF6Idinxx8eggrwA/P3NSfL218K9dmj9w1bYu71MIHRoA
 UIlyygS5kxF9dVQUvCQ9hQLpk1jgEHBhlEXN+RelfBzAfPfVnXeGDjU6PfFa6pxAWOHa
 6iUQ==
X-Gm-Message-State: ACrzQf3tW2MN5w/4/6D+qa+fNO2RtLKxiYImJRl3KDODWymmUK28cEZr
 bibMus/uTbfK9VfyKoDO0W5rRGsC9jRTbG5E
X-Google-Smtp-Source: AMsMyM778PONPyoUHLPp7pfRGBR2hZPAmU2OPdtnz3Jq+IXDYCeDsd2NFGDuz+fttcy5PjhXFpphyw==
X-Received: by 2002:a65:6041:0:b0:449:8b9c:8d29 with SMTP id
 a1-20020a656041000000b004498b9c8d29mr40411698pgp.335.1666864994205; 
 Thu, 27 Oct 2022 03:03:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 3/6] target/openrisc: Always exit after mtspr npc
Date: Thu, 27 Oct 2022 21:02:51 +1100
Message-Id: <20221027100254.215253-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have called cpu_restore_state asserting will_exit.
Do not go back on that promise.  This affects icount.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/sys_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 09b3c97d7c..a3508e421d 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -51,8 +51,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         if (env->pc != rb) {
             env->pc = rb;
             env->dflag = 0;
-            cpu_loop_exit(cs);
         }
+        cpu_loop_exit(cs);
         break;
 
     case TO_SPR(0, 17): /* SR */
-- 
2.34.1


