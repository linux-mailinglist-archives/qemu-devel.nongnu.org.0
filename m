Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6EA56990B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:14:52 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Iuh-0001qZ-Ky
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijh-0003h2-RO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijb-0008J4-KT
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCzC0BaFW3gSNThvTiDi2RPUQ/x+scAFMBXUbHK1bS4=;
 b=NOAQ85NPu34cWG0ILvwue20ay95xR/jALKebppqd8PTdEc2ZMUOIERLWUuT1EinJkFv5fU
 QFWku6zzUOQmYdhtTLcLFm6F2aHybc13aqGqownd/+M+40aKz9MW68iCyDihVxuDKCtbV2
 t9kNQaAJ6X+Lk0xLawB0Af8T31KROCk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-zxI84UTAPEG0YNRRxP32xA-1; Thu, 07 Jul 2022 00:03:19 -0400
X-MC-Unique: zxI84UTAPEG0YNRRxP32xA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0675729AB401;
 Thu,  7 Jul 2022 04:03:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8958818ECB;
 Thu,  7 Jul 2022 04:03:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 12/13] tests/qemu-iotests: skip 108 when FUSE is not loaded
Date: Thu,  7 Jul 2022 00:03:09 -0400
Message-Id: <20220707040310.4163682-13-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-1-jsnow@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


