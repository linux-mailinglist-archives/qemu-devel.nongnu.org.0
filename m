Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C37A4ED001
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:26:30 +0200 (CEST)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhht-0003H2-Bd
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:26:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfso-0007tW-SS
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:38 -0400
Received: from [2a00:1450:4864:20::22d] (port=43578
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsm-00039j-5G
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:38 -0400
Received: by mail-lj1-x22d.google.com with SMTP id b43so24945398ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9OJ5RXIXg4BtdAWW5pGtNxedO+9gKWycHuEOgw/Gm8=;
 b=LcEAg7mmGFfZ/2L8Y2Ccz6hlkFtQz4N6TGMjk6tDlhWcJRi6xVCDlP7B+mTvrHrDLb
 Rhs8sbrJjNNDar+nwjFsUMhjaPeo1nlgBz9la3ukz6BQGFjjTdJl7if1RrqzQ8wjAeDe
 7EtzqAdja9r0EmsOL9HP9Yl3FwiVCiYgPlHISVNkhhyeGcfegubpB+7QoRSJ8RP7SjhR
 AraZbndC8CZK5bubo2Pm2mu+d5ANy8jAtN/pKM7fXgednm0+AE+PimaelOxt4Y7WvUlK
 F7fMYWwnfBvI9ATfTmj6WDIG6VVE5LLNHzY9Hjub+A4uYYRsr8n3rwbRUGXJJvgIR0rN
 JdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9OJ5RXIXg4BtdAWW5pGtNxedO+9gKWycHuEOgw/Gm8=;
 b=4g6wxMj+5mfqowprsjs7RQiWyJxyZyXUET3FnwyTAnyNN5KeFYFM2qiepGJny65bXi
 RvVpwSpFFSpvXSw0DHF3KWdjGSbmh1OoZX+L5ZFhVbHOsj60IcjMXwBs4ArDow+x3d1+
 PlB4EFMy15qyDO+eeknss5f4MRMh6J2NAy1V/e4ZbXzMQ9UbR7g5aaIAxgU0az4mE7uA
 ODTAyRVzPwL9B0bcYCNigz5wf+5iv2MnOg3lHkRs09KVaeCG7cJiFherriHBjEoe/U/5
 EiuqGoWynZ7bMcyiAm1IHKC3NiH/GUz6w/YbeUTLrXCj1VysX21zcTANMN6o7iMF201m
 ACcQ==
X-Gm-Message-State: AOAM5320uLy8UE+hShgxKtpy4Ii2daRRb/kxWhYp/pFULs1bBz7ohfDY
 afarzaqgyZ5V4C9J8GvBeVhEWA==
X-Google-Smtp-Source: ABdhPJygFBcJUg+3Z4yh7tTnM34yWgXgcv4fFKZwolJI6zAJS3pLvzOONRn4ugSP6uDllUNUlxw4/w==
X-Received: by 2002:a2e:9053:0:b0:24a:f0ac:bd7f with SMTP id
 n19-20020a2e9053000000b0024af0acbd7fmr2216414ljg.425.1648675774646; 
 Wed, 30 Mar 2022 14:29:34 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:34 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 05/45] tests-bdrv-drain: bdrv_replace_test driver: declare
 supports_backing
Date: Thu, 31 Mar 2022 00:28:22 +0300
Message-Id: <20220330212902.590099-6-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:15 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do add COW child to the node.  In future we are going to forbid
adding COW child to the node that doesn't support backing. So, fix it
here now.

Don't worry about setting bs->backing itself: it further commit we'll
update the block-layer to automatically set/unset this field in generic
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/unit/test-bdrv-drain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 36be84ae55..23d425a494 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1948,6 +1948,7 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
 static BlockDriver bdrv_replace_test = {
     .format_name            = "replace_test",
     .instance_size          = sizeof(BDRVReplaceTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_replace_test_close,
     .bdrv_co_preadv         = bdrv_replace_test_co_preadv,
-- 
2.35.1


