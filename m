Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E807850E2FB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:24:20 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizdU-0007i8-2I
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOW-0005z5-Mj
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOV-00021m-5m
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MK8WKQ0RuaePSHtFDyhY5fcnkUNc62z5UQrgVkeXjYo=;
 b=f+6P7fZmM0QYAkWxDoqeJJXQVI/sbitUOtY1N2LJqw2ilxkIzvO5AXYR9vLW875nFxPvo3
 mK1T1UCfrSdzAOsLkw7HqeTmg3+RYWCKjze/5sW2kEZNG3mFGS4sbRu8k39o1+cGYWRf03
 PwgiDTo2p5SFL0bs1Bw1BW1JbB6f6zo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-zw8nVSV6NC2ubVq_CfSbGA-1; Mon, 25 Apr 2022 10:08:45 -0400
X-MC-Unique: zw8nVSV6NC2ubVq_CfSbGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8DE185A7BA;
 Mon, 25 Apr 2022 14:08:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5083C2026609;
 Mon, 25 Apr 2022 14:08:44 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/14] iotests: make qemu_io_log() check return codes by default
Date: Mon, 25 Apr 2022 16:08:20 +0200
Message-Id: <20220425140821.957511-14-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Just like qemu_img_log(), upgrade qemu_io_log() to enforce a return code
of zero by default.

Tests that use qemu_io_log(): 242 245 255 274 303 307 nbd-reconnect-on-open

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-13-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py                  | 5 +++--
 tests/qemu-iotests/tests/nbd-reconnect-on-open | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index d1661f11ff..da7d6637e1 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -364,8 +364,9 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_log(*args: str) -> 'subprocess.CompletedProcess[str]':
-    result = qemu_io(*args, check=False)
+def qemu_io_log(*args: str, check: bool = True
+                ) -> 'subprocess.CompletedProcess[str]':
+    result = qemu_io(*args, check=check)
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
     return result
 
diff --git a/tests/qemu-iotests/tests/nbd-reconnect-on-open b/tests/qemu-iotests/tests/nbd-reconnect-on-open
index 8be721a24f..d0b401b060 100755
--- a/tests/qemu-iotests/tests/nbd-reconnect-on-open
+++ b/tests/qemu-iotests/tests/nbd-reconnect-on-open
@@ -39,7 +39,7 @@ def check_fail_to_connect(open_timeout):
     log(f'Check fail to connect with {open_timeout} seconds of timeout')
 
     start_t = time.time()
-    qemu_io_log(*create_args(open_timeout))
+    qemu_io_log(*create_args(open_timeout), check=False)
     delta_t = time.time() - start_t
 
     max_delta = open_timeout + 0.2
-- 
2.35.1


