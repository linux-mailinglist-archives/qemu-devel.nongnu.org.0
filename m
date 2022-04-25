Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3B50E2ED
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:21:26 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizaf-0001JW-DP
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizOP-0005V3-9c
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizON-0001zf-M5
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6B3M525PLtLPkzDyPeHSB5nQns43jSKhUfiDjNNmYVM=;
 b=f+mSaB+iVAhHhIC0fNFmQ/U5+mIDeEXWtuESajws++wMCjnLUHwioOivbcARscleQ6SLm7
 kFZKanj+buWqtOVyZ40K/Z7GCGJDQ6z2yjHnU6GbtCTiMGWIcb0dCdDW8icG+a1TMwJ7XG
 Mo2LgcqYWKnAUY6aHy/DKnCh8PTJt3Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-ImAwkCX7P3-v98nvQJZXkA-1; Mon, 25 Apr 2022 10:08:41 -0400
X-MC-Unique: ImAwkCX7P3-v98nvQJZXkA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4494E3C025BC;
 Mon, 25 Apr 2022 14:08:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03556404D8F6;
 Mon, 25 Apr 2022 14:08:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/14] iotests: remove qemu_io_pipe_and_status()
Date: Mon, 25 Apr 2022 16:08:18 +0200
Message-Id: <20220425140821.957511-12-hreitz@redhat.com>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
References: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I know we just added it, sorry. This is done in favor of qemu_io() which
*also* returns the console output and status, but with more robust error
handling on failure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220418211504.943969-11-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 06d35af21a..a13e6fa876 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -364,9 +364,6 @@ def qemu_io(*args: str, check: bool = True, combine_stdio: bool = True
     return qemu_tool(*qemu_io_wrap_args(args),
                      check=check, combine_stdio=combine_stdio)
 
-def qemu_io_pipe_and_status(*args):
-    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
-
 def qemu_io_log(*args: str) -> 'subprocess.CompletedProcess[str]':
     result = qemu_io(*args, check=False)
     log(result.stdout, filters=[filter_testfiles, filter_qemu_io])
-- 
2.35.1


