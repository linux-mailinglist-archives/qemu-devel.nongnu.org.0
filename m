Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D724ED038
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:36:43 +0200 (CEST)
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhrm-0007zC-Um
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:36:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft5-0008GR-KP
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:56 -0400
Received: from [2a00:1450:4864:20::12d] (port=40625
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft1-0003Lw-So
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:55 -0400
Received: by mail-lf1-x12d.google.com with SMTP id t25so38067548lfg.7
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tG4qRDp75q7RazPHtwh5ErdEyaOnIwmsEWlnL+y4BaI=;
 b=afx+qONuDHVYmO1beNEEbqEeyp+LEmwn3hzUv5F/hWwo55WYx9i+LfV6DiiiCjeu7I
 QQCL+/WFBJCiwvlbBrzUQiG51oIyTt/9lIX8mQHUTOKfG6z7uIl1sRuKiVA9Nl7p1KQb
 AElX55UexLQfQ58IhzRjhy5Xd5N/j7pKoHA3uK8dhnmZxi31bFaN2wUBo8JfpKS1KXNi
 mj2X/4OFMIDp3K2DZYxmYpf3DCGpcutMleyHqW/K35gdg8pKd8rBOcirlWrVgTlOS9G6
 VmHFvUfrV4ZQ75KJ0nwmmOqbs8fzTNxLivDwWcKC6x933cdaCL4UK9OITmYtypesCAwQ
 sKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tG4qRDp75q7RazPHtwh5ErdEyaOnIwmsEWlnL+y4BaI=;
 b=CyNSPFFNtlsim8fAMHi+/dOHhLEbcv9Y1YH5v74hGrfxdxLFIvQOz7sMzIdzl8WGQr
 1dWen8SFy1QxI3v883MPlvuO3FTBdelLToVM0okuXpU2Hkd9hKVFI/1Qu4aRA2YB79zm
 PyKkH3HEo8b8gbtcWN6SP133Pz9MafltXIYhhUacFilDM7wAp+tw7pj+hMvAnJqQBL+l
 7vcosPQsdIZJDVNsrEUN2bIrdtsTgI/ciervi1rm9vvMcyOw1HZXsGnIjNgN+mPIMTfS
 /8Zo1qRvyN1X8pJc422JIGZmchUubOTnO7/GsSAXQiHU0WKcQzXPOzwXhqvsrav0WmJd
 +k6g==
X-Gm-Message-State: AOAM53378P1hAJaQ4hT0XnoALt/WgvsYurcVcBim4VthqAXPv0NPodFM
 88lWj0bB6+5f8nEEbexJMcQjBw==
X-Google-Smtp-Source: ABdhPJw8W96ttf7alxDrg5dnCzP4JH9G+s65n7NSnRO2WwP2gg5DM08ZiGxWqoobSVk4NlCEfIFUpQ==
X-Received: by 2002:a05:6512:31c4:b0:44a:b45e:b0 with SMTP id
 j4-20020a05651231c400b0044ab45e00b0mr7937426lfe.494.1648675790210; 
 Wed, 30 Mar 2022 14:29:50 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:49 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 30/45] block: bdrv_insert_node(): use BDRV_O_NOPERM
Date: Thu, 31 Mar 2022 00:28:47 +0300
Message-Id: <20220330212902.590099-31-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:25 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Further bdrv_replace_node will refresh permissions anyway, so we can
avoid intermediate permission conflicts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index ca0b629bec..17c057a962 100644
--- a/block.c
+++ b/block.c
@@ -5420,8 +5420,8 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *options,
 
     GLOBAL_STATE_CODE();
 
-    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options, flags,
-                                            errp);
+    new_node_bs = bdrv_new_open_driver_opts(drv, node_name, options,
+                                            flags | BDRV_O_NOPERM, errp);
     options = NULL; /* bdrv_new_open_driver() eats options */
     if (!new_node_bs) {
         error_prepend(errp, "Could not create node: ");
-- 
2.35.1


