Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715213B965F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:10:37 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz256-0004PN-4Q
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lz21w-0002LX-GJ
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lz21s-0001mc-1Q
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625166435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VovJkM6uCPkktepAYvfUBgvGI+BFncwrJlFk1K0yBk=;
 b=bnj3r4e+C2FoG+LbqpXgVTEYQefimOedE5gCKYl84oZaHcKYCFAqSNRnAr18dx470LvptD
 R5WIHRgAvFlP1uCHvW/Kcoew8atlC9xRzaMqiyphe12WOfViK15WloDH9TzF6hMWZmM1FO
 NV7dUc/6uBaubFsO5NK8f+8EBcAbx1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-keaW6auLPe2KsJluvuX5Qg-1; Thu, 01 Jul 2021 15:07:12 -0400
X-MC-Unique: keaW6auLPe2KsJluvuX5Qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60D6C801F97;
 Thu,  1 Jul 2021 19:07:11 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-109.phx2.redhat.com [10.3.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B1E18AAB;
 Thu,  1 Jul 2021 19:07:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] iotests: Improve and rename test 309 to
 nbd-qemu-allocation
Date: Thu,  1 Jul 2021 14:06:54 -0500
Message-Id: <20210701190655.2131223-2-eblake@redhat.com>
In-Reply-To: <20210701190655.2131223-1-eblake@redhat.com>
References: <20210701190655.2131223-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance the test to inspect what qemu-nbd is advertising during
handshake, and rename it now that we support useful iotest names.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../qemu-iotests/{309 => tests/nbd-qemu-allocation}  |  5 ++++-
 .../{309.out => tests/nbd-qemu-allocation.out}       | 12 +++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)
 rename tests/qemu-iotests/{309 => tests/nbd-qemu-allocation} (95%)
 rename tests/qemu-iotests/{309.out => tests/nbd-qemu-allocation.out} (81%)

diff --git a/tests/qemu-iotests/309 b/tests/qemu-iotests/tests/nbd-qemu-allocation
similarity index 95%
rename from tests/qemu-iotests/309
rename to tests/qemu-iotests/tests/nbd-qemu-allocation
index b90b279994c9..4ee73db8033b 100755
--- a/tests/qemu-iotests/309
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation
@@ -3,7 +3,7 @@
 #
 # Test qemu-nbd -A
 #
-# Copyright (C) 2018-2020 Red Hat, Inc.
+# Copyright (C) 2018-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -32,6 +32,7 @@ _cleanup()
 trap "_cleanup; exit \$status" 0 1 2 3 15

 # get standard environment, filters and checks
+cd ..
 . ./common.rc
 . ./common.filter
 . ./common.nbd
@@ -57,6 +58,8 @@ echo
 $QEMU_IMG map --output=json -f qcow2 "$TEST_IMG"
 IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
 nbd_server_start_unix_socket -r -f qcow2 -A "$TEST_IMG"
+# Inspect what the server is exposing
+$QEMU_NBD --list -k $nbd_unix_socket
 # Normal -f raw NBD block status loses access to allocation information
 $QEMU_IMG map --output=json --image-opts \
     "$IMG" | _filter_qemu_img_map
diff --git a/tests/qemu-iotests/309.out b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
similarity index 81%
rename from tests/qemu-iotests/309.out
rename to tests/qemu-iotests/tests/nbd-qemu-allocation.out
index db75bb6b0df9..c51022b2a38d 100644
--- a/tests/qemu-iotests/309.out
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
@@ -1,4 +1,4 @@
-QA output created by 309
+QA output created by nbd-qemu-allocation

 === Initial image setup ===

@@ -14,6 +14,16 @@ wrote 2097152/2097152 bytes at offset 1048576
 [{ "start": 0, "length": 1048576, "depth": 1, "zero": false, "data": true, "offset": 327680},
 { "start": 1048576, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": 327680},
 { "start": 3145728, "length": 1048576, "depth": 1, "zero": true, "data": false}]
+exports available: 1
+ export: ''
+  size:  4194304
+  flags: 0x58f ( readonly flush fua df multi cache )
+  min block: 1
+  opt block: 4096
+  max block: 33554432
+  available meta contexts: 2
+   base:allocation
+   qemu:allocation-depth
 [{ "start": 0, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 3145728, "length": 1048576, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 [{ "start": 0, "length": 1048576, "depth": 0, "zero": true, "data": true, "offset": OFFSET},
-- 
2.31.1


