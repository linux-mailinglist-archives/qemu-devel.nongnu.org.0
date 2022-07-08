Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA956BE20
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:24:12 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qm3-0003Ar-Oy
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0m-0006vx-5l
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0i-0007OD-7v
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657294515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCzC0BaFW3gSNThvTiDi2RPUQ/x+scAFMBXUbHK1bS4=;
 b=RFrgwe1CfviXRPjc8ckCXVtLzjJuercn5cTQugCmQwK1C0LQXKBfsa3MQmXo6ud49EyO9E
 a1hB/mYzYnZxSnEdwdLpdLVUI6YFrZRDUtqKaBsjttsqI4fGDtnH7/RbdxowEwQPzUuIOv
 xd11fyiFDZSjElw9D418jTZbOVxCb9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-A0iiiqS2MYqZujjzd1mN3g-1; Fri, 08 Jul 2022 11:35:11 -0400
X-MC-Unique: A0iiiqS2MYqZujjzd1mN3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A09E101A586;
 Fri,  8 Jul 2022 15:35:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B9E8A4D1;
 Fri,  8 Jul 2022 15:35:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 11/12] tests/qemu-iotests: skip 108 when FUSE is not loaded
Date: Fri,  8 Jul 2022 11:35:02 -0400
Message-Id: <20220708153503.18864-12-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not merge: Staged in Hanna's branch.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/108 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 9e923d6a59f..54e935acf28 100755
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
2.34.3


