Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82F169C956
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU462-0004X2-O3; Mon, 20 Feb 2023 06:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45l-0004SJ-OJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:21 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45i-0006Ry-Ix
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:20 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j2so568710wrh.9
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmnWoNMHciP793cEremK0wUfHJtfeQ2W0yr8vbgY8Xk=;
 b=vEGFUJ9VkfzzxRZjMUpioBhLlyynrAO7j/MyUY9n6e9fsObuZwT0d7Kz3al0cue8OM
 1jaSfwNctxjU/gutmKD9kCwPBch4oeyp8QOrJoKzUlouUredBOqKFlq38PsuQzo9oymq
 u9JZrz1T38IosGMyFroMpqgI4WnquKlzEZ+ZUZtP2P7hEbYlM9+JyaDVpMdrpYUarVN2
 cBgkPfHbbSx8akEmLgmfeujmdmR5lOnu27xrhHNvIm/Yv661swqj+UoaZ7rKk9cQzLgq
 I46cuwpDJ5uaX9WRc7TTQH3TMf3gLSEXJhX4VYYH8cNwVA+P5u4cXJ78wvxIC8XSCNVG
 Vu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmnWoNMHciP793cEremK0wUfHJtfeQ2W0yr8vbgY8Xk=;
 b=8Hyfd3ZfazWR9EG4OeVnYxabXD0CWN57TacHYLYjOXu6zZ0RviQkg+FwWZgSpuLFfA
 l8m1tWFds3itTQ56vGQXl/gwjrjC4HWIAWJb8HjpA1J373ARwVxZMYcMegLOWaY+M/lA
 wc5R9PlgDZW8+zIj+0X7/kCeRrCIMX6FlV+7AC9cqpkbr2NtW4er5y9T2p1+0d9oxcGt
 0nX7tbJBl1F/keTEy1DuU/BKLoYIED6L1bZptVUaRU3Q1gBm0qoAVp0qhHTkmnPaaNbh
 TMf4+Bf7qU7aenA4sbaSu4eoLwTAEmjUJR1o9ID9pkMPM0HHKH30u2v+HqvtrWLRQTcU
 q2Ig==
X-Gm-Message-State: AO0yUKUO7ntRsN6/bel3pA/LfIIrpGyxs8Nbnef7G8ODpQULVv8ilQYP
 lgL/aYuwTpIIQU3aNv0+Xsjm70WdCiobDJf15ZY=
X-Google-Smtp-Source: AK7set/dW1KunvhC9Nj5FfKrt6J7ImcJhGkEf7etAuJum0Gyw5Jnf0rO37WiwY35QKCw8PBSBKR+mA==
X-Received: by 2002:adf:f108:0:b0:2c5:561e:809b with SMTP id
 r8-20020adff108000000b002c5561e809bmr994028wro.66.1676891536589; 
 Mon, 20 Feb 2023 03:12:16 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b002c573778432sm5046656wrr.102.2023.02.20.03.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:12:16 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 1/4] util/cacheflush: fix cache on windows-arm64
Date: Mon, 20 Feb 2023 12:12:12 +0100
Message-Id: <20230220111215.27471-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
References: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42c.google.com
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

ctr_el0 access is privileged on this platform and fails as an illegal
instruction.

Windows does not offer a way to flush data cache from userspace, and
only FlushInstructionCache is available in Windows API.

The generic implementation of flush_idcache_range uses,
__builtin___clear_cache, which already use the FlushInstructionCache
function. So we rely on that.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 util/cacheflush.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 2c2c73e085..06c2333a60 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -121,8 +121,12 @@ static void sys_cache_info(int *isize, int *dsize)
 static bool have_coherent_icache;
 #endif
 
-#if defined(__aarch64__) && !defined(CONFIG_DARWIN)
-/* Apple does not expose CTR_EL0, so we must use system interfaces. */
+#if defined(__aarch64__) && !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
+/*
+ * Apple does not expose CTR_EL0, so we must use system interfaces.
+ * Windows neither, but we use a generic implementation of flush_idcache_range
+ * in this case.
+ */
 static uint64_t save_ctr_el0;
 static void arch_cache_info(int *isize, int *dsize)
 {
@@ -225,7 +229,11 @@ static void __attribute__((constructor)) init_cache_info(void)
 
 /* Caches are coherent and do not require flushing; symbol inline. */
 
-#elif defined(__aarch64__)
+#elif defined(__aarch64__) && !defined(CONFIG_WIN32)
+/*
+ * For Windows, we use generic implementation of flush_idcache_range, that
+ * performs a call to FlushInstructionCache, through __builtin___clear_cache.
+ */
 
 #ifdef CONFIG_DARWIN
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
-- 
2.30.2


