Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFBB587D49
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:41:25 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIs9E-0001N0-89
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs66-0003b8-6h
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs64-0002ar-5s
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cyh/bcdfGlkXJJRAyRmxxlHOnTTmQ4pLigrB+Y2aoPs=;
 b=DfoQuQgLh8CUgPkssfdZ2uNja+vYkUMr2TWSHW/8o6LRoN6LGg0XTJIz9UIQV+R3g9aW7B
 D6QwGc1tHgUlORfDxjSRwAngk0jfSndafBo+GSc/1XQ6AXOrkuuddrwisDxPaFwyHf9+J7
 Brg6HGlSR47YJxW2/N4/+1+7nHfQ2xE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-8TPEq9qRN6mlgnlSK1ERWQ-1; Tue, 02 Aug 2022 09:38:06 -0400
X-MC-Unique: 8TPEq9qRN6mlgnlSK1ERWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF01F1C08963;
 Tue,  2 Aug 2022 13:38:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 484002166B26;
 Tue,  2 Aug 2022 13:38:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 4/7] libvduse: Pass positive value to strerror()
Date: Tue,  2 Aug 2022 15:37:54 +0200
Message-Id: <20220802133757.138016-5-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xie Yongji <xieyongji@bytedance.com>

The value passed to strerror() should be positive.
So let's fix it.

Fixes: Coverity CID 1490226, 1490223
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220706095624.328-4-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvduse/libvduse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 1e36227388..1a5981445c 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1257,7 +1257,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         free(dev);
         return NULL;
     }
@@ -1331,7 +1331,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     ret = vduse_dev_init(dev, name, num_queues, ops, priv);
     if (ret < 0) {
         fprintf(stderr, "Failed to init vduse device %s: %s\n",
-                name, strerror(ret));
+                name, strerror(-ret));
         goto err;
     }
 
-- 
2.35.3


