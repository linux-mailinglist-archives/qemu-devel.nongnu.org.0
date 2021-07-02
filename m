Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EE3BA3A5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:29:51 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMz8-0000dV-8u
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuJ-0000Wu-9s; Fri, 02 Jul 2021 13:24:51 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuG-0005qk-3W; Fri, 02 Jul 2021 13:24:50 -0400
Received: by mail-ed1-x535.google.com with SMTP id h2so14243743edt.3;
 Fri, 02 Jul 2021 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QW7HGtKv0C0bEpd/9qc96su0QZ9Z5ghcYE9uCBmlmvs=;
 b=mijmvg3qsaaEuA1AMDZJx7ACShmdrhTQh9BqP45cl8HMvP+rVFAHAtfC03LgPnilp2
 3QHjT1isaUIePLJV0MQJL88fV4SwyRSTLrSQJXd0yM4tgDTc/9Pvv9iOEVaYgYBteedV
 2GnmKnB4Vk13DyQSNm+fZ1LQCpFSXzCUGcoqzByLh6aplHO8mQDldpJvJh8qF3zsAVGo
 0JvU0Bt5QQyo6TNXTpUgz3XJPwlWqUPMxUGzbO0/hYDcVdKIeqzdV/9jCodb8jsnS1sb
 0qOQFeqjA5dJinWCuUJ/8Lh4c/X+hKzhpul3AzPC++ndboekfCgZI2Bd6yFt5YXjO2B6
 ASmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QW7HGtKv0C0bEpd/9qc96su0QZ9Z5ghcYE9uCBmlmvs=;
 b=X/0+IqmiWK+Fn6OipazvXsI0vcn1t+aI2yapinuxYCux3SlHmh/tYbxezjWcoIael1
 d1XNfR3G+luILGQopwDPXztT3dQWfPhc/aGCbTyzOdqGK/Y/ALPEXosBw1AczHIZds+8
 Yyy3tYcKiJ/YeO5DyLPWRx3q0nxIg66LjjnB9pLiL0iyTs0ecWexsAXzW49NAbFVNUyv
 YgIhq9KK207DSSkiNbN1LqQCNW2qDQdcRy7+oHu5wMzQ7vs4UMcXMyPfNJizkT/oYASJ
 Jcz9uIVLdPFpFmbDZkOzxC+23wOPtetC3LZfFOadfpxk20l0rbz/AMPlaanZ2+OqijTl
 F6LQ==
X-Gm-Message-State: AOAM532tyADJnP1neoNITB7JcWjnMGZcOumJMp5Bm1VIZM+P+/OIEX5m
 Jkjf1DGPuGZzfcZeW5jN3w6DAfKT+FYYWw==
X-Google-Smtp-Source: ABdhPJxdATciiHw4a7rIeb7z5PB6uoRgbxP/rN90gGGPFzg69Krbn/FliTqhAh24I68feIvG5kahcA==
X-Received: by 2002:aa7:c758:: with SMTP id c24mr749524eds.178.1625246685842; 
 Fri, 02 Jul 2021 10:24:45 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:45 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 6/6] block/rbd: drop qemu_rbd_refresh_limits
Date: Fri,  2 Jul 2021 19:23:56 +0200
Message-Id: <20210702172356.11574-7-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

librbd supports 1 byte alignment for all aio operations.

Currently, there is no API call to query limits from the Ceph
ObjectStore backend.  So drop the bdrv_refresh_limits completely
until there is such an API call.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
---
 block/rbd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 3152bc8ba00a..01a7b94d6257 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -240,14 +240,6 @@ done:
     return;
 }
 
-
-static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
-{
-    /* XXX Does RBD support AIO on less than 512-byte alignment? */
-    bs->bl.request_alignment = 512;
-}
-
-
 static int qemu_rbd_set_auth(rados_t cluster, BlockdevOptionsRbd *opts,
                              Error **errp)
 {
@@ -1482,7 +1474,6 @@ static BlockDriver bdrv_rbd = {
     .format_name            = "rbd",
     .instance_size          = sizeof(BDRVRBDState),
     .bdrv_parse_filename    = qemu_rbd_parse_filename,
-    .bdrv_refresh_limits    = qemu_rbd_refresh_limits,
     .bdrv_file_open         = qemu_rbd_open,
     .bdrv_close             = qemu_rbd_close,
     .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
-- 
2.19.2


