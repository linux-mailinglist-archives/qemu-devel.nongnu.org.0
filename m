Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7174557225F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:19:39 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKTy-0005GV-Ii
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHf-0003M6-8i
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHb-0006by-Gb
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5AyEP65UH1KG5GYo/N2XQZ2ZdD5I48Thvm0Z3HH07N0=;
 b=EsXQ0VftkqGpM2D8NqTyNQcMLOhoHcg1egkqhGbI7juEKyuhsGTTrMO3apcVtpuaTkOiYR
 UWwIBcBBzgnkouY0zAZ6/momMJ3A05XN5cjUjxMbcn/JgjMrwWv/DagOnwiJ1RfCnAVl9Z
 IGxuSq+EEZwU04dIUKn1uP2OoRYAzN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-5novVHfJOJaEx_MyzZP6iA-1; Tue, 12 Jul 2022 14:06:40 -0400
X-MC-Unique: 5novVHfJOJaEx_MyzZP6iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E39F8032F2;
 Tue, 12 Jul 2022 18:06:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D28A1121314;
 Tue, 12 Jul 2022 18:06:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 12/35] tests/qemu-iotests: skip 108 when FUSE is not loaded
Date: Tue, 12 Jul 2022 20:05:54 +0200
Message-Id: <20220712180617.1362407-13-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: John Snow <jsnow@redhat.com>

In certain container environments we may not have FUSE at all, so skip
the test in this circumstance too.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20220616142659.3184115-3-jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/108 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 9e923d6a59..54e935acf2 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -60,6 +60,11 @@ if sudo -n losetup &>/dev/null; then
 else
     loopdev=false
 
+    # Check for usable FUSE in the host environment:
+    if test ! -c "/dev/fuse"; then
+        _notrun 'No passwordless sudo nor usable /dev/fuse'
+    fi
+
     # QSD --export fuse will either yield "Parameter 'id' is missing"
     # or "Invalid parameter 'fuse'", depending on whether there is
     # FUSE support or not.
-- 
2.35.3


