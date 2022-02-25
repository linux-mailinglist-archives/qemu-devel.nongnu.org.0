Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E54C4BDC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:16:47 +0100 (CET)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeCz-0007Yv-N0
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:16:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNe5H-0001pD-PH
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNe5E-0007KR-U2
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645808924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TZ6nZOHSZ25I3AqgrAIGXEvV3ellYzq06AYRIQq+814=;
 b=Ue9l99E5GV3kE3MaTS780LqPxBGI2BtlehJEV0uDHUx10Hkg0VyqzoJ279rhsOdbxsBAzp
 3dmpxKbU/GLwwiEP779R4+a6wydP6kHv8lstZQBYh308GRix65EGJ/HOYw/co2LG7GBTHH
 4xNAkT2oJh0kjBtr1Z+oz7Zs6lZV6hU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-hDUJ2kKxPu-EalciZMrgGQ-1; Fri, 25 Feb 2022 12:08:42 -0500
X-MC-Unique: hDUJ2kKxPu-EalciZMrgGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFABF1854E26
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 17:08:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22F08841C7;
 Fri, 25 Feb 2022 17:08:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts/qmp-shell-wrap: Fix import path
Date: Fri, 25 Feb 2022 12:08:28 -0500
Message-Id: <20220225170828.3418305-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mea culpa. Dan's patch wound up with the wrong import path because I
re-ordered my most recent pull request and missed that this needed a fix
on rebase.

Fixes: 43912529
Reported-by: Kashyap Chamarthy <kchamart@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell-wrap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
index 9e94da114f..66846e36d1 100755
--- a/scripts/qmp/qmp-shell-wrap
+++ b/scripts/qmp/qmp-shell-wrap
@@ -4,7 +4,7 @@ import os
 import sys
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.qmp import qmp_shell
+from qemu.aqmp import qmp_shell
 
 
 if __name__ == '__main__':
-- 
2.34.1


