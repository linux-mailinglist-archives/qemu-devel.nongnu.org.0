Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030654E3E72
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:25:17 +0100 (CET)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdZc-0001He-12
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:25:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8p-0003SM-5v
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8n-0006YS-9c
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i91O8dWwUcv78cm11nfWjgAvjx3LbmIrrCZ8Ackajak=;
 b=KHu2/bX2GmQJ8zhc7GfKxY+4sLVt1PHt8Oicl9F2chKfzg76INTKd2K5njLcEkw/w6Mx7c
 ETVZc2aXjT+k3amOoy1gu1SeTE0nJIyh8oIgFx40qWYpFLDWp0zlcR7p1KAGPbjlWWH2xJ
 9/ykodEYtG5G5yNUelhaT4OaLxOklDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-OFAjd-g_PYiDltcYibeIrA-1; Tue, 22 Mar 2022 07:57:31 -0400
X-MC-Unique: OFAjd-g_PYiDltcYibeIrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19FE13C16196;
 Tue, 22 Mar 2022 11:57:31 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6412403D1A3;
 Tue, 22 Mar 2022 11:57:30 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/25] iotests/207: Filter host fingerprint
Date: Tue, 22 Mar 2022 12:56:47 +0100
Message-Id: <20220322115647.726044-26-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e3296cc796aeaf319f3ed4e064ec309baf5e4da4 made the ssh block
driver's error message for fingerprint mismatches more verbose, so it
now prints the actual host key fingerprint and the key type.

iotest 207 tests such errors, but was not amended to filter that
fingerprint (which is host-specific), so do it now.  Filter the key
type, too, because I guess this too can differ depending on the host
configuration.

Fixes: e3296cc796aeaf319f3ed4e064ec309baf5e4da4
       ("block: print the server key type and fingerprint on failure")
Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220318125304.66131-3-hreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/207     | 7 ++++++-
 tests/qemu-iotests/207.out | 6 +++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index 0f5c4bc8a0..41dcf3ff55 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -35,7 +35,12 @@ def filter_hash(qmsg):
         if key == 'hash' and re.match('[0-9a-f]+', value):
             return 'HASH'
         return value
-    return iotests.filter_qmp(qmsg, _filter)
+    if isinstance(qmsg, str):
+        # Strip key type and fingerprint
+        p = r"\S+ (key fingerprint) '(md5|sha1|sha256):[0-9a-f]+'"
+        return re.sub(p, r"\1 '\2:HASH'", qmsg)
+    else:
+        return iotests.filter_qmp(qmsg, _filter)
 
 def blockdev_create(vm, options):
     vm.blockdev_create(options, filters=[iotests.filter_qmp_testfiles, filter_hash])
diff --git a/tests/qemu-iotests/207.out b/tests/qemu-iotests/207.out
index aeb8569d77..05cf753283 100644
--- a/tests/qemu-iotests/207.out
+++ b/tests/qemu-iotests/207.out
@@ -42,7 +42,7 @@ virtual size: 4 MiB (4194304 bytes)
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "md5"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
 {"return": {}}
-Job failed: remote host key does not match host_key_check 'wrong'
+Job failed: remote host key fingerprint 'md5:HASH' does not match host_key_check 'md5:wrong'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
@@ -59,7 +59,7 @@ virtual size: 8 MiB (8388608 bytes)
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha1"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
 {"return": {}}
-Job failed: remote host key does not match host_key_check 'wrong'
+Job failed: remote host key fingerprint 'sha1:HASH' does not match host_key_check 'sha1:wrong'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
@@ -76,7 +76,7 @@ virtual size: 4 MiB (4194304 bytes)
 
 {"execute": "blockdev-create", "arguments": {"job-id": "job0", "options": {"driver": "ssh", "location": {"host-key-check": {"hash": "wrong", "mode": "hash", "type": "sha256"}, "path": "TEST_DIR/PID-t.img", "server": {"host": "127.0.0.1", "port": "22"}}, "size": 2097152}}}
 {"return": {}}
-Job failed: remote host key does not match host_key_check 'wrong'
+Job failed: remote host key fingerprint 'sha256:HASH' does not match host_key_check 'sha256:wrong'
 {"execute": "job-dismiss", "arguments": {"id": "job0"}}
 {"return": {}}
 
-- 
2.35.1


