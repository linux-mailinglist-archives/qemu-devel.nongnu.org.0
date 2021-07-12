Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6ED3C5D5B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:36:56 +0200 (CEST)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w7D-0000Zl-BY
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vdy-00069i-G0
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2vdw-0007AL-Ad
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626095199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gX70GM7iPcVN2VHP2PayfpuVvJsvGiDLRcAOQ0HBm3E=;
 b=TF5XGLo27rFYi8Tiwt2Fuk+vsOF4KsTnhA9wffmMVjXz6s9mnqTFogflx9awo7qq7zLFix
 JiWW53dkghq3QlKx+CjqNqUFCtman2r+rx0N4htOY+JCLn9d8oH8LjYvquKj0MEd3KBI+X
 NvjFOa/gc29RueZ9OF5paYW4X0hLEPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-m913wQTWPrSRvdXP0vdhqw-1; Mon, 12 Jul 2021 09:06:37 -0400
X-MC-Unique: m913wQTWPrSRvdXP0vdhqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B14100CF6E;
 Mon, 12 Jul 2021 13:06:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-105.ams2.redhat.com
 [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 806E85C1D1;
 Mon, 12 Jul 2021 13:06:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/22] tests/migration: fix unix socket migration
Date: Mon, 12 Jul 2021 14:02:23 +0100
Message-Id: <20210712130223.1825930-23-berrange@redhat.com>
In-Reply-To: <20210712130223.1825930-1-berrange@redhat.com>
References: <20210712130223.1825930-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman <huangy81@chinatelecom.cn>

The test aborts and error message as the following be throwed:
"No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
when the unix socket migration test nearly done. The reason is
qemu removes the unix socket file after migration before
guestperf.py script do it. So pre-check if the socket file exists
when removing it to prevent the guestperf program from aborting.

See also commit f9cc00346d3 ("tests/migration: fix unix socket batch
migration").

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Hyman <huangy81@chinatelecom.cn>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/migration/guestperf/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 7c991c4407..87a6ab2009 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -423,7 +423,7 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
             progress_history = ret[0]
             qemu_timings = ret[1]
             vcpu_timings = ret[2]
-            if uri[0:5] == "unix:":
+            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
                 os.remove(uri[5:])
 
             if os.path.exists(srcmonaddr):
-- 
2.31.1


