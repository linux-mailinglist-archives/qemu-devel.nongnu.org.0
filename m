Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAA101244
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 04:49:56 +0100 (CET)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWuWY-0008Kf-Ox
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 22:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46628)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elohimes@gmail.com>) id 1iWuVh-0007tX-ES
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:49:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <elohimes@gmail.com>) id 1iWuVg-0005UA-FU
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:49:01 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <elohimes@gmail.com>) id 1iWuVg-0005Tp-7q
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 22:49:00 -0500
Received: by mail-pg1-x542.google.com with SMTP id 207so3299996pge.8
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 19:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TF6TFAQKsMFo80oxxX5RYhozr/1T6zFTJQcpB8H7WHU=;
 b=THoELoKDyZfRO48/gBB4Z77waV6rXuz1uHP1IYMuBtSyc+ofNceTjN7h7CDv+x1KSA
 D/USexXalkwS6MntZhbVdOGl7xJE3qJ1dY+xq/K7OshR9sfqgfFZvEMirtggUiepQzfC
 ci4vn8NyuRn2FqRU3Ad+CGdRcCtr9TYRg/mAgq8uOjXDy0rQdOTE4wK1HWMi8oOAx7bW
 fn/wCiKP6kHySbagkS3Yasm3Pm/QANBhR4dKwcTJ2jsYwPaFZa4ItgdeE2M2Oe6PSlJS
 QWzJbxD+T6slyhg5YhPON+WtX+v1G3fThG8l3b19lmmeSRoOWH/rmQ1cUVmcOqmoZ0mD
 VotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TF6TFAQKsMFo80oxxX5RYhozr/1T6zFTJQcpB8H7WHU=;
 b=Dv8N0zM4YY0FSIBE3o12DidlabgGSuDfEZv/nHYk8EPNL0JeYDHkAo+zs1CZSw4/Eo
 a0NK5O06Q0qWiJmpjrpwfSsVaQ4URuplnTXUlFEvaLaLP0CM2k9Ky1Se5MA9mFTnQunk
 fr4rgorh/T0L9d5PUX0Xw1avCbsNccGXUUPGXGXyT0rWzX3OiqLDWDD6p61cE4r/b2KM
 Ltl/Bm3FEJXPjsLSWFNbRcZ3YJ+7y5CrRM0TAaQQXPuTf1bRmOyXKviFisRyGjNG47AO
 gcXAfbSPHXVKtlijQ6+3EskvUvX1+kV5n/bdozzuLm/a8JBQAXHlKI+p0vvrbbNqDQIq
 sCdA==
X-Gm-Message-State: APjAAAW1piQjj02T0J0ajBxkZeBmfA9Q6QRMxTLPhW9PwrhsOY2MA8eh
 RYVI5y5MXeH5yUm94gFpY7g=
X-Google-Smtp-Source: APXvYqw2sDWXYnY2I5VJqPbqz2z4OAVFn61p/ieWJ53H/AJ9GCvzZLLYOeEmd5v02dp/42OSay0Kqg==
X-Received: by 2002:a63:4b07:: with SMTP id y7mr3028084pga.373.1574135339159; 
 Mon, 18 Nov 2019 19:48:59 -0800 (PST)
Received: from localhost ([116.247.112.152])
 by smtp.gmail.com with ESMTPSA id a66sm23471118pfb.166.2019.11.18.19.48.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Nov 2019 19:48:58 -0800 (PST)
From: elohimes@gmail.com
X-Google-Original-From: xieyongji@baidu.com
To: mst@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH] libvhost-user: Zero memory allocated for VuVirtqInflightDesc
Date: Tue, 19 Nov 2019 11:48:51 +0800
Message-Id: <20191119034851.2285-1-xieyongji@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Xie Yongji <xieyongji@baidu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

Use a zero-initialized VuVirtqInflightDesc struct to avoid
that scan-build reports that vq->resubmit_list[0].counter may
be garbage value in vu_check_queue_inflights().

Fixes: 5f9ff1eff ("libvhost-user: Support tracking inflight I/O in
shared memory")
Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Xie Yongji <xieyongji@baidu.com>
---
 contrib/libvhost-user/libvhost-user.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 68c27136ae..e76d6e9920 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -992,7 +992,7 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
     vq->shadow_avail_idx = vq->last_avail_idx = vq->inuse + vq->used_idx;
 
     if (vq->inuse) {
-        vq->resubmit_list = malloc(sizeof(VuVirtqInflightDesc) * vq->inuse);
+        vq->resubmit_list = g_malloc0(sizeof(VuVirtqInflightDesc) * vq->inuse);
         if (!vq->resubmit_list) {
             return -1;
         }
@@ -1605,10 +1605,8 @@ vu_deinit(VuDev *dev)
             vq->err_fd = -1;
         }
 
-        if (vq->resubmit_list) {
-            free(vq->resubmit_list);
-            vq->resubmit_list = NULL;
-        }
+        g_free(vq->resubmit_list);
+        vq->resubmit_list = NULL;
 
         vq->inflight = NULL;
     }
@@ -2263,7 +2261,7 @@ vu_queue_pop(VuDev *dev, VuVirtq *vq, size_t sz)
         elem = vu_queue_map_desc(dev, vq, vq->resubmit_list[i].index, sz);
 
         if (!vq->resubmit_num) {
-            free(vq->resubmit_list);
+            g_free(vq->resubmit_list);
             vq->resubmit_list = NULL;
         }
 
-- 
2.17.1


