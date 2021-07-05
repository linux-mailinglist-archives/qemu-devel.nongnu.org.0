Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0F3BB771
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 09:03:38 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Idl-0003ge-5N
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 03:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IYD-0002jb-Ae
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IY9-0004N9-Ml
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625468269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERdSQhrv1dpNgYyhUXn0SP0xdRZ4+cF2nkeM4ca6HvY=;
 b=WGqmEdCar60eW0dJxCBU72ZmRIZTKhjIuuKgT7hE0fyfCvMD7/SAPsiLAh0Xj9VFN+ugKw
 kbDiwEnpU15gzTx7k5tH9y4xECixC/oJtcJTDezAbcoK5ksqJwJvuzWK6HqjahMoCcuBX7
 YAvyfLOqNo8QjKy18itkRJWWbEAUrKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-40pM8dnoOcStqn4M23GHEw-1; Mon, 05 Jul 2021 02:57:47 -0400
X-MC-Unique: 40pM8dnoOcStqn4M23GHEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9273804140;
 Mon,  5 Jul 2021 06:57:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-244.ams2.redhat.com
 [10.36.112.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71DC2100EBAF;
 Mon,  5 Jul 2021 06:57:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 09/16] docs/devel/testing: add -gdb option to the debugging
 section of QEMU iotests
Date: Mon,  5 Jul 2021 08:57:04 +0200
Message-Id: <20210705065711.127119-10-eesposit@redhat.com>
In-Reply-To: <20210705065711.127119-1-eesposit@redhat.com>
References: <20210705065711.127119-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
---
 docs/devel/testing.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 9d6a8f8636..8b24e6fb47 100644
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
+  regardless on whether it is set or not.
+
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
-- 
2.31.1


