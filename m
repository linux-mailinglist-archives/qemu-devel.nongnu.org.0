Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15583D0C84
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:44:47 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69iY-0002ZK-Pb
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69as-00045T-TL
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:50 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69ar-00058W-7T
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id r11so1623527wro.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=kECJ5uUMYsBFl3gH2zuDE5inU8gTtZF8byA+S0pbFALEeL1p3XcU0mXV0iWdUdaMYu
 jiitQ4/hQpBFuomTEtcaOIZFCcZmr0z3OtTFHiLWyNO1kLh1N2QbUFbqGoLBGWJQf+am
 XoLjXrJ/5N8lKq1RmMRUGs+dc0Q8sZ4kM5JZUPNw4S1W7CwOOvkt/0H/zmaFLnbU04L8
 ulv/og0FaPPrOW2WelEfP9nu3AUVeFVPvj8AAmvFic9GVOpeyllDPSD30rp2Lme0Q7ae
 vE0aGrRwDAO5nXeqo5S0HPAory/QawP126HlF1eM0N4er+xKH18xj+2D3SYqm/1xv3rG
 0TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=faVyjXkX8ocI2iRh8tGHpCUaeRQoRxigLv1m7BrwsmOsl84vHhAyzB03rhs/hrIwRJ
 DLFkkTr/QtJbR2lLMtvL2k5m0Pjn+bc08A7hB9KREYBAMtYvPMsCt760ARsS7Gzwq6zN
 AVQXOgeLe9avYG7lwfhVCz5+0btKOObhC7Fuc6dPlBrh7aRcOD1T+aUeQ35mUTqocMGs
 KsK0KbTuPh45XSqNZu8P/FfNy/IThFgO6cUG1DPkC0k46Lnidl9QQaUhh7NP+7Ey+Vz7
 iZMOuac5j9H2QoogV1LIHHd6Lv2YyHfaannjo/HtLTWd9nXTjB4LyWnRD+A6/PWi6wT1
 dPJg==
X-Gm-Message-State: AOAM53257ErDlAfHm9p/1Eo9VmvcvYIrlfYMU7gMROZ7UvtNWyQcniYy
 AT1HaegFA3a9Fc1kbVI8eEIdG8GGH84=
X-Google-Smtp-Source: ABdhPJynVV5Z3K/plSBb3YTOqXWwSubr+ZEKESZmOV1yoU61mW3jq/CjP2i7ivIw52IzXXutSnNbfg==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr40895109wro.176.1626863807560; 
 Wed, 21 Jul 2021 03:36:47 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:46 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] plugins/cache: limited the scope of a mutex lock
Date: Wed, 21 Jul 2021 12:36:08 +0200
Message-Id: <20210721103612.48844-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721103612.48844-1-ma.mandourr@gmail.com>
References: <20210721103612.48844-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not necessary to lock the address translation portion of the
vcpu_mem_access callback.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 4a71602639..695fb969dc 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -355,15 +355,14 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     struct qemu_plugin_hwaddr *hwaddr;
     InsnData *insn;
 
-    g_mutex_lock(&mtx);
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
     if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
-        g_mutex_unlock(&mtx);
         return;
     }
 
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
+    g_mutex_lock(&mtx);
     if (!access_cache(dcache, effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
-- 
2.25.1


