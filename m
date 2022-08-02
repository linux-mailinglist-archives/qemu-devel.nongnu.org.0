Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81967587D7A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:52:13 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsJf-0004yM-9w
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs69-0003fT-Mp
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs67-0002dO-Uv
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUo0lfirg8QU102T4uNn5N84cH1z8mhvI8+mQFvddCA=;
 b=cHdLggO/m2FH4XqDmhBcFaYlbV+mH3BIsxAKb6XWhUqZ1OazcPo2gLYqwmoYA97lPfjIOm
 IkdJFzxuFl4xWvIzQ9n8TZisUGxBEptyWQdOXBzpS++vFjAkqISWvF/LLwTYZK7xgFckqs
 yhsMCaebtPHFGgibAMgR8ZZJYk79/CI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-wMCpBJ3sNjGqiHE-B0LFDA-1; Tue, 02 Aug 2022 09:38:08 -0400
X-MC-Unique: wMCpBJ3sNjGqiHE-B0LFDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD1C85A581;
 Tue,  2 Aug 2022 13:38:07 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F01D2166B26;
 Tue,  2 Aug 2022 13:38:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 6/7] qemu-iotests: Discard stderr when probing devices
Date: Tue,  2 Aug 2022 15:37:56 +0200
Message-Id: <20220802133757.138016-7-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Cole Robinson <crobinso@redhat.com>

qemu-iotests fails in the following setup:

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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.35.3


