Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463174CFE3A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:24:14 +0100 (CET)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCPN-0006kw-8N
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAjf-0005PQ-SW
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAje-0008Mi-CB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gElKuNfcJkleG5t5EbksuQYIaPWWi8gZbvGUs/Isrc0=;
 b=fM773BOHVoDyFGFgbgNxF1YqOMiC3YjdaYi7JhPRB6K1jFUnYc+o9Tgw+VPAwdtoxwoDGm
 DB2UV3ep6FghGy/gdUjvRUJZ6Zt3fVKLTUi+V5WdGNVlWHhrOHlUKlc+FzdknDw74mtUdm
 RMeB4qdpTQOefnW+45lyxvMxlVVph3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-ywVja6c8Oye1Olj0E1s26A-1; Mon, 07 Mar 2022 05:36:53 -0500
X-MC-Unique: ywVja6c8Oye1Olj0E1s26A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 820861091DA0;
 Mon,  7 Mar 2022 10:36:52 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AABD842BF;
 Mon,  7 Mar 2022 10:36:48 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/23] iotests.py: add qemu_io_pipe_and_status()
Date: Mon,  7 Mar 2022 11:35:47 +0100
Message-Id: <20220307103549.808809-22-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20220303194349.2304213-15-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index aff1b5d305..508adade9e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -278,6 +278,9 @@ def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
+def qemu_io_pipe_and_status(*args):
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.34.1


