Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED545A711
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:01:44 +0100 (CET)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYEo-0006Wy-LL
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCa-0004JH-3v
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYCY-0007g9-Hp
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637683161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0cpCi9JMgKY3XtvC3AUbvyyeW3xdqtWpXVJ2QeSanE=;
 b=cPH4JMQfvf2E7jMhWobitgBNERLMS+JohejDwf9jYLLh8tBiJB+fsyctugffs7PmbsRrAW
 tp1oc72h/dy6WXPUjsAZ+1gFvUcECr5YeFlH8Uar8ed91V2+qmtKHOS4m8GPT/sUcObAO7
 SpyuC1Ih/0SA6n1aOyjxSrSgaHL02Rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-0utgXHEYNBaPnwP_wXYGWw-1; Tue, 23 Nov 2021 10:59:18 -0500
X-MC-Unique: 0utgXHEYNBaPnwP_wXYGWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8433AA40CB;
 Tue, 23 Nov 2021 15:59:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2BB879454;
 Tue, 23 Nov 2021 15:59:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/3] block/vvfat.c fix leak when failure occurs
Date: Tue, 23 Nov 2021 16:59:07 +0100
Message-Id: <20211123155909.717547-2-hreitz@redhat.com>
In-Reply-To: <20211123155909.717547-1-hreitz@redhat.com>
References: <20211123155909.717547-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniella Lee <daniellalee111@gmail.com>

Function vvfat_open called function enable_write_target and init_directories,
and these functions malloc new memory for BDRVVVFATState::qcow_filename,
BDRVVVFATState::used_clusters, and BDRVVVFATState::cluster_buff.

When the specified folder does not exist ,it may contains memory leak.
After init_directories function is executed, the vvfat_open return -EIO,
and bdrv_open_driver goto label open_failed,
the program use g_free(bs->opaque) to release BDRVVVFATState struct
without members mentioned.

command line:
qemu-system-x86_64 -hdb <vdisk qcow file>  -usb -device usb-storage,drive=fat16
-drive file=fat:rw:fat-type=16:"<path of a host folder does not exist>",
id=fat16,format=raw,if=none

enable_write_target called:
(gdb) bt
    at ../block/vvfat.c:3114
    flags=155650, errp=0x7fffffffd780) at ../block/vvfat.c:1236
    node_name=0x0, options=0x555556fa45d0, open_flags=155650,
    errp=0x7fffffffd890) at ../block.c:1558
    errp=0x7fffffffd890) at ../block.c:1852
    reference=0x0, options=0x555556fa45d0, flags=40962, parent=0x555556f98cd0,
    child_class=0x555556b1d6a0 <child_of_bds>, child_role=19,
    errp=0x7fffffffda90) at ../block.c:3779
    options=0x555556f9cfc0, bdref_key=0x555556239bb8 "file",
    parent=0x555556f98cd0, child_class=0x555556b1d6a0 <child_of_bds>,
    child_role=19, allow_none=true, errp=0x7fffffffda90) at ../block.c:3419
    reference=0x0, options=0x555556f9cfc0, flags=8194, parent=0x0,
    child_class=0x0, child_role=0, errp=0x555556c98c40 <error_fatal>)
    at ../block.c:3726
    options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>)
    at ../block.c:3872
    options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>)
    at ../block/block-backend.c:436
    bs_opts=0x555556f757b0, errp=0x555556c98c40 <error_fatal>)
    at ../blockdev.c:608
    errp=0x555556c98c40 <error_fatal>) at ../blockdev.c:992
......

Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
Message-Id: <20211119112553.352222-1-daniellalee111@gmail.com>
[hreitz: Took commit message from v1]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/vvfat.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 05e78e3c27..5dacc6cfac 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1279,8 +1279,18 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
 
     qemu_co_mutex_init(&s->lock);
 
-    ret = 0;
+    qemu_opts_del(opts);
+
+    return 0;
+
 fail:
+    g_free(s->qcow_filename);
+    s->qcow_filename = NULL;
+    g_free(s->cluster_buffer);
+    s->cluster_buffer = NULL;
+    g_free(s->used_clusters);
+    s->used_clusters = NULL;
+
     qemu_opts_del(opts);
     return ret;
 }
@@ -3118,7 +3128,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     int size = sector2cluster(s, s->sector_count);
     QDict *options;
 
-    s->used_clusters = calloc(size, 1);
+    s->used_clusters = g_malloc0(size);
 
     array_init(&(s->commits), sizeof(commit_t));
 
@@ -3166,8 +3176,6 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     return 0;
 
 err:
-    g_free(s->qcow_filename);
-    s->qcow_filename = NULL;
     return ret;
 }
 
-- 
2.33.1


