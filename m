Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815E3D0C7E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:38:43 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69cg-0006iS-I2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69ar-00040O-8A
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m69ap-00057E-Hm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:36:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id t5so1617163wrw.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=h/8icZVaM5HMSX5NQLxksO/THCIi5JEhwIedcep0/y2LY2DJYcxKMAflfiy6ylFThq
 2uCPgUKzSDtcYJQXn+oIrdv5Pp9Oc+fS2kYCZXPtqwSau9UkxDiXyGDHZMyBs4nDVWPo
 0/OxOfc2mfUehhJhAQtrbyeNW77zYjKhn7a8paNp3WUlmK3g6K1YQQR4MsukuWlzhHWZ
 LXjABV9Mnuxa4RrBCNgL4j/ypx1L7miizZAEPHHXWAvU6Ggl4Xg2/bvsHhPkJI99CH0q
 RvruID1ct2+cqLd8nWpg1EG3spAR+NEcIsgIzIrOGKUmz0wYCWZB3nYPCxYlKcVAu1KQ
 pEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=lFFC7Ac4seY2y1/9LcwtEFFhzEWd9byvuzuRGdVD4G55Teabb+zpxUKKDTu1wxY1fk
 zoRn2hGVUKy/bSMrTJiGxzQZYlPw7DhxKuv0hcSyoZmlI00pov+CiNqWy94Ji6LgvJau
 Z+iFH20xf7MTbmHWHm2NXpJKImup8wWsdJZki5e6qLXtNkTrBCCsbB2p/Bgv9Y5W/8rm
 FITQ3sOo7nQtq3oiPqPjLSoDaLflJyS6itFuSJ6MqG4XK/A8FLJ3yKDALjy3L41tlOTP
 jjeIEBW0ldTNeIT/OqWfZzNscN2L8vBugAeoJmBre2tBqSlGcyhBiEA0b18c1mDJBoux
 9j6A==
X-Gm-Message-State: AOAM533O2N+ks3jwouf3VU59dWlRilIyDm4plz8BZK5hKKLwGy9AwSWo
 jD0uvQnc51oFUyzYMtr01gzbMsMFM4g=
X-Google-Smtp-Source: ABdhPJxQ2zf5MEGk7h9i2YQ2Px+QF5CKbaQ4Vj1F+9kTAJvRHsV3uaFgZRMKEQDW7xUGEoT5L093qQ==
X-Received: by 2002:adf:f949:: with SMTP id q9mr40451606wrr.178.1626863805951; 
 Wed, 21 Jul 2021 03:36:45 -0700 (PDT)
Received: from localhost.localdomain ([102.47.167.62])
 by smtp.gmail.com with ESMTPSA id s24sm28854019wra.33.2021.07.21.03.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:36:45 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] plugins/cache: Fixed a bug with destroying FIFO
 metadata
Date: Wed, 21 Jul 2021 12:36:07 +0200
Message-Id: <20210721103612.48844-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721103612.48844-1-ma.mandourr@gmail.com>
References: <20210721103612.48844-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x436.google.com
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

This manifests itself when associativity degree is greater than the
number of sets and FIFO is used, otherwise it's also a memory leak
whenever FIFO was used.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
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
2.25.1


