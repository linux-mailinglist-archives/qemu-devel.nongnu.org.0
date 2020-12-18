Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D912DE68A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:29:11 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHgs-0004cI-1p
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRt-0002eu-HT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRk-0005Q7-9h
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KpELzEE13FisWZ41bYaFFcgjVL07EkAwsJtKzu5Tl3Y=;
 b=O6n9T0aIfJnQmXP7ZM0euipJvlKAkxOuQ+tVzheJxeM1HkLKpOFta+d5tsgi2FndJXtxKk
 Fa+iUDQR1PUrTNhqBSXveuKbZloj2ydmm8OSQRYry4zLewgn6v+OtY8uYhmIp1Nupz/zU+
 dkLAaoc9myOBi+dwu6urLJCNmNFaxMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-Xro0oQZ_MiG7b4opMTCsLQ-1; Fri, 18 Dec 2020 10:13:27 -0500
X-MC-Unique: Xro0oQZ_MiG7b4opMTCsLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47E691005D44;
 Fri, 18 Dec 2020 15:13:26 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B993D1002382;
 Fri, 18 Dec 2020 15:13:25 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/30] iotests.py: execute_setup_common(): add required_fmts
 argument
Date: Fri, 18 Dec 2020 16:12:34 +0100
Message-Id: <20201218151249.715731-16-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add a parameter to skip test if some needed additional formats are not
supported (for example filter drivers).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-12-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1b7f376348..dcdcd0387f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1123,6 +1123,11 @@ def _verify_aio_mode(supported_aio_modes: Sequence[str] = ()) -> None:
     if supported_aio_modes and (aiomode not in supported_aio_modes):
         notrun('not suitable for this aio mode: %s' % aiomode)
 
+def _verify_formats(required_formats: Sequence[str] = ()) -> None:
+    usf_list = list(set(required_formats) - set(supported_formats()))
+    if usf_list:
+        notrun(f'formats {usf_list} are not whitelisted')
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
 
@@ -1280,7 +1285,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
                          supported_aio_modes: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = (),
                          supported_protocols: Sequence[str] = (),
-                         unsupported_protocols: Sequence[str] = ()) -> bool:
+                         unsupported_protocols: Sequence[str] = (),
+                         required_fmts: Sequence[str] = ()) -> bool:
     """
     Perform necessary setup for either script-style or unittest-style tests.
 
@@ -1306,6 +1312,7 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     _verify_platform(supported=supported_platforms)
     _verify_cache_mode(supported_cache_modes)
     _verify_aio_mode(supported_aio_modes)
+    _verify_formats(required_fmts)
 
     return debug
 
-- 
2.29.2


