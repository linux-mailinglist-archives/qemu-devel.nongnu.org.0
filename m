Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CC8587D5A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsEM-0008QT-62
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs66-0003a5-T1
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs63-0002aH-3V
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFPrwYhk7XoJbqRc6nAUA+SaC++OjEGxIi419e5RF74=;
 b=NKKce3d6f3BY2wYfeHVQeBL4639bt5wSTowk8o7yn0sShQ19uONpLSbDn4JQKB54dZWmIW
 IJmZOJ5EEZcdR7VC+sLVONP+mXTMjRyueLYugffDx5meP+0mmh0BU6yHev+P0jYO94Ashx
 MWQqf2Eb/apxZd3L5+T4M8YF/hWHjLc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-r1viZMa-MguoK87l5fXAPA-1; Tue, 02 Aug 2022 09:38:05 -0400
X-MC-Unique: r1viZMa-MguoK87l5fXAPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F2E101E986;
 Tue,  2 Aug 2022 13:38:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50A622166B26;
 Tue,  2 Aug 2022 13:38:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 3/7] libvduse: Replace strcpy() with strncpy()
Date: Tue,  2 Aug 2022 15:37:53 +0200
Message-Id: <20220802133757.138016-4-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Coverity reported a string overflow issue since we copied
"name" to "dev_config->name" without checking the length.
This should be a false positive since we already checked
the length of "name" in vduse_name_is_invalid(). But anyway,
let's replace strcpy() with strncpy() (as a general library,
we'd like to minimize dependencies on other libraries, so we
didn't use g_strlcpy() here) to fix the coverity complaint.

Fixes: Coverity CID 1490224
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220706095624.328-3-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvduse/libvduse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 6374933881..1e36227388 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1309,7 +1309,8 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
         goto err_dev;
     }
 
-    strcpy(dev_config->name, name);
+    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
+    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
     dev_config->device_id = device_id;
     dev_config->vendor_id = vendor_id;
     dev_config->features = features;
-- 
2.35.3


