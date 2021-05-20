Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A44389F5F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:59:39 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdak-00048Z-5b
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVJ-0003mI-Nw
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVH-0006TY-Gf
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xWojd96mWY/VkZBzHZKVknxkDCz3xOcY1edOjGqzVs=;
 b=OmEtIAyxAFBg9gA4pjHMgKcAFJ0esQVq9U7x6luZA9CXJO19akWKne8NT3dxTDD2EESEgs
 rSxeZaIXAkqsvWS+mlNZXKy6M3U5KBdSNtf78oU69f2nEW6UCS/xn1TqhErtDPK4osxhmY
 izykigYjTsFO/IpzvM/JzgL4R8xhkdU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-lD17Z8kwMRqND0jt8oaHow-1; Thu, 20 May 2021 03:53:56 -0400
X-MC-Unique: lD17Z8kwMRqND0jt8oaHow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 199A81034B1C;
 Thu, 20 May 2021 07:53:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2B0C690F3;
 Thu, 20 May 2021 07:53:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 08/15] docs/devel/testing: add -gdb option to the debugging
 section of QEMU iotests
Date: Thu, 20 May 2021 09:52:29 +0200
Message-Id: <20210520075236.44723-9-eesposit@redhat.com>
In-Reply-To: <20210520075236.44723-1-eesposit@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 docs/devel/testing.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8144e316a4..a746cab745 100644
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
2.30.2


