Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F53365978
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:04:18 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYq36-00046V-SW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lYpzE-0002sf-W4
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lYpzB-0003UO-HS
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qp7HiN1hguHR0QSsPpHZab4c0WAmzQJOU7eT8RaLZ+U=;
 b=ezJRoWiI2bqGAjVOOmpoDfOg17UvRLjduBtXSzpF5zpN9R0q6o1TygiJRtZvuYb2IqXMSB
 Yowqh3iLszVP17eh0mPhpq+ifCEMeLYgI8OnzhyDtdBXeuw80E5GD+MhkulqXtX0BWasd/
 QVVo4fpt5eAcUhewjJBmgiqlL8QHwFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-ZWTNc2RKMhSdXsc6sctYEw-1; Tue, 20 Apr 2021 09:00:02 -0400
X-MC-Unique: ZWTNc2RKMhSdXsc6sctYEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECAEE7F5AB
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:58:39 +0000 (UTC)
Received: from localhost (unknown [10.36.110.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22495D9CD;
 Tue, 20 Apr 2021 12:58:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0?] qga: fix guest-get-disks regression
Date: Tue, 20 Apr 2021 16:58:31 +0400
Message-Id: <20210420125831.233092-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit 54aa3de72 ("qapi: Use QAPI_LIST_PREPEND() where possible")
inadvertently removed the has_dependencies from the partition disk
info, resulting in empty list being returned.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1950833

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 4299ebd96f..75dbaab68e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1376,6 +1376,7 @@ static GuestDiskInfoList *get_disk_partitions(
         partition = g_new0(GuestDiskInfo, 1);
         partition->name = dev_name;
         partition->partition = true;
+        partition->has_dependencies = true;
         /* Add parent disk as dependent for easier tracking of hierarchy */
         QAPI_LIST_PREPEND(partition->dependencies, g_strdup(disk_dev));
 
-- 
2.29.0


