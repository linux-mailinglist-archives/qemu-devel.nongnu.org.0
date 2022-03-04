Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BD4CCAA9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 01:17:30 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPvdR-0004hP-KH
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 19:17:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPvao-0002ag-JB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 19:14:46 -0500
Received: from [2607:f8b0:4864:20::102e] (port=39904
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPvam-0006ru-QB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 19:14:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 mr24-20020a17090b239800b001bf0a375440so3869308pjb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 16:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaDQznwcypm1q0+tvTR4An0zuVWVPb5LLtISrx/tsEE=;
 b=saB9QSqMmlMqgMstjpTMVyhqOC0cXWdukenXvCnmK1mhF4m/i5FajD9bs98ooE4iic
 9EHyakBEN9EcGrOJfRW5xe5wcqCzSfXW1foU9zheLQa/4NxW7r6IqjU+Vjqc7zs5FbDv
 VQKw8URregnAhXYadTnzRuG+dePVphNX2jxt2nkkxRaoVwdMxsiHS02JJ38+TmBhhoWv
 Vnr6pPDaendRsR5HnOxHd66ynTlKPxQt35C68xmZ5qAhnpe4fO1NvErzAGTlieNng3Gg
 6hr6sBKWMeH4AGpKQYQjH+pagHRZf+guEYKyh9kQ8lH7Jw04sEiJoPEwIB1cRDmwZzht
 C9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaDQznwcypm1q0+tvTR4An0zuVWVPb5LLtISrx/tsEE=;
 b=F95p5KOBJRAvBt9FBE8Yc8qmAJLVDeSEeUXnEglW3irWw1T1I9vmRFjg1AkKa3cVRd
 dkOG8NeJ+DNO5vOroJ0ddlfC+EHtnairONBdTWTQ7uIypH+GqyS6rbVHdzRfM8mmm9Ln
 dGpRDG3crHCnT85asGopdawZvbVavdBl+8CCbc3veB0tf4EwKUoPj6kzXnkb3d1EjG6b
 P8p4tQZY0i0OPkjV+19znFwQpeLUiak6X44n+XpGJGE7p7iabABZyFOq3ID3UshwhNsV
 6LiM/rDpKIycgYO4+PxkYdUSud57ig6JQ/O1Or8l30EOy4ia+nInTKFbCndQuD1H9cFg
 QpVA==
X-Gm-Message-State: AOAM533QW10r2rE2N57hV0wHd6VBiMVPaSFPZtua8r+Z/8wGW6m76T51
 22TKpadwY4BP1BiqkfCQHAXjV1Ybq3thCQ==
X-Google-Smtp-Source: ABdhPJylZn0I/J92fgSLhVrcq2+roe1K7X4a3i0TdMYth9OEZz3YTe+glL4YflJv3x8aJWORwr3f1w==
X-Received: by 2002:a17:902:8b85:b0:150:27f1:e86 with SMTP id
 ay5-20020a1709028b8500b0015027f10e86mr34258951plb.88.1646352883205; 
 Thu, 03 Mar 2022 16:14:43 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 ip3-20020a17090b314300b001b9cb7ab96fsm3474318pjb.8.2022.03.03.16.14.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:14:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve2 ldnt1 (64-bit unscaled offset)
Date: Thu,  3 Mar 2022 14:14:40 -1000
Message-Id: <20220304001440.472085-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We were mapping this to ld1 (32-bit unpacked unscaled offset),
which discarded the upper 32 bits of the address coming from
the vector argument.

Fixed by setting XS=2, which is the existing translator internal
value for no extension.  Update the comments, which matched the
incorrect code.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c60b9f0fec..fd96baeb68 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,9 +1576,9 @@ USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 ### SVE2 Memory Gather Load Group
 
 # SVE2 64-bit gather non-temporal load
-#   (scalar plus unpacked 32-bit unscaled offsets)
+#   (scalar plus 64-bit unscaled offsets)
 LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
-                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
+                &rprr_gather_load xs=2 esz=3 scale=0 ff=0
 
 # SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
 LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
-- 
2.25.1


