Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C86F6A3B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:40:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXIa-000613-F2; Thu, 04 May 2023 07:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIY-00060M-E7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puXIW-0003L3-Vl
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683200336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugUqXn8zzO3HFtEPqUEUYtCfcqqf0/Xro9sDeDTFtKM=;
 b=GJBpebpDwOFd1wqQd2YfcHBMAshr8ju8i9lx/1gga7l6dpjlGe390kN6Jdt3FkG5BkHSXb
 kdyMHY7Qy6+uNU+5NUif/dptBSZEcHx7TNhqXoNDc1RUziiKnWWK5RtblGQpwxoA71lBvH
 8mH0jhz4QOY9zkzNQpeM+NufYTSHXmY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-ZAvgqIQ2Pg-nqPjStNTXWA-1; Thu, 04 May 2023 07:38:52 -0400
X-MC-Unique: ZAvgqIQ2Pg-nqPjStNTXWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7FF72A5954C;
 Thu,  4 May 2023 11:38:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CDAB2166B30;
 Thu,  4 May 2023 11:38:50 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 5/9] qemu-file: No need to check for shutdown in
 qemu_file_rate_limit
Date: Thu,  4 May 2023 13:38:37 +0200
Message-Id: <20230504113841.23130-6-quintela@redhat.com>
In-Reply-To: <20230504113841.23130-1-quintela@redhat.com>
References: <20230504113841.23130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

After calling qemu_file_shutdown() we set the error as -EIO if there
is no another previous error, so no need to check it here.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 5aa990b82a..771aba7369 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -742,9 +742,6 @@ int64_t qemu_file_total_transferred(QEMUFile *f)
 
 int qemu_file_rate_limit(QEMUFile *f)
 {
-    if (f->shutdown) {
-        return 1;
-    }
     if (qemu_file_get_error(f)) {
         return 1;
     }
-- 
2.40.0


