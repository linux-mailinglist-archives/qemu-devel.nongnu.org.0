Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B79565DE08
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 22:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDAwl-0006cF-IP; Wed, 04 Jan 2023 16:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDAwj-0006az-NZ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDAwf-0006sn-H1
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672866301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTGbStfrdBXQmoQ58BKhfyAQyf1QHa4HSteui2Lm+kY=;
 b=YKOMB+cKacvm8LHNQdA5q6mE5o4FYTJDujqMkWc20sAY0CIuS4n57uzm7JdByQYbdvXKbb
 iNI1A3XmfY4oX0imghjAzHiReAfyaFG99m056S4RSUtqsQX7J5YgmIFb5j6c00dVCw6Ife
 Uqx0CsAkLLE9UEmIl1/VNayEX2D7Apo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-8LDTRlLsMOq74CLYoOW3ew-1; Wed, 04 Jan 2023 16:04:58 -0500
X-MC-Unique: 8LDTRlLsMOq74CLYoOW3ew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92FA2101A5B4;
 Wed,  4 Jan 2023 21:04:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27E432026D4B;
 Wed,  4 Jan 2023 21:04:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 2/5] python/machine: Handle termination cases without QMP
Date: Wed,  4 Jan 2023 16:04:52 -0500
Message-Id: <20230104210455.571473-3-jsnow@redhat.com>
In-Reply-To: <20230104210455.571473-1-jsnow@redhat.com>
References: <20230104210455.571473-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

If we request a shutdown of a VM without a QMP console, we'll just hang
waiting. Not ideal.

Add in code that attempts graceful termination in these cases.  Tested
lightly; it appears to work and I doubt we rely on this case anywhere,
but it's a corner you're allowed to wedge yourself in, so it should be
handled.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 6f1374a7550..748a0d807c9 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -547,6 +547,12 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
             finally:
                 # Regardless, we want to quiesce the connection.
                 self._close_qmp_connection()
+        elif not self._quit_issued:
+            LOG.debug(
+                "Not anticipating QEMU quit and no QMP connection present, "
+                "issuing SIGTERM"
+            )
+            self._subp.terminate()
 
         # May raise subprocess.TimeoutExpired
         LOG.debug(
-- 
2.39.0


