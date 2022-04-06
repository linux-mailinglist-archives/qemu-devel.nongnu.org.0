Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59D4F6357
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:34:37 +0200 (CEST)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7g4-00031r-Vh
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7ds-0000uR-Q2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:21 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:46598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nc7dp-0001te-S6
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:32:20 -0400
Received: by mail-lf1-x12b.google.com with SMTP id e16so4683830lfc.13
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+YbsXez79aBIQBvhfLmRW92p3RKZFT5OA9WKYM7VT1w=;
 b=l9Z652iWepGrrlJErYgWHQi/wC838YoB1Y19MekUDofe6GxRoGvfmTxhW0u+9Bp8K0
 Fjq1ca/WdpSf/jitGu42cfTNIUD4uGoKdNgf0Ye48fvMoIKhgE6JntzzTbm0tXf2MHRE
 m978u5VCJ0iDZPfWYhFc3RwUQpXFnwiwHHnjS8kgbtcgHPVvMj0dpOGkNXo/p4wG1PVP
 xiicjVupybTQviWOqkl6wFpHVc1Y6jEIL9z+KEjbHFZ4yjlN4maBC7hFOgAf/TrLit3u
 EIXBCK/hk7DlXf96q1ybDVczK5kezSTCH9xPzoHG9ZHMWcT9Bwjn5rYrTPozZfh74hAe
 ZAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+YbsXez79aBIQBvhfLmRW92p3RKZFT5OA9WKYM7VT1w=;
 b=NcGnir4DGaluBarEAeBfRECc0Mx0BKDmbfYaMgjILMCSuqBci13Ewh2lu3Rlixe6Z3
 oibf3gCe27j52T3FoEdgjc68vCDYTFxv3RTm4jWx7ahj3QN/QSCMuM0vhudSQU+Aq4xd
 7urHun4CoFxFdH/5htNW1Ej1Ba9ZOyQXt7+tsNH0LPVebUN5WziNeprz2iHQ0c0S+Wj7
 GwB3VnPRJjeDn44Ag+5h7FQSsRnxTnsZAe9z1nrOzv6sOw4SPBkD3yUZvJ5F5YZhbMID
 HNXdC5p+W6cICDv7F2fTIPqlE4E32cfmhT8KSouOQC4OTplOCpmQkkaR3wu9Ea/UhS2+
 A93g==
X-Gm-Message-State: AOAM531WMIqijPzvbzHb5eXXkzL3hNi3i7f9kJuiDFQllhXt8HNAGhjC
 QrXiowratxo424ZAMJhCUO1GLA==
X-Google-Smtp-Source: ABdhPJwYAOxSv5dQjd1e4i1YOp7QmsDGFuFz6GSsTeUMOyf1lUD8RfYJ6m/th/7Jn/Rmd1MwT0mxqQ==
X-Received: by 2002:a05:6512:b1b:b0:44a:9ae9:b9bf with SMTP id
 w27-20020a0565120b1b00b0044a9ae9b9bfmr6275935lfu.365.1649259135946; 
 Wed, 06 Apr 2022 08:32:15 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 m20-20020a056512115400b0044aa2184999sm1861378lfg.142.2022.04.06.08.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:32:15 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/throttle-groups: use QEMU_CLOCK_REALTIME for qtest
 too
Date: Wed,  6 Apr 2022 18:32:01 +0300
Message-Id: <20220406153202.332186-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406153202.332186-1-vsementsov@openvz.org>
References: <20220406153202.332186-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, berto@igalia.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Virtual clock just doesn't tick for iotests, and throttling just not
work. Let's use realtime clock.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/throttle-groups.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index fb203c3ced..029158d797 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -753,10 +753,6 @@ static void throttle_group_obj_init(Object *obj)
     ThrottleGroup *tg = THROTTLE_GROUP(obj);
 
     tg->clock_type = QEMU_CLOCK_REALTIME;
-    if (qtest_enabled()) {
-        /* For testing block IO throttling only */
-        tg->clock_type = QEMU_CLOCK_VIRTUAL;
-    }
     tg->is_initialized = false;
     qemu_mutex_init(&tg->lock);
     throttle_init(&tg->ts);
-- 
2.35.1


