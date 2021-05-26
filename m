Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60773390D4C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:30:22 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhRF-0000s0-Bt
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhMO-0003dF-EU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhML-0006cK-W1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AeqWqqe4byyu5sN2IyiJ1hoR9egPsJjOm1lcyJLaQbI=;
 b=OrnMDcZykJXwCI7jarHXTHrazal7+hg0TuMuh2Gr4FDPv1SNSjwY8kCSb2O2xp/SRLRWWc
 1CSHA6GgEs9bhwoOkPYzOFhW+Epeudej0uDGOqDZVP+nYfu1cDnj3iod/1PsqIwn9WGOXq
 U/IVwMnUC+/ts0EKgaywe+iZTgmSa98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ajgi7xwkOp6d9NuO_Gewcw-1; Tue, 25 May 2021 20:25:15 -0400
X-MC-Unique: ajgi7xwkOp6d9NuO_Gewcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EED0800FF0;
 Wed, 26 May 2021 00:25:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5748B6EF40;
 Wed, 26 May 2021 00:25:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/31] python/machine: use subprocess.run instead of
 subprocess.Popen
Date: Tue, 25 May 2021 20:24:26 -0400
Message-Id: <20210526002454.124728-4-jsnow@redhat.com>
In-Reply-To: <20210526002454.124728-1-jsnow@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

use run() instead of Popen() -- to assert to pylint that we are not
forgetting to close a long-running program.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210517184808.3562549-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 5b87e9ce024..04e005f3811 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -223,13 +223,16 @@ def send_fd_scm(self, fd: Optional[int] = None,
             assert fd is not None
             fd_param.append(str(fd))
 
-        proc = subprocess.Popen(
-            fd_param, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
-            stderr=subprocess.STDOUT, close_fds=False
+        proc = subprocess.run(
+            fd_param,
+            stdin=subprocess.DEVNULL,
+            stdout=subprocess.PIPE,
+            stderr=subprocess.STDOUT,
+            check=False,
+            close_fds=False,
         )
-        output = proc.communicate()[0]
-        if output:
-            LOG.debug(output)
+        if proc.stdout:
+            LOG.debug(proc.stdout)
 
         return proc.returncode
 
-- 
2.31.1


