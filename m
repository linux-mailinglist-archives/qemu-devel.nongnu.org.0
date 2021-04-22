Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1D367689
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 02:55:05 +0200 (CEST)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZNcW-0006oj-95
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 20:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYs-0004j1-4E
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYq-0006YR-0j
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso2239778wmq.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 17:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtpqjJB+mPrWI3pSReKeoScSunVn5yIMNvsUm4adUls=;
 b=DjpYlKq0WW7u4vK7dS11sWaehUsPnQ5HYetkj6qGFpEDQmr9FtDJLdxZ8PZEhXHCI+
 cqfXKcn2JPpz3lWzjirc6/HPs1EzRFs0FOoKS67PM99MmHMK6kdjsX4QDEet0P6Ybzmd
 yJ1sypq6bnamhZAyoDYGaMrdqTBCwpIFoFsrduDTiSbxJ+PRdXda+YFKv/Rn28MRSgAw
 q/xkJbH+Df+ntOvueruIkv8M3SMT3dEl2O6Q6Jajq30RAGotQjt/X0ibbRcXa2A6Dsw8
 9ugjyRJCrk1Pg7gIZYnsqQsNLvlyFUD4YZSTdbnJRvx+m8NYgH44FAhcM/0FxS0u6efq
 t+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtpqjJB+mPrWI3pSReKeoScSunVn5yIMNvsUm4adUls=;
 b=QVD+pV64tRh4FMaSP2S2JTGmEnS3bJqE0CZK9thqgnRwbMNFyyZv7MR8CcptHablbK
 kys4LAo8xs63P3G3dXTerJ0Gp5xmq0OYfNZvceydbvbXufL6nGmHZ/XEEKHe9VF/OOKC
 TujfPnRrDMaQv5uxK4GWF22peOSnIRmR3VJi0QxRcpbv/LpaSTCr1odDzKJrbw7ipEDd
 2h4zCdppQhCXkRtp3BwCjYYDZxFQk0yjhpUBh3bDc1JF4ns2sgTynZykiXZFGHCFR00n
 0AG6sHPkCY/u31NAMDkWHa5DKkuAqCKVmj+/OklxAxHGj4Sk2L8VzLL4QhdsSkgo2Muj
 q8Mw==
X-Gm-Message-State: AOAM533C+U14ksTl/vxzMXoePJiycrlP2NUSnDcNpk0o8R2QH+JiYWdI
 lw1Blx8gIegf9oRt+fle5MLV6hFy1Xs=
X-Google-Smtp-Source: ABdhPJwXVArvJQ7HCiS88kl8lLo5agqwrW6ZBHMT5LzdtD3wCSIIYg+JUejrGSANM56AlxtNHYx2hw==
X-Received: by 2002:a1c:a7c8:: with SMTP id q191mr844857wme.6.1619052674205;
 Wed, 21 Apr 2021 17:51:14 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id 2sm3734607wmi.19.2021.04.21.17.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 17:51:13 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] plugins/hotpages: Properly freed the hash table values
Date: Thu, 22 Apr 2021 02:50:43 +0200
Message-Id: <20210422005043.3569-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422005043.3569-1-ma.mandourr@gmail.com>
References: <20210422005043.3569-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allocated ``pages`` hash table through ``g_hash_table_new_full`` to
add a freeing function & destroyed the hash table on exit.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotpages.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..9cf7f02c77 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -97,13 +97,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         g_list_free(it);
     }
 
+    g_hash_table_destroy(pages);
     qemu_plugin_outs(report->str);
 }
 
 static void plugin_init(void)
 {
     page_mask = (page_size - 1);
-    pages = g_hash_table_new(NULL, g_direct_equal);
+    pages = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
 }
 
 static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
-- 
2.25.1


