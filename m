Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C90366DCD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 16:12:01 +0200 (CEST)
Received: from localhost ([::1]:43194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZDaC-0004SN-IL
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 10:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDYa-00036O-9F
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:10:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lZDYX-0003El-Re
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 10:10:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c4so2612688wrt.8
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZpYsYIIWwDjQfBvMvJ2wOCRY7GzZq3+BJCpSNNvhRY=;
 b=Rd5SHm4jaDQf8q5zC+vWpdwwgQ9yxmzUxnfJFgCnKqLAbSlRzvh/HWayKBifaZiY4V
 aB367ej4sXVcwv4x6LmmhMuc4BYd3PaGiMVy57AAWvf0Evaggp6ebqITgKy2Bk6bI/Ho
 tiLh5ElzKKniI+SUMfkExzH2bY18FJDKM/ER8S1dLCSBG3x4GvFNFYibAKmIfgivcfTE
 6MFJlhpK/qDVagxbDVsCR7xd3p2vrD0kaTYQWm79eZkMMd72fJWrMLeJRCQFNQttRHlE
 goSBMjRYwBn/gNquQ6LE/oSbv3G519LXAktcexjPtc1uvvza57SPSwPO/q7AeKBUKbRf
 UfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZpYsYIIWwDjQfBvMvJ2wOCRY7GzZq3+BJCpSNNvhRY=;
 b=kVjbiq75nH+c0ZjKOHGh0zk/ae3nIaC12kxKAd03045N+5H2Pwb1t8bcnWLdjCR66L
 Hf2wtWtaWMc0ruUlgv5+O10pAqtmlP5Z6dbWgFkAQaqiZ75Ac472sUrmefSHsCOuOb/o
 /2Vyj7t0Xe3gwxFp/0jXlcEjAFOuFEhvWoQ3v6Casw8Nz7Q+ziB3wNhUF48/ibQo2TeT
 i3gYCPhWDOjAkqeytXwFVlaN7mJR1+4WxlbOBcYAaJhmSwWkGPaun5ufMotmfa77WJAE
 nNichdJDRIr45V+rdjZIIQ+6CPxblg/yq3A/7W8rqqzik3TlKIWrN4smv5cO2qWYvije
 bYbQ==
X-Gm-Message-State: AOAM532j6s6vVJsumSz5l3ltqNWb52I6oM5GWTlyOe85xipvGELV7go/
 iKBND8uUZwEu+2z7wF+ZA30i+fGx6NI=
X-Google-Smtp-Source: ABdhPJzpDQVqstEK7FpG7/h0ayAkfVLj0fqmKv0BYT6Nk7oMnqhAGhHdsVJGAnVRDwT85tQozbs1Vw==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr27195343wrt.190.1619014216314; 
 Wed, 21 Apr 2021 07:10:16 -0700 (PDT)
Received: from localhost.localdomain ([197.61.162.183])
 by smtp.googlemail.com with ESMTPSA id q5sm3273407wrv.17.2021.04.21.07.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 07:10:16 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] plugins/hotpages: Properly freed the hash table values
Date: Wed, 21 Apr 2021 16:09:34 +0200
Message-Id: <20210421140934.7561-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421140934.7561-1-ma.mandourr@gmail.com>
References: <20210421140934.7561-1-ma.mandourr@gmail.com>
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Freed the values stored in the hash table ``pages``
returned by ``g_hash_table_get_values()`` by freeing the sorted
list and destroyed the hash table afterward.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotpages.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..2094ebd15f 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -94,9 +94,10 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
                                    rec->cpu_read, rec->reads,
                                    rec->cpu_write, rec->writes);
         }
-        g_list_free(it);
+        g_list_free_full(it, g_free);
     }
 
+    g_hash_table_destroy(pages);
     qemu_plugin_outs(report->str);
 }
 
-- 
2.25.1


