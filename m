Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2A33FDEA4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:27:35 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLS9G-00083p-T2
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyt-0003XD-1f
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyq-0003K7-D3
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8251mwDnxi+Q0NunZx+JdqKG9qRr6JC3+IlvC5Z94c=;
 b=gdykQXCz4hMqQE/wWIyNZH0iosBak+Q2RGgbsKZNCz+N+dCbKPX8hOCuJCHy1TKvfz9jFx
 K+OH3NMH40URPWOkIM6bF3irNyWrWb7WdwPAzswgsd2La/gJRar9NAM/n4qqA7m9RC/WpU
 VTy8eT3I2k0nmi3HV90nnAk0Ee66XE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-Il5Ox5loNbOmFRiELW1ZIA-1; Wed, 01 Sep 2021 11:16:41 -0400
X-MC-Unique: Il5Ox5loNbOmFRiELW1ZIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D725B106BC6C;
 Wed,  1 Sep 2021 15:16:40 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7906640AC;
 Wed,  1 Sep 2021 15:16:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/56] docs/devel/testing: add -gdb option to the debugging
 section of QEMU iotests
Date: Wed,  1 Sep 2021 17:15:32 +0200
Message-Id: <20210901151619.689075-10-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210809090114.64834-10-eesposit@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 docs/devel/testing.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8359f2ae37..01e1919873 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -229,6 +229,17 @@ Debugging a test case
 The following options to the ``check`` script can be useful when debugging
 a failing test:
 
+* ``-gdb`` wraps every QEMU invocation in a ``gdbserver``, which waits for a
+  connection from a gdb client.  The options given to ``gdbserver`` (e.g. the
+  address on which to listen for connections) are taken from the ``$GDB_OPTIONS``
+  environment variable.  By default (if ``$GDB_OPTIONS`` is empty), it listens on
+  ``localhost:12345``.
+  It is possible to connect to it for example with
+  ``gdb -iex "target remote $addr"``, where ``$addr`` is the address
+  ``gdbserver`` listens on.
+  If the ``-gdb`` option is not used, ``$GDB_OPTIONS`` is ignored,
+  regardless of whether it is set or not.
+
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
-- 
2.31.1


