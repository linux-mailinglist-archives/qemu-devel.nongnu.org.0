Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0530405D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:35:06 +0100 (CET)
Received: from localhost ([::1]:43600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PQv-0008I8-8T
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDd-0000Gq-LG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDV-00069W-Go
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2+2Y/wPhYxiFmvcTE0ZS2OuI+GYL0o292q/ywUGpo4=;
 b=ZLjWy1kH9sN7MGvOCOrRDJ85wO1nRNasfSV6orjDZ3w7ZH+aHqalJURPk8eGZ80eiNNghG
 apSIWZhUYtSZgrn/aMRzZQMhJQCrGCxeTPvBWV4adEumbAaKuWcjlHKnTDzFn4lIaYEN53
 hVzpz4d5SaNIHiX3kUIYSci3ZIPndUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-HM_zyfHAOKKzzR1S_cMNHA-1; Tue, 26 Jan 2021 09:21:10 -0500
X-MC-Unique: HM_zyfHAOKKzzR1S_cMNHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E249680BCBE;
 Tue, 26 Jan 2021 14:21:08 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 826F110023B2;
 Tue, 26 Jan 2021 14:21:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/53] iotests/129: Limit mirror job's buffer size
Date: Tue, 26 Jan 2021 15:19:45 +0100
Message-Id: <20210126142016.806073-23-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issuing 'stop' on the VM drains all nodes.  If the mirror job has many
large requests in flight, this may lead to significant I/O that looks a
bit like 'stop' would make the job try to complete (which is what 129
should verify not to happen).

We can limit the I/O in flight by limiting the buffer size, so mirror
will make very little progress during the 'stop' drain.

(We do not need to do anything about commit, which has a buffer size of
512 kB by default; or backup, which goes cluster by cluster.  Once we
have asynchronous requests for backup, that will change, but then we can
fine-tune the backup job to only perform a single request on a very
small chunk, too.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-9-mreitz@redhat.com>
---
 tests/qemu-iotests/129 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index f4b447b04a..03843fc255 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -68,7 +68,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
     def test_drive_mirror(self):
         self.do_test_stop("drive-mirror", device="drive0",
                           target=self.target_img, format=iotests.imgfmt,
-                          sync="full")
+                          sync="full", buf_size=65536)
 
     def test_drive_backup(self):
         self.do_test_stop("drive-backup", device="drive0",
-- 
2.29.2


