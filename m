Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C313366DCE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:12:03 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDaE-0004Vc-96
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDYa-00036Y-Th
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:10:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDYX-0003E6-OF
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:10:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so1404491wmg.0
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6EqUfSAg+SkgsLP4QrSoWoVHrKhsANzTFjajqpdzr44=;
 b=CH7dLPpWVg3eYPR7sj7x4WZ2vfXbs2rbXHlXxFZ2pt4wMgua72c4iKU90OpIqvaJxC
 gIIq4Kky6+bMZ8zxp7KzIHeTb44lnv4jkrbBcFPH8aMCpMmiQzB6ZYorXfWPzXw1thrz
 5Q+bdljYyov+KsHJOEgZ3Vqw1EijRBO9bsDz3MHPkskOqHOGJGv5GNs0wPZOTcI2joj5
 cSgNS8p73Ni9EwYyopCwa26IctuzrPQ/pBtHJJGooFqX+vKXo+mtKAsZbsnpPgLuW3F2
 QCyfRwB4YzIwOGeynbtzHdDYWclYZ2jDclcxucmFfht2AKgTmHatBlewwBDbh0UYlbo2
 dxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6EqUfSAg+SkgsLP4QrSoWoVHrKhsANzTFjajqpdzr44=;
 b=tHnx0CvD/h4PNwADb0t49eTKXuqC/0lJkE56BBKKEOauwZ1ieHluA+BjaFJNmRvJmw
 QX1hxt5BNVHB9VmZHYGxWj0w1E8Xs5nFqAbV0hVWjp8l0SnKjCnRBQEMRlS95ynisaDl
 KAJRj6DsdG7kfg+/2ASLXodTVh5PTQAUTzDZxUNYWvygwRLi0xHkobLvbosF3Y86Fknn
 nI2SW//mV/31WUrCvg8XyID+TmHBe57p9POuP+j80T3T2yRYFaS6jeTe3wVJXAGYrGZC
 SsZlSwxLtuXsTQOcJYDCLyCvjIJjYXiqHGKDB1JrICuvtxoMyvbDNQ027WCqZ/6lxkQo
 f9sw==
X-Gm-Message-State: AOAM530AR415RZA0DKg01FkoVkYYK3QhFSl2AazLVXMouD8M7J8yp+Oa
 icunqsyBtIeWkzNaTNebqhXv5/+hvUU=
X-Google-Smtp-Source: ABdhPJw1E5/OMqpPh4bf/EQP2WoBVQRqSmyY1GvE+T6rCDvyihtTHKJy389FNx4eSkNdfzBFiOmn1Q==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr8169231wmk.2.1619014215211;
 Wed, 21 Apr 2021 07:10:15 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id q5sm3273407wrv.17.2021.04.21.07.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 07:10:14 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] plugins/hotblocks: Properly freed the hash table values
Date: Wed, 21 Apr 2021 16:09:33 +0200
Message-Id: <20210421140934.7561-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421140934.7561-1-ma.mandourr@gmail.com>
References: <20210421140934.7561-1-ma.mandourr@gmail.com>
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


