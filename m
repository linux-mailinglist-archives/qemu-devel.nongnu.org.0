Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3B3C89C7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:27:31 +0200 (CEST)
Received: from localhost ([::1]:52920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ifS-00027r-SH
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idW-0008O2-9X
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idT-0005fs-Fh
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so3081334wmf.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=EmVbtbh0r2Us2q671BS2liiGmzxXC3pMcVhUTGLlpT+fIsO2hCO8uVFyiShsE0bdoP
 3gJjLpEkSGooH0v4pjccq+ySE0RY9LKJJsj+Lf8XPDK18WsIZ/8aOFqTO/SPE76qtnkB
 k08vIr+N9vIVVpLBHQ8gPmqNBc9o3VodC8EGCaxD5UaPJncGGI2zpfXHwk9FmD+rfes4
 LbIKL+EuDsJP2Gr7kDOfvg0dob0dWJif4RDBWBoq+9ly6ReY8DkueW9n7Cz5YykUjAiK
 KDfRmyig/On6n0kYLmzA/SWwu/cFtp6ObBkvvld3Yk3wwVs4zt7xRqrMviMyfqKUPxhh
 9kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=oyL93+E5JC8eu3LpFv+PlbJcoxJRQ2OQv3dbCPB04NoYYIAuE+l4RL13XiDrqWmYzv
 CxenVTTmuYDsVoWzjQSIVdG9/I8GDPrdQEf3ESekbv9OYh1XbvF8FTp6JKr4Y1uIyf5w
 hPvPOOTzCOg5dnhIiYjHqtJtTAKLNA9rSXo70QvVRz3gR0l4rFUn9oghlLW1/0ckyL4D
 XzyNuh7F5BGGB4bcTlXJ5Cpu+dgFnTnOsCTIG1AdG0cxEb1llHqOwm2xgWocwZVfyYLF
 YueqUwiazKib+MTUg1XOnmHlrISlMqhlB7Sxqvc/RCEqClUVNHdCWVYFpQdGHG7Bt0qZ
 9r0w==
X-Gm-Message-State: AOAM530cnnp4RIjGaEcr65/7RGM98SgTiW4vtem4upNEAzaIKC/RMCVC
 mqR2zQvqT+KqalYEiEUSSQNZg3JVwigokQ==
X-Google-Smtp-Source: ABdhPJw1xmuO/7mb4MIw8aZSU6/iHTLoL9xbg/Eey1kPSi1Dg1UfEF5RE8HnBU+jcSoMfOeTlW4fxg==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr12516820wmh.186.1626283523387; 
 Wed, 14 Jul 2021 10:25:23 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:23 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] plugins/cache: limited the scope of a mutex lock
Date: Wed, 14 Jul 2021 19:21:48 +0200
Message-Id: <20210714172151.8494-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
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


