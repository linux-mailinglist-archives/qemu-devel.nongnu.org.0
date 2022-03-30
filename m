Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E6A4ED000
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:25:03 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhgU-0000sW-EP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:25:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsm-0007rc-PN
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:36 -0400
Received: from [2a00:1450:4864:20::12c] (port=39794
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsk-00039N-KL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:36 -0400
Received: by mail-lf1-x12c.google.com with SMTP id w7so38087193lfd.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4WZxi2Hv1Mu9evftq2+HMaOyt8YOtbqwpKKMvDGn5w=;
 b=jgiqym3eyRavWH4NLio6f/vZpS9aw12fvrFkHC+9r3YWEkqEozFAB5i+cRoxMq4+fi
 v6sJJ3XGL/J8Pqj7RBsJtMm88xTT+AiWreXSthry7/Jb5yMZIohgksHpCFV0QbmSR7HR
 DPd67MRetyiDmVbRN/xXgfbfaEMXRxtb0hG2Q0dVkoCueEC5gDG3Aw/5MEwkbAAEZCVd
 z7mQXhtqYOGxAA1NVAzhAWG1nSuGmmyJdoSixeTyQwU6LEPZ8JtCGbMX7tnRIVC6R2gY
 YAuCTQN67c0Q022XTrt3eFFDGYSd/eknxoFvhC2Vi6yb9liigCBlsWNyfmH/Yl468u/G
 AOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4WZxi2Hv1Mu9evftq2+HMaOyt8YOtbqwpKKMvDGn5w=;
 b=G1wnLcWkDGT7hl9lwrlKA7PzlleFx0cU4O3wdNdPMkNgT7gKhzxTOuHrnjOdHqjH9e
 gB5JCuA8Hj4jqgRZdQjzXYw1+s33RMaCcnNcHo3K6z/nSiMlU3CCEZc4WmXKB9uz4ChE
 xgnoK+84CrvdPKIJOHY7i41TW2rqzTyH+WoesiNl/7IedwFxSOF8jjZq22YyoylHmxgv
 KW+S1dmUtR9gb/6tGxOog1r14IQvvp9moCpSDAUGBcy2YL6TknkXNj0xKum1eE6sOV4Q
 okmImmwcr8yZHuhcVoTD603ZMlDkzs5Te91G8Rua7TayajCkauclBxN9U+HoIYezjxi+
 AVaw==
X-Gm-Message-State: AOAM530/16f9Wpsk6re5IkR5vrakDRwktVDaD6gO5XMSHV9op9P2p3fv
 yvBuJxhoLUd+O2dKiJJ6Lct1NQ==
X-Google-Smtp-Source: ABdhPJxhqk/Qu7sQeNlHk3LF6eEFUqHW2BqUCTCewU1RMlHOcpZyb30V9QmC9/n5mvRmqvpx1gdCzA==
X-Received: by 2002:a05:6512:2256:b0:44a:9868:c02f with SMTP id
 i22-20020a056512225600b0044a9868c02fmr8543429lfu.501.1648675773077; 
 Wed, 30 Mar 2022 14:29:33 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:32 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 03/45] block/blklogwrites: don't care to remove bs->file
 child on failure
Date: Thu, 31 Mar 2022 00:28:20 +0300
Message-Id: <20220330212902.590099-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:13 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to remove bs->file, generic layer takes care of it. No
other driver cares to remove bs->file on failure by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/blklogwrites.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f66a617eb3..7d25df97cc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -254,10 +254,6 @@ fail_log:
         s->log_file = NULL;
     }
 fail:
-    if (ret < 0) {
-        bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
-    }
     qemu_opts_del(opts);
     return ret;
 }
-- 
2.35.1


