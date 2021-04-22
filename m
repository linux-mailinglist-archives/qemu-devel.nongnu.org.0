Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7C367686
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 02:53:51 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZNbK-0005vj-N4
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 20:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYr-0004i5-6i
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZNYo-0006YJ-O3
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 20:51:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2228332wmy.5
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EqUfSAg+SkgsLP4QrSoWoVHrKhsANzTFjajqpdzr44=;
 b=jzMwSx5JIvnwe9YlCc8rFK7iRrFR2JLZcLKzgrB4aVxGnEkk9Nse2G7RmhOsHsYfBT
 gb3TUIR8v5Nep4P+ob8xH3W1NeaIS/S2jPkPSDUKzRIII/E7EIakhnVJpaa2jlXDnUlY
 Gho+1/z2lGhMLzSrJ26SnkImmigPh8nuCWShzz5EQqA9L3RcaHsQWJ9kLk5PmoikRYDa
 ahKGMgdGc+vPoN0W1dDI4XEvDl0twH7/Mkkh3bTHUEyQeeswDD7HveeR2lk6ItxXVmL2
 OSWd7rnss7FHA5GQFrz8Hw5OcsrUuuJDUu5z+vQJtSxM8lAfpsCvC6snKwxOa9yTdIyC
 +pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EqUfSAg+SkgsLP4QrSoWoVHrKhsANzTFjajqpdzr44=;
 b=G5+rXhFxh5/WObnZDA1TFqiO0A3xkYqqGxbQ7cVdQby8eyJGApJivyQnht5oAxOKNh
 tJWmT4vBQhDQqEZoO9mw3Q7mKxiEvxChgTeinsC3R5I+A0q63Emj6jP/31uJsKATBHhC
 cYZVwoey9/YY4zpmicZ4jnyPc5/o1FHT+pCyvPbSDycPWq2oBNf1GWjHwDRfdvuyV/iN
 SnWn3KtjrWaZT+DBzPRxJyFrqPskGSZi2p1iYRDsViB+bFcnSV0cZw1Ej1a2/HeyqMR2
 dqsDprnFCh9kDdIq5gYiXoZ+7aW1RpADfheu+NW3ChKo/BRLQQn21awp/HktVkoGZL3b
 Azlw==
X-Gm-Message-State: AOAM533T9DCq4kTS4yPbPoiVCxFDyiZA++p25Vj0ccwSJhUdWOd0bhra
 Jo4dthva9cZ8PC9QPzVIcC90VlJ4wnc=
X-Google-Smtp-Source: ABdhPJwX6tXQTrbRP94DX8gEJ4hEP2omyS+qrxxC+S23ZQ3jQAy8ytn5jT61kKxxRE3yutAsg7eFJw==
X-Received: by 2002:a05:600c:2148:: with SMTP id
 v8mr12345227wml.167.1619052673153; 
 Wed, 21 Apr 2021 17:51:13 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id 2sm3734607wmi.19.2021.04.21.17.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 17:51:12 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] plugins/hotblocks: Properly freed the hash table values
Date: Thu, 22 Apr 2021 02:50:42 +0200
Message-Id: <20210422005043.3569-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422005043.3569-1-ma.mandourr@gmail.com>
References: <20210422005043.3569-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
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

Freed the values stored in the hash table ``hotblocks``
returned by ``g_hash_table_get_values()`` by freeing the sorted
list and destroyed the hash table afterward.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotblocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..64692c0670 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -68,10 +68,11 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    rec->insns, rec->exec_count);
         }
 
-        g_list_free(it);
+        g_list_free_full(it, g_free);
         g_mutex_unlock(&lock);
     }
 
+    g_hash_table_destroy(hotblocks);
     qemu_plugin_outs(report->str);
 }
 
-- 
2.25.1


