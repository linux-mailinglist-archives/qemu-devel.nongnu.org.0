Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9633D1E92
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:01:24 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Shv-0006YU-3s
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbZ-0008R3-Fb
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbX-0006ux-53
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id t5so4694465wrw.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=ZoCEmtH8hlCVw0iT/Bad9K6tiN4/33nlUob0p7V6Z1ZTTRcxDrK1Ncfm4nBLe8iar2
 5BvvBFw4h4A0/RUKKtxh6DtPUIprzx67SXXHje2DhlhD3xJNgncR20pvBHEnZkyhnqMS
 lR4GT2aLuUVm3nJfnYVTV1i5oValyauw0UVQ7nRXLBES36qSVird3wiDsGDCYl7aPcIm
 faEkuM1fxh93urxaC3k3WpXg6ZaewOjysoFJqgtd3qyM24xMzSf7logllve1VX8WeiA1
 WQ1EuakPl2ZhejvQ4qa4WNXTfghHCgydn65LEnKxXt7iGUQLXX0/opt9hTJbtR66LbZs
 7xBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk3htMMb3bfqB/M3qyqhgxhOXapf/D+thLXQN5K9iqg=;
 b=iROYZa4+PR5T89oRW8qYlK7kHsD2gbUDXo2EJDJzkeDwKRQt5OEo7tT3Ccn2YYzFwR
 6FVnK2W2KgHoOdmYDa6/k6R7R+F2pzLV9GZnzV3T/eao++gl9rRUEbPCG+nwfExVKUC4
 sT8X5HMRrxbaQSnpkt+NOCNjjvxCZVa8a+8A/kYB8jtz7E6Hj6OxF3qFCdYzuCcds+4m
 zElqdVUDm6WwaLLuFYj6R0VurdxqViWzaTJCAQd77UjPV36m1EzajHTofejzelTN5fMM
 VNjt9xdfToMcIPGaFFN0mWCHsSmDyXYVD/D7R7rzDlEVG9HaWOjXE8LT6yFU0w1Mm1VQ
 h8Mg==
X-Gm-Message-State: AOAM531dqmCalyR9YrPZOUi3YX0YI5VpmrMlbtpVUe+KnnZ6cEed66VM
 6FXWVWvGANWiqYC+iGOVZF/dTWxWILw=
X-Google-Smtp-Source: ABdhPJwrCQT12+3cMb2sSVj+eocHjcNFBJnRoKN/uD/GdwMTUst/dyuz1Zc42xZSdQd/H0V+Xk5Xcg==
X-Received: by 2002:adf:e805:: with SMTP id o5mr13880366wrm.321.1626936885692; 
 Wed, 21 Jul 2021 23:54:45 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id b16sm29245426wrw.46.2021.07.21.23.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:54:45 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] plugins/cache: limited the scope of a mutex lock
Date: Thu, 22 Jul 2021 08:54:25 +0200
Message-Id: <20210722065428.134608-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722065428.134608-1-ma.mandourr@gmail.com>
References: <20210722065428.134608-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x432.google.com
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


