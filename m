Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E301FB42F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:24:34 +0200 (CEST)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCVt-0002TH-QL
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPU-0001oZ-0V; Tue, 16 Jun 2020 10:17:56 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCPS-0006as-Dq; Tue, 16 Jun 2020 10:17:55 -0400
Received: by mail-ot1-x32a.google.com with SMTP id g5so16040353otg.6;
 Tue, 16 Jun 2020 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wsVxcj7mHh7vxJ9uceuL9aJXpHZ9FIzGFrt0QiTuCIs=;
 b=GHQLTYnIqkdqWcDxp5+h4DNlNoZ2Dx2hG/6qJ5sWG1T0RAQkKAJ9rgKH7jm9QIVgE1
 BaRJMq/Gx1QYMQVX+IGws+JHRsNAr/TtJ74Tqii+qBLcr973vN44R9bhBlRfPDf5bU0N
 4V+HcHcK0e0MGjA3IJpEUVjkJKWqPbyr20d4I7tksQiIMqebdWXlM8cMCcT/KR0VIkdh
 L5lXENcuPjUqjntH4FktK40Tegro3LYfa32mUPVwT9KblAYjFwueS3vOERlvrt/dYtGW
 7i2fcOv98hr9NTgKwKRxL5rTt964Mt2NJIH239GNWRWj8uduomjt0ArWDhqRD3ghvJHT
 6dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=wsVxcj7mHh7vxJ9uceuL9aJXpHZ9FIzGFrt0QiTuCIs=;
 b=r0pp7rzwbJdyqR0AJGO7uX7Cu6pZASU5JVN1RWJDcHEhmFi/LH8JSWD+fk6bf6NPs/
 rrJ6tHBbKJBROyPhhB96CVSL9YIa6M6SkPS8FFDUdN6TolkM51zhWJ9RrQxz7qnc1N2v
 voRSfAx8cq870MBwlXCHMNaKM7C3IPSO50EHS9f3N+0PvlUenH9qEYvY862QzIzk8Evj
 EMiFOkh6gniSFnVncGUYzG3sfQNePYTvab+3000XT/loOx5GkjoULjc9s1+eDXmnZaqF
 DldRGTEyM+j5/QlV6pHxHx9OYtAYnOKZ1ZejOuTNs04PwSdK5oqAxNjB+3gwwOrxEaNo
 J2fA==
X-Gm-Message-State: AOAM533CnwNMZBzUDGEh4lXANn1Lvn96yh6jZTH1H9Etc7yOnbra9Pxr
 wX5uu5Bz41UZndDezXA2jYl5IgVs
X-Google-Smtp-Source: ABdhPJzkd61bS8jCe+hRa+KGIYvcT1VY2DH5Dq5QSQWZ5hzPrHoCSj6gqIf33l1Lcalogd98feVmZw==
X-Received: by 2002:a05:6830:22f1:: with SMTP id
 t17mr2655990otc.288.1592317072481; 
 Tue, 16 Jun 2020 07:17:52 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id 94sm4058183otb.47.2020.06.16.07.17.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:17:51 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/78] block/nbd: extract the common cleanup code
Date: Tue, 16 Jun 2020 09:14:30 -0500
Message-Id: <20200616141547.24664-2-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Pan Nengyuan <pannengyuan@huawei.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

The BDRVNBDState cleanup code is common in two places, add
nbd_clear_bdrvstate() function to do these cleanups.

Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <1575517528-44312-2-git-send-email-pannengyuan@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: fix compilation error and commit message]
Signed-off-by: Eric Blake <eblake@redhat.com>
(cherry picked from commit 7f493662be4045146a8f45119d8834c9088a0ad6)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 block/nbd.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5f18f78a94..6bb6715286 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -94,6 +94,19 @@ typedef struct BDRVNBDState {
 
 static int nbd_client_connect(BlockDriverState *bs, Error **errp);
 
+static void nbd_clear_bdrvstate(BDRVNBDState *s)
+{
+    object_unref(OBJECT(s->tlscreds));
+    qapi_free_SocketAddress(s->saddr);
+    s->saddr = NULL;
+    g_free(s->export);
+    s->export = NULL;
+    g_free(s->tlscredsid);
+    s->tlscredsid = NULL;
+    g_free(s->x_dirty_bitmap);
+    s->x_dirty_bitmap = NULL;
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret == -EIO) {
@@ -1864,11 +1877,7 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
 
  error:
     if (ret < 0) {
-        object_unref(OBJECT(s->tlscreds));
-        qapi_free_SocketAddress(s->saddr);
-        g_free(s->export);
-        g_free(s->tlscredsid);
-        g_free(s->x_dirty_bitmap);
+        nbd_clear_bdrvstate(s);
     }
     qemu_opts_del(opts);
     return ret;
@@ -1947,12 +1956,7 @@ static void nbd_close(BlockDriverState *bs)
     BDRVNBDState *s = bs->opaque;
 
     nbd_client_close(bs);
-
-    object_unref(OBJECT(s->tlscreds));
-    qapi_free_SocketAddress(s->saddr);
-    g_free(s->export);
-    g_free(s->tlscredsid);
-    g_free(s->x_dirty_bitmap);
+    nbd_clear_bdrvstate(s);
 }
 
 static int64_t nbd_getlength(BlockDriverState *bs)
-- 
2.17.1


