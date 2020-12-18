Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1422DE678
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:24:34 +0100 (CET)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHcP-0006pq-8O
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRp-0002Yc-Ho
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRh-0005Ov-4z
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nePBOte7Ef+Q0kbPVIXSFIsfmlBHc73YjzfApsE4dMg=;
 b=K/hCiypTJ5BpbXnKikUlUUhtEes0czR1AS5r8mtXc5aWTdI8L0x6pn0N+dmh8xm95J4/Iv
 okU187EQGSYNK1VAhIfO6L9PrtTUECIlmKUI2TvGclj1vror1SBacqPlKxeoQnbsl8ivpU
 Jn2Lwue74V7W4o6aG2z/cFX/I3SQB48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-j73iKH7bNM2YXS5UFte4xA-1; Fri, 18 Dec 2020 10:13:25 -0500
X-MC-Unique: j73iKH7bNM2YXS5UFte4xA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF1B190B2A0;
 Fri, 18 Dec 2020 15:13:23 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 963042BFF1;
 Fri, 18 Dec 2020 15:13:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/30] iotests: qemu_io_silent: support --image-opts
Date: Fri, 18 Dec 2020 16:12:33 +0100
Message-Id: <20201218151249.715731-15-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201021145859.11201-11-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index bcd4fe5b6f..1b7f376348 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -205,7 +205,12 @@ def qemu_io_log(*args):
 
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
-    args = qemu_io_args + list(args)
+    if '-f' in args or '--image-opts' in args:
+        default_args = qemu_io_args_no_fmt
+    else:
+        default_args = qemu_io_args
+
+    args = default_args + list(args)
     exitcode = subprocess.call(args, stdout=open('/dev/null', 'w'))
     if exitcode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
-- 
2.29.2


