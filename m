Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22B33E7E5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:55:15 +0100 (CET)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNH8-00068w-Jk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNF1-0003JO-9X
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNEy-00032K-Tl
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615953180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkfvOmKQKuHQVQkHYuZzAVO0HmAfuKft1JVGth8R6g4=;
 b=gGpDL7KnAs0kLRnb0+tfAC2ylJpF91Jzkx/VUcGdYcf7xLOTMOXoizc+mDSa040ypNYiWe
 U/XTv5OqqZSxRTp6rgvnSyrnXTHlPwHm6eIA4Bfc+BQvEkwsoRPm1I1MZ0wSwFvKrsd9f1
 YYiP6uwu2K3WKruxp2vDhNsTjSwsh+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-NtaSTOy7PDW1jWxZZuyt7Q-1; Tue, 16 Mar 2021 23:52:57 -0400
X-MC-Unique: NtaSTOy7PDW1jWxZZuyt7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D32818460E0;
 Wed, 17 Mar 2021 03:52:55 +0000 (UTC)
Received: from localhost.net (ovpn-113-107.rdu2.redhat.com [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6DBA5D9D3;
 Wed, 17 Mar 2021 03:52:52 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/5] tests/migration: fix unix socket batch migration
Date: Tue, 16 Mar 2021 23:52:39 -0400
Message-Id: <20210317035242.24418-3-crosa@redhat.com>
In-Reply-To: <20210317035242.24418-1-crosa@redhat.com>
References: <20210317035242.24418-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

when execute the following test command:
"guestperf-batch.py --dst-host localhost --transport unix ..."
test aborts and error message as the following be throwed:
"launching VM Failed: [Errno 98] Address already in use".

The reason is that batch script use the same monitor socket
in all test cases and do not remove the socket file. The second
migration test will launch vm use the same socket file as
the first, so we get the error message. To fix it, just remove
the socket file each time we have done the migration test.

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
Message-Id: <c3fc438993b87a6ab0bea3d07f6ca0260d29936e.1615397103.git.huangy81@chinatelecom.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/migration/guestperf/engine.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 83bfc3b6bb8..5189cf96775 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -407,6 +407,13 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             vcpu_timings = ret[2]
             if uri[0:5] == "unix:":
                 os.remove(uri[5:])
+
+            if os.path.exists(srcmonaddr):
+                os.remove(srcmonaddr)
+
+            if self._dst_host == "localhost" and os.path.exists(dstmonaddr):
+                os.remove(dstmonaddr)
+
             if self._verbose:
                 print("Finished migration")
 
-- 
2.30.2


