Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3097C3A2778
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:53:32 +0200 (CEST)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGRP-0005GK-9V
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGOV-0003mI-VG
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrGOU-00044s-F1
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623315029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y2Pyiw0Wl9/DyEiUxHLtR1oMST+4NRtt5CMAcHgQLcE=;
 b=JluXB8SgpPpM+TIAuA6GGtf9JJJz4TSaBu+Zk1PAU5NK2Wr4nADLEUA4O9nuqTfN8V+j23
 Ns5GtFiStE5cKgVNn/521gGc4TFKNaNJwsAni0g24ygG34OcMAS7wvnpOfSCY7R/iROXYp
 3T5wqr+McE07albLhWan0aGJjGKwtnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-Q6-sSxopOnqwZ-JYtZHczA-1; Thu, 10 Jun 2021 04:50:28 -0400
X-MC-Unique: Q6-sSxopOnqwZ-JYtZHczA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E454F100C61C
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:50:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7EC160C05;
 Thu, 10 Jun 2021 08:50:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51A4D113865F; Thu, 10 Jun 2021 10:50:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-option: Drop dead assertion
Date: Thu, 10 Jun 2021 10:50:26 +0200
Message-Id: <20210610085026.436081-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit c6ecec43b2 "qemu-option: Check return value instead of @err
where convenient" simplified

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1,
                            &local_err);
    if (local_err) {
        error_propagate(errp, local_err);
        return NULL;
    }

to

    opts = qemu_opts_create(list, qdict_get_try_str(qdict, "id"), 1, errp);
    if (!opts) {
        return NULL;
    }

but neglected to delete

    assert(opts != NULL);

Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-option.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 4944015a25..3fa0b13378 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1028,8 +1028,6 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
         return NULL;
     }
 
-    assert(opts != NULL);
-
     for (entry = qdict_first(qdict);
          entry;
          entry = qdict_next(qdict, entry)) {
-- 
2.31.1


