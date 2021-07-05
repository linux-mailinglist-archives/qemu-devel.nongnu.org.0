Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3793A3BBD57
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:09:07 +0200 (CEST)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OLS-0000x4-9Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OI0-0002Lt-5y; Mon, 05 Jul 2021 09:05:32 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m0OHw-0008Fc-RX; Mon, 05 Jul 2021 09:05:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id o18so17607858pgu.10;
 Mon, 05 Jul 2021 06:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BboCVf08aC01Ks4WA1LGZcW6OPVNG/7Re1XPl/AdI60=;
 b=oaM+AqDcou2w++3W64zzjsBBTXXF9nu5MIUMZ1T3hUSpKozniwc895lLEovLTRRKLQ
 H6d0sWEtFRc8o1RZNTZbbEJs/OyQj9JjWNdouFf9JF+FhHx1RqBuivdYA2/mFjgtjGv5
 XMguAQrjDf7qiRnbMJgdgDjf1xz9JGzNzy/KN47UxJPIwZ0WdXzkCoGIC98JCHTYrP3t
 UO9F9AWXqz70kTh8UWaSx2hQCTwhzwHcAsMYR86hatBmIcz9xreY1gdj/j1M/tyJtZTg
 OFrzPgO5sRbJDG2sV38LFNV+MMso7wY1MFfvnV7ffg3496wVQPQvYPb2zF/cGeFCqPHC
 BMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BboCVf08aC01Ks4WA1LGZcW6OPVNG/7Re1XPl/AdI60=;
 b=Wv1JkvtIX8nVEOsPceNe+Y2iTIeUXJpE/TibYFurNr0R3U7q6IEDRnbdu+l8dQF45/
 AtzuCuraNkbve7vwj5I4nr6MAqMapSyVHZ+jfNnGr7EKNdNJT86wC8DNFnyM9m+VuiRP
 /ugRKDwsEMQTHfdF17YSp7JR9weOOLteJCOlh1tVUk1H0vioXJ7R61EOzLSY2Jj56gY1
 4ysjz7Ob0SaEkEULhQsU2sTtvb6K/0LzevRbx51S/JNaFUhiVxJfMwHaS3Yr/j28HfGF
 FH87Qp1WOt1UBukCWaUzcXrgWZ3H2p3O214RJbP9jgHCO1Z99och2/L32uq87d8ntnPL
 q6wQ==
X-Gm-Message-State: AOAM533EiVDxa7Ep39kUEMdbdInWAbYFnyMVT3xuJY9kHdAZz6lrrK0R
 B9eJiUpYnQdFwdSB+TUT2II=
X-Google-Smtp-Source: ABdhPJzBEy88oySCJv5/uQi+rDkfxoAgeHYQPMIsjwbEldTIR6PtLh2PXZXceFL8QeQhUvjeyzU58A==
X-Received: by 2002:a63:b48:: with SMTP id a8mr4249736pgl.169.1625490327020;
 Mon, 05 Jul 2021 06:05:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ad14:b651:2921:88e5])
 by smtp.gmail.com with ESMTPSA id s27sm12727263pfg.169.2021.07.05.06.05.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 06:05:26 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v5 3/3] block/io: Merge discard request alignments
Date: Mon,  5 Jul 2021 22:04:58 +0900
Message-Id: <20210705130458.97642-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210705130458.97642-1-akihiko.odaki@gmail.com>
References: <20210705130458.97642-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, Akihiko Odaki <akihiko.odaki@gmail.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Konstantin Nazarov <mail@knazarov.com>, shajnocz <shajnocz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 block/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/io.c b/block/io.c
index 323854d0633..db19ae2bd9c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -125,6 +125,8 @@ void bdrv_parent_drained_begin_single(BdrvChild *c, bool poll)
 
 static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
 {
+    dst->pdiscard_alignment = MAX(dst->pdiscard_alignment,
+                                  src->pdiscard_alignment);
     dst->opt_transfer = MAX(dst->opt_transfer, src->opt_transfer);
     dst->max_transfer = MIN_NON_ZERO(dst->max_transfer, src->max_transfer);
     dst->opt_mem_alignment = MAX(dst->opt_mem_alignment,
-- 
2.30.1 (Apple Git-130)


