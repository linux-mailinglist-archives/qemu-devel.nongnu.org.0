Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045583D1E8D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:57:06 +0200 (CEST)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Sdk-0001wW-UL
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbY-0008QQ-90
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6SbW-0006th-St
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:54:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n1so4691876wri.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=MY6P0k/QX5A2EMelgZVkp4eILJgKq9fxJqSTh46PVSMdYu6xNoFNPGnysRSiXUCPIp
 FutAFPVP+vlgEss4qMD5XCaF1SSb27joESHbdiXA7lbSW1PCkdGM9W67pHnfaoSCk/S1
 iGkIo0eZ9r/zrfKn8UPrup75iqXpGR+HVtZxuavUOPUcgFMvSr7mhEz54N4e+LE6nGW6
 H71qsPqcBomhF33eDLd8gJ0bavuDTambTSkILKPkhg06hc+KXvi/GoineBJlfV/zKB5J
 K47EEIfcRyyx6O+T/3Xzn1/lJaH92AVsIS2pn7bjBhp+MAuo+JsVwMvwtWmP071lKVqI
 nI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WnusAEAyfZfbEUVNFaz2SidIzioGK97iFgSAymrfuw8=;
 b=sXb1uk233R6qGQblu0CIGmEeOp0K9SYoVT6bCOjzYSRafeeTaBnwKNDZ8tJrEjuPwr
 41UqfB3eFMYXPIWP0wNXW8wYFmnI13JQDRQV5jDt8/s31wlOy4J9VIRRJ6fh1CiH3cNi
 3ASGCgNDowaWYrazT4yY3TsVXhNtqEX4/DTr316vKw9qgsge8z0eUw8WIfXqseMOAFOm
 xSDPzV5oSCPKOWilefuwTwA+95yOGbIeh5gJcAU7kcW03OmNpm8EjVhS3/0d1rOJDKII
 lmAtAmPLKPi4Y97DbpY1VjIgV2veHr9J03+jO0b5j/kzE57KpxlKrXzZsAOmUsIkOZ2V
 aP0Q==
X-Gm-Message-State: AOAM5303ortLkMO82FvyOtgkXFEQeSvijlh2vX3KzHGnBzrQnzfiHQIQ
 k906Ev0lkHTUYmWdnepU29YMAFNxhmo=
X-Google-Smtp-Source: ABdhPJydDJCU457bhgqM2Yo8asrGrbPzsQaBZVDgHfdH+Qxl/94QytUiqlSJ6hqPaUgRAIgh8/jWZg==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr47076145wrs.356.1626936884426; 
 Wed, 21 Jul 2021 23:54:44 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id b16sm29245426wrw.46.2021.07.21.23.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 23:54:44 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] plugins/cache: Fixed a bug with destroying FIFO
 metadata
Date: Thu, 22 Jul 2021 08:54:24 +0200
Message-Id: <20210722065428.134608-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722065428.134608-1-ma.mandourr@gmail.com>
References: <20210722065428.134608-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
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


