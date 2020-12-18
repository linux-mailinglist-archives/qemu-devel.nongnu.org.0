Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDAC2DE1CF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:12:31 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDgU-0006Ya-Vi
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDDF-00041J-Ri
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDD9-0004jG-L7
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTC4KCO0oXS70552iRFyKX+l5WH0KUvjjS9B5WeucLQ=;
 b=dPf5oOsAEbUjWYKX6qdLBSV9qAKFKom+xMvxXeof8w4bEaee2nDfDlj/sdSbxSCad8Ukgm
 Hz2se4/HFuGf1NqLrQGL4rsXQfi8qH4paEiFex8ErnZt2h+Pm0moXS/YwpHcgdH65+qM6O
 fug5JdpSe8JCLHoEW4WsU6wFnQpuTRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-T2XiDRfEPGGAvUHY3S-tyA-1; Fri, 18 Dec 2020 05:42:06 -0500
X-MC-Unique: T2XiDRfEPGGAvUHY3S-tyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DAB2801B12;
 Fri, 18 Dec 2020 10:42:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07A5F60C15;
 Fri, 18 Dec 2020 10:41:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 14/15] savevm: Delete snapshots just created in case of error
Date: Fri, 18 Dec 2020 10:41:16 +0000
Message-Id: <20201218104117.199096-15-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tuguoyi <tu.guoyi@h3c.com>

bdrv_all_create_snapshot() can fails with some snapshots created,
so it's better to delete those snapshots before returns to the caller

Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
Message-Id: <1607410416-13563-3-git-send-email-tu.guoyi@h3c.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 601b5144b8..4a18c9d897 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2833,6 +2833,7 @@ int save_snapshot(const char *name, Error **errp)
     if (ret < 0) {
         error_setg(errp, "Error while creating snapshot on '%s'",
                    bdrv_get_device_or_node_name(bs));
+        bdrv_all_delete_snapshot(sn->name, &bs, NULL);
         goto the_end;
     }
 
-- 
2.29.2


