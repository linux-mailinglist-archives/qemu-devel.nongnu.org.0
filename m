Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8A3E5C32
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:51:49 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSAW-0004UP-Hv
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7o-0007Vs-Gx
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mDS7n-0008JH-5w
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:49:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r6so4140869wrt.4
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 06:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztyZR8cQ1Le68g67dAtQvahuQF0be41+QNTy+0JP4BM=;
 b=iNA4FPqxIoHiKyOtqqcR9FTPlUjT6x/nM7TT5U4iMW0msZZbjZjIgHrnUvdUaxn27Z
 uQMLWiOMICUAG7L+7wdjqDsP5nLbA+yDmtkiSHWpbYufF2Jm8huCgzY8C/gEIEDRUuWe
 Ia7zbfr58Yu9xkKEoc6dJVQs4elXvmZlDdvO/QHUyLDeBl8J+V8gT3ZiNLMbjO7zuIIX
 GujIuSxyU+XAzjgozy3WtIVHjQuIuQt+Z1SGKpOaIy6YCJF+fCzeywiaJIe6eoYFmDP/
 4j08t2LpVxjLboruBTOizwU7/vFCjZPhOxgTqaAflvlvhO7hLLPNNsM0f2tFkV2XqYoa
 g9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztyZR8cQ1Le68g67dAtQvahuQF0be41+QNTy+0JP4BM=;
 b=GBwFlldKAAe+FMeUbpVNfd9JpNk/eIy6iLl2XguQQ65Uqqw0DNXTgZ6RIUpCvustGa
 LCa6UKFpjsDi2+8FZUZz0T74zbzx9ZiWmLYR1Y3h3JzXDD+xvyU1sXTF1uioS2K6LA0o
 j+W8n8sDLrU+aLDH/Qk78phOlC9VxAyVUeHTl33rNjv5hD4pD4xkXPswp4bXHsh9fC1D
 hm6GVzGoZGgFu1o/nExPH5jqet4f9NRLwQYSN7Th14nnz+9Whsce4V25c6ZmZIPxIulM
 S6dCaxK+ZcNKFIbIERiIlLrYUzEuFke2smu32Q7Sz13MRv29mhFAzveNdWeTNuXsGmlc
 VsKg==
X-Gm-Message-State: AOAM5305tnTSC+B3hL3GGequU6JBDKaPldb2VgHVBeUXdV9cS+to0k6i
 w33mqq0mMrKAgXcnQAx8vSWf0OiUvbQ=
X-Google-Smtp-Source: ABdhPJyUQI03W47EQq6EgCTRZIPtFFMbO7RvSf2er+FxFqgUAL5EiFTs632eV0ybAZFOBn3zXKrZ2w==
X-Received: by 2002:adf:f149:: with SMTP id y9mr32300367wro.413.1628603335197; 
 Tue, 10 Aug 2021 06:48:55 -0700 (PDT)
Received: from localhost.localdomain ([41.36.105.33])
 by smtp.gmail.com with ESMTPSA id u6sm8683413wrp.83.2021.08.10.06.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:48:54 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] plugins/cache: freed heap-allocated mutexes
Date: Tue, 10 Aug 2021 15:48:40 +0200
Message-Id: <20210810134844.166490-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810134844.166490-1-ma.mandourr@gmail.com>
References: <20210810134844.166490-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index a1e03ca882..a255e26e25 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -614,6 +614,9 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     caches_free(dcaches);
     caches_free(icaches);
 
+    g_free(dcache_locks);
+    g_free(icache_locks);
+
     g_hash_table_destroy(miss_ht);
 }
 
-- 
2.25.1


