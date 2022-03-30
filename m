Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE534ED071
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:54:07 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi8d-0002NY-1A
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:54:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft7-0008HA-4e
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: from [2a00:1450:4864:20::12c] (port=42538
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft3-0003NQ-Ml
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:56 -0400
Received: by mail-lf1-x12c.google.com with SMTP id d5so38070828lfj.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYEWypywAd4uJaDSkR3S94BPshZVhwkXw90EpvCll0k=;
 b=G4nobmCWAOhtg5is5Wp3ir+MH70+E95IgqOnHW2ght++jS1Ri4Jv3weYL8PCGzm2Bc
 C8j8hOHk3LqULiQ9PalG7Z+r5eS9rOLTPMMqnKuOMd604tjF1KGTcG1p2KgQhN8gh1FH
 f6SCJgnWNW1TtQ3OMWZr2wAbwKLy4CpFfkReLQx9LnWflBgUeF2U1TM9eUTFQytK+cP0
 BgxBBDU8EBGdlN3apZWXVuienPIYCPOb1KicRadwcDyWyPsmrJOOnfb0WTYo1yZ4zWmI
 OePBOr69s7tfsJaki+MWAqcWGMWlNjC36noA0zIHglWmf+FXzjPwKGmaKkOG0IxXyVzt
 uqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYEWypywAd4uJaDSkR3S94BPshZVhwkXw90EpvCll0k=;
 b=1MHp7zBxb2hkErwIrHnBlCNSkwwAWNyyITDcMloiO0m/ygCmIlFWFmYHISAXpeC2Zh
 jfkGmSMw/1vQhX+cnqj3nTaNzd96mZNPGBvXr+yiAfGAanaiZPPf+bQMiOq5YkaEbN4k
 PazViMdVPnAAySWd6gu/Y3nw5ZVSJ/FsvI+4XdK2hpL6y/6mHGhWisu89EP550c874X0
 lR+zhaQymO+WTG0i5MBzRsShxNAtnZLoWekus7tASLEcdccdn/FuNowDRffHa2ENb0iE
 iy8EmomwTugrMfh79u0K6uiPZB454JqZy2l48SJX6gF874WWAIjGluwRyw5Wsyt/oL7E
 8d2Q==
X-Gm-Message-State: AOAM532LvcikItJmePgaKe664lApKg/eZUZfEe3uqIukRb26x3Jv9wFf
 xyT5DKvogeza9hC6B3FZgj9cbg==
X-Google-Smtp-Source: ABdhPJxQ0ZdwAa7jHEldvWvcIVY11VNtShCb0ijeCrzlZEaSvveKOjSpsMizkr0NXHyuNugh63zN2Q==
X-Received: by 2002:ac2:46e2:0:b0:44a:3e96:3a15 with SMTP id
 q2-20020ac246e2000000b0044a3e963a15mr8414678lfo.336.1648675792067; 
 Wed, 30 Mar 2022 14:29:52 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:51 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 33/45] block-backend: blk_root(): drop const specifier on
 return type
Date: Thu, 31 Mar 2022 00:28:50 +0300
Message-Id: <20220330212902.590099-34-vsementsov@openvz.org>
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
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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

We'll need get non-const child pointer for graph modifications in
further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/block-backend.c                       | 2 +-
 include/sysemu/block-backend-global-state.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..f5476bb9fc 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2618,7 +2618,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     GLOBAL_STATE_CODE();
     return blk->root;
diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
index 2e93a74679..0ee6dced99 100644
--- a/include/sysemu/block-backend-global-state.h
+++ b/include/sysemu/block-backend-global-state.h
@@ -109,7 +109,7 @@ void blk_set_force_allow_inactivate(BlockBackend *blk);
 void blk_register_buf(BlockBackend *blk, void *host, size_t size);
 void blk_unregister_buf(BlockBackend *blk, void *host);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
-- 
2.35.1


