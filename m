Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF75FA036
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:30:57 +0200 (CEST)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtnz-000304-Vw
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkq-0005v0-Ki
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:40 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkp-0005Xn-13
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id b4so17334114wrs.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UhrnEzupfDW4VUrWZYS+8MEh7LjRrlG3/gLMwULTgSk=;
 b=kZeEGwuz74XaSMz02YTAoSWNHvRdc1H83RRD/mRiZayT+5Ry+ggOWnCzCp0wkwcGRh
 3qvYz8Z88dNf0mV2v7ZQI7s/j/o8xdI7SCzbzVc0SkH0WpyeshzeqNJes4eZUgA2x8XZ
 GYrkEX5rlk1cpMjNPQWJ03Y114p9qmmjOgrRPcZilrPjNGgKBqLxJuJ4b7IRtmAvlmdg
 ncjcrXFx/XB9TkgN6p2iU4+Phslu3sGwXPydwp9m+0jV6C2mHpUWGffJsIlh2l5lKwsO
 A4ziI0PdsGamte6P4pjVOzqzEfH4vbxKEmr8QjY9E/uS550uSnidird1USiEWbbqo+mW
 XfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhrnEzupfDW4VUrWZYS+8MEh7LjRrlG3/gLMwULTgSk=;
 b=w7X4ftel/onMaXgaJo7yBO4YYmdEct1rHn+ugsoRjhoyfEz3gNu6O2IYc0ixwa4FNM
 kXZbeaepEVNj6S6Hl4JxfSPZcxTwtbmnEjFnAFmIbrhMzbTgfUcYQCs0dBOHVY+CQlVh
 9IX8FTUtcT/yDes6Ou5ELRQ3gmQpILQh2mVxXvHuDmWjwWvYJ9rdgkcbpI9LKlPtmX6m
 ZiCK2Tdw+24T+8+u9syIWyojnfIV+SSmtAfA6ym4KVBJqLj3L1hBm4U+U2EUdkSSfDK8
 LdWXjClq4iKJOZBg2XcfJuRJ8L6Y8z9/oyDggATAphH6zsvT3GBFonI74WEN8/DE365U
 ko7Q==
X-Gm-Message-State: ACrzQf04HKo6YMaZdRVQgBBh1YsEmnD+NKYmPRxhKXVkphVU34M8QIkm
 Ac73M19J4/OkrK8BsFqM4h6l0Ji5kBu/sg==
X-Google-Smtp-Source: AMsMyM5GbCzBZTtKtyc09uA8z/TDMi5XiO7OZv94e07PHyKw77nHtNIy8XUer4nIYHV3S1u2Dyqb3w==
X-Received: by 2002:a05:6000:18a1:b0:230:f9fb:c83 with SMTP id
 b1-20020a05600018a100b00230f9fb0c83mr1640439wri.329.1665412057398; 
 Mon, 10 Oct 2022 07:27:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] target/arm: Split s2walk_secure from ipa_secure in
 get_phys_addr
Date: Mon, 10 Oct 2022 15:27:06 +0100
Message-Id: <20221010142730.502083-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

Create a new local variable, s2walk_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221001162318.153420-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028abb..b8c494ad9f0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2298,7 +2298,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s1_prot;
             int ret;
-            bool ipa_secure;
+            bool ipa_secure, s2walk_secure;
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
@@ -2313,17 +2313,17 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             ipa = result->phys;
             ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-                } else {
-                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-                }
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                s2walk_secure = !(ipa_secure
+                                  ? env->cp15.vstcr_el2 & VSTCR_SW
+                                  : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
                 assert(!ipa_secure);
+                s2walk_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
+            s2_mmu_idx = (s2walk_secure
                           ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
@@ -2366,7 +2366,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-- 
2.25.1


