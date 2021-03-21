Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B6C3433AC
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:22:03 +0100 (CET)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1m4-0000oG-Sk
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j0-0007NK-SS
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1it-0005Ra-LX
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02DGbrUqtjcx+KvCxlPP539DjQ82K7xeYKUDqDDUnwQ=;
 b=W3QBrI8RyDVOISSqiAcJa6u/qCyeyNfcLBkRtL+C0DpQApSCnT7OCORbfmgdx87YW0IcgS
 elJSQugap47NItVHKSYdlfuLsoUGyttqAtXdvbjwzpzzpe/M3x4VJTNcIcDzVRe6P77IRx
 QxZLdfexWX4zNPfdFVqQzz7vBPCYQGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-L7VOJT2MNpyeMny5xQV1Kg-1; Sun, 21 Mar 2021 13:18:40 -0400
X-MC-Unique: L7VOJT2MNpyeMny5xQV1Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97CD108BD06;
 Sun, 21 Mar 2021 17:18:38 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C14C295D8;
 Sun, 21 Mar 2021 17:18:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/5] tests/unit/test-block-iothread: fix maybe-uninitialized
 error on GCC 11
Date: Sun, 21 Mar 2021 18:18:30 +0100
Message-Id: <20210321171833.20736-3-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
References: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

When building qemu with GCC 11, test-block-iothread produces the following
warning:

../tests/unit/test-block-iothread.c:148:11: error: ‘buf’ may be used
uninitialized [-Werror=maybe-uninitialized]

This is caused by buf[512] left uninitialized and passed to
bdrv_save_vmstate() that expects a const uint8_t *, so the compiler
assumes it will be read and expects the parameter to be initialized.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210319112218.49609-1-eesposit@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-block-iothread.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 3f866a35c6..8cf172cb7a 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -89,7 +89,7 @@ static void test_sync_op_pread(BdrvChild *c)
 
 static void test_sync_op_pwrite(BdrvChild *c)
 {
-    uint8_t buf[512];
+    uint8_t buf[512] = { 0 };
     int ret;
 
     /* Success */
@@ -117,7 +117,7 @@ static void test_sync_op_blk_pread(BlockBackend *blk)
 
 static void test_sync_op_blk_pwrite(BlockBackend *blk)
 {
-    uint8_t buf[512];
+    uint8_t buf[512] = { 0 };
     int ret;
 
     /* Success */
@@ -141,7 +141,7 @@ static void test_sync_op_load_vmstate(BdrvChild *c)
 
 static void test_sync_op_save_vmstate(BdrvChild *c)
 {
-    uint8_t buf[512];
+    uint8_t buf[512] = { 0 };
     int ret;
 
     /* Error: Driver does not support snapshots */
-- 
2.27.0


