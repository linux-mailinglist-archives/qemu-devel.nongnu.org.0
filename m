Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CC695249
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfku-0000pN-4d; Mon, 13 Feb 2023 15:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbSz-000831-T8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbSy-0005ja-BX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so9450578wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Fnuvphrd4KcPyS3DWGw7YsNit5qQSnqPK9bRR9NFcg=;
 b=VgN6Qgs0HFBq67W9Lx1KkMneFTChFIoflNB5bpvRbNpmrl8kPdXhI0IR/MayOSFxCg
 tAvhEvxiABIzN9XbCTwXNRVJwVJmkkdzgPEh27mrNOq7oYqNh5mIRTgOPUqW3gcEzNCU
 dhXo9ph6yzrsBDBDQcJW1nuT5luCjoFUY3RaEFjQ83UTdw5LQhlYTeO/Porx4a95kaff
 EyeJ/1kAbFb+UfTogLuKMwheXj6uvMEwn9+IjojZBXNfnsSEE2U0iV9pcrLekmX73doX
 rCXETdhVF5UYTb6/ENGfNxXSIT6PBjRcV7dM7CruxZe+Zy7ecZkIdVVM2P7NwECbyizS
 NTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Fnuvphrd4KcPyS3DWGw7YsNit5qQSnqPK9bRR9NFcg=;
 b=B+cvKvLGr1JH6MITIeQlwUsYyvrscn+JsMlUXeibX2Wjjibnb/sh4IiGCcEmH8wq2S
 pBIwbQIyqyn9yz0o8TATDB7ZmhHG3YkJWLvnaGNE6/F21lbzckUvgIxnteVVT/LzVDPk
 TtaBbJXQETF+Q15319UQqX1mR/GQ+8A780dpmkJ2zBLUHhSUTGDjrUF3D07Vm+SNbLmJ
 PX0MCtlSlBWuyEKtYE7fTzlW3Nd9v6XBtnHxiTLWwe1XWiXrSh+NBWzysmr3uxEtd76m
 0y/GTzLijJ58aVbdJK4cnR++AXDx+GSkfxr/P+/VnBjbkfwQ4cBAMCUo8hXYncPmE3Gv
 E+YQ==
X-Gm-Message-State: AO0yUKUjhs8Bg3LSCJq52IKS+53AuuhIrZC0i7XgDi4g7yemHvG05b8L
 4BmlR0gHzsp+5uzlmPQIC+KiB9qsEpOKnHsWkxA=
X-Google-Smtp-Source: AK7set8FqqPFU2NyGp22ANdw5rvMBXO/sKqn+mvfO3AgtT0nfV79NRGa14elkn0gTHorEAaWh02SMA==
X-Received: by 2002:a05:600c:2b45:b0:3dc:561a:79d8 with SMTP id
 e5-20020a05600c2b4500b003dc561a79d8mr23532947wmf.35.1676304846618; 
 Mon, 13 Feb 2023 08:14:06 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:8df5:e191:f2b0:5825])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm3582882wrm.99.2023.02.13.08.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:14:06 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/4] util/cacheflush: fix illegal instruction on windows-arm64
Date: Mon, 13 Feb 2023 17:13:49 +0100
Message-Id: <20230213161352.17199-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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

mrs instruction fails as an illegal instruction.
For now, no cache information is retrieved for this platform.
It could be specialized later, using Windows API.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 util/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 2c2c73e085..149f103d32 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -121,8 +121,9 @@ static void sys_cache_info(int *isize, int *dsize)
 static bool have_coherent_icache;
 #endif
 
-#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
+#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
+/* Does not work on windows-arm64, illegal instruction using mrs */
 static uint64_t save_ctr_el0;
 static void arch_cache_info(int *isize, int *dsize)
 {
@@ -225,7 +226,7 @@ static void __attribute__((constructor)) init_cache_info(void)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-#elif defined(__aarch64__)
+#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
 
 #ifdef CONFIG_DARWIN
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
-- 
2.30.2


