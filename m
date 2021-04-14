Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBF35F98B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 19:15:59 +0200 (CEST)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWj7O-000200-9r
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 13:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwR-0002xY-An
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lWiwM-0008TZ-LS
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 13:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJJoPUpsnoaD9RGW/i6SUxTURPE4V3DocsOVt8U+4EQ=;
 b=A0t15YtTbpMrdtLCU3FVsbmt3ArRVS7U0KA+G2HGePOW5sWszzUSg0hkOs8Q+LRjxi+XC1
 nrLDHSsGhko3udw/M7sr8i3wXxpIKw8ELyegYfiG/9hjVjlghoeAc137fvYdvOQOluB910
 9HwDPSiX8zFBIX7WYhSYEIFrmz7sWUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-TZHUiDJGMsCZllxE-Xex6g-1; Wed, 14 Apr 2021 13:04:32 -0400
X-MC-Unique: TZHUiDJGMsCZllxE-Xex6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DEB85B38E;
 Wed, 14 Apr 2021 17:04:31 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-18.ams2.redhat.com
 [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2CFA10023AC;
 Wed, 14 Apr 2021 17:04:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 08/15] docs/devel/testing: add -gdb option to the debugging
 section of QEMU iotests
Date: Wed, 14 Apr 2021 19:03:45 +0200
Message-Id: <20210414170352.29927-9-eesposit@redhat.com>
In-Reply-To: <20210414170352.29927-1-eesposit@redhat.com>
References: <20210414170352.29927-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 docs/devel/testing.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index b7e2370e7e..2ee77a057b 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -229,6 +229,13 @@ Debugging a test case
 QEMU iotests offers some options to debug a failing test, that can be
 given as options to the ``check`` script:
 
+* ``-gdb`` wraps ``gdbsever`` to the QEMU binary,
+  so it is possible to connect to it via gdb.
+  One way to do so is via ``gdb -iex "target remote $GDB_QEMU"``
+  The default address is ``localhost:12345``, and can be changed
+  by setting the ``$GDB_QEMU`` environmental variable.
+  The final command line will be ``gdbserver $GDB_QEMU $QEMU ...``
+
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
-- 
2.30.2


