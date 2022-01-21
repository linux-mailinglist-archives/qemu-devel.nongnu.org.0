Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948E495D82
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:13:23 +0100 (CET)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqv4-0008PK-IU
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nApc1-0007W6-Gz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:49:38 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38649
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nApbz-0005Br-Vx
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:49:37 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so10000125pjj.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8kK7gzUbOpUqj0i1vLS2wElksbx0Z1HbijnD3p4R4I=;
 b=wuTzCAutKHeOvVaNeAtKb86RNH5wb7PlW+q80mW+ksF2U3NEuX0TGpM2UV1epEzvjF
 K8f8eGscqhXEn9BK2y9duDt/JOOdtrOL+41j5PJuTTfGGdYkswzJZueoPRoNqfu3a52m
 MKzZN25SkHvi2uJVEBeHJTWla4hZWl/713IIlSrZoRQCo28SPKGB25eEqPy9B5aixYUW
 EbkTHPAkvwO+xDaDnV5YKoOnpZg4+o/tQo600/CFiv2Io/t10Ts47A70Xq4iJs7GqGNZ
 a4n6j+euKahoWTxX9iLbEEx0HoegZWi2w50Lqp1E3XaHtWzlTYohdP8iKtdPj5MKS9NT
 T9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8kK7gzUbOpUqj0i1vLS2wElksbx0Z1HbijnD3p4R4I=;
 b=gtxWOzP1ieQ1/ateaykASxJ4IYX3zKvO4u4d3FD1malV7b9ZYC1Ix1S+JU+AF2ETxr
 w9WlK8TSl8rrdY3U8fx2APnsnluW2hd1WkMmQBtwLzz7rV7v+vln0Cwkk3oPaNz3bW32
 yQWFEkE38OwAdgeMLtg1EoguZvpl18+85zGxZifhJmZj4ton4ulBOkkP2s02bzeryHEg
 iCJOvpUFTdqDXrkfQyNOjTiTGERZVX2vTT8F2q5hktFlsbTNEhqRNN5R9g3c8sSqqXDO
 8oLEWPkTdeP9quQ3negohy93CMtVkZhGVZqgKXwdsKbrx28h5Cmbawu5h0pRkykfXsUe
 3Elw==
X-Gm-Message-State: AOAM531K78jyolDrpunmfLTFv5H5kF4xG8TN8XxSmOKVpzzlYG5ogdFO
 7Qvyod3iZ7Edc3V6mcxoPuN9
X-Google-Smtp-Source: ABdhPJy1F8NqnaIQ/qOeyX9AnduKbWUm0YHsQJo1PXkx7DiT226yYUEk0zmlu9FKkmrX9cRXx8RQYg==
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr3600126pjb.178.1642754974778; 
 Fri, 21 Jan 2022 00:49:34 -0800 (PST)
Received: from localhost ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id b9sm5939869pfm.154.2022.01.21.00.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 00:49:34 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: Coiby.Xu@gmail.com, stefanha@redhat.com, marcandre.lureau@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH 2/2] block/export: Add vhost-user-blk resize support
Date: Fri, 21 Jan 2022 16:46:44 +0800
Message-Id: <20220121084644.217-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121084644.217-1-xieyongji@bytedance.com>
References: <20220121084644.217-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To support block resize, this updates the capacity field
in configuration space and use vu_notify_config_change()
to notify the vhost-user master on the block resize callback.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vhost-user-blk-server.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index 1862563336..929a0bd007 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -435,6 +435,20 @@ static void blk_aio_detach(void *opaque)
     vexp->export.ctx = NULL;
 }
 
+static void vu_blk_resize(void *opaque)
+{
+    BlockExport *exp = opaque;
+    VuBlkExport *vexp = container_of(exp, VuBlkExport, export);
+
+    vexp->blkcfg.capacity =
+        cpu_to_le64(blk_getlength(exp->blk) >> VIRTIO_BLK_SECTOR_BITS);
+    vu_notify_config_change(&vexp->vu_server.vu_dev);
+}
+
+static const BlockDevOps vu_block_ops = {
+    .resize_cb = vu_blk_resize,
+};
+
 static void
 vu_blk_initialize_config(BlockDriverState *bs,
                          struct virtio_blk_config *config,
@@ -513,6 +527,8 @@ static int vu_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
         return -EADDRNOTAVAIL;
     }
 
+    blk_set_dev_ops(exp->blk, &vu_block_ops, exp);
+
     return 0;
 }
 
-- 
2.20.1


