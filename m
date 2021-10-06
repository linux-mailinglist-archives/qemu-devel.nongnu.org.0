Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD942438F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:58:28 +0200 (CEST)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAFP-0006og-Vk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA6w-0003x2-DK
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA6u-0007JM-SB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0wXTRVmpQOHIPz9zqGtnv0qzZsKc85iVogQEdlDyD0=;
 b=dGInn6gUbzoblTcuLsF2syeJ1pKn0SDYPr3j57xw7cwMnXWzPY/n9U+3QD8KDhAHG8Hbuh
 5JsvqJQxMELwbGXZDWcdvivcmvxSxvHyXIjvCaUk6tRaFp2zVrjX/Fi+JJzAOeJfz7BBEd
 IIVpcwH/oH5kDtDMqeVZxLlDMRMQuVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-WGtz2m8uMx6MVBpLle1ogA-1; Wed, 06 Oct 2021 12:49:39 -0400
X-MC-Unique: WGtz2m8uMx6MVBpLle1ogA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2546614wrb.14
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0wXTRVmpQOHIPz9zqGtnv0qzZsKc85iVogQEdlDyD0=;
 b=XGFfK/CmdLu1JoJu++LrV/2mTbi/bYAxzWHbjnoONrOC13VRjQkA+hifPZgt9OVNep
 wfP5rLmHhQDO24TWUBIWhLKLr8hUdwls8Oy74IdxKwq5KgNYHIKeoTT7WEDpyWz1ZmbA
 2lpv/HeCbZppFg/QRH3EMnbnGgDx32KqEuPdSbeDU2hkCQaUO+C79xEWZT6Op4aCsf3k
 hqQEIPX1OCFZzNTmvOr5g4WFavva7BhpaQWRO9oKSwrSiIGr43PkuGnGrHX697u4sX0+
 YlAmg7eEa33Qi+JF44hxqkXjp2NS+SRLKw7qprD6oAwGCDQTJiCIfHaR1Z2x5NGoZdH2
 6cWg==
X-Gm-Message-State: AOAM531a7wDl8LULqPdL3c/pmRMSj0WIYC2IizjPI9LxOBUU8PuHhCbd
 8YgLYZfqf+miS0XN09bi1EGivhfCa0oCi2oRz9W9ACXv0pgQyuICVzDel7lcPb1pb0Wtuoa7dSm
 0axNuSAlCX/A2CaDODDxnZWGie856lxMTvdGBzbx+cLf2HOT3sqpQji6dnzu7Rddb
X-Received: by 2002:a1c:f402:: with SMTP id z2mr11082191wma.53.1633538977737; 
 Wed, 06 Oct 2021 09:49:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydeu1JlGJw2kKXfKAKwoIL9nQM05DbKetFZYl2QntNWdBATWFh+MyLoMXbF+gdHWtDcjzPMg==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr11082166wma.53.1633538977538; 
 Wed, 06 Oct 2021 09:49:37 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x26sm2286144wmi.30.2021.10.06.09.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] block/nvme: Automatically free qemu_memalign() with
 QEMU_AUTO_VFREE
Date: Wed,  6 Oct 2021 18:49:27 +0200
Message-Id: <20211006164931.172349-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006164931.172349-1-philmd@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 4d324c0bf65 ("introduce QEMU_AUTO_VFREE") buffers
allocated by qemu_memalign() can automatically freed when using
the QEMU_AUTO_VFREE macro. Use it to simplify a bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 1cc7b62bb4b..fefcc04abe6 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -514,10 +514,10 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
 {
     BDRVNVMeState *s = bs->opaque;
     bool ret = false;
-    union {
+    QEMU_AUTO_VFREE union {
         NvmeIdCtrl ctrl;
         NvmeIdNs ns;
-    } *id;
+    } *id = NULL;
     NvmeLBAF *lbaf;
     uint16_t oncs;
     int r;
@@ -595,7 +595,6 @@ static bool nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
     s->blkshift = lbaf->ds;
 out:
     qemu_vfio_dma_unmap(s->vfio, id);
-    qemu_vfree(id);
 
     return ret;
 }
@@ -1219,7 +1218,7 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
 {
     BDRVNVMeState *s = bs->opaque;
     int r;
-    uint8_t *buf = NULL;
+    QEMU_AUTO_VFREE uint8_t *buf = NULL;
     QEMUIOVector local_qiov;
     size_t len = QEMU_ALIGN_UP(bytes, qemu_real_host_page_size);
     assert(QEMU_IS_ALIGNED(offset, s->page_size));
@@ -1246,7 +1245,6 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
     if (!r && !is_write) {
         qemu_iovec_from_buf(qiov, 0, buf, bytes);
     }
-    qemu_vfree(buf);
     return r;
 }
 
@@ -1365,7 +1363,7 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *ioq = s->queues[INDEX_IO(0)];
     NVMeRequest *req;
-    NvmeDsmRange *buf;
+    QEMU_AUTO_VFREE NvmeDsmRange *buf = NULL;
     QEMUIOVector local_qiov;
     int ret;
 
@@ -1440,7 +1438,6 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
     trace_nvme_dsm_done(s, offset, bytes, ret);
 out:
     qemu_iovec_destroy(&local_qiov);
-    qemu_vfree(buf);
     return ret;
 
 }
-- 
2.31.1


