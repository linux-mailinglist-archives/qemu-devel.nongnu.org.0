Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0ED2B1281
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 00:08:42 +0100 (CET)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLhp-0000Q0-G0
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 18:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdLfr-0007RC-VR
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kdLfq-0005Xd-Ca
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605222394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEZzBoUQ7qGKkcK1oxsvTD2HQhsJctzm4yku9y5OCAw=;
 b=gV4wuBgqX2MZght87p2QZ50Rb4fV1p6pzlMBvaP5eCXNAAzOxDmQ6QqhDt3rEQeiOfn4lY
 KDGO+q557z6Zx+zMQZ3C9Rd1gbxXHUGdtJnyljjzQILb97Nk8rsz8Dw8rywXwF4ihfByu/
 BT8H3DxHXL1cNbP7OHG5XQtMDepjfEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-1AVAtIsbOdWLy90BOg1Cig-1; Thu, 12 Nov 2020 18:06:31 -0500
X-MC-Unique: 1AVAtIsbOdWLy90BOg1Cig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE2F192AB60;
 Thu, 12 Nov 2020 23:06:30 +0000 (UTC)
Received: from gimli.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0122E6EF50;
 Thu, 12 Nov 2020 23:06:26 +0000 (UTC)
Subject: [PULL 1/1] Fix use after free in vfio_migration_probe
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2020 16:06:26 -0700
Message-ID: <160522236242.22563.14708258644629839877.stgit@gimli.home>
In-Reply-To: <160522223115.22563.1877553897618141184.stgit@gimli.home>
References: <160522223115.22563.1877553897618141184.stgit@gimli.home>
User-Agent: StGit/0.21-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?utf-8?q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Alex =?utf-8?q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Edmondson <dme@dme.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kirti Wankhede <kwankhede@nvidia.com>

Fixes Coverity issue:
CID 1436126:  Memory - illegal accesses  (USE_AFTER_FREE)

Fixes: a9e271ec9b36 ("vfio: Add migration region initialization and finalize function")
Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: David Edmondson <dme@dme.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3ce285ea395d..55261562d4f3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -897,8 +897,8 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
-    g_free(info);
     trace_vfio_migration_probe(vbasedev->name, info->index);
+    g_free(info);
     return 0;
 
 add_blocker:


