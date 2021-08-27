Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E43F93D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:56:13 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTuM-00005n-Ht
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpV-0008RZ-07
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpR-0000ya-QJ
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUDnfdKqgeH7gZTvaV7zuHqS+a+BhXW6BWkZsYixnfs=;
 b=XR1YzVHmPSANCp5q2efZbrTDD6zFb6WuxG9gp84LeV107VcLQ4/HCpaF7gNTLhyv/JqLXG
 3zlgZLkjEkCe/XEMetvjOeDM9Q5z3mG4V9XHvBe2lSrqOGVdt/qbR2mB7eK+XWi2/5jo/E
 tzdmb90Byg8WOIyDdASrtKem6vi0aNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-X1XC2mr9OIaQXtjlB9kGLg-1; Fri, 27 Aug 2021 00:50:54 -0400
X-MC-Unique: X1XC2mr9OIaQXtjlB9kGLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA78A1082929;
 Fri, 27 Aug 2021 04:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 820995C1BB;
 Fri, 27 Aug 2021 04:50:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9713811380BC; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] whpx nvmm: Drop useless migrate_del_blocker()
Date: Fri, 27 Aug 2021 06:50:37 +0200
Message-Id: <20210827045044.388748-9-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: peter.maydell@linaro.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Reinoud Zandijk <reinoud@NetBSD.org>, Kamil Rytarowski <kamil@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing to delete after migrate_add_blocker() failed.  Trying
anyway is safe, but useless.  Don't.

Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Cc: Kamil Rytarowski <kamil@netbsd.org>
Cc: Reinoud Zandijk <reinoud@netbsd.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-9-armbru@redhat.com>
Reviewed-by: Reinoud Zandijk <reinoud@NetBSD.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 target/i386/nvmm/nvmm-all.c | 1 -
 target/i386/whpx/whpx-all.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index dfa690d65d..7bb0d9e30e 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -929,7 +929,6 @@ nvmm_init_vcpu(CPUState *cpu)
         (void)migrate_add_blocker(nvmm_migration_blocker, &local_error);
         if (local_error) {
             error_report_err(local_error);
-            migrate_del_blocker(nvmm_migration_blocker);
             error_free(nvmm_migration_blocker);
             return -EINVAL;
         }
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f832f286ac..cc8c0b984b 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1349,7 +1349,6 @@ int whpx_init_vcpu(CPUState *cpu)
         (void)migrate_add_blocker(whpx_migration_blocker, &local_error);
         if (local_error) {
             error_report_err(local_error);
-            migrate_del_blocker(whpx_migration_blocker);
             error_free(whpx_migration_blocker);
             ret = -EINVAL;
             goto error;
-- 
2.31.1


