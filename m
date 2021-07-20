Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42503D05CB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:46:58 +0200 (CEST)
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zRx-0007cc-1C
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zG3-0004d9-5P
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zG1-0001mg-FD
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:38 -0400
Received: by mail-wr1-x429.google.com with SMTP id f9so159923wrq.11
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sD6Pm84CmdjI5JpcNTDj7rKfkXWeIjK0Wl9Ca+PDk9k=;
 b=EVHszxLvdmzOJZjw52l2g8KNz9Ef4JhI3K0QmEc0meIdw6+8hCYECkpwxUzU5Kf4J/
 Nxoh/QUMYAnHE/kY9qfqCDTuu3fZ0A/D3xu32qBpM31GJPMpsOH43VMWd/4gmikiOQFz
 n5O+qnscmKnFpmFvjhLW3K06gldz90uSit77jGUqVy/tChAIQAPOAvK+Z+7JWcURyCCk
 NU73TiOLoB4+f0DBN1pmJ11LLOFZumchm8WjlCC+xEBKQA1I8YY7SY0DgsIdh3PqH5Bk
 0Z2zLkg3hVJt4A6sE2MquRBXuyvrHxLPBdZ+JOmYEeErBJgn4UrfI4TD8VR6phlPkmEy
 OH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sD6Pm84CmdjI5JpcNTDj7rKfkXWeIjK0Wl9Ca+PDk9k=;
 b=QJPR+F/xGDGOeAM9kWtJs8nCP2aKdyZqmZPrMWnRpssmbe0zK6U7T6w5qnv9eLP/lQ
 PdlCDoRny+4eSIZtikoR5P2gpmydzgkY+71I26PG3HoNU8bk2JmQTXtq5CO21/ad/1zJ
 vUzRLZ4C69h/Ktf6fL3rog7tMhCuXM/mHLjbJA++KHGwKJnlAHbOe/VyAHbW6IpRF4V2
 cvSi0efyWaoin3WdOnTKsqYwWt9gZyVE5Pj/dB/7ZEYpZJldnTlXh9JRVzKfMtIdCjny
 cHSVM3SF4GJ9JXmEQ4dEPgJCHptf2vuw9kw/qhwZQe9bRD56ldVVfEk9jE0ZmTtyv3iv
 4gOw==
X-Gm-Message-State: AOAM530LTv26e6i+gbHMHmCDVzJJExg2gq2cAlopwKqq3vmIXRAobZ/b
 5UsTbmKyA7KwHsAEBEh9ecuqCQ==
X-Google-Smtp-Source: ABdhPJz5LUXL4J7FDvK7M7+eA42G9XH/iR3WNoBiSunI38kwUYtYl2cnaHJ2ma/poiNXdfcEiYY4Bg==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr39403150wrq.269.1626824076098; 
 Tue, 20 Jul 2021 16:34:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm20634050wma.48.2021.07.20.16.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6D6A1FFAA;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 21/29] plugins/cache: Fixed a bug with destroying FIFO
 metadata
Date: Wed, 21 Jul 2021 00:26:55 +0100
Message-Id: <20210720232703.10650-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

This manifests itself when associativity degree is greater than the
number of sets and FIFO is used, otherwise it's also a memory leak
whenever FIFO was used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714172151.8494-2-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index bf0d2f6097..4a71602639 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -200,7 +200,7 @@ static void fifo_destroy(Cache *cache)
 {
     int i;
 
-    for (i = 0; i < cache->assoc; i++) {
+    for (i = 0; i < cache->num_sets; i++) {
         g_queue_free(cache->sets[i].fifo_queue);
     }
 }
-- 
2.32.0.264.g75ae10bc75


