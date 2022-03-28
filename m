Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7754B4EA258
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:20:36 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwmx-0001gB-3m
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:20:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiQ-0001nJ-Nt
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:54 -0400
Received: from [2a00:1450:4864:20::12c] (port=33544
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiP-0003sj-6F
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:54 -0400
Received: by mail-lf1-x12c.google.com with SMTP id bu29so27076710lfb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0b/vKG8d64ziCwTuIIIwbPbN0lcgQlGSkacaatvrseM=;
 b=i6lFDa/kJjXR5SWepoAEEBGD+AukymL5qLiUVPUiiYzQsA6CfQK4OG++831otJLNqx
 M4ilr2jeMHuTJACUZRaZpDVcxKRgYKEGmsvuLerSeRl4fc0uIO3UJ4kNggtLFX8llcGz
 Yg+xJhove/3M8g+mO/QUj9DOpCm+aW09TH2RkQcev2l+qYmWxDIp1zhnOlHBedbDZeLw
 jDI249zMd1nrGC+bQx9p1CQ2TMQWGbcln8EZjIPHtZEDgd2rh/rFrQYjNPWe/AX5C9pu
 nUJH+LNUaQgr/E/IedBGoQK31kdUve0wuN9IgQc8ILonDrkLcki33E5b29Kd4iJhLSQx
 p1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0b/vKG8d64ziCwTuIIIwbPbN0lcgQlGSkacaatvrseM=;
 b=Mq7fXKGeFf+7TjsUkab8WJz7vAj4EFTbXhUzrt2Qq54O6MedCq3pW0LCbj1sqzlNQo
 gqiaOW+SJgf3Z5LsI0QZz0Tkwj65ZPe/3P180uvBKZcchV0v/HHzuUQPUCFphSjIGNft
 1JzcKz8eSRzqTgTZeexIQ27IjoLenfzU26t4QaKXR+WoywyQ9h6EHTgxR+e7mZWtiMHJ
 OSkbNGhFSaHCNcvblrS/cm3VaV/knBp98EovdYKklxuajq49lV9pNWoURV2D4bE6BOfp
 Y2gD4Lt3dRBhTKLcv1cCMaKePAXKwjRJjlBB48jEIYyeNd/N6UqOM29saAmOD8LHz8nE
 0Evg==
X-Gm-Message-State: AOAM531W/P1DQf5aseczDgMbKS7+FpzxxV3YAnenw5ADTjTUt1pwgiVe
 +BnsceQDi8W4aVXNcJWK+TX+yuvQSfb2MA==
X-Google-Smtp-Source: ABdhPJzCUf+b7BAsUzOB3Db2R9CWSfCnGEMiOepB2S+n5SEZsqvyVDcR93m2La4OFa3Qxnr7Fb49jg==
X-Received: by 2002:ac2:4e0c:0:b0:44a:3260:e35d with SMTP id
 e12-20020ac24e0c000000b0044a3260e35dmr21484152lfr.104.1648502151614; 
 Mon, 28 Mar 2022 14:15:51 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:51 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/9] colo-compare: safe finalization
Date: Tue, 29 Mar 2022 00:15:37 +0300
Message-Id: <20220328211539.90170-8-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes some possible issues with finalization. For example, finalization
immediately after instance_init fails on the assert.

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 net/colo-compare.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 62554b5b3c..81d8de0aaa 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1426,7 +1426,7 @@ static void colo_compare_finalize(Object *obj)
             break;
         }
     }
-    if (QTAILQ_EMPTY(&net_compares)) {
+    if (QTAILQ_EMPTY(&net_compares) && colo_compare_active) {
         colo_compare_active = false;
         qemu_mutex_destroy(&event_mtx);
         qemu_cond_destroy(&event_complete_cond);
@@ -1442,19 +1442,26 @@ static void colo_compare_finalize(Object *obj)
 
     colo_compare_timer_del(s);
 
-    qemu_bh_delete(s->event_bh);
+    if (s->event_bh) {
+        qemu_bh_delete(s->event_bh);
+    }
 
-    AioContext *ctx = iothread_get_aio_context(s->iothread);
-    aio_context_acquire(ctx);
-    AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
-    if (s->notify_dev) {
-        AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
+    if (s->iothread) {
+        AioContext *ctx = iothread_get_aio_context(s->iothread);
+        aio_context_acquire(ctx);
+        AIO_WAIT_WHILE(ctx, !s->out_sendco.done);
+        if (s->notify_dev) {
+            AIO_WAIT_WHILE(ctx, !s->notify_sendco.done);
+        }
+        aio_context_release(ctx);
     }
-    aio_context_release(ctx);
 
     /* Release all unhandled packets after compare thead exited */
     g_queue_foreach(&s->conn_list, colo_flush_packets, s);
-    AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
+    /* Without colo_compare_complete done == false without packets */
+    if (!g_queue_is_empty(&s->out_sendco.send_list)) {
+        AIO_WAIT_WHILE(NULL, !s->out_sendco.done);
+    }
 
     g_queue_clear(&s->conn_list);
     g_queue_clear(&s->out_sendco.send_list);
-- 
2.31.1


