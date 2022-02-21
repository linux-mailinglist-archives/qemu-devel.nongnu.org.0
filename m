Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6134BED5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:46:13 +0100 (CET)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHRc-0000Dm-5X
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGZ-0000i2-82
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGW-0008Co-JW
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7i/fRy92bqqFDBLPwmXaVoukAs5FDkkysp3wBfMYyo=;
 b=fz+164AEKTAwtj/FrKU6hSEG6iOoauijzWShUXQa5J+kVggoSGopubEnMUxJDBo3nYhU95
 NX5kyiIHbZQzZ8pAinxneRGFBNlVy5lvpOhzZRkk5xjKNe2X05HQweAR6X8/e82gK1I3ZB
 fztw9CA3gQcCSCfk6qHnmZlcwEFEynM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-jTozLkwxNGOJ9uB-abYJ5w-1; Mon, 21 Feb 2022 17:34:41 -0500
X-MC-Unique: jTozLkwxNGOJ9uB-abYJ5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0753E814243;
 Mon, 21 Feb 2022 22:34:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE7461038AAF;
 Mon, 21 Feb 2022 22:34:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/18] iotests: change supports_quorum to use qemu_img
Date: Mon, 21 Feb 2022 17:34:06 -0500
Message-Id: <20220221223413.2123003-12-jsnow@redhat.com>
In-Reply-To: <20220221223413.2123003-1-jsnow@redhat.com>
References: <20220221223413.2123003-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other recent changes: use the qemu_img invocation that
supports throwing loud, nasty exceptions when it fails for surprising
reasons.

(Why would "--help" ever fail? I don't know, but consistency is like a
well-manicured bonsai.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index cbb3af71523..882d3e0214a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1428,8 +1428,8 @@ def _verify_imgopts(unsupported: Sequence[str] = ()) -> None:
         notrun(f'not suitable for this imgopts: {imgopts}')
 
 
-def supports_quorum():
-    return 'quorum' in qemu_img_pipe('--help')
+def supports_quorum() -> bool:
+    return 'quorum' in qemu_img('--help').stdout
 
 def verify_quorum():
     '''Skip test suite if quorum support is not available'''
-- 
2.34.1


