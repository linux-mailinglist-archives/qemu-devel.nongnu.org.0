Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BEE530C55
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 11:29:49 +0200 (CEST)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt4No-0001ZC-HN
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 05:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mf-00023j-HN
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:36 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mZ-0000aE-IV
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:22 -0400
Received: by mail-pf1-x436.google.com with SMTP id bo5so13090227pfb.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rXBU7oVXT2+sbEtRKBkShF9MxMyy1u1HYI/7VyL+0mw=;
 b=U5Ar90cAck6kyum9aO3ASjcPyKTKbT+fI1d4w9TDEQuSADXxk6eVeARnbMMwLhu1ue
 hD75sTHq6mGdEn/XqxjlVizxa0w/7b7PWEXDDWHThwb/FPFi6pSxEHPmkQFnnEKUgxMY
 /k3OZuNQqfRpboNCCJ5Y3vkCnVcxD0aGDitBCszF1P0DP1qWCBpGXinl6B2qqCFRPIFs
 gq98fxUrjKiE/nHmNZdtM+AFURn5hX6s6/q/byHsehqBEn9WaGmlD9iFmnYBrbj15N6W
 8qe3FGk0SRomjjbGNHPn+J/EY+uKoLhli3PvzJOZJVoGyok7mLYSWpTpfzd2hHqyO5R0
 7xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXBU7oVXT2+sbEtRKBkShF9MxMyy1u1HYI/7VyL+0mw=;
 b=q6n84s1SaLH0eCcLX6IcTSeuPUlu9Lh87pGhO09BQUqujdd0GbusDfhCv3b9spKvOv
 ZSYZrISM3BlNDLzhVuS5K0c9HANPhPfcwjvWj/WVBqc7Z3GZ+pqgUZCGEpF+8VPPvOsw
 dMeHzpevyzfdE7KaZs8VHXskABjrYSMiGkIYKLWAdL7W7v7x3aJ72RnaPPYdZTyB+536
 ccop/xD8LQtCAI2AGucu+W29uCmsNDG1ZEwzCiFISx1RZQCndweSPa9BT3DM/ds+h5jW
 SUmW730bFtPdLk1bjj003/qm7cotK3vd68ckRHFAvg1VM8tzeTUbdDBSEdjM8wTbqSkn
 5nWA==
X-Gm-Message-State: AOAM53036cmm5cD1OYZfpNSIIJOOSvK6/zWUMy6MONmfIqxKobrH6/Bz
 D8xjFQwxqrswA5to8e5FaePh
X-Google-Smtp-Source: ABdhPJxNJaTj463gFZFc+da0m+9jrWWaztGyiyXB4TF2ifZhblaToNJIJSssPrnT2gs5NaAGSrsiCA==
X-Received: by 2002:aa7:8258:0:b0:50d:d365:70c8 with SMTP id
 e24-20020aa78258000000b0050dd36570c8mr22874180pfn.50.1653295870324; 
 Mon, 23 May 2022 01:51:10 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 p39-20020a056a000a2700b0050dc76281f8sm6691320pfh.210.2022.05.23.01.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:09 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 2/8] block/export: Fix incorrect length passed to
 vu_queue_push()
Date: Mon, 23 May 2022 16:46:05 +0800
Message-Id: <20220523084611.91-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523084611.91-1-xieyongji@bytedance.com>
References: <20220523084611.91-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now the req->size is set to the correct value only
when handling VIRTIO_BLK_T_GET_ID request. This patch
fixes it.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 block/export/vhost-user-blk-server.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index b2e458ade3..19c6ee51d3 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -60,8 +60,7 @@ static void vu_blk_req_complete(VuBlkReq *req)
 {
     VuDev *vu_dev = &req->server->vu_dev;
 
-    /* IO size with 1 extra status byte */
-    vu_queue_push(vu_dev, req->vq, &req->elem, req->size + 1);
+    vu_queue_push(vu_dev, req->vq, &req->elem, req->size);
     vu_queue_notify(vu_dev, req->vq);
 
     free(req);
@@ -207,6 +206,7 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
         goto err;
     }
 
+    req->size = iov_size(in_iov, in_num);
     /* We always touch the last byte, so just see how big in_iov is.  */
     req->in = (void *)in_iov[in_num - 1].iov_base
               + in_iov[in_num - 1].iov_len
@@ -267,7 +267,6 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
                           VIRTIO_BLK_ID_BYTES);
         snprintf(elem->in_sg[0].iov_base, size, "%s", "vhost_user_blk");
         req->in->status = VIRTIO_BLK_S_OK;
-        req->size = elem->in_sg[0].iov_len;
         break;
     }
     case VIRTIO_BLK_T_DISCARD:
-- 
2.20.1


