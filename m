Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFE42CD31
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:00:32 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamIZ-00018Z-GA
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGF-0006Fd-VT
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGC-0003sF-9h
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634162282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZntCCbhI6fpdmNzr90FllQAMYK0IXSh06MNzH43pew=;
 b=ei/6DJfH9YEeos+2sgDofwqbH7R1bwiISS3eYOIfNeSUBPIkVvnnoij0WYLayfEbPCY9kg
 mIRl/4c8X4vq2hp3VSWNmlUglT09geOu50hHOI4vnkAlFkPfwZoG31zmTlstf1ljE5dhWM
 JsPvEKaki/shyTn/QpCfuOayRZ614W8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-XYBy6Y8FMyemizxSQITMAQ-1; Wed, 13 Oct 2021 17:58:01 -0400
X-MC-Unique: XYBy6Y8FMyemizxSQITMAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05CE21006AA4;
 Wed, 13 Oct 2021 21:58:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07DEB1002D6A;
 Wed, 13 Oct 2021 21:57:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] iotests/300: avoid abnormal shutdown race condition
Date: Wed, 13 Oct 2021 17:57:46 -0400
Message-Id: <20211013215748.2154908-7-jsnow@redhat.com>
In-Reply-To: <20211013215748.2154908-1-jsnow@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wait for the destination VM to close itself instead of racing to shut it
down first, which produces different error log messages from AQMP
depending on precisely when we tried to shut it down.

(For example: We may try to issue 'quit' immediately prior to the target
VM closing its QMP socket, which will cause an ECONNRESET error to be
logged. Waiting for the VM to exit itself avoids the race on shutdown
behavior.)

Reported-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/300 | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 10f9f2a8da6..bbea7248005 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -24,8 +24,6 @@ import random
 import re
 from typing import Dict, List, Optional
 
-from qemu.machine import machine
-
 import iotests
 
 
@@ -461,12 +459,10 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
                       f"'{self.src_node_name}': Name is longer than 255 bytes",
                       log)
 
-        # Expect abnormal shutdown of the destination VM because of
-        # the failed migration
-        try:
-            self.vm_b.shutdown()
-        except machine.AbnormalShutdown:
-            pass
+        # Destination VM will terminate w/ error of its own accord
+        # due to the failed migration.
+        self.vm_b.wait()
+        assert self.vm_b.exitcode() > 0
 
     def test_aliased_bitmap_name_too_long(self) -> None:
         # Longer than the maximum for bitmap names
-- 
2.31.1


