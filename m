Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201596DDEDC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:05:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWZ-0003Wx-DV; Tue, 11 Apr 2023 11:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWB-0003AC-TJ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-0002A1-Qs
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZ0exvT56EiRlSMtf4A8e0fSO/FJXyi+ajVf3B1F5hU=;
 b=KV6o03coD+q9hn5O3j6RXSYSyQk9+fLTUhASu1/j5V0Jq6nmDMO3qqMj3W8JvH4eKQ1431
 +1hVqBeslPQ4gmFWK9tFj5SA7+exCk8E7u66T/XfVp8iFONdTsNDQ+MBG/4FHT42whS5Hc
 NJ7/zjYGX36tIBvykTgqdCme5w4cSa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448--f7SYsJjOVG3iEx-9Q4IlA-1; Tue, 11 Apr 2023 11:02:16 -0400
X-MC-Unique: -f7SYsJjOVG3iEx-9Q4IlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6D2C3C0F37E;
 Tue, 11 Apr 2023 15:02:07 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1BA040BC797;
 Tue, 11 Apr 2023 15:02:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/10] block: remove has_variable_length from filters
Date: Tue, 11 Apr 2023 17:01:41 +0200
Message-Id: <20230411150147.318637-5-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Filters automatically get has_variable_length from their underlying
BlockDriverState.  There is no need to mark them as variable-length
in the BlockDriver.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-3-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/copy-on-read.c    | 1 -
 block/filter-compress.c | 1 -
 block/preallocate.c     | 1 -
 block/replication.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index cc0f848b0f..b4d6b7efc3 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -259,7 +259,6 @@ static BlockDriver bdrv_copy_on_read = {
     .bdrv_co_eject                      = cor_co_eject,
     .bdrv_co_lock_medium                = cor_co_lock_medium,
 
-    .has_variable_length                = true,
     .is_filter                          = true,
 };
 
diff --git a/block/filter-compress.c b/block/filter-compress.c
index ac285f4b66..320d9576fa 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -146,7 +146,6 @@ static BlockDriver bdrv_compress = {
     .bdrv_co_eject                      = compress_co_eject,
     .bdrv_co_lock_medium                = compress_co_lock_medium,
 
-    .has_variable_length                = true,
     .is_filter                          = true,
 };
 
diff --git a/block/preallocate.c b/block/preallocate.c
index 71c3601809..4d82125036 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -558,7 +558,6 @@ BlockDriver bdrv_preallocate_filter = {
     .bdrv_set_perm = preallocate_set_perm,
     .bdrv_child_perm = preallocate_child_perm,
 
-    .has_variable_length = true,
     .is_filter = true,
 };
 
diff --git a/block/replication.c b/block/replication.c
index de01f96184..ea4bf1aa80 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -762,7 +762,6 @@ static BlockDriver bdrv_replication = {
 
     .is_filter                  = true,
 
-    .has_variable_length        = true,
     .strong_runtime_opts        = replication_strong_runtime_opts,
 };
 
-- 
2.39.2


