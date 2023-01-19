Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657A673F4E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 17:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIY7D-00069E-6L; Thu, 19 Jan 2023 11:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIY7B-00068q-6Q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:50:13 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIY79-0000by-AH
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 11:50:12 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 a14-20020a17090a70ce00b00229a2f73c56so6399595pjm.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FFeIttlONvVj1CijWZulOP3y4frElXKsrPTdIWRMz5A=;
 b=sdmpAKXTaWIqse8E577ioc6kZR8aHYGFZwtyfJBSANJ6ppoPNVIYtZtZ0esXbsef6r
 S6xVGdLxhOhCX3A1c5oW+t/1QnGzMP4VuNXT9SmFkWIRDSAo8ZyyJGZFYqrV1PXEG+9Z
 Ywx5X00lu8n8EINz04QqWSZE9MkQC7x1mqe+326oqYNx2nI2MRAoRFQZzKyLir/rXCDm
 ixASGWyHPVryH4QCIAiO+c7jjJHXGHNJmzz5fs6aOqiJLPj9SKt3k+2mKJEWsD75/eft
 JmJTSQry1T5wno2orbXvPh0l27kGWyyVxO0uy/hhgdfbYAudAuUPkgJdBNbSma4R47MZ
 a7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FFeIttlONvVj1CijWZulOP3y4frElXKsrPTdIWRMz5A=;
 b=gDSjTYhF3owS9Wku79Y7l1AgXJclgKs7pTX4S4yJwNycSl8hiOm4gHsfH5h7oHrydr
 snmxyjhJn1UU6rnxr6xFD2eOUfFRdX3EtmEdDXLYOfObKwI+AFmadt9VnVjkW7LkOoXp
 bScN0ZNFbD8pIzSa1EdLJEflIFPSssn/TK1FOo/8L4EsdK8DTz28sL83aZvd0RHHUPpm
 4hM0IvtJ05f+A5vFfQqeusTJS+3KHsJana8I42juacClL1JjbSOgoYm++UsVGI6hHZAG
 6bqE/gRZWW64NoPxE/kMkMIPg/AO1kR8Lm9uozjRG3yezjTyPWRSOYLekXignrwkDzSI
 7RaQ==
X-Gm-Message-State: AFqh2krt51o5b6G4UzM3SmBJvrAEsbVO4Ovv+Js2yVRoKLfHI+ofABPN
 opJUCY4Yp77Qwl/xi68iGFFEJ9MLWyID6Sci
X-Google-Smtp-Source: AMrXdXuxr0XGE0h7lepKQYtwLYTAUCFbjfI0BuzSi/gngHKb2wUpmYGsDtCW1rNNwjOebRsF00ke0g==
X-Received: by 2002:a17:902:eec6:b0:191:35c9:db30 with SMTP id
 h6-20020a170902eec600b0019135c9db30mr12280243plb.5.1674147009354; 
 Thu, 19 Jan 2023 08:50:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a170902bb8400b00192a8b35fa3sm25314683pls.122.2023.01.19.08.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:50:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	idan.horowitz@gmail.com
Subject: [PATCH] tcg: Mark tcg helpers noinline to avoid an issue with LTO
Date: Thu, 19 Jan 2023 06:50:06 -1000
Message-Id: <20230119165006.742073-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Marking helpers __attribute__((noinline)) prevents an issue
with GCC's ipa-split pass under --enable-lto.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1454
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Idan, please give this a try.  By inspection, it fixes the issue
with s390x's helper_divs32 function.


r~

---
 include/exec/helper-proto.h | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index c4b1bda632..7a3f04b58c 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -6,34 +6,49 @@
 
 #include "exec/helper-head.h"
 
+/*
+ * Work around an issue with --enable-lto, in which GCC's ipa-split pass
+ * decides to split out the noreturn code paths that raise an exception,
+ * taking the __builtin_return_address() along into the new function,
+ * where it no longer computes a value that returns to TCG generated code.
+ * Despite the name, the noinline attribute affects splitter, so this
+ * prevents the optimization in question.  Given that helpers should not
+ * otherwise be called directly, this should have any other visible effect.
+ *
+ * See https://gitlab.com/qemu-project/qemu/-/issues/1454
+ */
+#define DEF_HELPER_ATTR  __attribute__((noinline))
+
 #define DEF_HELPER_FLAGS_0(name, flags, ret) \
-dh_ctype(ret) HELPER(name) (void);
+dh_ctype(ret) HELPER(name) (void) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_1(name, flags, ret, t1) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), \
+                            dh_ctype(t3)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                                   dh_ctype(t4));
+                            dh_ctype(t4)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5));
+                            dh_ctype(t4), dh_ctype(t5)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5), dh_ctype(t6));
+                            dh_ctype(t4), dh_ctype(t5), \
+                            dh_ctype(t6)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
                             dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
-                            dh_ctype(t7));
+                            dh_ctype(t7)) DEF_HELPER_ATTR;
 
 #define IN_HELPER_PROTO
 
@@ -51,5 +66,6 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 #undef DEF_HELPER_FLAGS_5
 #undef DEF_HELPER_FLAGS_6
 #undef DEF_HELPER_FLAGS_7
+#undef DEF_HELPER_ATTR
 
 #endif /* HELPER_PROTO_H */
-- 
2.34.1


