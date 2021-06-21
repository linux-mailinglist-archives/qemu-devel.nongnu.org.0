Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E63AF121
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:58:28 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNFj-0005Pr-NM
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnX-0007ks-4X
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnV-0007kk-9U
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a11so20381467wrt.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mOCMbARqDYDxg+iJoPZnwKz9GlIjsXJ+C62Iqgse7ts=;
 b=VcRvHBrYijxGekw+OlwNIsA9jHAdMPRmgZ0/b+qBhWU6wOG81GtUQ/7gIAs2KcvKV3
 9eptR79Yw8jK5SjR6qYZMraCJbgld2bFkC7gFL/TSl3EhG6Xz7u9LvGmMFYtsImezP34
 UD0CiRI5IMp/O94hfyiZAd0Gee26vayq4LzEf1wOeK8I8Irmz6WdSU19gXB7G1OiYpwH
 mCV7y7GCmsZXUdFXqYAPGwZHwIf2YTc90/uQCMrUwAxzvv3HBGHcwSBEOxGVWSaKraaq
 s83u0v1StQUvUT/xuPqip6n7/9rm053FWuhugU/HXIx5rboaX0JlbTlacV0/RAX4KJn8
 umRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOCMbARqDYDxg+iJoPZnwKz9GlIjsXJ+C62Iqgse7ts=;
 b=S1JZvvyoAb5zHaNASN8oD75d4wgmgdh0OvP75Uug7S/HDie9NBZMFnOw8++es4oti7
 l9NWDA8kziYRqskrfLXeeAzjn/fpUNoq4A/VJuNBj/9PmsPBIu1SAtQQedvpakTv56//
 ck8Ie+D3ry9/FSk65SyCV3myfXOJkOoHDTUCeCOx34SNUTJwSDdCi7Ofrdtlp3G95ZWt
 R8exSR5BMBcmbQtVUkprZzh9xlElnXRlAXACRzBX4eNP+l+d9rzt9/URDaEH41CdCguX
 L0AQRerjiWxty4LqQLaOs6CwPB2nEAZqlaMWfCZ3ACmofZ5zmPounXNMTP3o1XjHny4K
 kw/g==
X-Gm-Message-State: AOAM5313yzKKDMJkFdo9GZtsJ6Vr8TI6yuj2wWNSQsiO/4H+Zqymp9M6
 xg6FyApwR5upbxvjR4QvGnNi/qBVPwQ6hti+
X-Google-Smtp-Source: ABdhPJyaJ8U60O4jFj75wdIdKG+rDzJOM7waMZL2WoeAGkDgWwxaFvwDnKQNkDcDjfChsHQEp1GBQQ==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr20565776wru.88.1624292955952; 
 Mon, 21 Jun 2021 09:29:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/57] target/arm: Implement MVE VSHL insn
Date: Mon, 21 Jun 2021 17:28:21 +0100
Message-Id: <20210621162833.32535-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-35-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 42be99ad526..56b3e8591ad 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -169,6 +169,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e78eab6d659..ebf156b46b5 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8ddd07ac287..fa440b13d31 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -521,6 +521,12 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+#define DO_VSHLS(N, M) do_sqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+#define DO_VSHLU(N, M) do_uqrshl_bhs(N, (int8_t)(M), sizeof(N) * 8, false, NULL)
+
+DO_2OP_S(vshls, DO_VSHLS)
+DO_2OP_U(vshlu, DO_VSHLU)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bd4c6150cad..487ac3185c6 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -402,6 +402,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VSHL_S, vshls)
+DO_2OP(VSHL_U, vshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1


