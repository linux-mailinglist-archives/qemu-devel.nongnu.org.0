Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA383E421C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:09:11 +0200 (CEST)
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1HS-0005Qu-UT
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1AI-0001oE-DU
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1AG-0001hN-P6
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=idIj2q1epKhKLVhwR/EFfGgQo9w5miAWDUdYoyTanlk=;
 b=CelTQuHIqBLGDYxUVOY6R2ya7BDh+FADswQYIVimB1O4uXl6Moy8aPIOQFFW6Zk2nKObXv
 qIA81HoQfKCENCu9SJkH/5oBYRQ3SpCtOh58xBmNGfdgyYS2HCjA5ot1xn/2llRIAvCe+M
 1NLg12zN2KoDXe+tUoz5ya6oOIZ2Afo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-h27SudzVM5SU1SwvPkeQsw-1; Mon, 09 Aug 2021 05:01:42 -0400
X-MC-Unique: h27SudzVM5SU1SwvPkeQsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F93C87D541;
 Mon,  9 Aug 2021 09:01:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD09760C25;
 Mon,  9 Aug 2021 09:01:39 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 09/16] docs/devel/testing: add -gdb option to the debugging
 section of QEMU iotests
Date: Mon,  9 Aug 2021 11:01:07 +0200
Message-Id: <20210809090114.64834-10-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


