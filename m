Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E83BA3A0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:27:03 +0200 (CEST)
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzMwQ-0003gu-Lh
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuF-0000P3-2M; Fri, 02 Jul 2021 13:24:47 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuB-0005nj-Fh; Fri, 02 Jul 2021 13:24:46 -0400
Received: by mail-ej1-x635.google.com with SMTP id hr1so13881238ejc.1;
 Fri, 02 Jul 2021 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UkB5Cg3l7iFacBNKZzOJcUMJJe/Nc5QbHYWn+q/EE68=;
 b=iKHX282rp5KLgbD5ry8S2DyQaAJZfythNrgS2/+g8JU06LGI9bfB5eXlNPpkwN66AP
 /GSaVhxAXr2RiWjdxyuW8cE6ezzUfWSduw6V33ZPMfjqOZBOHPRQIqRp5Ofcq5TBftyl
 Dbxn9C9rDtJ2VET9+w6WcF0K7uib4TKKXBxpEjnYn5GhHRJc4aMRSOyfBGZa9y+9DHUj
 H/j1++/dWugG35lOpYqBMaI/uEOzrOuVxf/yRtNyHcCGbIoSN2fEodfF+fzl/G4Skd49
 gBgCGKDqEdCHE1tdOg7YO1pn0kVJRH8qEA3t8IJQW37+GRxmu3w7Gg1z/MZG6keVC9Y+
 IS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UkB5Cg3l7iFacBNKZzOJcUMJJe/Nc5QbHYWn+q/EE68=;
 b=qZq1swhPDv0Rll5Sz4sDhp3IxBbEeRSD0D1Oh8MKjrtw/0aLRql2dWSme/cnXL4gTH
 M+qG6VzExAgkZKdaHxg9xt7/s9KIlQDuc4BpcqcQpixcXchVX4ow7WAGUP9BG2NKojqG
 y/r+zalG1qkpxfsWUQnerYUVpWytTjwQltqHaJ/b+VJ8hKwcNqgVIqQn+xkYma/QSuJq
 VR6Ja0ePoVuiPlMOA80CWZ48bfpo7o+8Gu54YGpYalQaAHMgLmNhAPhw94u7kkTTEnIP
 br5d+9uY7FjV2umG1ECjlOPEc8GX+c4JE6HyoOD2gcoe05u31OULq30ruuwe6inXm1jt
 cmEQ==
X-Gm-Message-State: AOAM531mwL2pu8UaYqimfEAhxlN0rPU+r+cATcCF4fZx4tGFl1dFNrCx
 qnAOL20HcHSA5IIOVsvgiLFJ5SjE/sD32A==
X-Google-Smtp-Source: ABdhPJw84bu82coLuzFw6JwDPUNDjg5pwxYoWXMr68YxBEwVxfqwdbu1KbqSXks5wIAUeZFlp+C8eQ==
X-Received: by 2002:a17:906:70cf:: with SMTP id
 g15mr825231ejk.366.1625246681881; 
 Fri, 02 Jul 2021 10:24:41 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:41 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 2/6] block/rbd: store object_size in BDRVRBDState
Date: Fri,  2 Jul 2021 19:23:52 +0200
Message-Id: <20210702172356.11574-3-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x635.google.com
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

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
---
 block/rbd.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index b4b928bbb99f..1ebf8f7e4875 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -102,6 +102,7 @@ typedef struct BDRVRBDState {
     char *snap;
     char *namespace;
     uint64_t image_size;
+    uint64_t object_size;
 } BDRVRBDState;
 
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
@@ -958,6 +959,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
     const QDictEntry *e;
     Error *local_err = NULL;
     char *keypairs, *secretid;
+    rbd_image_info_t info;
     int r;
 
     keypairs = g_strdup(qdict_get_try_str(options, "=keyvalue-pairs"));
@@ -1035,12 +1037,14 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
 #endif
     }
 
-    r = rbd_get_size(s->image, &s->image_size);
+    r = rbd_stat(s->image, &info, sizeof(info));
     if (r < 0) {
-        error_setg_errno(errp, -r, "error getting image size from %s",
+        error_setg_errno(errp, -r, "error getting image info from %s",
                          s->image_name);
         goto failed_post_open;
     }
+    s->image_size = info.size;
+    s->object_size = info.obj_size;
 
     /* If we are using an rbd snapshot, we must be r/o, otherwise
      * leave as-is */
@@ -1253,15 +1257,7 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
-    int r;
-
-    r = rbd_stat(s->image, &info, sizeof(info));
-    if (r < 0) {
-        return r;
-    }
-
-    bdi->cluster_size = info.obj_size;
+    bdi->cluster_size = s->object_size;
     return 0;
 }
 
-- 
2.19.2


