Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772260B93A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 22:06:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on3Wi-0007Mg-E2; Mon, 24 Oct 2022 15:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3We-0007Lj-6K
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1on3WO-0005J5-DE
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 15:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666641242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWuAmlcAUARA/PWwHYCqjlVWwSBzWxJPxKeBK77Zk8k=;
 b=Rdn/BL6bgm2D9ypJM9+42mhV4RcCtJi/8FyWke/yVM1Vhrd4u2kSljETOMmpYF7g03mqxP
 O4Av1ZDw0kjLq8XxtWEaLPLKkN1oC8tjFi6WhsGZmHO8/g4UEgb2w8rR3Az1dabBy1Ddrc
 mnO3VFBiAKlPZIzOGGPMKuunl+BJm0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-0eYCdhULOQ6XR544S4AEfQ-1; Mon, 24 Oct 2022 15:54:01 -0400
X-MC-Unique: 0eYCdhULOQ6XR544S4AEfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7FD5380673C
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:54:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A6681415114;
 Mon, 24 Oct 2022 19:53:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 2/2] python/machine: Handle termination cases without QMP
Date: Mon, 24 Oct 2022 15:53:55 -0400
Message-Id: <20221024195355.860504-3-jsnow@redhat.com>
In-Reply-To: <20221024195355.860504-1-jsnow@redhat.com>
References: <20221024195355.860504-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index c467f951d5d..e1ba5d01b86 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -544,6 +544,12 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
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
         self._subp.wait(timeout=timeout)
-- 
2.37.3


