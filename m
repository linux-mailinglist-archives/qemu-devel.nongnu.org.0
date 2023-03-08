Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C46B12A2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa01c-00012I-2m; Wed, 08 Mar 2023 15:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01a-00011i-3q
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pa01Y-0006xx-LK
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678305871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/AFU0JU1z8T5WP1b+002mj/Rf7qzwuGBuYJ1H4aWS8=;
 b=MOl56X41Gv8Cj732eG11qT4ANfNOscHFHDn0IXXR22/ZQLEGCWY48u3wmw3eylde63lxwb
 pUZ1undHQ5qMspTJWLM6A2tFF9ngKxxcSSJ6kyYNXdh0UoDbT1LsFQvrizVKmyjRhYrzU0
 KDEcQ1tNcTz4e6i3aYeqf9Y4ja3z4zg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-Fyh9Fmv2M8G33-U528q4Fg-1; Wed, 08 Mar 2023 15:04:29 -0500
X-MC-Unique: Fyh9Fmv2M8G33-U528q4Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AD751C27D85;
 Wed,  8 Mar 2023 20:04:29 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.224.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824A22026D4B;
 Wed,  8 Mar 2023 20:04:28 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 5/5] qga/win/vss: requester_freeze changes
Date: Wed,  8 Mar 2023 22:04:19 +0200
Message-Id: <20230308200419.453688-6-kkostiuk@redhat.com>
In-Reply-To: <20230308200419.453688-1-kkostiuk@redhat.com>
References: <20230308200419.453688-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

From: Kfir Manor <kfir@daynix.com>

Change requester_freeze so that the VSS backup type queried from the registry

Signed-off-by: Kfir Manor <kfir@daynix.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/vss-win32/requester.cpp | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index e06d516675..3e998af4a8 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -285,6 +285,7 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
     DWORD wait_status;
     int num_fixed_drives = 0, i;
     int num_mount_points = 0;
+    VSS_BACKUP_TYPE vss_bt = get_vss_backup_type();
 
     if (vss_ctx.pVssbc) { /* already frozen */
         *num_vols = 0;
@@ -332,7 +333,7 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
         goto out;
     }
 
-    hr = vss_ctx.pVssbc->SetBackupState(true, true, VSS_BT_FULL, false);
+    hr = vss_ctx.pVssbc->SetBackupState(true, true, vss_bt, false);
     if (FAILED(hr)) {
         err_set(errset, hr, "failed to set backup state");
         goto out;
-- 
2.25.1


