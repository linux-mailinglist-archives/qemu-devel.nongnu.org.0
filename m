Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD4953DC62
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 16:58:49 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxriK-0003rf-Ob
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 10:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nxrh7-00032A-5Y
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nxrh2-0006li-Qy
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654441047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V61X7UHXMZn1fJuzpZUcF/bPNXUtpQ2kIlC85GtlfeM=;
 b=DjyQELEVw7slO6ZfsujK7Jbeg542sH21cm2s6uJr6mYADCxuJJm34090c+se1klB8KFLCZ
 5lZR9I2h/IIE/+fDN+hvjmPmqaBr+q5CGuVuZUD3dm2h96UrtJgZ7O2luEbvzLtOjnJymt
 1bg/rw3e5m0CKCbMUdNPR/xFZKCbtgA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-0QtKN7JVPsGcl8rSwOz60Q-1; Sun, 05 Jun 2022 10:57:24 -0400
X-MC-Unique: 0QtKN7JVPsGcl8rSwOz60Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D82280159B;
 Sun,  5 Jun 2022 14:57:24 +0000 (UTC)
Received: from worklaptop.redhat.com (unknown [10.22.16.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3189B492C3B;
 Sun,  5 Jun 2022 14:57:24 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Cole Robinson <crobinso@redhat.com>
Subject: [PATCH] qemu-iotests: Discard stderr when probing devices
Date: Sun,  5 Jun 2022 10:57:17 -0400
Message-Id: <a535c532fb5a9a607f4e3e187cf386e3eaadf892.1654441037.git.crobinso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

./configure --enable-modules --enable-smartcard \
    --target-list=x86_64-softmmu,s390x-softmmu
make
cd build
QEMU_PROG=`pwd`/s390x-softmmu/qemu-system-s390x \
    ../tests/check-block.sh qcow2
...
--- /home/crobinso/src/qemu/tests/qemu-iotests/127.out
+++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/127.out.bad
@@ -1,4 +1,18 @@
 QA output created by 127
+Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
...
--- /home/crobinso/src/qemu/tests/qemu-iotests/267.out
+++ /home/crobinso/src/qemu/build/tests/qemu-iotests/scratch/267.out.bad
@@ -1,4 +1,11 @@
 QA output created by 267
+Failed to open module: /home/crobinso/src/qemu/build/hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach

The stderr spew is its own known issue, but seems like iotests should
be discarding stderr in this case.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 tests/qemu-iotests/common.rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 165b54a61e..db757025cb 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -982,7 +982,7 @@ _require_large_file()
 #
 _require_devices()
 {
-    available=$($QEMU -M none -device help | \
+    available=$($QEMU -M none -device help 2> /dev/null | \
                 grep ^name | sed -e 's/^name "//' -e 's/".*$//')
     for device
     do
@@ -994,7 +994,7 @@ _require_devices()
 
 _require_one_device_of()
 {
-    available=$($QEMU -M none -device help | \
+    available=$($QEMU -M none -device help 2> /dev/null | \
                 grep ^name | sed -e 's/^name "//' -e 's/".*$//')
     for device
     do
-- 
2.36.1


