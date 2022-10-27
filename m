Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D9610193
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:27:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo85f-0002Rq-Aw; Thu, 27 Oct 2022 14:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oo85S-0002RW-DG
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:58:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oo85Q-0006my-Ll
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666897120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXrZL+dB95o6r8l4H09BdVjqnWEcE0MBe9bH3Di5iZ0=;
 b=JBqKvYdwsWbYYg8Y4MINlQmuwn+S1yIi0xLvZxig3ugRiSOc/6m4WdIbFo2iNz4R1iJf1y
 2Fy2RL1ltfeNMED5MSSR4rVZDfBCRLt1+i9LRdzDXX+qJdjla0W5zGewkuCXZKNk/7BPyN
 xjw7qMC3E93K2In/Eyheh7If2fD9WzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-bxx1f_XRNQ6vWJ6gdA18AA-1; Thu, 27 Oct 2022 14:58:38 -0400
X-MC-Unique: bxx1f_XRNQ6vWJ6gdA18AA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82D8E85A59D
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 18:58:38 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABBEA2024CB7;
 Thu, 27 Oct 2022 18:58:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 2/2] python/machine: Handle termination cases without QMP
Date: Thu, 27 Oct 2022 14:58:36 -0400
Message-Id: <20221027185836.1455810-3-jsnow@redhat.com>
In-Reply-To: <20221027185836.1455810-1-jsnow@redhat.com>
References: <20221027185836.1455810-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
2.37.3


