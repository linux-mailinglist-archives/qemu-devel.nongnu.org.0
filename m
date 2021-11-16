Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EB453409
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:21:55 +0100 (CET)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzLN-0004zM-Ou
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mmy1o-0001Nn-Oo; Tue, 16 Nov 2021 07:57:38 -0500
Received: from [2607:f8b0:4864:20::534] (port=33688
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daniellalee111@gmail.com>)
 id 1mmy1l-0004w6-R9; Tue, 16 Nov 2021 07:57:36 -0500
Received: by mail-pg1-x534.google.com with SMTP id 136so12846205pgc.0;
 Tue, 16 Nov 2021 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DVf3ma4ZQbIEH0ycbMcYl2WTTX0ITr7e3zGPI/Dj9A=;
 b=dRFc5ba2XlutRdIEtsKOVHDasxBbWu4gb4C7ZSwbm7ZAZqEjvd5hZiy6CgBc1XyfSi
 8lwKM6cLj/QQ3YDYehmMgjFQDUNRSWBMGWxDlk3of0Ckm0i9o2BWgkCHqlrQAluJt5Nd
 SE6ksvM2rqyXbGOV7mVSCk0/5tdGznIksfEXxIejm7+igmGSWJfWmbcwQg5ngyuFrzCZ
 ZziDF5Hs7C9S7Z3AKqUTjhwQIn3X/wCmQLFupmTbDyGHqO+S8+q3dSzGEFcMPDk/5UKj
 n3IlFRx2udXPDaMLlxQJGrJq1pfvlkr/1cAeJL8LOWI+nw0V0791kBAVzXm56/LJFcRk
 2aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DVf3ma4ZQbIEH0ycbMcYl2WTTX0ITr7e3zGPI/Dj9A=;
 b=yfx4MDpHkHUxmEQF+Iqq/Uubrqi5WYMn/GFl6YVOs2gGvsSqQaf4MRImeEZl0lk+f6
 r5sYQJ71j4wlrqqmz0StTywfmjsCSKRv1/aA8hjclkHxfosQ1g6060FCDaokebD853M6
 WqKFxgRWLKgmRbvnYyxpWsrzeIID6oLi6QoWIc82gnXt77Ta+O6IxBkrYaG010v+NR5H
 gRPM+yNbPxU8eVaykSyO/Hj9PF0vZ9MWhTRhlItghGWbOgv6PKZx6R/3Amlui+I833Bl
 ujSDde82HHBotCVWaMiE3mkAzQLUpVjNXE+BMB+DvKuJ1ikf/GQm3Anwffj9zeTeezA3
 dskQ==
X-Gm-Message-State: AOAM5307knmASc9HES/CpxZcpTu39bnbXFB6NTwexczmh7zr5NkGpNvR
 ILaommKW8bc/uqt4yeERdhw=
X-Google-Smtp-Source: ABdhPJzXNFnU678e9OTeIJoEPuqWBFrMfUCdmruT8+gBbbJM14ToLKcE9S9M/PQ0eEJCI1x7XYYb1w==
X-Received: by 2002:a62:1544:0:b0:49f:f74e:8327 with SMTP id
 65-20020a621544000000b0049ff74e8327mr40046940pfv.55.1637067449674; 
 Tue, 16 Nov 2021 04:57:29 -0800 (PST)
Received: from localhost.localdomain ([106.52.23.176])
 by smtp.googlemail.com with ESMTPSA id
 h10sm20445793pfc.104.2021.11.16.04.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 04:57:29 -0800 (PST)
From: Daniella Lee <daniellalee111@gmail.com>
To: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] block/vvfat.c fix leak when failure occurs
Date: Tue, 16 Nov 2021 20:57:18 +0800
Message-Id: <20211116125718.2922980-1-daniellalee111@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=daniellalee111@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:19:49 -0500
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
Cc: Daniella Lee <daniellalee111@gmail.com>, pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
#0  enable_write_target (bs=0x555556f9f000, errp=0x7fffffffd780) 
    at ../block/vvfat.c:3114
#1  vvfat_open (bs=0x555556f9f000, options=0x555556fa45d0, 
    flags=155650, errp=0x7fffffffd780) at ../block/vvfat.c:1236
#2  bdrv_open_driver (bs=0x555556f9f000, drv=0x555556c47920 <bdrv_vvfat>, 
    node_name=0x0, options=0x555556fa45d0, open_flags=155650, 
    errp=0x7fffffffd890) at ../block.c:1558
#3  bdrv_open_common (bs=0x555556f9f000, file=0x0, options=0x555556fa45d0,
    errp=0x7fffffffd890) at ../block.c:1852
#4  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>", 
    reference=0x0, options=0x555556fa45d0, flags=40962, parent=0x555556f98cd0,
    child_class=0x555556b1d6a0 <child_of_bds>, child_role=19, 
    errp=0x7fffffffda90) at ../block.c:3779
#5  bdrv_open_child_bs (filename=0x555556f73310 "fat:rw:<dirNone>", 
    options=0x555556f9cfc0, bdref_key=0x555556239bb8 "file", 
    parent=0x555556f98cd0, child_class=0x555556b1d6a0 <child_of_bds>, 
    child_role=19, allow_none=true, errp=0x7fffffffda90) at ../block.c:3419
#6  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>", 
    reference=0x0, options=0x555556f9cfc0, flags=8194, parent=0x0,
    child_class=0x0, child_role=0, errp=0x555556c98c40 <error_fatal>) 
    at ../block.c:3726
#7  bdrv_open (filename=0x555556f73310 "fat:rw:<dirNone>", reference=0x0,
    options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>) 
    at ../block.c:3872
#8  blk_new_open (filename=0x555556f73310 "fat:rw:<dirNone>", reference=0x0,
    options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>)
    at ../block/block-backend.c:436
#9  blockdev_init (file=0x555556f73310 "fat:rw:<dirNone>", 
    bs_opts=0x555556f757b0, errp=0x555556c98c40 <error_fatal>) 
    at ../blockdev.c:608
#10 drive_new (all_opts=0x555556d2b700, block_default_type=IF_IDE, 
    errp=0x555556c98c40 <error_fatal>) at ../blockdev.c:992
......

Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
---
 block/vvfat.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/vvfat.c b/block/vvfat.c
index 05e78e3c27..454a74c5d5 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1280,7 +1280,22 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
     qemu_co_mutex_init(&s->lock);
 
     ret = 0;
+
+    qemu_opts_del(opts);
+    return ret;
 fail:
+    if(s->qcow_filename) {
+        g_free(s->qcow_filename);
+        s->qcow_filename = NULL;
+    }
+    if(s->cluster_buffer) {
+        g_free(s->cluster_buffer);
+        s->cluster_buffer = NULL;
+    } 
+    if(s->used_clusters) {
+        g_free(s->used_clusters);
+        s->used_clusters = NULL;
+    }
     qemu_opts_del(opts);
     return ret;
 }
-- 
2.17.1


