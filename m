Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D336F5249
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6wu-00087R-Dq; Wed, 03 May 2023 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wi-0007lI-Mq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wg-00076W-3V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso346065e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099036; x=1685691036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Mn0CeWWH9U2AB8/lpUxesUJy1Tn/CPl0OcAiEyXSps=;
 b=t7iNFvGcdm9N62mCh1LUx+VTCntxlrCJQeKPI0qrYdHb3FkQb9IGrZemcnXJjNnil9
 tfmp5WvCCO/1XdBrAJiVNUBFXdcOG8pyB75+fvpWgZm39hw0W/vgQsmPAKdDGrNN/xf9
 3Ny9M7BN2vU54uvmwfBTqDzKnXMqDEtW9msV1MPGB3hyLal89Z3bdbBRaiaMK1/QwxX6
 kXB7b/QZJV36rPuQZivxHCQa6h0F4evFT9KDtkY43QhmbICs8M3NkyNl+t/SmskQebgs
 Hj6J+wycuh0R6YcEC0HZoUGsM10H4mObGsqsDKaniFOKZdZFL1hbfSsr61X/AXF1I/xB
 r0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099036; x=1685691036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Mn0CeWWH9U2AB8/lpUxesUJy1Tn/CPl0OcAiEyXSps=;
 b=ingL5f4N/GivKgNXFn4LwJrB8VIu777KfIsfEeCECkAI8qOsFilA0meC3UMHxYzkuF
 6V6HKCTU08kHw4kvk5GhD5BpdtKLvGO2EpKesBMO80yOaNOmfW0EAWINjzsayDX5y+D2
 ++MKXVBnJH9q4eJO9m7GLGUZlcITApR57bPVVxim7j0u1b+ehDhj5DzDT7zEG8sA1ab9
 Ud1S+4Z2tm7xAs8KiO/VHj6d5iABlQNZzL3BFmjYwNUlWrZGGC1HHwBkciAPU9B7S1cu
 6/1CWIXOYf6a6doI48M1cIrQOLSQqMbvzKSurKo0kplzh9g07PfQYhH0C0WqNFdbQZAx
 uWLA==
X-Gm-Message-State: AC+VfDxLXmpwuv3yRTodlrNjPlJ/I4QJGU37fiI5rhFBTNfJkWLINqSj
 tWHixEJ8zPw5c+Tbe9sbUatdqY3sKc3bBDEIsaNvcQ==
X-Google-Smtp-Source: ACHHUZ4zgk7jKvXhTUlGvnyGIdWyII7ttwYsim+rJrL0hvzKHUTN202Lnr18zdtQpsm2OWJdTqrV5w==
X-Received: by 2002:a7b:c8cb:0:b0:3f1:6ec5:bc6e with SMTP id
 f11-20020a7bc8cb000000b003f16ec5bc6emr15419090wml.3.1683099036327; 
 Wed, 03 May 2023 00:30:36 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm982896wmb.25.2023.05.03.00.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:30:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 84/84] tcg: Build once for system and once for user-only
Date: Wed,  3 May 2023 08:23:31 +0100
Message-Id: <20230503072331.1747057-85-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Create two static libraries for use by each execution mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/meson.build | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tcg/meson.build b/tcg/meson.build
index f56c465f4d..bbac401fbf 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -1,3 +1,7 @@
+if not get_option('tcg').allowed()
+   subdir_done()
+endif
+
 tcg_ss = ss.source_set()
 
 tcg_ss.add(files(
@@ -14,8 +18,28 @@ tcg_ss.add(files(
 if get_option('tcg_interpreter')
   libffi = dependency('libffi', version: '>=3.0', required: true,
                       method: 'pkg-config', kwargs: static_kwargs)
-  specific_ss.add(libffi)
-  specific_ss.add(files('tci.c'))
+  tcg_ss.add(libffi)
+  tcg_ss.add(files('tci.c'))
 endif
 
-specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
+tcg_ss = tcg_ss.apply(config_host, strict: false)
+
+libtcg_user = static_library('tcg_user',
+                             tcg_ss.sources() + genh,
+                             name_suffix: 'fa',
+                             c_args: '-DCONFIG_USER_ONLY',
+                             build_by_default: have_user)
+
+tcg_user = declare_dependency(link_with: libtcg_user,
+                              dependencies: tcg_ss.dependencies())
+user_ss.add(tcg_user)
+
+libtcg_softmmu = static_library('tcg_softmmu',
+                                tcg_ss.sources() + genh,
+                                name_suffix: 'fa',
+                                c_args: '-DCONFIG_SOFTMMU',
+                                build_by_default: have_system)
+
+tcg_softmmu = declare_dependency(link_with: libtcg_softmmu,
+                                 dependencies: tcg_ss.dependencies())
+softmmu_ss.add(tcg_softmmu)
-- 
2.34.1


